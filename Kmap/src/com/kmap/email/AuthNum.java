package com.kmap.email;

public class AuthNum {
	public String RandomNum(){
		StringBuffer buffer = new StringBuffer();
		
		for(int i=0; i<=6 ; i++){
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
}
