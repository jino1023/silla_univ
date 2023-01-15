package com.yori.domain;

public class ReplyDTO {
	private Integer rpNum;
	private String rpDate;
	private String rpContent;
	private String memId;
	private Integer recNum;
	private Integer rpStar;
	
	public Integer getRpStar() {
		return rpStar;
	}
	public void setRpStar(Integer rpStar) {
		this.rpStar = rpStar;
	}
	public int getRpNum() {
		return rpNum;
	}
	public void setRpNum(int rpNum) {
		this.rpNum = rpNum;
	}
	public String getRpDate() {
		return rpDate;
	}
	public void setRpDate(String rpDate) {
		this.rpDate = rpDate;
	}
	public String getRpContent() {
		return rpContent;
	}
	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getRecNum() {
		return recNum;
	}
	public void setRecNum(int recNum) {
		this.recNum = recNum;
	}
}
