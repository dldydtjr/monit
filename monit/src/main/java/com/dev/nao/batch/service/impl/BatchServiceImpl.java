package com.dev.nao.batch.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.dev.nao.batch.service.BatchService;
import com.dev.nao.batch.service.BatchVO;

/**
 * 구현체 <br>
 * 23.02.14 <br>
 * @author 이용석
 */
@Service("batchService")
@EnableTransactionManagement
public class BatchServiceImpl implements BatchService {

	@Resource(name="batchDAO")
    private BatchDAO batchDAO;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int sample(BatchVO batchVO) throws Exception {
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
//		Calendar cal = Calendar.getInstance();
//		String yearMon = dateFormat.format(cal.getTime()).substring(2,6);
//
//		batchVO.setTableName("TB_SUKUB5M_"+yearMon);
		
		int insertYn = 0;
		insertYn = batchDAO.sample(batchVO);
		
		return insertYn;
	}
	
}
