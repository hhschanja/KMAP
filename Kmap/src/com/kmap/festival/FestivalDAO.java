package com.kmap.festival;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmap.util.DBConnector;
import com.kmap.util.RowMaker;
import com.sun.org.apache.regexp.internal.RE;

public class FestivalDAO {
	
	public int insert(FestivalDTO festivalDTO){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		String sql = "insert into festival(num, name, address, contents, start_date, "
				+ "last_date, host, price, phone) values(festival_seq.nextval,?,?,?,?,?,?,?,?)";
		//(num, name, address, contents, start_date,last_date, host, price, phone)
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, festivalDTO.getName());
			pst.setString(2, festivalDTO.getAddress());
			pst.setString(3, festivalDTO.getContents());
			pst.setDate(4, festivalDTO.getStart_date());
			pst.setDate(5, festivalDTO.getLast_date());
			pst.setString(6, festivalDTO.getHost());
			pst.setInt(7, festivalDTO.getPrice());
			pst.setString(8, festivalDTO.getPhone());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
					
		}
		
		return result;
	}
	public int delete(int num){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		String sql = "delete festival where num = ?";
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
	public int update(FestivalDTO festivalDTO){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		String sql = "update festival set name = ?, address = ?, contents=?, start_date = ?, "
				+ "last_date = ?, host = ?, price = ? , phone = ? where num = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, festivalDTO.getName());
			pst.setString(2, festivalDTO.getAddress());
			pst.setString(3, festivalDTO.getContents());
			pst.setDate(4, festivalDTO.getStart_date());
			pst.setDate(5, festivalDTO.getLast_date());
			pst.setString(6, festivalDTO.getHost());
			pst.setInt(7, festivalDTO.getPrice());
			pst.setString(8, festivalDTO.getPhone());
			pst.setInt(9, festivalDTO.getNum());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		return result;
	}
	public List<FestivalDTO> list(RowMaker rowMaker){
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		List<FestivalDTO> ar = new ArrayList<>();
		FestivalDTO festivalDTO = null;
		String sql = "select * from "
				+ "(select rownum R, Z.* from "
				+ "(select F.* from festival F where "+rowMaker.getKind() +" like ? order by F.num desc) Z) "   
				+ "where R between ? and ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			pst.setInt(2, rowMaker.getStartRow());
			pst.setInt(3, rowMaker.getLastRow());
			rs = pst.executeQuery();
			while(rs.next()){
				festivalDTO = new FestivalDTO();
				festivalDTO.setNum(rs.getInt("num"));
				festivalDTO.setName(rs.getString("name"));
				festivalDTO.setAddress(rs.getString("address"));
				festivalDTO.setContents(rs.getString("contents"));
				festivalDTO.setStart_date(rs.getDate("start_date"));
				festivalDTO.setLast_date(rs.getDate("last_date"));
				festivalDTO.setHost(rs.getString("host"));
				festivalDTO.setPrice(rs.getInt("price"));
				festivalDTO.setPhone(rs.getString("phone"));
				ar.add(festivalDTO);
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return ar;
	}
	public int count(RowMaker rowMaker){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		String sql = "select count(num) from festival where "+rowMaker.getKind()+" like ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			rs = pst.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);

		}
		return result;
	}
	public FestivalDTO view(int num){
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		FestivalDTO festivalDTO = null;
		String sql = "select * from festival where num = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			rs = pst.executeQuery();
			if(rs.next()){
				festivalDTO = new FestivalDTO();
				festivalDTO.setNum(rs.getInt("num"));
				festivalDTO.setName(rs.getString("name"));
				festivalDTO.setAddress(rs.getString("address"));
				festivalDTO.setContents(rs.getString("contents"));
				festivalDTO.setStart_date(rs.getDate("start_date"));
				festivalDTO.setLast_date(rs.getDate("last_date"));
				festivalDTO.setHost(rs.getString("host"));
				festivalDTO.setPrice(rs.getInt("price"));
				festivalDTO.setPhone(rs.getString("phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return festivalDTO;
		
	}
	public int currNum(){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select max(num) from festival";
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return result ;
	}
}
