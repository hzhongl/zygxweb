package com.hxx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hxx.po.Resource;

public interface ResourceService {

	 public int addResource(Resource resource);
	 List<Resource> classify(int Lid);
	 List<Resource> findbyCid(int cId);
	 public Resource findResourceByrId(int rid);
	List<Resource> findResourceList(String resourceName);
}
