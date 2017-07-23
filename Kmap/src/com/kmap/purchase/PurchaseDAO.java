package com.kmap.purchase;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmap.basket.BasketDTO;
import com.kmap.sale.SaleDAO;
import com.kmap.sale.SaleDTO;
import com.kmap.util.DBConnector;
import com.kmap.util.RowMaker;


public class PurchaseDAO implements SaleDAO{

	@Override
	public int insert(SaleDTO saleDTO, String member_id) {//구매 폼에서 
		return 0;
	}
	
	public int buy(int num, PurchaseDTO purchaseDTO){
		int result = 0;
		int point = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		BasketDTO basketDTO = this.one(num);
		String sql = "insert into purchase_list values(purchase_list_seq.nextval,?,?,?,?,?,?,'배송준비중',?,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, basketDTO.getName());
			pst.setInt(2, basketDTO.getType_num());
			pst.setInt(3, basketDTO.getCount());
			pst.setInt(4, basketDTO.getCount() * basketDTO.getPrice());
			pst.setString(5, basketDTO.getMember_id());
			pst.setInt(6, basketDTO.getCount()*basketDTO.getPrice()/10);
			pst.setString(7, purchaseDTO.getCharge_type());
			pst.setInt(8, purchaseDTO.getAddress_num());
			pst.setString(9, purchaseDTO.getAddress_main());
			pst.setString(10, purchaseDTO.getAddress_detail());
			pst.setString(11, purchaseDTO.getMember_name());
			result = pst.executeUpdate();
			if(result>0){
			point = basketDTO.getCount()*basketDTO.getPrice()/10;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		return point;
	}
	public int buyOne(PurchaseDTO purchaseDTO){
		int result = 0;
		int point = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		String sql = "insert into purchase_list values(purchase_list_seq.nextval,?,?,?,?,?,?,'배송준비중',?,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, purchaseDTO.getName());
			pst.setInt(2, purchaseDTO.getType_num());
			pst.setInt(3, purchaseDTO.getCount());
			pst.setInt(4, purchaseDTO.getCount() * purchaseDTO.getPrice());
			pst.setString(5, purchaseDTO.getMember_id());
			pst.setInt(6, purchaseDTO.getCount()*purchaseDTO.getPrice()/10);
			pst.setString(7, purchaseDTO.getCharge_type());
			pst.setInt(8, purchaseDTO.getAddress_num());
			pst.setString(9, purchaseDTO.getAddress_main());
			pst.setString(10, purchaseDTO.getAddress_detail());
			pst.setString(11, purchaseDTO.getMember_name());
			result = pst.executeUpdate();
			if(result>0){
			point = purchaseDTO.getCount()*purchaseDTO.getPrice()/10;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		return point;
	}
	public int buyPoint(int num, PurchaseDTO purchaseDTO){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		BasketDTO basketDTO = this.one(num);
		String sql = "insert into purchase_list values(purchase_list_seq.nextval,?,?,?,?,?,?,'배송준비중',?,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, basketDTO.getName());
			pst.setInt(2, basketDTO.getType_num());
			pst.setInt(3, basketDTO.getCount());
			pst.setInt(4, basketDTO.getCount() * basketDTO.getPrice());
			pst.setString(5, basketDTO.getMember_id());
			pst.setInt(6, 0);
			pst.setString(7, purchaseDTO.getCharge_type());
			pst.setInt(8, purchaseDTO.getAddress_num());
			pst.setString(9, purchaseDTO.getAddress_main());
			pst.setString(10, purchaseDTO.getAddress_detail());
			pst.setString(11, purchaseDTO.getMember_name());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		return result;
	}
	public int buyPointOne(PurchaseDTO purchaseDTO){
		int result = 0;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		String sql = "insert into purchase_list values(purchase_list_seq.nextval,?,?,?,?,?,?,'배송준비중',?,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, purchaseDTO.getName());
			pst.setInt(2, purchaseDTO.getType_num());
			pst.setInt(3, purchaseDTO.getCount());
			pst.setInt(4, purchaseDTO.getCount() * purchaseDTO.getPrice());
			pst.setString(5, purchaseDTO.getMember_id());
			pst.setInt(6, 0);
			pst.setString(7, purchaseDTO.getCharge_type());
			pst.setInt(8, purchaseDTO.getAddress_num());
			pst.setString(9, purchaseDTO.getAddress_main());
			pst.setString(10, purchaseDTO.getAddress_detail());
			pst.setString(11, purchaseDTO.getMember_name());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(pst, con);
		}
		
		return result;
	}
	private BasketDTO one(int num){
		BasketDTO basketDTO = null;
		Connection con = DBConnector.getConnect();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select * from basket where num = ?";
		
		try {
			
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				basketDTO = new BasketDTO();
				basketDTO.setCount(rs.getInt("count"));
				basketDTO.setMember_id(rs.getString("member_id"));
				basketDTO.setName(rs.getString("name"));
				basketDTO.setNum(rs.getInt("num"));
				basketDTO.setPrice(rs.getInt("price"));
				basketDTO.setType_num(rs.getInt("type_num"));
		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		
		return basketDTO;
		
	}
	

	@Override
	public int delete(int num, String member_id) { //물건을 사면 구매리스트에서 지워지는거지 상품 시퀀스랑 아이디
		Connection con = DBConnector.getConnect();
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "delete from purchase_list where num=? and member_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, member_id);
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(ps, con);

		}
		return result;
	}

	@Override
	public List<SaleDTO> list(String id) {  //이걸 안쓰는데????
		Connection con = DBConnector.getConnect();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<SaleDTO> sar = new ArrayList<>();
		String sql = "select * from (select * from purchase_list where member_id=? order by num desc) where rownum between ? and ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			
			while(rs.next()){
				PurchaseDTO pdto = new PurchaseDTO();
				pdto.setNum(rs.getInt("num"));
				pdto.setName(rs.getString("name"));
				pdto.setType_num(rs.getInt("type_num"));
				pdto.setCount(rs.getInt("count"));
				pdto.setPrice(rs.getInt("price"));
				pdto.setMember_id(rs.getString("member_id"));
				pdto.setPoint(rs.getInt("point"));
				pdto.setStatus(rs.getString("status"));
				pdto.setCharge_type(rs.getString("charge_type"));
				pdto.setAddress_num(rs.getInt("address_num"));
				pdto.setAddress_main(rs.getString("address_main"));
				pdto.setAddress_detail(rs.getString("address_detail"));
				pdto.setMember_name(rs.getString("member_name"));
				sar.add(pdto);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, ps, con);
		}
		return sar;
	}
	
