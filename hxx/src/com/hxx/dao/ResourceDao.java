package com.hxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hxx.po.Resource;


public interface ResourceDao {
	public int addResource(Resource  resource);
	List<Resource> classify(int lId);
	List<Resource> findbyCid(int cId);
	public Resource findResourceByrId(int rId);
	List<Resource> findResourceList(@Param("resourceName") String resourceName);
}

