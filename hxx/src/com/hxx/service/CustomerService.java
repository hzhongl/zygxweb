package com.hxx.service;

import java.util.List;

import com.hxx.po.Customer;
import com.hxx.po.Resource;
import com.hxx.po.SearchContent;


public interface CustomerService {
	
	
	
	public int addCustomer(Customer customer);

	//用户登录
	public Customer login(Customer customer);
	
	
}
