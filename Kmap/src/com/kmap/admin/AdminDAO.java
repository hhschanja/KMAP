package com.kmap.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kmap.util.DBConnector;

public class AdminDAO {
	public AdminDTO login(AdminDTO adminDTO){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select * from admin where id = ? and pw = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, adminDTO.getId());
			pst.setString(2, adminDTO.getPw());
			rs = pst.executeQuery();
			if(rs.next()){
				adminDTO.setNum(rs.getInt("num"));
			}else{
				adminDTO = null;
			}
		} catch (SQLException e) {
			adminDTO = null;
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return adminDTO;
	}

}
