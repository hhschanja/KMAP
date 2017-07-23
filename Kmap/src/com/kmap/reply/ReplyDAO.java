package com.kmap.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import com.kmap.util.DBConnector;
import com.kmap.util.RowMaker;


public class ReplyDAO {
	
	public ReplyDTO replyView(int num){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ReplyDTO rdto = null;
		String sql = "select * from reply where num=? ";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				rdto = new ReplyDTO();
				
				rdto.setNum(rs.getInt("num"));
				rdto.setContents(rs.getString("contents"));
				rdto.setWriter(rs.getString("writer"));
				rdto.setReg_date(rs.getDate("reg_date"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rdto;
		
	}
	private void replyUpdate(Connection con, ReplyDTO replyDTO) throws Exception{
		PreparedStatement pst = null;
		String sql = "update reply set step=step+1 where ref=? and step>?";
		pst = con.prepareStatement(sql);
		pst.setInt(1, replyDTO.getRef());
		pst.setInt(2, replyDTO.getStep());
	}
	
	public int write(ReplyDTO replyDTO){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		String sql = "insert into reply values(reply_seq.nextval,?,?,sysdate,reply_seq.currval,0,0,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, replyDTO.getWriter());
			pst.setString(2, replyDTO.getContents());
			pst.setString(3, replyDTO.getType());
			pst.setInt(4, replyDTO.getType_num());
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		return result;
		
	}
	public int replyWrite(ReplyDTO replyDTO, int type_num){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		try {
			con.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "insert into reply values(reply_seq.nextval, "
				+ "?,?,sysdate,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			this.replyUpdate(con, replyDTO);
			pst.setString(1, replyDTO.getWriter());
			pst.setString(2, replyDTO.getContents());
			pst.setInt(3, replyDTO.getRef());
			pst.setInt(4, replyDTO.getStep()+1);
			pst.setInt(5, replyDTO.getDepth()+1);
			pst.setInt(6, type_num);
			result = pst.executeUpdate();
			con.commit();
			
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			DBConnector.disConnect(pst, con);
		}
				
		
		return result;
	}
	public List<ReplyDTO> replyList(ReplyDTO rdto){
		List<ReplyDTO> ar = new ArrayList<>();
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ReplyDTO replyDTO = null;
		String sql = "select * from "
				+ "(select rownum R, A.* from "
				+ "(select * from reply where type_num = ? and type=? order by num desc) A )";
		try {
			pst = con.prepareStatement(sql);
			
			pst.setInt(1, rdto.getType_num());
			pst.setString(2, rdto.getType());
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				replyDTO = new ReplyDTO();
				replyDTO.setNum(rs.getInt("num"));
				replyDTO.setWriter(rs.getString("writer"));
				replyDTO.setContents(rs.getString("contents"));
				replyDTO.setReg_date(rs.getDate("reg_date"));
				replyDTO.setRef(rs.getInt("ref"));
				replyDTO.setStep(rs.getInt("step"));
				replyDTO.setDepth(rs.getInt("depth"));
				ar.add(replyDTO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return ar;
	}
	public int replyMod(ReplyDTO replyDTO){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		String sql = "update reply set contents = ? where num = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, replyDTO.getContents());
			pst.setInt(2, replyDTO.getNum());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		return result;
	}
	public int replyDelete(int num){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		String sql = "delete reply where num = ?";
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
	public int replyCount(int type_num){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select count(num) from reply where fnum = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, type_num);
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
	

}
