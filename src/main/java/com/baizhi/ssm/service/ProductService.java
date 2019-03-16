package com.baizhi.ssm.service;

import java.util.List;

import com.baizhi.ssm.bean.Product;

public interface ProductService {
	
//	��ѯ��Ʒ�б���Ϣ
	public List<Product> getAll();
	
//	��ѯĳһ����Ʒ��Ϣ
	public Product findOne(Integer productId);
	
//	���һ����Ʒ��Ϣ
	public void addProduct(Product product);
	
//	�޸�һ����Ʒ��Ϣ
	public void modifyProduct(Product product);
	
//	ɾ��һ����Ʒ��Ϣ
	public void deleteProduct(Integer productId);

}
