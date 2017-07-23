package com.kmap.freeboard;

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

public class FreeboardDAO implements BoardDAO {

	@Override
	public int write(BoardDTO bdto) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int result = 0;
		FreeboardDTO fdto = (FreeboardDTO)bdto;
		String sql = "insert into freeboard values (freeboard_seq.nextval,?,?,?,sysdate,0,0,?)";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, fdto.getWriter());
			pst.setString(2, fdto.getTitle());
			pst.setString(3, fdto.getContents());
			pst.setString(4, fdto.getKind());
			
			result = pst.executeUpdate();
			pst.close();
			sql = "select max(num) from freeboard";
			pst = con.prepareStatement(sql);
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

	@Override
	public BoardDTO view(int num) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		FreeboardDTO fdto = new FreeboardDTO();
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
		}finally {
			try {
				con.commit();
				con.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String sql = "select * from freeboard where num=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			
			rs = pst.executeQuery();
			if(rs.next()){
				fdto.setNum(rs.getInt("num"));
				fdto.setWriter(rs.getString("writer"));
				fdto.setTitle(rs.getString("title"));
				fdto.setContents(rs.getString("contents"));
				fdto.setReg_date(rs.getDate("reg_date"));
				fdto.setHit(rs.getInt("hit"));
				fdto.setRecommend(rs.getInt("recommend"));
				fdto.setKind(rs.getString("kind"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return fdto;
	}

	@Override
	public List<BoardDTO> list(RowMaker rowMaker) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<BoardDTO> ar = new ArrayList<>();
		FreeboardDTO fdto = null;
		
		String sql = "select * from "
				+ "(select rownum R, F.* from "
				+ "(select * from freeboard where "+rowMaker.getKind()+" like ? order by num desc) F) "
				+ "where R between ? and ?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			pst.setInt(2, rowMaker.getStartRow());
			pst.setInt(3, rowMaker.getLastRow());
			
			rs = pst.executeQuery();
			while(rs.next()){
				fdto = new FreeboardDTO();
				fdto.setNum(rs.getInt("num"));
				fdto.setWriter(rs.getString("writer"));
				fdto.setTitle(rs.getString("title"));
				fdto.setContents(rs.getString("contents"));
				fdto.setReg_date(rs.getDate("reg_date"));
				fdto.setHit(rs.getInt("hit"));
				fdto.setRecommend(rs.getInt("recommend"));
				fdto.setKind(rs.getString("kind"));
				ar.add(fdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return ar;
	}
	
	//내가 쓴 글들만 가져오기
		public List<BoardDTO> myList(RowMaker rowMaker,String id) {
			Connection con = DBConnector.getConnect();
			PreparedStatement pst = null;
			ResultSet rs = null;
			List<BoardDTO> ar = new ArrayList<>();
			FreeboardDTO fdto = null;
			
			String sql = "select * from "
					+ "(select rownum R, F.* from "
					+ "(select * from freeboard where "+rowMaker.getKind()+" like ? and writer=? order by num desc) F) "
					+ "where R between ? and ?";
			
			try {
				pst = con.prepareStatement(sql);
				pst.setString(1, rowMaker.getSearch());
				pst.setString(2, id);
				pst.setInt(3, rowMaker.getStartRow());
				pst.setInt(4, rowMaker.getLastRow());
				
				rs = pst.executeQuery();
				
				while(rs.next()){
					fdto = new FreeboardDTO();
					fdto.setNum(rs.getInt("num"));
					fdto.setWriter(rs.getString("writer"));
					fdto.setTitle(rs.getString("title"));
					fdto.setContents(rs.getString("contents"));
					fdto.setReg_date(rs.getDate("reg_date"));
					fdto.setHit(rs.getInt("hit"));
					fdto.setRecommend(rs.getInt("recommend"));
					fdto.setKind(rs.getString("kind"));
					ar.add(fdto);
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
		String sql = "delete freeboard where num=?";
		
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
		FreeboardDTO fdto = (FreeboardDTO)bdto;
		String sql = "update freeboard set title=?, contents=?, kind=? where num=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, fdto.getTitle());
			pst.setString(2, fdto.getContents());
			pst.setString(3, fdto.getKind());
			pst.setInt(4, fdto.getNum());
			
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
		
		System.out.println("카인드" + rowMaker.getKind());
		
		String sql = "select count(num) from freeboard where "+rowMaker.getKind()+" like ? ";
		
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
	private void hitCount(Connection con, int num) throws Exception{
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "update freeboard set hit=hit+1 where num=?";
		
		pst = con.prepareStatement(sql);
		
		pst.setInt(1, num);
		
		result = pst.executeUpdate();
		
		
	}
	public int recomCount(int num){
		Connection con =DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "update freeboard set recommend=recommend+1 where num=?";
		
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
	public List<FreeboardDTO> bestRecommend(){
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		FreeboardDTO fdto = null;
		List<FreeboardDTO> ar = new ArrayList<>();
		String sql = "select * from (select A.*, rownum r from (select * from freeboard order by recommend desc) A) where r between 1 and 5";
		
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()){
				fdto = new FreeboardDTO();
				fdto.setNum(rs.getInt("num"));
				fdto.setWriter(rs.getString("writer"));
				fdto.setTitle(rs.getString("title"));
				fdto.setContents(rs.getString("contents"));
				fdto.setKind(rs.getString("kind"));
				fdto.setRecommend(rs.getInt("recommend"));
				fdto.setHit(rs.getInt("hit"));
				fdto.setReg_date(rs.getDate("reg_date"));
				ar.add(fdto);
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
