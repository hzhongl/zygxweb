package com.hxx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hxx.dao.HotResourcesDao;
import com.hxx.po.HotResources;
import com.hxx.po.Resource;
import com.hxx.service.HotResourceService;
@Service
public class HotResourceServiceimpl implements HotResourceService{
	@Autowired
	private  HotResourcesDao hotResourcesDao;
	@Override
	public List<HotResources> findhotresources() {
		return this.hotResourcesDao.findhotresources();
	}
	
	

}
