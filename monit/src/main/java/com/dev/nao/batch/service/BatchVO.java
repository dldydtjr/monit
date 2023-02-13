package com.dev.nao.batch.service;

/**
 *  <br>
 * 22.04.18 <br>
 * @author 이용석
 */
public class BatchVO {

	String baseDatetime;
	
	String currPwrTot;
	
	String forecastLoad;
	
	String operReservePwr;
	
	String operReserveRate;
	
	String suppAbility;
	
	String suppReservePwr;
	
	String suppReserveRate;

	String tableName;
	
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

}
