package com.baizhi.ssm.service;

import com.baizhi.ssm.bean.User;

public interface UserService {
	
//	���һ���û���Ϣ
	public void addUser(User user);
	
//	ͨ���û�����������֤����½���
	public boolean validateUser(User user);

}
