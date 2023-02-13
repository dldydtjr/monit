package com.dev.nao.monitoring.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.nao.monitoring.service.MonitoringVO;

/**
 * 로그인 및 회원가입을 위한 DAO <br>
 * 22.04.18 <br>
 * @author 이용석
 */
@Repository("monitoringDAO")
public class MonitoringDAO {

	@Autowired
    private SqlSessionTemplate sqlSession;

	public List<MonitoringVO> data(MonitoringVO monitoringVO) throws Exception {
		return sqlSession.selectList("monitoringDAO.selectData", monitoringVO);
	}
	
	public List<MonitoringVO> data_hist(MonitoringVO monitoringVO) throws Exception {
		return sqlSession.selectList("monitoringDAO.selectData_hist", monitoringVO);
	}
	
	public List<MonitoringVO> data_hist15(MonitoringVO monitoringVO) throws Exception {
		return sqlSession.selectList("monitoringDAO.selectData_hist15", monitoringVO);
	}
	
	public List<MonitoringVO> data_hist_hour(MonitoringVO monitoringVO) throws Exception {
		return sqlSession.selectList("monitoringDAO.selectData_hist_hour", monitoringVO);
	}
	
	public List<MonitoringVO> data_hist_day(MonitoringVO monitoringVO) throws Exception {
		return sqlSession.selectList("monitoringDAO.selectData_hist_day", monitoringVO);
	}
	
	public List<MonitoringVO> data_hist_month(MonitoringVO monitoringVO) throws Exception {
		return sqlSession.selectList("monitoringDAO.selectData_hist_month", monitoringVO);
	}
}
