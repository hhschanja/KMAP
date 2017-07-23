package com.kmap.upload;

import java.util.ArrayList;
import java.util.Enumeration;

import com.oreilly.servlet.MultipartRequest;

public class AdminFileUploader {

	public ArrayList<AdminUploadDTO> upload(MultipartRequest request, int num, String management_type){
		
		ArrayList<AdminUploadDTO> ar = new ArrayList<>();
		Enumeration<Object> em = request.getFileNames();
		System.out.println(request.getFileNames());
		
		while(em.hasMoreElements()){
			AdminUploadDTO udto = new AdminUploadDTO();
			String name = (String)em.nextElement();
			udto = this.upload(request, num, management_type, name);
			ar.add(udto);
		}
		return ar;
	}
	
	public AdminUploadDTO upload(MultipartRequest request, int num, String management_type, String name){
		
		AdminUploadDTO udto = new AdminUploadDTO();
		udto.setFname(request.getFilesystemName(name));
		udto.setOname(request.getOriginalFileName(name));
		udto.setManagement_type(management_type);
		udto.setNum(num);
		
		return udto;
	}
	
	
}
