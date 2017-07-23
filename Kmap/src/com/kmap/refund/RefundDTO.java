package com.kmap.refund;

import java.sql.Date;

public class RefundDTO {
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getRefund_type() {
		return refund_type;
	}
	public void setRefund_type(String refund_type) {
		this.refund_type = refund_type;
	}
	private int num;
	private int purchase_num;
	private String id;
	private String title;
	private String contents;
	private Date write_date;
	private String handling;
	private String refund_type;
	private int point;
	public String getHandling() {
		return handling;
	}
	public void setHandling(String handling) {
		this.handling = handling;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPurchase_num() {
		return purchase_num;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public void setPurchase_num(int purchase_num) {
		this.purchase_num = purchase_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}


}
