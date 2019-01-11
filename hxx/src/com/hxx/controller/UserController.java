package com.hxx.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.hxx.po.Customer;
import com.hxx.po.Resource;
import com.hxx.po.User;
import com.hxx.service.UserService;

/**
 * 
 *	后台管理控制层（所有）
 *
 */

@Controller
public class UserController {

	@Autowired
	private UserService userservice;
	
	DateTime date=new DateTime();
	String time=date.time();
	
	//管理员登录
	@RequestMapping("/managerClient.action")
	public String managerClient(User user,Model model,HttpSession session){
		if(user == null) {
			model.addAttribute("msg", "请登录账号");
			return "managerClient";	
		}else {
			User userto=userservice.managerClient(user);
			if(userto != null) {
				System.out.println("登录账号:"+userto.getuAccount()+"----登录时间:"+time);
				session.setAttribute("userto", userto);
				return "layaw";
			}else {
				model.addAttribute("msg", "账号密码有误");
				return "managerClient";
			}
		}

	}
	
	//退出登录
	@RequestMapping(value= {"/outmanagerClient.action","tomanagerClient.action"})
	public String outmanagerClient(HttpSession session){
		//清除session
		session.invalidate();
		//重定向到登录页面
		return "managerClient";
	}
	
	//忘记密码查询
	@RequestMapping("/findPassword.action")
	@ResponseBody
	public String findPassword(@RequestBody User user,Model model) {
		User userPassword=userservice.findPassword(user);
		if(userPassword != null) {
			return "{\"userPassword\":\""+userPassword.getuPassword()+"\"}";
		}else {
			return "error";
		}
	}
	
	//跳转到添加管理员
	@RequestMapping("/toaddUsers.action")
	public String toadduser(){
		
		return "addUser";
	}
	
	//添加管理员
	@RequestMapping("/addUser.action")
	@ResponseBody
	public String addUser(@RequestBody User user,Model model) {
		
		int i=userservice.addUser(user);
		if(i > 0) {
			System.out.println("新增管理员:"+user.getuRealName());
			model.addAttribute("data", "success");
			return "addUser";
		}else {
			model.addAttribute("data", "error");
			return "addUser";
		}
	}

	//加载资源列表
	@RequestMapping("/toResourceList.action")
	public String toResourceList() {
		return "listResource";
	}

	//资源表单查询
	@RequestMapping("/findResourceList.action")
	@ResponseBody
	public PageInfo<Resource> findResourceList(@RequestParam(name="pn", defaultValue="1", required=false) Integer pn, 
			@RequestParam(name="resourceName", defaultValue="", required=false) String resourceName,
			@RequestParam(name="type", defaultValue="", required=false) String type) {
		//引入分页查询，使用PageHelper分页功能  
		//在查询之前传入当前页，然后多少记录  	
		PageHelper.startPage(pn,13);
		//startPage后紧跟的这个查询就是分页查询  
		List<Resource> resource =  userservice.findResourceList(resourceName,type);
		//使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
			PageInfo<Resource> pageInfo = new PageInfo<>(resource);  

			return pageInfo;
	}
	
	//资源审核
	@RequestMapping("/changePass.action")
	@ResponseBody
	public String changePass(@RequestBody Resource resource) {
		int i=userservice.changePass(resource);
		if(i>0) {
			return "success";
		}else {
			return "error";
		}
		
	}
	
	//热门资源
	@RequestMapping("/changeHot.action")
	@ResponseBody
	public String changeHot(@RequestBody Resource resource) {
		int id=resource.getrId();
		if(resource.getrHot().equals("1")) {
			userservice.changeHot(id);
			userservice.updateHot(resource);
			return "success";
		}else if(resource.getrHot().equals("0")){
			userservice.deleteHot(id);
			userservice.updateHot(resource);
			return "success";
		}else {
			return "error";
		}
		
	}
	
	//资源详情
	@RequestMapping("/ResourceDetails.action")
	@ResponseBody
	public Resource ResourceDetails(@RequestBody Resource resource,Model model) {
		
		Resource resourceOne =  userservice.ResourceDetails(resource);
		
		return resourceOne;
	}
	
	//资源删除
	@RequestMapping("/deleteResource.action")
	@ResponseBody
	public String deleteResource(@RequestBody Resource resource) {
		int i=userservice.deleteResource(resource);
		if(i>0) {
			return "success";
		}else {
			return "error";
		}

	}

	

	//加载客户列表
	@RequestMapping("/toCustomerList.action")
	public String toCustomerList() {
		return "listCustomer";
	}

	//客户表单查询
	@RequestMapping("/findCustomerList.action")
	@ResponseBody
	public PageInfo<Customer> findCustomerList(@RequestParam(name="pn", defaultValue="1", required=false) Integer pn, 
			@RequestParam(name="customerAccount", defaultValue="", required=false) String customerAccount,
			@RequestParam(name="type", defaultValue="", required=false) String type
			) {
		//引入分页查询，使用PageHelper分页功能  
		//在查询之前传入当前页，然后多少记录  	
		PageHelper.startPage(pn,13);  
		//startPage后紧跟的这个查询就是分页查询  
		List<Customer> customer =  userservice.findCustomerList(customerAccount,type);
		//使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
		PageInfo<Customer> pageInfo = new PageInfo<>(customer);  

		return pageInfo;
	}

	//客户账号状态
	@RequestMapping("/changeCustomerType.action")
	@ResponseBody
	public String changeCustomerType(@RequestBody Customer customer) {
		int i=userservice.changeCustomerType(customer);
		if(i>0) {
			return "success";
		}else {
			return "error";
		}

	}

	//客户详情
	@RequestMapping(value="/CustomerDetails.action",produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CustomerDetails(@RequestBody Customer customer) {
		
		Gson gson=new Gson();
		Customer customerOne =  userservice.CustomerDetails(customer);
		List<Resource> resource = userservice.upResource(customer);
	
		return "{\"customerOne\":"+gson.toJson(customerOne)+",\"resource\":"+gson.toJson(resource)+"}";
	}
	
	//跳转管理员修改页面
	@RequestMapping("/toupdateUser.action")
	public String toupdateUser(User user,Model model) {
		//传来的id查询个人信息，并返回给修改页面
		user=userservice.managerClient(user);
		model.addAttribute("user", user);

		return "updateUser";
	
	}
	
	//管理员修改页面
	@RequestMapping("/updateUser.action")
	@ResponseBody
	public String updateUser(@RequestBody User user,Model model) {
		//根据查询传来的参数判断是修改还是加载页面
		int i=userservice.updateUser(user);
		if (i > 0) {
			System.out.println("账号信息修改:"+user.getuAccount()+";***时间:"+time);
			return "success";
		}else {
			return "error";
		}
		
	}
	
	
	
	
	
	
}
