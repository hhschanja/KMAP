package com.kmap.reply;

import com.kmap.board.BoardDTO;

public class ReplyDTO extends BoardDTO{
	private int ref;
	private int step;
	private int depth;
	private String type;
	private int type_num;
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getType_num() {
		return type_num;
	}
	public void setType_num(int type_num) {
		this.type_num = type_num;
	}

}
