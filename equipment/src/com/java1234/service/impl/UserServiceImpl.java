package com.java1234.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.UserDao;
import com.java1234.model.PageBean;
import com.java1234.model.User;
import com.java1234.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	
	
	public User login(User user) {
		return userDao.login(user);
	}

	
	public List<User> find(PageBean pageBean, User s_user) {
		return userDao.find(pageBean, s_user);
	}

	
	public int count(User s_user) {
		return userDao.count(s_user);
	}

	
	public void delete(int id) {
		userDao.delete(id);
	}

	
	public void add(User user) {
		userDao.add(user);
	}

	
	public void update(User user) {
		userDao.update(user);
	}

	
	public User loadById(int id) {
		return userDao.loadById(id);
	}

	
	public boolean existUserByDeptId(int deptId) {
		return userDao.existUserByDeptId(deptId);
	}

}
