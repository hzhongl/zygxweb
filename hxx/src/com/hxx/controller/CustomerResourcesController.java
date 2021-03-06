package com.hxx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hxx.po.Lable;
import com.hxx.po.Resource;
import com.hxx.service.LableService;
import com.hxx.service.ResourceService;



@Controller
@RequestMapping(value="myresources.action")
public class CustomerResourcesController {
		
	@Autowired
	private ResourceService resourceService;
	@Autowired
	private LableService lableservice;
	@RequestMapping
	public ModelAndView findResources(@RequestParam(name="pn", defaultValue="1", required=false) Integer pn,Integer cId ,Model model) {
		ModelAndView mav = new ModelAndView();
		
		List<Lable> lables = lableservice.findLable();
		model.addAttribute("lables", lables);
		PageHelper.startPage(pn,6);
		List<Resource> cr=resourceService.findbyCid(cId);
		PageInfo<Resource> pageInfo = new PageInfo<>(cr);  
		
		mav.addObject("resources", pageInfo);
		mav.setViewName("myresources");
		return mav;
	}
	
}
