package com.baizhi.ssm.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baizhi.ssm.bean.User;
import com.baizhi.ssm.bean.UserExample;
import com.baizhi.ssm.bean.UserExample.Criteria;
import com.baizhi.ssm.mapper.UserMapper;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

//	添加一个管理员信息
	@Override
	public void addUser(User user) {
		userMapper.insertSelective(user);
	}

	
//	验证用户名和密码是否正确。登陆使用
	@Override
	public boolean validateUser(User user) {
		UserExample userExample = new UserExample();
//		userExample.setDistinct(false);
	
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		criteria.andPasswordEqualTo(user.getPassword());
		List<User> userList = userMapper.selectByExample(userExample);
		if(userList.size()>0) {
			return true;
		}else {
			return false;
		}
		
	}

}
