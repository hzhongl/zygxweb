package com.hxx.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hxx.po.User;

public class ClientInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		//获取请求的url
		String url=request.getRequestURI();
		//url：处了登录请求外，其他url都进行拦截
		if(url.indexOf("/managerClient.action") >=0) {
			return true;
		}
		//获取Session
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("userto");
		//判断user中数据
		if(user != null) {
			return true;
		}
		
		//不符合条件的，跳转回登录页面
		request.setAttribute("msg", "请登录账号");
		request.getRequestDispatcher("WEB-INF/jsp/managerClient.jsp").forward(request, response);	
		return false;
	}

	
	
	
	
}
