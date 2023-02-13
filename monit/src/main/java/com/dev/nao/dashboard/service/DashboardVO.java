package com.dev.nao.dashboard.service;

/**
 * 데이터 모델 <br>
 * 22.04.18 <br>
 * @author 이용석
 */
public class DashboardVO {

	String baseDate;
	String baseTime;
	String x;
	String y;
	String t1h;
	String rn1;
	String sky;
	
	
	
	
	String baseDatetime;
	
	String currPwrTot;
	
	String forecastLoad;
	
	String operReservePwr;
	
	String operReserveRate;
	
	String suppAbility;
	
	String suppReservePwr;
	
	String suppReserveRate;

	String tableName;
	
	String searchDate;
	String searchTime;
	
	public String getBaseDate() {
		return baseDate;
	}

	public void setBaseDate(String baseDate) {
		this.baseDate = baseDate;
	}

	public String getBaseTime() {
		return baseTime;
	}

	public void setBaseTime(String baseTime) {
		this.baseTime = baseTime;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public String getT1h() {
		return t1h;
	}

	public void setT1h(String t1h) {
		this.t1h = t1h;
	}

	public String getRn1() {
		return rn1;
	}

	public void setRn1(String rn1) {
		this.rn1 = rn1;
	}

	public String getSky() {
		return sky;
	}

	public void setSky(String sky) {
		this.sky = sky;
	}

	public String getBaseDatetime() {
		return baseDatetime;
	}

	public void setBaseDatetime(String baseDatetime) {
		this.baseDatetime = baseDatetime;
	}

	public String getCurrPwrTot() {
		return currPwrTot;
	}

	public void setCurrPwrTot(String currPwrTot) {
		this.currPwrTot = currPwrTot;
	}

	public String getForecastLoad() {
		return forecastLoad;
	}

	public void setForecastLoad(String forecastLoad) {
		this.forecastLoad = forecastLoad;
	}

	public String getOperReservePwr() {
		return operReservePwr;
	}

	public void setOperReservePwr(String operReservePwr) {
		this.operReservePwr = operReservePwr;
	}

	public String getOperReserveRate() {
		return operReserveRate;
	}

	public void setOperReserveRate(String operReserveRate) {
		this.operReserveRate = operReserveRate;
	}

	public String getSuppAbility() {
		return suppAbility;
	}

	public void setSuppAbility(String suppAbility) {
		this.suppAbility = suppAbility;
	}

	public String getSuppReservePwr() {
		return suppReservePwr;
	}

	public void setSuppReservePwr(String suppReservePwr) {
		this.suppReservePwr = suppReservePwr;
	}

	public String getSuppReserveRate() {
		return suppReserveRate;
	}

	public void setSuppReserveRate(String suppReserveRate) {
		this.suppReserveRate = suppReserveRate;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	public String getSearchTime() {
		return searchTime;
	}

	public void setSearchTime(String searchTime) {
		this.searchTime = searchTime;
	}

}
