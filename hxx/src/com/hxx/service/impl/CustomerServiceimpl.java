package com.hxx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.hxx.dao.CustomerDao;
import com.hxx.po.Customer;
import com.hxx.po.Resource;
import com.hxx.po.SearchContent;
import com.hxx.service.CustomerService;


@Service
@Transactional
public class CustomerServiceimpl implements CustomerService{

	@Autowired
	private CustomerDao customerDao;

	
	//添加管理员
	public int addCustomer(Customer customer) {

		return this.customerDao.addCustomer(customer);
	}

	//用户登录
	public Customer login(Customer customer) {
		return this.customerDao.login(customer);
	}


	



}
