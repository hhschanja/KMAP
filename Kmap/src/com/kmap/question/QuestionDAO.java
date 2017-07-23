package com.kmap.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmap.board.BoardDAO;
import com.kmap.board.BoardDTO;
import com.kmap.util.DBConnector;
import com.kmap.util.RowMaker;


public class QuestionDAO implements BoardDAO {

	@Override
	public BoardDTO view(int num) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		QuestionDTO qdto = new QuestionDTO();
		
		
		String sql = "select * from question where num=?";
		
		try {
			pst = con.prepareStatement(sql);
			
			pst.setInt(1, num);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				qdto.setNum(rs.getInt("num"));
				qdto.setWriter(rs.getString("writer"));
				qdto.setTitle(rs.getString("title"));
				qdto.setContents(rs.getString("contents"));
				qdto.setReg_date(rs.getDate("reg_date"));
				qdto.setPhone_kind(rs.getString("phone_kind"));
				qdto.setPhone_1(rs.getString("phone_1"));
				qdto.setPhone_2(rs.getString("phone_2"));
				qdto.setPhone_3(rs.getString("phone_3"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return qdto;
	}

	@Override
	public List<BoardDTO> list(RowMaker rowMaker) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<BoardDTO> ar = new ArrayList<>();
		QuestionDTO qdto = null;
		String sql = "select * from "
				+ "(select rownum R, Q.* from "
				+ "(select * from question where "+rowMaker.getKind()+" like ? order by num desc) Q) "
				+ "where R between ? and ?";
		
		try {
			pst = con.prepareStatement(sql);
			
			pst.setString(1, rowMaker.getSearch());
			pst.setInt(2, rowMaker.getStartRow());
			pst.setInt(3, rowMaker.getLastRow());
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				qdto = new  QuestionDTO();
				qdto.setNum(rs.getInt("num"));
				qdto.setWriter(rs.getString("writer"));
				qdto.setTitle(rs.getString("title"));
				qdto.setContents(rs.getString("contents"));
				qdto.setReg_date(rs.getDate("reg_date"));
				qdto.setPhone_kind(rs.getString("phone_kind"));
				qdto.setPhone_1(rs.getString("phone_1"));
				qdto.setPhone_2(rs.getString("phone_2"));
				qdto.setPhone_3(rs.getString("phone_3"));
				ar.add(qdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return ar;
	}

	public List<BoardDTO> myList(RowMaker rowMaker,String id) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<BoardDTO> ar = new ArrayList<>();
		QuestionDTO qdto = null;
		String sql = "select * from "
				+ "(select rownum R, Q.* from "
				+ "(select * from question where "+rowMaker.getKind()+" like ? and writer=? order by num desc) Q) "
				+ "where R between ? and ?";
		
		try {
			pst = con.prepareStatement(sql);
			
			pst.setString(1, rowMaker.getSearch());
			pst.setString(2, id);
			pst.setInt(3, rowMaker.getStartRow());
			pst.setInt(4, rowMaker.getLastRow());
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				qdto = new  QuestionDTO();
				qdto.setNum(rs.getInt("num"));
				qdto.setWriter(rs.getString("writer"));
				qdto.setTitle(rs.getString("title"));
				qdto.setContents(rs.getString("contents"));
				qdto.setReg_date(rs.getDate("reg_date"));
				qdto.setPhone_kind(rs.getString("phone_kind"));
				qdto.setPhone_1(rs.getString("phone_1"));
				qdto.setPhone_2(rs.getString("phone_2"));
				qdto.setPhone_3(rs.getString("phone_3"));
				ar.add(qdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return ar;
	}
	
	@Override
	public int delete(int num) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "delete question where num=?";
		
		try {
			pst = con.prepareStatement(sql);
			
			pst.setInt(1, num);
			
			result = pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(pst, con);
		}
		
		
		return result;
	}
	@Override
	public int update(BoardDTO bdto) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		QuestionDTO qdto = (QuestionDTO)bdto;
		
		String sql = "update question set title=?, contents=?, phone_kind=?, phone_1=?, phone_2=?, phone_3=? where num=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, qdto.getTitle());
			pst.setString(2, qdto.getContents());
			pst.setString(3, qdto.getPhone_kind());
			pst.setString(4, qdto.getPhone_1());
			pst.setString(5, qdto.getPhone_2());
			pst.setString(6, qdto.getPhone_3());
			pst.setInt(7, qdto.getNum());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(pst, con);
		}
		
		return result;
	}

	@Override
	public int write(BoardDTO bdto) {
		QuestionDTO qdto = (QuestionDTO)bdto;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "insert into question values (que_seq.nextval,?,?,?,sysdate,?,?,?,?)";
		
		try {
			pst = con.prepareStatement(sql);
			
			pst.setString(1, qdto.getWriter());
			pst.setString(2, qdto.getTitle());
			pst.setString(3, qdto.getContents());
			pst.setString(4, qdto.getPhone_kind());
			pst.setString(5, qdto.getPhone_1());
			pst.setString(6, qdto.getPhone_2());
			pst.setString(7, qdto.getPhone_3());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(pst, con);
		}
		
		return result;
	}
	public int count (RowMaker rowMaker){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int result = 0;
		
		String sql = "select count(num) from question where "+rowMaker.getKind()+" like ?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			
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
	

}
