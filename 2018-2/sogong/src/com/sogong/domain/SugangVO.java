package com.sogong.domain;

import java.util.Date;

public class SugangVO {
	private String userID;
	private String lessonID;
	private boolean payCheck;
	private Date payDate;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getLessonID() {
		return lessonID;
	}
	public void setLessonID(String lessonID) {
		this.lessonID = lessonID;
	}
	public boolean isPayCheck() {
		return payCheck;
	}
	public void setPayCheck(boolean payCheck) {
		this.payCheck = payCheck;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	
	
}
