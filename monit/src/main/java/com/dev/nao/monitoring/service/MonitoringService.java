package com.dev.nao.monitoring.service;

import java.util.List;

/**
 * 로그인 및 회원가입을 위한 Service interface <br>
 * 22.04.18 <br>
 * @author 이용석
 */
public interface MonitoringService {
	public List<MonitoringVO> data(MonitoringVO monitoringVO) throws Exception;
	public List<MonitoringVO> data_hist(MonitoringVO monitoringVO) throws Exception;
}