package com.hxx.service;

import java.util.List;

import com.hxx.po.Customer;
import com.hxx.po.Resource;
import com.hxx.po.User;

public interface UserService {
	//管理员登录
	public User managerClient(User user);
	
	//忘记密码
	public User findPassword(User user);
	
	//管理员表单查询
	public List<User> findUserList();
	
	//资源表单查询
	public List<Resource> findResourceList(String resourceName,String type);
	
	//资源表单查询按cId
	public List<Resource> upResource(Customer customer);
	
	//资源审核
	public int changePass(Resource resource);
	
	//添加热门资源
	public int changeHot(int id);
	
	//删除热门资源
	public int deleteHot(int id);
	
	//修改热门资源
	public int updateHot(Resource resource);
	
	//资源详情
	public Resource ResourceDetails(Resource resource);
	
	//删除资源操作
	public int deleteResource(Resource resource);
	
	//客户表单查询
	public List<Customer> findCustomerList(String customerAccount,String type);
		
	//客户账号状态
	public int changeCustomerType(Customer customer);
	
	//客户信息详情
	public Customer CustomerDetails(Customer customer);
	
	//管理员修改个人信息
	public int updateUser(User user);
	
	//添加管理员
	public int addUser(User user);


	
}
