package com.dev.nao.batch.service;

import twitter4j.internal.org.json.JSONArray;

/**
 * Service interface <br>
 * 22.04.18 <br>
 * @author 이용석
 */
public interface BatchService {
	public int data(BatchVO batchVO) throws Exception;
	public int makeSukub5mTable() throws Exception;
	public void selectTodayData(JSONArray a) throws Exception;
}