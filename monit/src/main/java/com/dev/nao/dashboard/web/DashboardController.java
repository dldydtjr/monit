package com.dev.nao.dashboard.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev.nao.dashboard.service.DashboardService;
import com.dev.nao.dashboard.service.DashboardVO;
import com.dev.nao.monitoring.service.MonitoringService;
import com.dev.nao.monitoring.service.MonitoringVO;

import twitter4j.internal.org.json.JSONArray;
import twitter4j.internal.org.json.JSONObject;
import twitter4j.internal.org.json.XML;

@Controller
public class DashboardController {

	@Resource(name = "dashboardService")
	DashboardService dashboardService;
	
	String sk = "zf0NtvFyeGTNjU4AZrC8cnWSAvKUiXKXcZj0nNVBQj%2FjPjXPb8O%2By3EdwKiVuf9ilfOVLTna2EfiTm6l8OiXUg%3D%3D";
	JSONObject weatherJO = new JSONObject();
    
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(HttpServletRequest request, Model model) throws Exception {
		if(request.getSession().getAttribute("id") == null) {
			return "redirect:/";
		}
		
		weatherJO.put("base_date", "0");
		weatherJO.put("base_time", "0");
		weatherJO.put("x", "0");
		weatherJO.put("y", "0");
		
		return "dashboard/dashboard";
	}
	
	@RequestMapping(value = "/dashboard/getWeather", method = RequestMethod.POST)
	public String getWeather(HttpServletRequest request,
			Model model) throws Exception {
		if(request.getSession().getAttribute("id") == null) {
			return "redirect:/";
		}
		
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String base_date = request.getParameter("base_date");
		String base_time = request.getParameter("base_time");
		System.out.println(base_date);
		System.out.println(base_time);
		
		// 위치와 시간 데이터 체크 (api 요청 최소화)
		// DB 조회 후 비교
		if(base_time.equals(weatherJO.get("base_time")) && x.equals(weatherJO.get("x")) && y.equals(weatherJO.get("y")) ) {
			
		}else {			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+sk); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
			urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(base_date, "UTF-8")); /*‘21년 6월 28일 발표*/
			urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(base_time, "UTF-8")); /*06시 발표(정시단위) */
			urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(x, "UTF-8")); /*예보지점의 X 좌표값*/
			urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(y, "UTF-8")); /*예보지점의 Y 좌표값*/
			URL url = new URL(urlBuilder.toString());
//			System.out.println("Response code: " + url.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			
			JSONArray ja = new JSONArray();
			JSONObject jo = new JSONObject();
			
			JSONObject json = XML.toJSONObject(sb.toString());
