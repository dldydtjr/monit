package com.dev.nao.dashboard.service;

import java.util.List;

/**
 * Service interface <br>
 * 22.04.18 <br>
 * @author 이용석
 */
public interface DashboardService {
	public DashboardVO setWeather(DashboardVO dashboardVO) throws Exception;
	public DashboardVO getWeather(DashboardVO dashboardVO) throws Exception;
	public DashboardVO getCurrData(DashboardVO dashboardVO) throws Exception;
	public List<DashboardVO> getData(DashboardVO dashboardVO) throws Exception;
}