package com.kmap.alchol;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmap.product.ProductDAO;
import com.kmap.product.ProductDTO;
import com.kmap.util.DBConnector;
import com.kmap.util.RowMaker;

public class AlcholDAO implements ProductDAO {
	
	
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
	public int insert(AlcholDTO alcholDTO){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		try {
			con.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "insert into alchol values(product_seq.nextval,?,?,?,?,?)";
		try {
			pst =con.prepareStatement(sql);
			pst.setDate(1, alcholDTO.getMade_date());
			pst.setLong(2, alcholDTO.getDegree());
			pst.setInt(3, alcholDTO.getCapacity());
			pst.setString(4, alcholDTO.getMaterial());
			pst.setString(5, alcholDTO.getKind());
			result = pst.executeUpdate();
			this.insert(alcholDTO, con);
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
	public void delete(int num, Connection con) throws Exception {
		PreparedStatement pst = null;
		String sql = "delete product where num = ?";
		pst = con.prepareStatement(sql);
		pst.setInt(1, num);
		pst.executeUpdate();

	}
	public int delete(int anum){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		try {
			con.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "delete alchol where anum = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, anum);
			result = pst.executeUpdate();
			this.delete(anum, con);
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
	public int update(AlcholDTO alcholDTO){
		int result = 0;
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		try {
			con.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "update alchol set made_date=?,degree=?,capacity=?,material=?,kind=? where anum = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setDate(1, alcholDTO.getMade_date());
			pst.setLong(2, alcholDTO.getDegree());
			pst.setInt(3, alcholDTO.getCapacity());
			pst.setString(4, alcholDTO.getMaterial());
			pst.setString(5, alcholDTO.getKind());
			pst.setInt(6, alcholDTO.getAnum());
			result = pst.executeUpdate();
			this.update(alcholDTO, con);
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
		AlcholDTO alcholDTO = null;
		
		String sql = "select * from "
				+ "(select rownum R, Z.* from "
				+ "(select A.*, P.* from alchol A, product P where A.anum = P.num and "+rowMaker.getKind() +" like ? order by A.anum desc) Z) " ;  
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			rs = pst.executeQuery();
			System.out.println("rs:"+rs);
			while(rs.next()){
				alcholDTO = new AlcholDTO();
				alcholDTO.setAnum(rs.getInt("anum"));
				alcholDTO.setMade_date(rs.getDate("made_date"));
				alcholDTO.setDegree(rs.getLong("degree"));
				alcholDTO.setCapacity(rs.getInt("capacity"));
				alcholDTO.setMaterial(rs.getString("material"));
				alcholDTO.setKind(rs.getString("kind"));
				
				alcholDTO.setNum(rs.getInt("num"));
				alcholDTO.setName(rs.getString("name"));
				alcholDTO.setPrice(rs.getInt("price"));
				alcholDTO.setContents(rs.getString("contents"));
				alcholDTO.setCount(rs.getInt("count"));
				alcholDTO.setMaker_num(rs.getInt("maker_num"));
				ar.add(alcholDTO);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return ar;
	}
	public List<ProductDTO> list(RowMaker rowMaker, String type) {
		PreparedStatement pst = null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		List<ProductDTO> ar = new ArrayList<>();
		AlcholDTO alcholDTO = null;
		
		String sql = "select * from "
				+ "(select rownum R, Z.* from "
				+ "(select A.*, P.* from alchol A, product P where A.anum = P.num and "+rowMaker.getKind() +" like ? and kind like ? order by A.anum desc) Z) " ;  
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, rowMaker.getSearch());
			pst.setString(2, "%"+type+"%");
			rs = pst.executeQuery();
			System.out.println("rs:"+rs);
			while(rs.next()){
				alcholDTO = new AlcholDTO();
				alcholDTO.setAnum(rs.getInt("anum"));
				alcholDTO.setMade_date(rs.getDate("made_date"));
				alcholDTO.setDegree(rs.getLong("degree"));
				alcholDTO.setCapacity(rs.getInt("capacity"));
				alcholDTO.setMaterial(rs.getString("material"));
				alcholDTO.setKind(rs.getString("kind"));
				
				alcholDTO.setNum(rs.getInt("num"));
				alcholDTO.setName(rs.getString("name"));
				alcholDTO.setPrice(rs.getInt("price"));
				alcholDTO.setContents(rs.getString("contents"));
				alcholDTO.setCount(rs.getInt("count"));
				alcholDTO.setMaker_num(rs.getInt("maker_num"));
				ar.add(alcholDTO);
			
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
				productDTO.setNum(num);
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
	public int count(RowMaker rowMaker) {
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select count(anum) from alchol A, product P where A.anum = P.num and "+rowMaker.getKind()+" like ?";
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
	public ProductDTO view(int anum) {
		PreparedStatement pst =null;
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		AlcholDTO alcholDTO = null;
		ProductDTO productDTO = null;
		String sql = "select * from alchol where anum = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, anum);
			rs = pst.executeQuery();
			if(rs.next()){
				alcholDTO = new AlcholDTO();
				alcholDTO.setAnum((rs.getInt("anum")));
				alcholDTO.setMade_date(rs.getDate("made_date"));
				alcholDTO.setDegree(rs.getLong("degree"));
				alcholDTO.setCapacity(rs.getInt("capacity"));
				alcholDTO.setMaterial(rs.getString("material"));
				alcholDTO.setKind(rs.getString("kind"));
				
				productDTO = new ProductDTO();
				productDTO = this.search(alcholDTO.getAnum());
				alcholDTO.setNum(productDTO.getNum());
				alcholDTO.setName(productDTO.getName());
				alcholDTO.setPrice(productDTO.getPrice());
				alcholDTO.setContents(productDTO.getContents());
				alcholDTO.setCount(productDTO.getCount());
				alcholDTO.setMaker_num(productDTO.getMaker_num());
			}
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return alcholDTO;
	}

}
