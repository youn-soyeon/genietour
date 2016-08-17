package com.genietour.www.hotel;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class test {

	public static void main(String[] args) {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = df.parse("2013-02-15");
			for (int i = 0; i < 2; i++) {
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				cal.add(Calendar.DATE, i);
				System.err.println(df.format(cal.getTime()));
				
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

}
