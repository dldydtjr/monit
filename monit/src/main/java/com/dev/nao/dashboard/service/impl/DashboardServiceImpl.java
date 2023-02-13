package com.dev.nao.dashboard.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dev.nao.dashboard.service.DashboardService;
import com.dev.nao.dashboard.service.DashboardVO;

/**
 * Service 구현체 <br>
 * 22.04.18 <br>
 * @author 이용석
 */
@Service("dashboardService")
public class DashboardServiceImpl implements DashboardService {

	@Resource(name="dashboardDAO")
    private DashboardDAO dashboardDAO;

	@Override
	public DashboardVO setWeather(DashboardVO dashboardVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DashboardVO getWeather(DashboardVO dashboardVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DashboardVO getCurrData(DashboardVO dashboardVO) throws Exception {
		return dashboardDAO.getCurrData(dashboardVO);
	}

	@Override
	public List<DashboardVO> getData(DashboardVO dashboardVO) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
		Calendar cal = Calendar.getInstance();
		String yearMon = dateFormat.format(cal.getTime()).substring(2,6);

		dashboardVO.setTableName("TB_SUKUB5M_"+yearMon);
		
		return dashboardDAO.getData(dashboardVO);
	}

}
