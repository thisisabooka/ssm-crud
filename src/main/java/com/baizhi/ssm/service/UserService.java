package com.baizhi.ssm.service;

import com.baizhi.ssm.bean.User;

public interface UserService {
	
//	添加一个用户信息
	public void addUser(User user);
	
//	通过用户名和密码验证。登陆检查
	public boolean validateUser(User user);

}
