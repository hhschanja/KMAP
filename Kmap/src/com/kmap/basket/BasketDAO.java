package com.kmap.basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




import com.kmap.sale.SaleDAO;
import com.kmap.sale.SaleDTO;
import com.kmap.util.DBConnector;


public class BasketDAO implements SaleDAO {

	@Override
	public int insert(SaleDTO saleDTO,String member_id) {
		Connection con = DBConnector.getConnect();
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "insert into basket values(basket_seq.nextval,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, saleDTO.getName());
			ps.setInt(2, saleDTO.getType_num());
			ps.setInt(3, saleDTO.getCount());
			ps.setInt(4, saleDTO.getPrice());
			ps.setString(5, member_id);
			
			
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
	public int delete(int num, String member_id) { //지울때는 product 시퀀스랑 사용자 아이디로 지워버려
		Connection con = DBConnector.getConnect();
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "delete from basket where num=? and member_id=?";
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
	public List<SaleDTO> list(String member_id) { //여기 아이디를 넣어줘서 불러올때 그 아이디의 장바구니 물품만 불러와야지
		Connection con = DBConnector.getConnect();
		PreparedStatement ps = null;
		List<SaleDTO> sar = new ArrayList<>();
		ResultSet rs = null;
		
		String sql = "select * from basket where member_id=? order by num desc";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			rs = ps.executeQuery();
			
			while(rs.next()){
				SaleDTO sdto = new SaleDTO();
				sdto.setNum(rs.getInt("num"));
				sdto.setName(rs.getString("name"));
				sdto.setType_num(rs.getInt("type_num"));
				sdto.setCount(rs.getInt("count"));
				sdto.setPrice(rs.getInt("price"));
				sdto.setMember_id(rs.getString("member_id"));
				sar.add(sdto);
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
		PreparedStatement pst = null;
		int totalCount = 0;
		ResultSet rs = null;
		
		String sql = "select count(num) from basket where member_id=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				totalCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnector.disConnect(rs, pst, con);
		}
		return totalCount;
	}


}