//			System.out.println(json);
			JSONArray dataArray = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
			JSONObject dataJO = new JSONObject();
			for(int i=0;i<dataArray.length();i++) {
//				System.out.println(dataArray.get(i));
				if(i%6==0) {
//					System.out.println("go");
					dataJO = (JSONObject) dataArray.get(i);
					if("T1H".equals(dataJO.get("category"))) {
						// 기온
						jo.put("name", "기온");
						jo.put("category", dataJO.get("category"));
						jo.put("obsrValue", dataJO.get("fcstValue"));
						jo.put("unit", "℃");
						ja.put(jo);
						jo = new JSONObject();
					}else if("RN1".equals(dataJO.get("category"))) {
						String value = "媛뺤닔�뾾�쓬".equals(dataJO.get("fcstValue").toString()) ? "0" : dataJO.get("fcstValue").toString();
						// 1시간 강수량
						jo.put("name", "시간당 강수량");
						jo.put("category", dataJO.get("category"));
						jo.put("obsrValue", value);
						jo.put("unit", "mm");
						ja.put(jo);
						jo = new JSONObject();
					}else if("SKY".equals(dataJO.get("category"))) {
						// 하늘상태 맑음(1), 구름많음(3), 흐림(4)
						String value = "1".equals(dataJO.get("fcstValue").toString())?"맑음"
										:"3".equals(dataJO.get("fcstValue").toString())?"구름많음"
										:"4".equals(dataJO.get("fcstValue").toString())?"흐림":"";
						jo.put("name", "하늘상태");
						jo.put("category", dataJO.get("category"));
						jo.put("obsrValue", value);
						jo.put("unit", "");
						ja.put(jo);
						jo = new JSONObject();
					}
//					// 강수형태 (초단기) 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)
//					jo.put("name", "강수형태");
//					jo.put("category", "PTY");
//					jo.put("obsrValue", "0");
//					ja.put(jo);
//					jo = new JSONObject();
//					// 습도
//					jo.put("name", "습도");
//					jo.put("category", "REH");
//					jo.put("obsrValue", "58");
//					ja.put(jo);
//					jo = new JSONObject();
//					// 풍속
//					jo.put("name", "풍속");
//					jo.put("category", "WSD");
//					jo.put("obsrValue", "2.7");
//					ja.put(jo);
				}
			}
			// 데이터 저장 (api 요청 최소화)
			weatherJO.put("base_date", base_date);
			weatherJO.put("base_time", base_time);
			weatherJO.put("x", x);
			weatherJO.put("y", y);
			weatherJO.put("data", ja);
		}
		
        
        model.addAttribute("message", weatherJO);
        
        return "ajax/messageContent";
	}
	
	@RequestMapping(value = "/dashboard/getCurrData", method = RequestMethod.POST)
	public String getCurrData(@ModelAttribute("dashboardVO") DashboardVO dashboardVO,
			HttpServletRequest request, Model model) throws Exception {
		if(request.getSession().getAttribute("id") == null) {
			return "redirect:/";
		}
		
		DashboardVO dd = dashboardService.getCurrData(dashboardVO);
		
		JSONObject jo = new JSONObject();
		jo.put("baseDatetime", dd.getBaseDatetime());
		jo.put("suppAbility", dd.getSuppAbility());
		jo.put("currPwrTot", dd.getCurrPwrTot());
		jo.put("forecastLoad", dd.getForecastLoad());
		jo.put("suppReservePwr", dd.getSuppReservePwr());
		jo.put("suppReserveRate", dd.getSuppReserveRate());
		jo.put("operReservePwr", dd.getOperReservePwr());
		jo.put("operReserveRate", dd.getOperReserveRate());
		
		model.addAttribute("message", jo);
        
        return "ajax/messageContent";
	}
	
	@RequestMapping(value = "/dashboard/getData", method = RequestMethod.POST)
	public String getData(@ModelAttribute("dashboardVO") DashboardVO dashboardVO,
			HttpServletRequest request, Model model) throws Exception {
		if(request.getSession().getAttribute("id") == null) {
			return "redirect:/";
		}
		
		String[] labels = {
	       		  "00:00","00:05","00:10","00:15","00:20","00:25","00:30","00:35","00:40","00:45","00:50","00:55"
	    		  ,"01:00","01:05","01:10","01:15","01:20","01:25","01:30","01:35","01:40","01:45","01:50","01:55"
	    		  ,"02:00","02:05","02:10","02:15","02:20","02:25","02:30","02:35","02:40","02:45","02:50","02:55"
	    		  ,"03:00","03:05","03:10","03:15","03:20","03:25","03:30","03:35","03:40","03:45","03:50","03:55"
	    		  ,"04:00","04:05","04:10","04:15","04:20","04:25","04:30","04:35","04:40","04:45","04:50","04:55"
	    		  ,"05:00","05:05","05:10","05:15","05:20","05:25","05:30","05:35","05:40","05:45","05:50","05:55"
	    		  ,"06:00","06:05","06:10","06:15","06:20","06:25","06:30","06:35","06:40","06:45","06:50","06:55"
	    		  ,"07:00","07:05","07:10","07:15","07:20","07:25","07:30","07:35","07:40","07:45","07:50","07:55"
	    		  ,"08:00","08:05","08:10","08:15","08:20","08:25","08:30","08:35","08:40","08:45","08:50","08:55"
	    		  ,"09:00","09:05","09:10","09:15","09:20","09:25","09:30","09:35","09:40","09:45","09:50","09:55"
	    		  ,"10:00","10:05","10:10","10:15","10:20","10:25","10:30","10:35","10:40","10:45","10:50","10:55"
	    		  ,"11:00","11:05","11:10","11:15","11:20","11:25","11:30","11:35","11:40","11:45","11:50","11:55"
	    		  ,"12:00","12:05","12:10","12:15","12:20","12:25","12:30","12:35","12:40","12:45","12:50","12:55"
	    		  ,"13:00","13:05","13:10","13:15","13:20","13:25","13:30","13:35","13:40","13:45","13:50","13:55"
	    		  ,"14:00","14:05","14:10","14:15","14:20","14:25","14:30","14:35","14:40","14:45","14:50","14:55"
	    		  ,"15:00","15:05","15:10","15:15","15:20","15:25","15:30","15:35","15:40","15:45","15:50","15:55"
	    		  ,"16:00","16:05","16:10","16:15","16:20","16:25","16:30","16:35","16:40","16:45","16:50","16:55"
	    		  ,"17:00","17:05","17:10","17:15","17:20","17:25","17:30","17:35","17:40","17:45","17:50","17:55"
	    		  ,"18:00","18:05","18:10","18:15","18:20","18:25","18:30","18:35","18:40","18:45","18:50","18:55"
	    		  ,"19:00","19:05","19:10","19:15","19:20","19:25","19:30","19:35","19:40","19:45","19:50","19:55"
	    		  ,"20:00","20:05","20:10","20:15","20:20","20:25","20:30","20:35","20:40","20:45","20:50","20:55"
	    		  ,"21:00","21:05","21:10","21:15","21:20","21:25","21:30","21:35","21:40","21:45","21:50","21:55"
	    		  ,"22:00","22:05","22:10","22:15","22:20","22:25","22:30","22:35","22:40","22:45","22:50","22:55"
	    		  ,"23:00","23:05","23:10","23:15","23:20","23:25","23:30","23:35","23:40","23:45","23:50","23:55"
	    		  ,"24:00"
		};
		
		JSONArray ja = new JSONArray();
		JSONObject jo = new JSONObject();
		
		List<DashboardVO> list = dashboardService.getData(dashboardVO);
		if(list.size()>0) {			
			for(int i=0; i<labels.length;i++) {
				if(labels[i].equals(dashboardVO.getSearchTime())) {
					break;
				}
				ja.put("0");
				for(int j=0; j<list.size();j++) {
					if(labels[i].equals(list.get(j).getBaseDatetime())) {
						ja.put(i, list.get(j).getCurrPwrTot());
						continue;
					}
				}
				if(labels[i].equals(list.get(list.size()-1).getBaseDatetime())) {
					break;
				}
			}
		}
		jo.put("ptValue", ja);
		model.addAttribute("message", jo);
		
		return "ajax/messageContent";
	}
}
