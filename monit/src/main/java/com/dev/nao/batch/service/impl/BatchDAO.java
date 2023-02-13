package com.dev.nao.batch.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.nao.batch.service.BatchVO;

/**
 * DAO <br>
 * 22.04.18 <br>
 * @author 이용석
 */
@Repository("batchDAO")
public class BatchDAO {

	@Autowired
    private SqlSessionTemplate sqlSession;
	
	public String chk(BatchVO batchVO) throws Exception {
		System.out.println("기준일시:"+"baseDatetime-"+batchVO.getBaseDatetime());
//		System.out.println("체크");
		return sqlSession.selectOne("batchDAO.chk", batchVO);
	}

	public int data(BatchVO batchVO) throws Exception {
//		System.out.println("전력거래소 수요 등록");
		return sqlSession.insert("batchDAO.insertData", batchVO);
	}
	
	public int deleteDataCurr(BatchVO batchVO) throws Exception {
//		System.out.println("현황 삭제");
		return sqlSession.delete("batchDAO.deleteDataCurr", batchVO);		
	}
	
	public int dataCurr(BatchVO batchVO) throws Exception {
//		System.out.println("현황 등록");
		return sqlSession.insert("batchDAO.insertDataCurr", batchVO);
	}
	
	public int makeSukub5mTable() throws Exception {
		return sqlSession.insert("batchDAO.makeSukub5mTable");
	}
	
	public List<BatchVO> selectTodayData(BatchVO batchVO) throws Exception {
		return sqlSession.selectList("batchDAO.selectTodayData", batchVO);
	}
}
