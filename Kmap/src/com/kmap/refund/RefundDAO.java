package com.kmap.refund;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.kmap.util.DBConnector;
import com.kmap.util.RowMaker;

public class RefundDAO {
	public int insert(RefundDTO refundDTO){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		String sql="insert into refund values(refund_seq.nextval,?,?,?,?,sysdate,?,?,?)";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, refundDTO.getPurchase_num());
			pst.setString(2, refundDTO.getId());
			pst.setString(3, refundDTO.getTitle());
			pst.setString(4, refundDTO.getContents());
			pst.setString(5, "미처리");
			pst.setString(6, refundDTO.getRefund_type());
			pst.setInt(7, refundDTO.getPoint());
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
		String sql = "delete refund where num = ?";
		
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
	public List<RefundDTO> list(RowMaker rowMaker){
		
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		List<RefundDTO> ar = new ArrayList<>();
		RefundDTO refundDTO = null;
		
		String sql = "select * from "
				+ "(select rownum R, D.* from "
				+ "(select * from refund where "+rowMaker.getKind()+" like ? order by num desc) D) "
				+ "where R between ? and ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			pst.setInt(2, rowMaker.getStartRow());
			pst.setInt(3, rowMaker.getLastRow());
			rs = pst.executeQuery();
			
			while(rs.next()){
				refundDTO = new RefundDTO();
				refundDTO.setContents(rs.getString("contents"));
				refundDTO.setId(rs.getString("id"));
				refundDTO.setNum(rs.getInt("num"));
				refundDTO.setPurchase_num(rs.getInt("purchase_num"));
				refundDTO.setTitle(rs.getString("title"));
				refundDTO.setWrite_date(rs.getDate("write_date"));
				refundDTO.setHandling(rs.getString("handling"));
				refundDTO.setPoint(rs.getInt("point"));
				ar.add(refundDTO);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return ar;
	}
public List<RefundDTO> list(RowMaker rowMaker, String id){
		
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		List<RefundDTO> ar = new ArrayList<>();
		RefundDTO refundDTO = null;
		
		String sql = "select * from "
				+ "(select rownum R, D.* from "
				+ "(select * from refund where "+rowMaker.getKind()+" like ? and id = ? order by num desc) D) "
				+ "where R between ? and ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			pst.setString(2, id);
			pst.setInt(3, rowMaker.getStartRow());
			pst.setInt(4, rowMaker.getLastRow());
			rs = pst.executeQuery();
			
			while(rs.next()){
				refundDTO = new RefundDTO();
				refundDTO.setContents(rs.getString("contents"));
				refundDTO.setId(rs.getString("id"));
				refundDTO.setNum(rs.getInt("num"));
				refundDTO.setPurchase_num(rs.getInt("purchase_num"));
				refundDTO.setTitle(rs.getString("title"));
				refundDTO.setWrite_date(rs.getDate("write_date"));
				refundDTO.setHandling(rs.getString("handling"));
				refundDTO.setPoint(rs.getInt("point"));
				ar.add(refundDTO);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return ar;
	}
	public RefundDTO view(int num){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		RefundDTO refundDTO = null;
		
		String sql = "select * from refund where num = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			rs = pst.executeQuery();
			
			if(rs.next()){
				refundDTO = new RefundDTO();
				refundDTO.setContents(rs.getString("contents"));
				refundDTO.setHandling(rs.getString("handling"));
				refundDTO.setId(rs.getString("id"));
				refundDTO.setNum(rs.getInt("num"));
				refundDTO.setPurchase_num(rs.getInt("purchase_num"));
				refundDTO.setTitle(rs.getString("title"));
				refundDTO.setWrite_date(rs.getDate("write_date"));
				refundDTO.setRefund_type(rs.getString("refund_type"));
				refundDTO.setPoint(rs.getInt("point"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnector.disConnect(rs, pst, con);
		}
		return refundDTO;
		
	}
	public int count(RowMaker rowMaker){
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		int result = 0;
		
		String sql = "select count(num) from refund where "+rowMaker.getKind()+" like ?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return result;
	}
	public int update(int num, String handling){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		System.out.println(num);
		System.out.println(handling);
		String sql = "update refund set handling = ? where num = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, handling);
			pst.setInt(2, num);
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
