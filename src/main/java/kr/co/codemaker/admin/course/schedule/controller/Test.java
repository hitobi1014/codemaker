package kr.co.codemaker.admin.course.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.ibatis.sqlmap.engine.type.SimpleDateFormatter;

public class Test {
	
	public static void main(String[] args) {
		
		String str = "Wed Dec 09 2020 00:00:00 GMT+0900 (대한민국 표준시)";
		
		Date date = new Date();
		date = SimpleDateFormatter.format("YYYY-MM-dd HH:mm:ss", str);
		
		System.out.println(date);
		
	}

}
