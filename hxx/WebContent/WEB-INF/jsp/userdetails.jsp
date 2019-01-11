<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="">
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<title>客户查询</title>
</head>
<script src="bootstrap/jquery/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<body>
	<table class="table table-striped">
	<thead>用户查询列表</thead>
		<tr>
			<td>id</td>
			<td>用户名</td>
			<td>工作</td>
			<td>电话</td>
		</tr>
		<tr>
			<td>${customer.id }</td>
			<td>${customer.username }</td>
			<td>${customer.jobs }</td>
			<td>${customer.phone }</td>
		</tr>
	</table>
	<a href="findCustomerList" target="_black">返回</a>
</body>
</html>