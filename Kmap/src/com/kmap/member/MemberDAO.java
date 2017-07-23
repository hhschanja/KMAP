package com.kmap.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kmap.util.DBConnector;

public class MemberDAO {
	
	//비밀번호 업데이트 메서드
	public int updatPw(String id, String pw){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		String sql = "update member set pw=? where id=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, pw);
			pst.setString(2, id);
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}
	//새로운 비밀번호 폼 불러오는 메서드
	public MemberDTO updateFormPw(MemberDTO memberDTO){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select * from member where id=? and pwq=? and pwa=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, memberDTO.getId());
			pst.setString(2, memberDTO.getPwq());
			pst.setString(3, memberDTO.getPwa());
			
			rs = pst.executeQuery();
			if(rs.next()){
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwq(rs.getString("pwq"));
				memberDTO.setPwa(rs.getString("pwa"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setAddress_num(rs.getInt("address_num"));
				memberDTO.setAddress_main(rs.getString("address_main"));
				memberDTO.setAddress_detail(rs.getString("address_detail"));
				memberDTO.setPhone_kind(rs.getString("phone_kind"));
				memberDTO.setPhone_1(rs.getString("phone_1"));
				memberDTO.setPhone_2(rs.getString("phone_2"));
				memberDTO.setPhone_3(rs.getString("phone_3"));
				memberDTO.setEmail_id(rs.getString("email_id"));
				memberDTO.setEmail_site(rs.getString("email_site"));
				memberDTO.setBirth_year(rs.getString("birth_year"));
				memberDTO.setBirth_month(rs.getString("birth_month"));
				memberDTO.setBirth_day(rs.getString("birth_day"));
				memberDTO.setPoint(rs.getInt("point"));
			}else {
				memberDTO = null;
			}
		} catch (SQLException e) {
			memberDTO = null;
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return memberDTO;
	}
	//비밀번호 찾기 메서드
	public MemberDTO findPw(MemberDTO memberDTO){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select * from member where id=? and name=? and email_id=? and email_site=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, memberDTO.getId());
			pst.setString(2, memberDTO.getName());
			pst.setString(3, memberDTO.getEmail_id());
			pst.setString(4, memberDTO.getEmail_site());
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwq(rs.getString("pwq"));
				memberDTO.setPwa(rs.getString("pwa"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setAddress_num(rs.getInt("address_num"));
				memberDTO.setAddress_main(rs.getString("address_main"));
				memberDTO.setAddress_detail(rs.getString("address_detail"));
				memberDTO.setPhone_kind(rs.getString("phone_kind"));
				memberDTO.setPhone_1(rs.getString("phone_1"));
				memberDTO.setPhone_2(rs.getString("phone_2"));
				memberDTO.setPhone_3(rs.getString("phone_3"));
				memberDTO.setEmail_id(rs.getString("email_id"));
				memberDTO.setEmail_site(rs.getString("email_site"));
				memberDTO.setBirth_year(rs.getString("birth_year"));
				memberDTO.setBirth_month(rs.getString("birth_month"));
				memberDTO.setBirth_day(rs.getString("birth_day"));
				memberDTO.setPoint(rs.getInt("point"));
			}else {
				memberDTO = null;
			}
		} catch (SQLException e) {
			memberDTO = null;
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return memberDTO;
	}
	
	public MemberDTO idView (MemberDTO memberDTO){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select id from member where name=? and email_id=? and email_site=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, memberDTO.getName());
			pst.setString(2, memberDTO.getEmail_id());
			pst.setString(3, memberDTO.getEmail_site());
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				memberDTO.setId(rs.getString("id"));
			}else {
				memberDTO = null;
			}
		} catch (SQLException e) {
			memberDTO = null;
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return memberDTO;
		
	}
	//아이디 찾을때  맨처음 이름과 이메일 가져와서 매치하는 메서드
	public int findId(MemberDTO memberDTO){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int result = 0;
		
		String sql = "select count(rownum) from member where name=? and email_id=? and email_site=?";
		
		try {
			pst = con.prepareStatement(sql);
			
			pst.setString(1, memberDTO.getName());
			pst.setString(2, memberDTO.getEmail_id());
			pst.setString(3, memberDTO.getEmail_site());
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return result;
	}
	public MemberDTO reLogin(MemberDTO memberDTO){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst =null;
		ResultSet rs = null;
		String sql = "select * from member where id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, memberDTO.getId());
			rs = pst.executeQuery();
			if(rs.next()){
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwq(rs.getString("pwq"));
				memberDTO.setPwa(rs.getString("pwa"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setAddress_num(rs.getInt("address_num"));
				memberDTO.setAddress_main(rs.getString("address_main"));
				memberDTO.setAddress_detail(rs.getString("address_detail"));
				memberDTO.setPhone_kind(rs.getString("phone_kind"));
				memberDTO.setPhone_1(rs.getString("phone_1"));
				memberDTO.setPhone_2(rs.getString("phone_2"));
				memberDTO.setPhone_3(rs.getString("phone_3"));
				memberDTO.setEmail_id(rs.getString("email_id"));
				memberDTO.setEmail_site(rs.getString("email_site"));
				memberDTO.setBirth_year(rs.getString("birth_year"));
				memberDTO.setBirth_month(rs.getString("birth_month"));
				memberDTO.setBirth_day(rs.getString("birth_day"));
				memberDTO.setPoint(rs.getInt("point"));
			}else{
				memberDTO = null;
			}
		} catch (SQLException e) {
			memberDTO = null;
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return memberDTO;
		
	}
	public MemberDTO login(MemberDTO memberDTO){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst =null;
		ResultSet rs = null;
		String sql = "select * from member where id = ? and pw = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, memberDTO.getId());
			pst.setString(2, memberDTO.getPw());
			rs = pst.executeQuery();
			if(rs.next()){
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwq(rs.getString("pwq"));
				memberDTO.setPwa(rs.getString("pwa"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setAddress_num(rs.getInt("address_num"));
				memberDTO.setAddress_main(rs.getString("address_main"));
				memberDTO.setAddress_detail(rs.getString("address_detail"));
				memberDTO.setPhone_kind(rs.getString("phone_kind"));
				memberDTO.setPhone_1(rs.getString("phone_1"));
				memberDTO.setPhone_2(rs.getString("phone_2"));
				memberDTO.setPhone_3(rs.getString("phone_3"));
				memberDTO.setEmail_id(rs.getString("email_id"));
				memberDTO.setEmail_site(rs.getString("email_site"));
				memberDTO.setBirth_year(rs.getString("birth_year"));
				memberDTO.setBirth_month(rs.getString("birth_month"));
				memberDTO.setBirth_day(rs.getString("birth_day"));
				memberDTO.setPoint(rs.getInt("point"));
			}else{
				memberDTO = null;
			}
		} catch (SQLException e) {
			memberDTO = null;
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return memberDTO;
	}
	
	public int join(MemberDTO memberDTO){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst =null;
		String sql = "insert into member(id,pw,pwq,pwa,name,address_num,address_main"
				+ ",address_detail,phone_kind,phone_1,phone_2,phone_3,email_id,email_site"
				+ ",birth_year,birth_month,birth_day,point) values("
				+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,500)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, memberDTO.getId());
			pst.setString(2, memberDTO.getPw());
			pst.setString(3, memberDTO.getPwq());
			pst.setString(4, memberDTO.getPwa());
			pst.setString(5, memberDTO.getName());
			pst.setInt(6, memberDTO.getAddress_num());
			pst.setString(7, memberDTO.getAddress_main());
			pst.setString(8, memberDTO.getAddress_detail());
			pst.setString(9, memberDTO.getPhone_kind());
			pst.setString(10, memberDTO.getPhone_1());
			pst.setString(11, memberDTO.getPhone_2());
			pst.setString(12, memberDTO.getPhone_3());
			pst.setString(13, memberDTO.getEmail_id());
			pst.setString(14, memberDTO.getEmail_site());
			pst.setString(15, memberDTO.getBirth_year());
			pst.setString(16, memberDTO.getBirth_month());
			pst.setString(17, memberDTO.getBirth_day());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		
		
		return result;
	}
	
	public int delete(String id){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst =null;
		String sql = "delete member where id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}
	public int update(MemberDTO memberDTO){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst =null;
		String sql = "update member set pw=?, pwq=?, pwa=?, address_num=?, "
				+ "address_main=?, address_detail=?, phone_kind=?, phone_1=?, "
				+ "phone_2=?, phone_3=?, email_id=?, email_site=?, birth_year=?, birth_month=?, birth_day=?"
				+ " where id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, memberDTO.getPw());
			pst.setString(2, memberDTO.getPwq());
			pst.setString(3, memberDTO.getPwa());
			pst.setInt(4, memberDTO.getAddress_num());
			pst.setString(5, memberDTO.getAddress_main());
			pst.setString(6,memberDTO.getAddress_detail());
			pst.setString(7, memberDTO.getPhone_kind());
			pst.setString(8, memberDTO.getPhone_1());
			pst.setString(9, memberDTO.getPhone_2());
			pst.setString(10, memberDTO.getPhone_3());
			pst.setString(11, memberDTO.getEmail_id());
			pst.setString(12, memberDTO.getEmail_site());
			pst.setString(13, memberDTO.getBirth_year());
			pst.setString(14, memberDTO.getBirth_month());
			pst.setString(15, memberDTO.getBirth_day());
			pst.setString(16, memberDTO.getId());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}
	
	public MemberDTO view(String id){
		Connection con = DBConnector.getConnect();
		PreparedStatement ps = null;
		MemberDTO memberDTO = null;
		ResultSet rs = null;
		
		String sql = "select * from member where id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				memberDTO = new MemberDTO();
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwq(rs.getString("pwq"));
				memberDTO.setPwa(rs.getString("pwa"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setAddress_num(rs.getInt("address_num"));
				memberDTO.setAddress_main(rs.getString("address_main"));
				memberDTO.setAddress_detail(rs.getString("address_detail"));
				memberDTO.setPhone_kind(rs.getString("phone_kind"));
				memberDTO.setPhone_1(rs.getString("phone_1"));
				memberDTO.setPhone_2(rs.getString("phone_2"));
				memberDTO.setPhone_3(rs.getString("phone_3"));
				memberDTO.setEmail_id(rs.getString("email_id"));
				memberDTO.setEmail_site(rs.getString("email_site"));
				memberDTO.setBirth_year(rs.getString("birth_year"));
				memberDTO.setBirth_month(rs.getString("birth_month"));
				memberDTO.setBirth_day(rs.getString("birth_day"));
				memberDTO.setPoint(rs.getInt("point"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, ps, con);
		}
		return memberDTO;
		
	}
	public int point(int point, String id, String w){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		String sql = "update member set point = point "+w+" ? where id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, point);
			pst.setString(2, id);
			result= pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		
		return result;
		
	}
	

}
