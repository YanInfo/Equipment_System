package com.java1234.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.EquipmentTypeDao;
import com.java1234.model.EquipmentType;
import com.java1234.model.PageBean;
import com.java1234.service.EquipmentTypeService;

@Service("equipmentTypeService")
public class EquipmentTypeServiceImpl implements EquipmentTypeService{

	@Resource
	private EquipmentTypeDao equipmentTypeDao;
	
	
	public List<EquipmentType> find(PageBean pageBean, EquipmentType s_equipmentType) {
		return equipmentTypeDao.find(pageBean, s_equipmentType);
	}

	
	public int count(EquipmentType s_equipmentType) {
		return equipmentTypeDao.count(s_equipmentType);
	}

	
	public void add(EquipmentType equipmentType) {
		equipmentTypeDao.add(equipmentType);
	}

	
	public void update(EquipmentType equipmentType) {
		equipmentTypeDao.update(equipmentType);
	}

	
	public void delete(int id) {
		equipmentTypeDao.delete(id);
	}

	
	public EquipmentType loadById(int id) {
		return equipmentTypeDao.loadById(id);
	}

}
