package com.dev.nao.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 공통 함수 util <br>
 * 19.05.08 <br>
 * @author 오세광 팀장
 */
public class commonUtil {
	/** Null을 ""으로 치환 */
	public static String isNullToString(Object obj) {
		String result = "";
		if(obj != null) {
			result = obj.toString();
		}
		return result;
	}
	/** 현재 시간 */
	public static String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
		return format.format(date);
	}
}