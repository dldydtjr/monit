package com.dev.nao.statistics.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.nao.statistics.service.StatisticsVO;

/**
 * 로그인 및 회원가입을 위한 DAO <br>
 * 22.04.18 <br>
 * @author 이용석
 */
@Repository("statisticsDAO")
public class StatisticsDAO {

	@Autowired
    private SqlSessionTemplate sqlSession;

	public List<StatisticsVO> data(StatisticsVO statisticsVO) throws Exception {
		return sqlSession.selectList("statisticsDAO.selectData", statisticsVO);
	}
	
}
