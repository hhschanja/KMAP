package com.kmap.upload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmap.util.DBConnector;

public class UploadDAO {

	public int uploadInsert(UploadDTO udto){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;

		String sql = "insert into upload values(?,?,?,?)";

		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, udto.getNum());
			pst.setString(2, udto.getFname());
			pst.setString(3, udto.getOname());
			pst.setString(4, udto.getBoard_type());

			result = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}

	public int uploadDelete(int num, String board_type){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;

		String sql = "delete upload where num=? and board_type=?";

		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			pst.setString(2, board_type);
			

			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(pst, con);
		}

		return result;
	}

	public List<UploadDTO> list (int num, String board_type){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<UploadDTO> ar = new ArrayList<>();

		String sql = "select * from upload where num=? and board_type=?";

		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			pst.setString(2, board_type);
			rs = pst.executeQuery();

			while(rs.next()){
				UploadDTO udto = new UploadDTO();
				udto.setNum(rs.getInt("num"));
				udto.setFname(rs.getString("fname"));
				udto.setOname(rs.getString("oname"));
				udto.setBoard_type(rs.getString("board_type"));
				ar.add(udto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return ar;
	}

	

}
