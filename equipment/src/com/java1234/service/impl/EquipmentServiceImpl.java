package com.java1234.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.EquipmentDao;
import com.java1234.dao.RepairDao;
import com.java1234.model.Equipment;
import com.java1234.model.PageBean;
import com.java1234.model.Repair;
import com.java1234.service.EquipmentService;

@Service("equipmentService")
public class EquipmentServiceImpl implements EquipmentService{

	@Resource
	private EquipmentDao equipmentDao;
	
	@Resource
	private RepairDao repairDao;
	
	
	public List<Equipment> find(PageBean pageBean, Equipment s_equipment) {
		return equipmentDao.find(pageBean, s_equipment);
	}

	
	public int count(Equipment s_equipment) {
		return equipmentDao.count(s_equipment);
	}

	
	public void delete(int id) {
		equipmentDao.delete(id);
	}

	
	public void add(Equipment equipment) {
		equipmentDao.add(equipment);
	}

	
	public void update(Equipment equipment) {
		equipmentDao.update(equipment);
	}

	
	public Equipment loadById(int id) {
		return equipmentDao.loadById(id);
	}

	
	public boolean existEquipmentByTypeId(int typeId) {
		return equipmentDao.existEquipmentByTypeId(typeId);
	}

	
	public void addRepair(int id, String userMan) {
		Repair repair=new Repair();
		repair.setEquipmentId(id);
		repair.setUserMan(userMan);
		repairDao.add(repair);
		
		Equipment equipment=equipmentDao.loadById(id);
		equipment.setState(2);
		equipmentDao.update(equipment);
	}

	
	public void updateRepair(int id, int repairId,String repairMan, boolean success) {
		Repair repair=new Repair();
		repair.setId(repairId);
		repair.setRepairMan(repairMan);
		Equipment equipment=equipmentDao.loadById(id);
		if(success){
			repair.setState(1);
			equipment.setState(1);
		}else{
			repair.setState(2);
			equipment.setState(3);
		}
		repairDao.update(repair);
		equipmentDao.update(equipment);
	}



}
