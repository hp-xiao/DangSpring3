package com.icss.dto;

import java.util.Date;
/**
 *     Ö÷Ò³Í¼Êé
 */
public class MBook {
	private String isbn;
	private String   bname;	
	private double   price;	
	private String   pic;
	private int dno;
	private Date rtime;
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public Date getRtime() {
		return rtime;
	}
	public void setRtime(Date rtime) {
		this.rtime = rtime;
	}	
}
