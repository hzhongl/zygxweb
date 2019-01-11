package com.hxx.dao;

import java.util.List;

import com.hxx.po.Customer;
import com.hxx.po.Resource;
import com.hxx.po.SearchContent;


public interface CustomerDao {
	
	//用户登录
	public Customer login(Customer customer);
	
	//添加管理员
	public int addCustomer(Customer customer);
	

}
