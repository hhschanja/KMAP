package com.kmap.purchase;

import com.kmap.sale.SaleDTO;

public class PurchaseDTO extends SaleDTO {


	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	private int point;
	private String status;
	private String charge_type;
	private int address_num;
	private String address_main;
	private String address_detail;
	private String member_name;
	

	public int getAddress_num() {
		return address_num;
	}
	public void setAddress_num(int address_num) {
		this.address_num = address_num;
	}
	public String getAddress_main() {
		return address_main;
	}
	public void setAddress_main(String address_main) {
		this.address_main = address_main;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCharge_type() {
		return charge_type;
	}
	public void setCharge_type(String charge_type) {
		this.charge_type = charge_type;
	}
	
	
}