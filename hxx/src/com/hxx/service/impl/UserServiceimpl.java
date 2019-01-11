package com.hxx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hxx.dao.UserDao;
import com.hxx.po.Customer;
import com.hxx.po.Resource;
import com.hxx.po.User;
import com.hxx.service.UserService;

@Service
@Transactional
public class UserServiceimpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	//管理员登录
	public User managerClient(User user) {
		
		return this.userDao.managerClient(user);
	}

	//忘记密码
	public User findPassword(User user) {

		return this.userDao.findPassword(user);

	}

	//管理员表单查询
	public List<User> findUserList() {

		return this.userDao.findUserList();
	}

	//资源表单查询
	public List<Resource> findResourceList(String resourceName,String type) {
		return this.userDao.findResourceList(resourceName,type);
	}
	
	//资源表单查询按cId
	public List<Resource> upResource(Customer customer) {
		return this.userDao.upResource(customer);
	}
	
	//资源审核
	public int changePass(Resource resource) {
			// TODO Auto-generated method stub
		return this.userDao.changePass(resource);
	}
	
	//资源详情
	public Resource ResourceDetails(Resource resource) {
		return this.userDao.ResourceDetails(resource);
	}
	
	//添加热门资源
	public int changeHot(int id) {
		return this.userDao.changeHot(id);
	}

	//删除热门资源
	public int deleteHot(int id) {
		return this.userDao.deleteHot(id);
	}
	
	//修改热门资源
	public int updateHot(Resource resource) {
		return this.userDao.updateHot(resource);
	}	
	
	//客户表单查询
	public List<Customer> findCustomerList(String customerAccount,String type) {
		return this.userDao.findCustomerList(customerAccount,type);
	}
	
	//客户详情
	public Customer CustomerDetails(Customer customer) {
		return this.userDao.CustomerDetails(customer);
	}
	
	//删除资源操作
	public int deleteResource(Resource resource) {

		return this.userDao.deleteResource(resource);
	}

	//客户账号状态
	public int changeCustomerType(Customer customer) {
		// TODO Auto-generated method stub
		return this.userDao.changeCustomerType(customer);
	}



	//管理员修改个人信息
	public int updateUser(User user) {

		return this.userDao.updateUser(user);
	}

	//添加管理员
	public int addUser(User user) {

		return this.userDao.addUser(user);
	}

	



}
