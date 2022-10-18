package com.myweb.somoim.moim.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class MeetingsDTO {
	private int meetingId;
	private String meetingTitle;
	private Date meetingDate;
	private String meetingTime;
	private String meetingPlace;
	private int meetingPrice;
	private int meetingLimit;
	private int moimId;
	private String month;
	private String day;
	private String dayOfW;
	private String hour;
	private String minute;
	private Date meetingCreateDate;

	public String getMeetingTime() {
		return meetingTime;
	}

	public void setMeetingTime(String meetingTime) {
		this.meetingTime = meetingTime;
	}
	public Date getMeetingCreateDate() {
		return meetingCreateDate;
	}

	public void setMeetingCreateDate(Date meetingCreateDate) {
		this.meetingCreateDate = meetingCreateDate;
	}

	public int getMeetingId() {
		return meetingId;
	}
	
	public void setMeetingId(int meetingId) {
		this.meetingId = meetingId;
	}
	
	public String getMeetingTitle() {
		return meetingTitle;
	}
	
	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}
	
	public Date getMeetingDate() {
		return meetingDate;
	}
	
	public void setMeetingDate(Date meetingDate) {
		this.meetingDate = meetingDate;
	SimpleDateFormat dateFm = new SimpleDateFormat("yyyy MM dd E요일 HH mm");
	String date = dateFm.format(meetingDate);
	
	String [] dateSplit = date.split(" ");
	for (int i=0 ; i< dateSplit.length ;i++ ) {
		
	}
	this.month = dateSplit[1];
	this.day = dateSplit[2];
	this.dayOfW = dateSplit[3];
	this.hour = dateSplit[4];
	this.minute = dateSplit[5];
	}
	
	public String getMeetingPlace() {
		return meetingPlace;
	}
	
	public void setMeetingPlace(String meetingPlace) {
		this.meetingPlace = meetingPlace;
	}
	
	public int getMeetingPrice() {
		return meetingPrice;
	}
	
	public void setMeetingPrice(int meetingPrice) {
		this.meetingPrice = meetingPrice;
	}
	
	public int getMeetingLimit() {
		return meetingLimit;
	}
	
	public void setMeetingLimit(int meetingLimit) {
		this.meetingLimit = meetingLimit;
	}
	
	public int getMoimId() {
		return moimId;
	}
	
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}
	


	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getDayOfW() {
		return dayOfW;
	}

	public void setDayOfW(String dayOfW) {
		this.dayOfW = dayOfW;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMinute() {
		return minute;
	}

	public void setMinute(String minute) {
		this.minute = minute;
	}

	@Override
	public String toString() {
		return "MeetingsDTO{" +
				"meetingId=" + meetingId +
				", meetingTitle='" + meetingTitle + '\'' +
				", meetingDate=" + meetingDate +
				", meetingTime='" + meetingTime + '\'' +
				", meetingPlace='" + meetingPlace + '\'' +
				", meetingPrice=" + meetingPrice +
				", meetingLimit=" + meetingLimit +
				", moimId=" + moimId +
				", month='" + month + '\'' +
				", day='" + day + '\'' +
				", dayOfW='" + dayOfW + '\'' +
				", hour='" + hour + '\'' +
				", minute='" + minute + '\'' +
				", meetingCreateDate=" + meetingCreateDate +
				'}';
	}
}
