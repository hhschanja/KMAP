package com.kmap.notice;

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

public class NoticeDAO implements BoardDAO {

	@Override
	public int write(BoardDTO bdto) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int result = 0;
		
		String sql = "insert into notice values (not_seq.nextval,?,?,?,sysdate,0)";
		
		try {
			pst = con.prepareStatement(sql);
			
			pst.setString(1, bdto.getWriter());
			pst.setString(2, bdto.getTitle());
			pst.setString(3, bdto.getContents());
			
			result = pst.executeUpdate();
			
			pst.close();
			
			sql="select max(num) from notice";
			pst = con.prepareStatement(sql);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return result;
	}

	@Override
	public BoardDTO view(int num) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		NoticeDTO ndto =  new NoticeDTO();
		
		try {
			con.setAutoCommit(false);
			this.hitCount(con, num);
		} catch (Exception e1) {
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			e1.printStackTrace();
		} finally {
			try {
				con.commit();
				con.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String sql = "select * from notice where num=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			
			rs = pst.executeQuery();
			if(rs.next()){
				ndto.setNum(rs.getInt("num"));
				ndto.setWriter(rs.getString("writer"));
				ndto.setTitle(rs.getString("title"));
				ndto.setContents(rs.getString("contents"));
				ndto.setReg_date(rs.getDate("reg_date"));
				ndto.setHit(rs.getInt("hit"));
			}
		} catch (Exception e) {
			ndto = null;
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return ndto;
	}

	@Override
	public List<BoardDTO> list(RowMaker rowMaker) {
		Connection con =  DBConnector.getConnect();
		PreparedStatement pst = null;		
		ResultSet rs = null;
		List<BoardDTO> ar = new ArrayList<>();
		String sql = "select * from"
				+ "(select rownum R, N.* from"
				+ "(select * from notice where "+rowMaker.getKind()+" like ? order by num desc) N)"
				+ "where R between ? and ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			pst.setInt(2, rowMaker.getStartRow());
			pst.setInt(3, rowMaker.getLastRow());
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				NoticeDTO ndto = new NoticeDTO();
				ndto.setNum(rs.getInt("num"));
				ndto.setWriter(rs.getString("writer"));
				ndto.setTitle(rs.getString("title"));
				ndto.setContents(rs.getString("contents"));
				ndto.setReg_date(rs.getDate("reg_date"));
				ndto.setHit(rs.getInt("hit"));
				ar.add(ndto);
			}
		} catch (Exception e) {
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
		
		String sql = "delete notice where num=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			
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
	public int update(BoardDTO bdto) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "update notice set title=?, contents=? where num=?";
		
		try {
			pst = con.prepareStatement(sql);
			
			pst.setString(1, bdto.getTitle());
			pst.setString(2, bdto.getContents());
			pst.setInt(3, bdto.getNum());
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}
	public int count(RowMaker rowMaker){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int result = 0;
		
		
		String sql = "select count(num) from notice where "+rowMaker.getKind()+" like ?";
		
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
		}
		
		
		return result;
	}

	private void hitCount(Connection con, int num) throws Exception{
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "update notice set hit=hit+1 where num=?";
		
		pst = con.prepareStatement(sql);
		
		pst.setInt(1, num);
		
		result = pst.executeUpdate();
		
		
	}
}
