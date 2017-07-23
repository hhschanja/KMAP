package com.kmap.sale;

import java.util.List;




public interface SaleDAO {
	public int insert(SaleDTO saleDTO,String member_id);
	
	public int delete(int num,String id);
	
	public List<SaleDTO> list(String id);
	
	public int count(String id);
}
