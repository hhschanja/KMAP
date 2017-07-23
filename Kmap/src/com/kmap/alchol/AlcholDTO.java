package com.kmap.alchol;

import java.sql.Date;

import com.kmap.product.ProductDTO;

public class AlcholDTO extends ProductDTO {
	private int anum;
	private Date made_date;
	private long degree;
	private int capacity;
	private String material;
	private String kind;
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public Date getMade_date() {
		return made_date;
	}
	public void setMade_date(Date made_date) {
		this.made_date = made_date;
	}
	public long getDegree() {
		return degree;
	}
	public void setDegree(long degree) {
		this.degree = degree;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}

}
