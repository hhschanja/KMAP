package com.kmap.question;

import com.kmap.board.BoardDTO;

public class QuestionDTO extends BoardDTO {
	private String phone_kind;
	private String phone_1;
	private String phone_2;
	private String phone_3;
	
	public String getPhone_kind() {
		return phone_kind;
	}
	public void setPhone_kind(String phone_kind) {
		this.phone_kind = phone_kind;
	}
	public String getPhone_1() {
		return phone_1;
	}
	public void setPhone_1(String phone_1) {
		this.phone_1 = phone_1;
	}
	public String getPhone_2() {
		return phone_2;
	}
	public void setPhone_2(String phone_2) {
		this.phone_2 = phone_2;
	}
	public String getPhone_3() {
		return phone_3;
	}
	public void setPhone_3(String phone_3) {
		this.phone_3 = phone_3;
	}

}
