package com.kmap.product;


import java.sql.Connection;
import java.util.List;

import com.kmap.util.RowMaker;

public interface ProductDAO {
	public void insert(ProductDTO productDTO,Connection con) throws Exception ;
	
	public void delete(int num,Connection con) throws Exception;
	
	public void update(ProductDTO productDTO,Connection con) throws Exception;
	
	public List<ProductDTO> list(RowMaker rowMaker);
	
	public int count(RowMaker rowMaker);
	
	public ProductDTO view(int num);
	

}
