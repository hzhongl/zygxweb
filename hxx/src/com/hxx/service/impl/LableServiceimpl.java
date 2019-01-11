package com.hxx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hxx.dao.LableDao;
import com.hxx.po.Lable;
import com.hxx.service.LableService;
@Service
public class LableServiceimpl implements LableService{
	@Autowired
	private LableDao labledao;

	@Override
	public List<Lable> findLable() {
		return this.labledao.findLable();
	}
	

}
