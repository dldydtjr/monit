package com.dev.nao.batch.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.dev.nao.batch.service.BatchService;
import com.dev.nao.batch.service.BatchVO;

import twitter4j.internal.org.json.JSONArray;
import twitter4j.internal.org.json.JSONObject;

/**
 * 구현체 <br>
 * 22.04.18 <br>
 * @author 이용석
 */
@Service("batchService")
@EnableTransactionManagement
public class BatchServiceImpl implements BatchService {

	@Resource(name="batchDAO")
    private BatchDAO batchDAO;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int data(BatchVO batchVO) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
		Calendar cal = Calendar.getInstance();
		String yearMon = dateFormat.format(cal.getTime()).substring(2,6);

		batchVO.setTableName("TB_SUKUB5M_"+yearMon);
		
		int insertYn = 0;
		String chk = batchDAO.chk(batchVO);
		
		if(chk == null || !chk.equals(batchVO.getBaseDatetime())) {
			batchDAO.data(batchVO);
			
			batchDAO.deleteDataCurr(batchVO);
			
			insertYn = batchDAO.dataCurr(batchVO);
		}else {
			System.out.println("전력거래소 중복데이터");
		}
		
		return insertYn;
	}

	@Override
	public int makeSukub5mTable() throws Exception {
		return batchDAO.makeSukub5mTable();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void selectTodayData(JSONArray array) throws Exception {
		BatchVO batchVO2 = new BatchVO();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
		Calendar cal = Calendar.getInstance();
		String yearMon = dateFormat.format(cal.getTime()).substring(2,6);

		batchVO2.setTableName("TB_SUKUB5M_"+yearMon);
		// db 조회
		List<BatchVO> selectTodayData = batchDAO.selectTodayData(batchVO2);
		
		// 현재 시간
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
//		Calendar cal = Calendar.getInstance();
//		String day = dateFormat.format(cal.getTime())+"000000";
		
		// 5분단위 루프용 시간
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMddHHmmss");
//		Date date = transFormat.parse(day);
//		Calendar cal1 = Calendar.getInstance();
//		cal1.setTime(date); // 시간 설정
		
		// db 데이터랑 api 조회 데이터랑 길이 체크
//		int cnt = array.length()<selectTodayData.size() ? array.length() : selectTodayData.size();
		
		System.out.println(array.length()+"==="+selectTodayData.size());
		JSONObject data = new JSONObject();
		for(int i=0;i<array.length();i++) {
//			if(i>0) {
//				cal1.add(Calendar.MINUTE, 5);
//			}
			data = array.getJSONObject(i);
			// 마지막꺼 저장
			if(i == selectTodayData.size()) {
				BatchVO batchVO = new BatchVO();
		        batchVO.setBaseDatetime(data.get("baseDatetime").toString());
		        batchVO.setSuppAbility(data.get("suppAbility").toString());
		        batchVO.setCurrPwrTot(data.get("currPwrTot").toString());
		        batchVO.setForecastLoad(data.get("forecastLoad").toString());
		        batchVO.setOperReservePwr(data.get("operReservePwr").toString());
		        batchVO.setOperReserveRate(data.get("operReserveRate").toString());
		        batchVO.setSuppReservePwr(data.get("suppReservePwr").toString());
		        batchVO.setSuppReserveRate(data.get("suppReserveRate").toString());
				this.data(batchVO);
				selectTodayData.add(i, batchVO);
				
			// DB 조회해온 리스트에 누락된거 강제 삽입
			}else if(!data.get("baseDatetime").toString().equals(selectTodayData.get(i).getBaseDatetime())) {
				BatchVO batchVO = new BatchVO();
				batchVO.setTableName("TB_SUKUB5M_"+yearMon);
				batchVO.setBaseDatetime(data.get("baseDatetime").toString());
//				batchVO.setSuppAbility(data.get("suppAbility").toString());
				batchVO.setCurrPwrTot(data.get("currPwrTot").toString());
//				batchVO.setForecastLoad(data.get("forecastLoad").toString());
//				batchVO.setOperReservePwr(data.get("operReservePwr").toString());
//				batchVO.setOperReserveRate(data.get("operReserveRate").toString());
//				batchVO.setSuppReservePwr(data.get("suppReservePwr").toString());
//				batchVO.setSuppReserveRate(data.get("suppReserveRate").toString());
				System.out.println("누락 데이터 저장:"+"baseDatetime-"+batchVO.getBaseDatetime());
				batchDAO.data(batchVO);
				selectTodayData.add(i, batchVO);
			}
		}
	}
	
}
