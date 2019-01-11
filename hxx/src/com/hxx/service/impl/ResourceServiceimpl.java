package com.hxx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hxx.dao.ResourceDao;
import com.hxx.po.Resource;
import com.hxx.service.ResourceService;
@Service
@Transactional
public class ResourceServiceimpl implements ResourceService{

	@Autowired
	private ResourceDao resourceDao;
	@Override
	public int addResource(Resource resource) {
		return this.resourceDao.addResource(resource);
	}
	@Override
	public List<Resource> classify(int Lid) {
		
		List<Resource> c=this.resourceDao.classify(Lid);
		return c;
	}
	@Override
	public List<Resource> findbyCid(int cId) {
		List<Resource> fc=this.resourceDao.findbyCid(cId);
		return fc;
	}
	@Override
	public Resource findResourceByrId(int rid) {
		
		
		return this.resourceDao.findResourceByrId(rid);
	}
	@Override
	public List<Resource> findResourceList(String resourceName) {
		List<Resource> search=this.resourceDao.findResourceList(resourceName);
		return search;
	}
	
	
}
