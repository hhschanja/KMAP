package com.kmap.ticket;

import java.sql.Date;

import com.kmap.product.ProductDTO;

public class TicketDTO extends ProductDTO {
	public Date getStart_month() {
		return start_month;
	}
	public void setStart_month(Date start_month) {
		this.start_month = start_month;
	}
	public Date getLast_month() {
		return last_month;
	}
	public void setLast_month(Date last_month) {
		this.last_month = last_month;
	}
	public int getTnum() {
		return tnum;
	}
	public void setTnum(int tnum) {
		this.tnum = tnum;
	}

	public int getRequired_time() {
		return required_time;
	}
	public void setRequired_time(int required_time) {
		this.required_time = required_time;
	}
	private int tnum;
	private Date start_month;
	private Date last_month;
	private int required_time;
	
}
