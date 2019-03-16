package com.baizhi.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baizhi.ssm.bean.Product;
import com.baizhi.ssm.mapper.ProductMapper;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper productMapper;

//	��ѯ��Ʒ�б���Ϣ
	@Override
	public List<Product> getAll() {

		List<Product> productList = productMapper.selectByExample(null);
		return productList;
	}

//	��ѯһ����Ʒ��Ϣ
	@Override
	public Product findOne(Integer productId) {

		Product product = productMapper.selectByPrimaryKey(productId);
		return product;
	}

//	���һ����Ʒ��Ϣ
	@Override
	public void addProduct(Product product) {

		productMapper.insertSelective(product);
	}

//	�޸�һ����Ʒ��Ϣ
	@Override
	public void modifyProduct(Product product) {

		productMapper.updateByPrimaryKeySelective(product);
	}

//	ɾ��һ����Ʒ��Ϣ
	@Override
	public void deleteProduct(Integer productId) {
		// TODO Auto-generated method stub
		productMapper.deleteByPrimaryKey(productId);
	}

}
