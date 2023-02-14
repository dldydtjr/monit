package com.dev.nao.statistics.service;

import java.util.List;

/**
 * 로그인 및 회원가입을 위한 Service interface <br>
 * 22.04.18 <br>
 * @author 이용석
 */
public interface StatisticsService {
	public List<StatisticsVO> data(StatisticsVO statisticsVO) throws Exception;
}