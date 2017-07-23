package com.kmap.upload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmap.util.DBConnector;

public class AdminUploadDAO {
	
	public int uploadInsert(AdminUploadDTO udto){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "insert into upload_admin values(?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, udto.getNum());
			pst.setString(2, udto.getFname());
			pst.setString(3, udto.getOname());
			pst.setString(4, udto.getManagement_type());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}
	
	public int uploadDelete(String fname){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;

		
		String sql = "delete from upload_admin where fname=?";
		try {
			pst=con.prepareStatement(sql);
			pst.setString(1, fname);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}
	
	public List<AdminUploadDTO> list(int num, String management_type){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<AdminUploadDTO> ar = new ArrayList<>();
		
		String sql = "select * from upload_admin where num=? and management_type like ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			pst.setString(2, "%"+management_type+"%");
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				AdminUploadDTO adto = new AdminUploadDTO();
				adto.setNum(rs.getInt("num"));
				adto.setFname(rs.getString("fname"));
				adto.setOname(rs.getString("oname"));
				adto.setManagement_type(rs.getString("management_type"));
				ar.add(adto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return ar;
	}

		//구매리스트,장바구니 사진 불러오기
	public List<AdminUploadDTO> purchaseList(int num, String management_type1,String management_type2){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<AdminUploadDTO> ar = new ArrayList<>();
		
		String sql = "select * from upload_admin where num=? and management_type in(?,?)";
		try {
			System.out.println("여기는 구매리스트");
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			pst.setString(2, management_type1);
			pst.setString(3, management_type2);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				AdminUploadDTO adto = new AdminUploadDTO();
				adto.setNum(rs.getInt("num"));
				adto.setFname(rs.getString("fname"));
				adto.setOname(rs.getString("oname"));
				adto.setManagement_type(rs.getString("management_type"));
				ar.add(adto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return ar;
	}
	
	
	public int update(AdminUploadDTO newAr, AdminUploadDTO pastAr){
		Connection con = DBConnector.getConnect();
		PreparedStatement ps = null;
		String s = newAr.getFname();
		int result = 0;
		
		if(s == null){
			result = 99;
		}else{
			
		String sql = null;
		
		sql = "update upload_admin set fname=?, oname=? where num=? and fname=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, newAr.getFname());
			ps.setString(2, newAr.getOname());
			ps.setInt(3, newAr.getNum());
			ps.setString(4, pastAr.getFname());
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			result=0;
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(ps, con);
		}
	}
		return result;
	}
	
	public int uploadDelete(int num){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "delete from upload_admin where num=?";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, num);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}
	
	public int uploadDelete(int num, String management_type){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "delete from upload_admin where num=? and management_type=?";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, num);
			pst.setString(2, management_type);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}
	
}