package com.baizhi.ssm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.baizhi.ssm.bean.User;
import com.baizhi.ssm.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/user",method=RequestMethod.POST)
	public void addUser(User user,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		userService.addUser(user);
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

}
