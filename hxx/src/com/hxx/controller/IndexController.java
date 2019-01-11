package com.hxx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hxx.po.HotResources;
import com.hxx.po.Lable;
import com.hxx.service.HotResourceService;
import com.hxx.service.LableService;



@Controller
@RequestMapping(value="index.action")
public class IndexController {
		
	@Autowired
	private HotResourceService hotResourceService;
	@Autowired
	private LableService lableservice;
	@RequestMapping
	public ModelAndView findHotResources(Model model) {
		ModelAndView mav = new ModelAndView();
		
		List<Lable> lables = lableservice.findLable();
		model.addAttribute("lables", lables);
	
		List<HotResources> hr=hotResourceService.findhotresources();

		mav.addObject("hotresources", hr);
		mav.setViewName("index");
		return mav;
	}
	
}
