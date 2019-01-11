package com.hxx.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hxx.po.Customer;
import com.hxx.po.Lable;
import com.hxx.service.CustomerService;
import com.hxx.service.LableService;


@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private LableService lableservice;
	DateTime date=new DateTime();
	String time=date.time();
	
	//用户登录
	@RequestMapping(value="login.action", method=RequestMethod.GET)
	public String tologin(){
		return "login";
	}
	@RequestMapping(value="login.action",method=RequestMethod.POST)
	public String login(Customer customer,Model model,HttpSession session) {

		Customer csl=customerService.login(customer);
		System.out.println(csl);
			if(csl != null) {
				if (csl.getcType().equals("1")) {
					System.out.println("登录账号:"+csl.getcAccount()+";登录时间:"+time);
					session.setAttribute("CUSTOMER_SESSION", csl);
					List<Lable> lables = lableservice.findLable();
					model.addAttribute("lables", lables);
					return "redirect:index.action";
				} else {
					model.addAttribute("msg","账号因违规被封禁");
					return "login";
				}
				
			} else {
				model.addAttribute("msg","账号或密码错误，请重新输入!");
				return "login";
			}
			
	}
	//退出登录
@RequestMapping(value="logout.action")
	public String logout(HttpSession session,Model model){
	session.invalidate();
	List<Lable> lables = lableservice.findLable();
	model.addAttribute("lables", lables);
		return "redirect:index.action";
		
	}
	
	//注册
	@RequestMapping("toAddCustomer.action")
	public String toAddCustomer(Model model){
		List<Lable> lables = lableservice.findLable();
		model.addAttribute("lables", lables);
		System.out.println(Arrays.toString(lables.toArray()));
		return "addCustomer";	
	}
	@RequestMapping(value="addCustomer.action")
	@ResponseBody
	public Customer addResource(@RequestBody Customer customer){
		System.out.println("--addCustomer---"+customer.toString());
		int rows=customerService.addCustomer(customer);
		if(rows >0){
		return customer;
		}
		return null;
	}
	
}
