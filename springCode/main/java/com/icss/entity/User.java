package com.icss.entity;

import java.util.Date;

public class User {
	private String uname;
	private String pwd;
	private int role;
	private String tel;
	private java.util.Date regTime;
	private double account;

	
    public double getAccount() {
		return account;
	}

	public void setAccount(double account) {
		this.account = account;
	}
	
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
}
