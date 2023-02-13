package com.dev.nao.monitoring.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dev.nao.monitoring.service.MonitoringService;
import com.dev.nao.monitoring.service.MonitoringVO;

/**
 * 로그인 및 회원가입을 위한 Service 구현체 <br>
 * 22.04.18 <br>
 * @author 이용석
 */
@Service("monitoringService")
public class MonitoringServiceImpl implements MonitoringService {

	@Resource(name="monitoringDAO")
    private MonitoringDAO monitoringDAO;

	@Override
	public List<MonitoringVO> data(MonitoringVO monitoringVO) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
		Calendar cal = Calendar.getInstance();
		String yearMon = dateFormat.format(cal.getTime()).substring(2,6);

		monitoringVO.setTableName("TB_HISTDATA_"+yearMon);
		return monitoringDAO.data(monitoringVO);
	}
	
	@Override
	public List<MonitoringVO> data_hist(MonitoringVO monitoringVO) throws Exception {
		List<MonitoringVO> list = null;
		
		String stDate = monitoringVO.getStDate().replace("-", "").substring(2,6);
		String edDate = monitoringVO.getEdDate().replace("-", "").substring(2,6);
		if(stDate.equals(edDate)) {
			monitoringVO.setTableName("TB_HISTDATA_"+edDate);
			list = histTypeList(monitoringVO);
		}else {
			monitoringVO.setTableName("TB_HISTDATA_"+stDate);
			list = histTypeList(monitoringVO);
			monitoringVO.setTableName("TB_HISTDATA_"+edDate);
			list.addAll(histTypeList(monitoringVO));
		}
		return list;
	}
	
	public List<MonitoringVO> histTypeList(MonitoringVO monitoringVO) throws Exception {
		List<MonitoringVO> list = null;
		
		if("month".equals(monitoringVO.getSearchOpt())) {
			list = monitoringDAO.data_hist_month(monitoringVO);
		}else if("day".equals(monitoringVO.getSearchOpt())) {			
			list = monitoringDAO.data_hist_day(monitoringVO);
		}else if("hour".equals(monitoringVO.getSearchOpt())) {
			list = monitoringDAO.data_hist_hour(monitoringVO);
		}else if("15".equals(monitoringVO.getSearchOpt())) {
			list = monitoringDAO.data_hist15(monitoringVO);
		}else {
			list = monitoringDAO.data_hist(monitoringVO);
		}
		
		return list;
	}
}
