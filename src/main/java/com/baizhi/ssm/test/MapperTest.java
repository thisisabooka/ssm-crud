package com.baizhi.ssm.test;


import java.math.BigDecimal;
import java.util.UUID;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.baizhi.ssm.bean.Product;
import com.baizhi.ssm.mapper.ProductMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {

		ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
		System.out.println("������ʼ������");
		for(int i=0;i<1000;i++) {
			String uuid = UUID.randomUUID().toString().substring(0,5) + i;
			mapper.insertSelective(new Product(null,uuid,new BigDecimal(567.5),"��֪����"+uuid));
		}

		System.out.println("������ɡ�����");

	}

}
