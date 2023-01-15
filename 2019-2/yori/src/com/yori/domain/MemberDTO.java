package com.yori.domain;

public class MemberDTO {
	private String memId;
	private String memPwd;
	private String memName;
	private String memGen;
	private String memNum;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemGen() {
		return memGen;
	}
	public void setMemGen(String memGen) {
		this.memGen = memGen;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	@Override
	public String toString() {
		return "memberDTO [id=" + memId + ", pw=" + memPwd + ", name=" + memName + ", + gender=" + memGen + " + number=" + memNum + " ]";
	}
	
}
