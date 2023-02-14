package com.dev.nao.batch.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.dev.nao.batch.service.BatchService;

import twitter4j.internal.org.json.JSONArray;
import twitter4j.internal.org.json.JSONObject;
import twitter4j.internal.org.json.XML;


/**
 * Controller <br>
 * 23.02.14 <br>
 * @author 이용석
 */
@Controller
public class BatchController {
	
	@Resource(name = "batchService")
	BatchService batchService;
	
	String sk = "zf0NtvFyeGTNjU4AZrC8cnWSAvKUiXKXcZj0nNVBQj%2FjPjXPb8O%2By3EdwKiVuf9ilfOVLTna2EfiTm6l8OiXUg%3D%3D";
	
	public void sample() throws Exception {
		System.out.println("==================================================");
		System.out.println("전력거래소 일데이터 조회 (누락 데이터 저장용)");
		try {
			StringBuilder urlBuilder = new StringBuilder("https://openapi.kpx.or.kr/openapi/sukub5mToday/getSukub5mToday"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+sk); /*Service Key*/
			URL url = new URL(urlBuilder.toString());
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			conn.setRequestMethod("GET");
//			conn.setRequestProperty("Content-type", "application/json");
//			System.out.println(conn.getResponseCode());
//			BufferedReader rd;
//			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//			    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			} else {
//			    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//			}
//			StringBuilder sb = new StringBuilder();
//			String line;
//			while ((line = rd.readLine()) != null) {
//			    sb.append(line);
//			}
//			rd.close();
//			conn.disconnect();
//			
//	        JSONObject json = XML.toJSONObject(sb.toString());
//	        System.out.println(json.getJSONObject("response").getJSONObject("header"));
//	        JSONArray dataArray = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
//	        batchService.selectTodayData(dataArray);
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