	public List<SaleDTO> myList(RowMaker rm, String id) { //마이페이지에서 list뿌리기
		Connection con = DBConnector.getConnect();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<SaleDTO> sar = new ArrayList<>();
		String sql = "select * from (select * from purchase_list where member_id=? order by num desc) where rownum between ? and ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, rm.getStartRow());
			ps.setInt(3, rm.getLastRow());
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				PurchaseDTO pdto = new PurchaseDTO();
				pdto.setNum(rs.getInt("num"));
				pdto.setName(rs.getString("name"));
				pdto.setType_num(rs.getInt("type_num"));
				pdto.setCount(rs.getInt("count"));
				pdto.setPrice(rs.getInt("price"));
				pdto.setMember_id(rs.getString("member_id"));
				pdto.setPoint(rs.getInt("point"));
				pdto.setStatus(rs.getString("status"));
				pdto.setCharge_type(rs.getString("charge_type"));
				pdto.setAddress_num(rs.getInt("address_num"));
				pdto.setAddress_main(rs.getString("address_main"));
				pdto.setAddress_detail(rs.getString("address_detail"));
				pdto.setMember_name(rs.getString("member_name"));
				sar.add(pdto);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, ps, con);
		}
		return sar;
	}
	
	
	@Override
	public int count(String id) {
		Connection con = DBConnector.getConnect();
		PreparedStatement ps = null;
		int result = 0;
		ResultSet rs = null;
		
		String sql = "select count(num) from purchase_list where member_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, ps, con);
		}
		return result;
	}

	
}