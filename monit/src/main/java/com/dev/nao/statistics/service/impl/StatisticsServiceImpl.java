package com.dev.nao.statistics.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dev.nao.statistics.service.StatisticsService;
import com.dev.nao.statistics.service.StatisticsVO;

/**
 * 로그인 및 회원가입을 위한 Service 구현체 <br>
 * 22.04.18 <br>
 * @author 이용석
 */
@Service("statisticsService")
public class StatisticsServiceImpl implements StatisticsService {

	@Resource(name="statisticsDAO")
    private StatisticsDAO statisticsDAO;

	@Override
	public List<StatisticsVO> data(StatisticsVO statisticsVO) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
		Calendar cal = Calendar.getInstance();
		String yearMon = dateFormat.format(cal.getTime()).substring(2,6);

		statisticsVO.setTableName("TB_HISTDATA_"+yearMon);
		return statisticsDAO.data(statisticsVO);
	}
}
