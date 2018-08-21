package com.java1234.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.DepartmentDao;
import com.java1234.model.Department;
import com.java1234.model.PageBean;
import com.java1234.service.DepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService{

	@Resource
	private DepartmentDao departmentDao;
	
	
	public List<Department> find(PageBean pageBean, Department s_department) {
		return departmentDao.find(pageBean, s_department);
	}

	
	public int count(Department s_department) {
		return departmentDao.count(s_department);
	}

	
	public void add(Department department) {
		departmentDao.add(department);
	}

	
	public void update(Department department) {
		departmentDao.update(department);
	}

	
	public void delete(int id) {
		departmentDao.delete(id);
	}

	
	public Department loadById(int id) {
		return departmentDao.loadById(id);
	}

}
