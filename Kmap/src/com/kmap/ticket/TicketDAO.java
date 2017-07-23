package com.kmap.ticket;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.kmap.product.ProductDAO;
import com.kmap.product.ProductDTO;
import com.kmap.util.DBConnector;
import com.kmap.util.RowMaker;

public class TicketDAO implements ProductDAO {

	public int purchase(int num, int count){
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		String sql = "update product set count = count - ? where num = ?";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, count);
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
	public int currNum(){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select max(num) from product";
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
	@Override
	public void insert(ProductDTO productDTO, Connection con) throws Exception {
		PreparedStatement pst = null;
		String sql = "insert into product values(product_seq.currval,?,?,?,?,?)";
		pst = con.prepareStatement(sql);
		pst.setString(1, productDTO.getName());
		pst.setInt(2, productDTO.getPrice());
		pst.setString(3, productDTO.getContents());
		pst.setInt(4, productDTO.getCount());
		pst.setInt(5, productDTO.getMaker_num());
		pst.executeUpdate();
	}
	public int insert(TicketDTO ticketDTO){
		int result = 0;
		PreparedStatement pst =null;
		Connection con = DBConnector.getConnect();
		try {
			con.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "insert into ticket values(product_seq.nextval,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setDate(1, ticketDTO.getStart_month());
			pst.setDate(2, ticketDTO.getLast_month());
			pst.setInt(3, ticketDTO.getRequired_time());
			result = pst.executeUpdate();
			this.insert(ticketDTO, con);
			con.commit();
			
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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

	@Override
	public void delete(int num, Connection con) throws Exception {
		PreparedStatement pst = null;
		String sql = "delete product where num = ?";
		pst = con.prepareStatement(sql);
		pst.setInt(1, num);
		pst.executeUpdate();

	}
	public int delete(int tnum){
		int result = 0;
		
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		try {
			con.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "delete ticket where tnum = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, tnum);
			result = pst.executeUpdate();
			this.delete(tnum, con);
			con.commit();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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

	@Override
	public void update(ProductDTO productDTO, Connection con) throws Exception {
		PreparedStatement pst = null;
		String sql = "update product set name=?,price=?,contents=?,count=?,maker_num=? where num = ?";
		pst = con.prepareStatement(sql);
		pst.setString(1, productDTO.getName());
		pst.setInt(2, productDTO.getPrice());
		pst.setString(3, productDTO.getContents());
		pst.setInt(4, productDTO.getCount());
		pst.setInt(5, productDTO.getMaker_num());
		pst.setInt(6, productDTO.getNum());
		pst.executeUpdate();

	}
	public int update(TicketDTO ticketDTO){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		try {
			con.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "update ticket set start_month=?,last_month=?,required_time=? where tnum=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setDate(1, ticketDTO.getStart_month());
			pst.setDate(2, ticketDTO.getStart_month());
			pst.setInt(3, ticketDTO.getRequired_time());
			pst.setInt(4, ticketDTO.getTnum());
			result = pst.executeUpdate();
			this.update(ticketDTO, con);
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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

	@Override
	public List<ProductDTO> list(RowMaker rowMaker) {
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		List<ProductDTO> ar = new ArrayList<>();
		TicketDTO ticketDTO = null;
		
		String sql = "select * from "
				+ "(select rownum R, Z.* from "
				+ "(select T.*, P.* from ticket T, product P where T.tnum = P.num and "+rowMaker.getKind() +" like ? order by T.tnum desc) Z) "   
				+ "where R between ? and ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			pst.setInt(2, rowMaker.getStartRow());
			pst.setInt(3, rowMaker.getLastRow());
			rs = pst.executeQuery();
			
			while(rs.next()){
				ticketDTO =  new TicketDTO();
				ticketDTO.setTnum(rs.getInt("tnum"));
				ticketDTO.setStart_month(rs.getDate("start_month"));
				ticketDTO.setLast_month(rs.getDate("last_month"));
				ticketDTO.setRequired_time(rs.getInt("required_time"));
				
				ticketDTO.setNum(rs.getInt("tnum"));
				ticketDTO.setName(rs.getString("name"));
				ticketDTO.setPrice(rs.getInt("price"));
				ticketDTO.setContents(rs.getString("contents"));
				ticketDTO.setCount(rs.getInt("count"));
				ticketDTO.setMaker_num(rs.getInt("maker_num"));
				ar.add(ticketDTO);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
					
				
		}
		return ar;
	}
	private ProductDTO search(int num){
		PreparedStatement pst  = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		ProductDTO productDTO = null;
		String sql = "select * from product where num = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			rs = pst.executeQuery();
			if(rs.next()){
				productDTO = new ProductDTO();
				productDTO.setNum(rs.getInt("num"));
				productDTO.setName(rs.getString("name"));
				productDTO.setPrice(rs.getInt("price"));
				productDTO.setContents(rs.getString("contents"));
				productDTO.setCount(rs.getInt("count"));
				productDTO.setMaker_num(rs.getInt("maker_num"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		return productDTO;
		
		
	}

	@Override
	public int count(RowMaker rowMaker) {
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select count(tnum) from ticket T, product P where T.tnum = P.num and "+rowMaker.getKind()+" like ?";
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

	@Override
	public ProductDTO view(int tnum) {
		PreparedStatement pst  = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		TicketDTO ticketDTO = null;
		ProductDTO productDTO = null;
		String sql = "select * from ticket where tnum = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, tnum);
			rs = pst.executeQuery();
			if(rs.next()){
				ticketDTO = new TicketDTO();
				ticketDTO.setTnum(rs.getInt("tnum"));
				ticketDTO.setStart_month(rs.getDate("start_month") );
				ticketDTO.setLast_month(rs.getDate("last_month") );
				ticketDTO.setRequired_time(rs.getInt("required_time"));
				productDTO = new ProductDTO();
				productDTO = this.search(ticketDTO.getTnum());
				ticketDTO.setNum(productDTO.getNum());
				ticketDTO.setName(productDTO.getName());
				ticketDTO.setPrice(productDTO.getPrice());
				ticketDTO.setContents(productDTO.getContents());
				ticketDTO.setCount(productDTO.getCount());
				ticketDTO.setMaker_num(productDTO.getMaker_num());
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return ticketDTO;
	}

}
