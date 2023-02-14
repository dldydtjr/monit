package com.dev.nao.statistics.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev.nao.statistics.service.StatisticsService;
import com.dev.nao.statistics.service.StatisticsVO;

import twitter4j.internal.org.json.JSONArray;
import twitter4j.internal.org.json.JSONObject;

@Controller
public class StatisticsController {

	@Resource(name = "statisticsService")
	StatisticsService statisticsService;
	
	@RequestMapping(value = "/statistics", method = RequestMethod.GET)
	public String monitoring(HttpServletRequest request, Model model) throws Exception {
//		if(request.getSession().getAttribute("id") == null) {
//			return "redirect:/";
//		}
		
		return "statistics/statistics";
	}
	
	@RequestMapping(value = "/statistics/getData", method = RequestMethod.POST)
	public String getData(@ModelAttribute("statisticsVO") StatisticsVO statisticsVO,
			HttpServletRequest request, Model model) throws Exception {
		
		String[] labels = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09"
							, "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"
							, "20", "21", "22", "23"
							};
		
		List<StatisticsVO> list = statisticsService.data(statisticsVO);
		JSONArray ja = new JSONArray();
		JSONArray ja2 = new JSONArray();
//		JSONArray ja3 = new JSONArray();
		JSONObject jo = new JSONObject();
		for(int j=0; j<labels.length;j++) {
			ja.put("0");
			ja2.put(labels[j]);
			
			for(int i=0; i<list.size();i++) {
				if(labels[j].equals(list.get(i).getLabels())) {					
					ja.put(j, list.get(i).getPtValue());
//					ja3.put(j, list.get(i).getHistDate());
					continue;
				}
			}
		}
		jo.put("data", ja);
		jo.put("time", ja2);
        model.addAttribute("message", jo);
        
        return "ajax/messageContent";
	}
	
	
}
