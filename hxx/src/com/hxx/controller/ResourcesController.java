package com.hxx.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hxx.po.Lable;
import com.hxx.po.Resource;
import com.hxx.service.LableService;
import com.hxx.service.ResourceService;

@Controller
public class ResourcesController {
	//添加
	@Autowired
	private ResourceService resourceservice;
	@Autowired
	private LableService lableservice;
	@RequestMapping("toAddResource.action")
	public String toAddResource(Model model){
		List<Lable> lables = lableservice.findLable();
		model.addAttribute("lables", lables);
		System.out.println(Arrays.toString(lables.toArray()));
		return "addResource";
		
	}
	@RequestMapping(value="addResource.action")
	@ResponseBody
	public Resource addResource(@RequestBody Resource resource){
		DateTime date=new DateTime();
		String time=date.time();
		resource.setrCreatetime(time);
		System.out.println("--addResource---"+resource);
		int rows=resourceservice.addResource(resource);
		if(rows >0){
		return resource;
		}
		return null;
	}
	@RequestMapping(value="findResourceByrId.action")
	public ModelAndView findResourceByrId(int rId) {
		ModelAndView mav = new ModelAndView();
		List<Lable> lables = lableservice.findLable();
		mav.addObject("lables", lables);
		Resource resource=resourceservice.findResourceByrId(rId);
		mav.addObject("resource", resource);
		mav.setViewName("resourceview");
		
		return mav;
	}
	//搜索
	@RequestMapping(value="findResources.action")
	public ModelAndView findResourceList(
			@RequestParam(name="search_name", defaultValue="", required=false)String resourceName,
			@RequestParam(name="pn", defaultValue="1", required=false) Integer pn
	) {
		ModelAndView mav = new ModelAndView();
		List<Lable> lables = lableservice.findLable();
		mav.addObject("lables", lables);
		PageHelper.startPage(pn,6);
		List<Resource> search=resourceservice.findResourceList(resourceName);
		PageInfo<Resource> pageInfo = new PageInfo<>(search);  
		mav.addObject("search", pageInfo);
		mav.setViewName("searchview");
		return mav;
	}
}
