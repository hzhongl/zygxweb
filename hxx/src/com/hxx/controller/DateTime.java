package com.hxx.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {
	
	public String time() {
		Date date=new Date();
		
		SimpleDateFormat thisdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String time=thisdate.format(date);
		
		return time;
	}
	
}
