package com.dev.nao.batch.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.nao.batch.service.BatchVO;

/**
 * DAO <br>
 * 23.02.14 <br>
 * @author 이용석
 */
@Repository("batchDAO")
public class BatchDAO {

	@Autowired
    private SqlSessionTemplate sqlSession;

	public int sample(BatchVO batchVO) throws Exception {
		return sqlSession.insert("dashboardDAO.sample", batchVO);
	}
	
}
