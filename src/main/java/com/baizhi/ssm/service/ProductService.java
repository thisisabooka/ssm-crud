package com.baizhi.ssm.service;

import java.util.List;

import com.baizhi.ssm.bean.Product;

public interface ProductService {
	
//	查询商品列表信息
	public List<Product> getAll();
	
//	查询某一个商品信息
	public Product findOne(Integer productId);
	
//	添加一个商品信息
	public void addProduct(Product product);
	
//	修改一个商品信息
	public void modifyProduct(Product product);
	
//	删除一个商品信息
	public void deleteProduct(Integer productId);

}
