package com.kmap.upload;

import java.util.ArrayList;
import java.util.Enumeration;

import com.kmap.upload.UploadDTO;
import com.oreilly.servlet.MultipartRequest;

public class FileUploader {
	
	public  ArrayList<UploadDTO> fileUpload(MultipartRequest multipartRequest,int num, String board){
		Enumeration<Object> e = multipartRequest.getFileNames();
		UploadDTO uploadDTO = null;
		ArrayList<UploadDTO> ar = new ArrayList<>();
		while(e.hasMoreElements()){
			String name=(String)e.nextElement();
			uploadDTO = this.fileUploadOne(multipartRequest, num, board, name);
			ar.add(uploadDTO);
		}
		return ar;
	}
	public UploadDTO fileUploadOne(MultipartRequest multipartRequest, int num, String board, String name){
		UploadDTO uploadDTO = new UploadDTO();
		uploadDTO.setFname(multipartRequest.getFilesystemName(name));
		uploadDTO.setOname(multipartRequest.getOriginalFileName(name));
		uploadDTO.setNum(num);
		uploadDTO.setBoard_type("freeboard");
		return uploadDTO;
	}
	
	
		
	
}
