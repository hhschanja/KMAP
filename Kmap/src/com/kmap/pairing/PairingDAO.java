package com.kmap.pairing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmap.util.DBConnector;
import com.kmap.util.RowMaker;

public class PairingDAO{

	public int write(PairingDTO pairingDTO) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int result = 0;
		
		String sql = "insert into pairing values (pairing_seq.nextval,?,?,?,0,0)";
		
		try {
			pst = con.prepareStatement(sql);
			
			pst.setString(1, pairingDTO.getWriter());
			pst.setString(2, pairingDTO.getTitle());
			pst.setString(3, pairingDTO.getContents());
			
			result = pst.executeUpdate();
			pst.close();
			
			//양조장 삽입하고 양조장의 마지막 글 번호 들고오기
			sql = "select max(num) from pairing";
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

	
	public PairingDTO view(int num) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		PairingDTO pairingDTO = null;
		
		try {
			con.setAutoCommit(false);
			this.hitCount(con, num);
		} catch (Exception e1) {
			try {
				con.rollback();
			} catch (SQLException e) {
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
		
		
		String sql = "select * from pairing where num=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				pairingDTO = new PairingDTO();
				pairingDTO.setNum(rs.getInt("num"));
				pairingDTO.setWriter(rs.getString("writer"));
				pairingDTO.setTitle(rs.getString("title"));
				pairingDTO.setContents(rs.getString("contents"));
				pairingDTO.setRecommend(rs.getInt("recommend"));
				pairingDTO.setHit(rs.getInt("hit"));
				
			}else {
				pairingDTO = null;
			}
			
		} catch (SQLException e) {
			pairingDTO = null;
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return pairingDTO;
	}

	
	public List<PairingDTO> list(RowMaker rowMaker) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		PairingDTO pairingDTO = null;
		List<PairingDTO> ar = new ArrayList<>();
		
		String sql = "select * from "
				+ "(select rownum R, P.* from "
				+ "(select * from pairing where "+rowMaker.getKind()+" like ? order by num desc) P) "
				+ "where R between ? and ?";
				
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			pst.setInt(2, rowMaker.getStartRow());
			pst.setInt(3, rowMaker.getLastRow());
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				pairingDTO = new PairingDTO();
				pairingDTO.setNum(rs.getInt("num"));
				pairingDTO.setWriter(rs.getString("writer"));
				pairingDTO.setTitle(rs.getString("title"));
				pairingDTO.setContents(rs.getString("contents"));
				pairingDTO.setRecommend(rs.getInt("recommend"));
				pairingDTO.setHit(rs.getInt("hit"));
				ar.add(pairingDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return ar;
	}
	public List<PairingDTO> indexList() {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		PairingDTO pairingDTO = null;
		List<PairingDTO> ar = new ArrayList<>();
		
		String sql = "select * from (select A.*, rownum r from (select * from pairing order by recommend desc) A) where r between 1 and 3";	
		try {
			pst = con.prepareStatement(sql);
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				pairingDTO = new PairingDTO();
				pairingDTO.setNum(rs.getInt("num"));
				pairingDTO.setWriter(rs.getString("writer"));
				pairingDTO.setTitle(rs.getString("title"));
				pairingDTO.setContents(rs.getString("contents"));
				pairingDTO.setRecommend(rs.getInt("recommend"));
				pairingDTO.setHit(rs.getInt("hit"));
				ar.add(pairingDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return ar;
	}

	
	public int delete(int num) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "delete pairing where num=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnector.disConnect(pst, con);
		}
		return result;
	}

	
	public int update(PairingDTO pairingDTO) {
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "update pairing set title=?, contents=? where num=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, pairingDTO.getTitle());
			pst.setString(2, pairingDTO.getContents());
			pst.setInt(3, pairingDTO.getNum());
			
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
		
		String sql = "select count(num) from pairing where "+rowMaker.getKind()+" like ? ";
		
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
	
	private void hitCount (Connection con, int num) throws Exception{
		PreparedStatement pst = null;
	
		String sql = "update pairing set hit=hit+1 where num=?";
		
		pst = con.prepareStatement(sql);
		
		pst.setInt(1, num);
		
		pst.executeUpdate();
		
		
	}
	
	public int recomCount(int num){
		Connection con =DBConnector.getConnect();
		PreparedStatement pst = null;
		int result = 0;
		
		String sql = "update pairing set recommend=recommend+1 where num=?";
		
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


}
