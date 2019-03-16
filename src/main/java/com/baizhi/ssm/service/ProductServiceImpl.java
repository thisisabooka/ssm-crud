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

//	查询商品列表信息
	@Override
	public List<Product> getAll() {

		List<Product> productList = productMapper.selectByExample(null);
		return productList;
	}

//	查询一个商品信息
	@Override
	public Product findOne(Integer productId) {

		Product product = productMapper.selectByPrimaryKey(productId);
		return product;
	}

//	添加一个商品信息
	@Override
	public void addProduct(Product product) {

		productMapper.insertSelective(product);
	}

//	修改一个商品信息
	@Override
	public void modifyProduct(Product product) {

		productMapper.updateByPrimaryKeySelective(product);
	}

//	删除一个商品信息
	@Override
	public void deleteProduct(Integer productId) {
		// TODO Auto-generated method stub
		productMapper.deleteByPrimaryKey(productId);
	}

}
