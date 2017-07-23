package com.kmap.freeboard;

import com.kmap.board.BoardDTO;

public class FreeboardDTO extends BoardDTO {
	private int hit;
	private int recommend;
	private String kind;
	
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

}
