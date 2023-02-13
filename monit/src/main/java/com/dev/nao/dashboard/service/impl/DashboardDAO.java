package com.dev.nao.dashboard.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.nao.dashboard.service.DashboardVO;
import com.dev.nao.login.service.LoginVO;
import java.util.List;

/**
 * DAO <br>
 * 22.04.18 <br>
 * @author 이용석
 */
@Repository("dashboardDAO")
public class DashboardDAO {

	@Autowired
    private SqlSessionTemplate sqlSession;

	public int deleteWeather(DashboardVO dashboardVO) throws Exception {
		return sqlSession.insert("dashboardDAO.deleteWeather", dashboardVO);
	}
	
	public int insertWeather(DashboardVO dashboardVO) throws Exception {
		return sqlSession.insert("dashboardDAO.insertWeather", dashboardVO);
	}
	
	public DashboardVO getWeather(DashboardVO dashboardVO) throws Exception {
		return sqlSession.selectOne("dashboardDAO.getWeather", dashboardVO);
	}
	
	public DashboardVO getCurrData(DashboardVO dashboardVO) throws Exception {
		return sqlSession.selectOne("dashboardDAO.getCurrData", dashboardVO);
	}
	
	public List<DashboardVO> getData(DashboardVO dashboardVO) throws Exception {
		return sqlSession.selectList("dashboardDAO.getData", dashboardVO);
	}
}
