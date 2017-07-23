package com.kmap.maker;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmap.util.DBConnector;
import com.kmap.util.RowMaker;

public class MakerDAO {
	
	//양조장 번호를 양조장이름으로 검색해서 들고오기
/*	public int getMakerNum(String name){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int num = 0;
		
		String sql = "select * from maker where name = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, name);
			
			rs = pst.executeQuery();
			
			rs.next();
			
			num = rs.getInt(1);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return num;
	}*/
	
	//양조장 삽입하기
	public int insert(MakerDTO makerDTO){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		ResultSet rs = null;
		
		String sql = "insert into maker values(maker_seq.nextval,?,?,?,?,?,?,?,?,?)";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, makerDTO.getName());
			pst.setString(2, makerDTO.getPhone());
			pst.setString(3, makerDTO.getCeo());
			pst.setDate(4, makerDTO.getEstablish());
			pst.setString(5, makerDTO.getSite());
			pst.setString(6, makerDTO.getContents());
			pst.setInt(7, makerDTO.getAddress_num());
			pst.setString(8, makerDTO.getAddress_main());
			pst.setString(9, makerDTO.getAddress_detail());
			
			
			result = pst.executeUpdate();
			pst.close();
			
			//양조장 삽입하고 양조장의 마지막 글 번호 들고오기
			sql = "select max(num) from maker";
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);	
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		return result;
	}
	
	
	
	public int update(MakerDTO makerDTO){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "update maker set name=?,phone=?,ceo=?,establish=?,site=?,contents=?,address_num=?,address_main=?,address_detail=? where num=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, makerDTO.getName());
			pst.setString(2, makerDTO.getPhone());
			pst.setString(3, makerDTO.getCeo());
			pst.setDate(4, makerDTO.getEstablish());
			pst.setString(5, makerDTO.getSite());
			pst.setString(6, makerDTO.getContents());
			pst.setInt(7, makerDTO.getAddress_num());
			pst.setString(8, makerDTO.getAddress_main());
			pst.setString(9, makerDTO.getAddress_detail());
			pst.setInt(10, makerDTO.getNum());
			
			result = pst.executeUpdate();
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		return result;
	}
	
	public List<MakerDTO> list(RowMaker rm){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		List<MakerDTO> mar = new ArrayList<>();
		ResultSet rs = null;
		
		String sql = "select * from (select A.*,rownum r from (select * from maker where "+rm.getKind()+" like ? order by num desc) A) B where r between ? and ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rm.getSearch());
			pst.setInt(2, rm.getStartRow());
			pst.setInt(3, rm.getLastRow());
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				MakerDTO makerDTO = new MakerDTO();
				makerDTO.setNum(rs.getInt("num"));
				makerDTO.setName(rs.getString("name"));
				makerDTO.setPhone(rs.getString("phone"));
				makerDTO.setCeo(rs.getString("ceo"));
				makerDTO.setEstablish(rs.getDate("establish"));
				makerDTO.setSite(rs.getString("site"));
				makerDTO.setContents(rs.getString("contents"));
				makerDTO.setAddress_num(rs.getInt("address_num"));
				makerDTO.setAddress_main(rs.getString("address_main"));
				makerDTO.setAddress_detail(rs.getString("address_detail"));
				mar.add(makerDTO);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return mar;
	}
	
	public int count(RowMaker rm){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int totalCount = 0;
		ResultSet rs = null;
		
		String sql = "select count(num) from maker where "+rm.getKind()+" like ? ";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rm.getSearch());
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				totalCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return totalCount;
	}
	
	public MakerDTO view(int num){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		MakerDTO makerDTO = null;
		
		String sql = "select * from maker where num = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				makerDTO = new MakerDTO();
				makerDTO.setNum(rs.getInt("num"));
				makerDTO.setName(rs.getString("name"));
				makerDTO.setPhone(rs.getString("phone"));
				makerDTO.setCeo(rs.getString("ceo"));
				makerDTO.setEstablish(rs.getDate("establish"));
				makerDTO.setSite(rs.getString("site"));
				makerDTO.setContents(rs.getString("contents"));
				makerDTO.setAddress_num(rs.getInt("address_num"));
				makerDTO.setAddress_main(rs.getString("address_main"));
				makerDTO.setAddress_detail(rs.getString("address_detail"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return makerDTO;
	}
	
	
	public int delete(int num){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "delete from maker where num = ?";
		try {
			pst = con.prepareStatement(sql);
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
	
	
}