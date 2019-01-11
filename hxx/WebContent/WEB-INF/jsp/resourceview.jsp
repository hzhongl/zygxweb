<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="supporth5/html5shiv.min.js"></script>
<script src="supporth5/respond.min.js"></script>

<title>首页</title>
<style type="text/css"> 
.header {
    width: 100%;
    background: #fff;
    height: 50px;
    box-sizing: border-box;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 9999;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}
.container-fluid {
    width: 1000px;
    margin: 0 auto;
}
.index_banner {
    width: 980px;
    height: 360px;
    margin: 0 auto;
    margin-top: 76px;
    margin-bottom: 20px;
    background-size: cover;
    box-sizing: border-box;
    position: relative;
	background:url(imgs/3D5D11BA@79C7E05B.D0CF0E58_recompress.jpg);
}
.index_banner .index_banner_main {
    position: absolute;
    bottom: 27px;
    left: 0;
    right: 0;
    margin: auto;
    width: 640px;
    height: 100px;
    text-align: center;
}
.index_banner .index_banner_main .index_banner_pop {
    position: absolute;
    width: 100%;
    height: 100%;
    background: #000;
    opacity: 0.6;
    border-radius: 4px;
    z-index: 1;
}
.index_banner .index_banner_main .index_banner_box {
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 10;
    top: 12px;
}
.index_banner .index_banner_search {
    width: 600px;
    margin: 0 auto;
    
    position: relative;
    overflow: hidden;
    box-sizing: border-box;
    font-size: 15px;
}
.index_banner .index_banner_main .index_banner_nav {
    font-size: 16px;
}
.index_banner .index_banner_main .index_banner_nav ul {
    display: inline-block;
}
.index_banner .index_banner_main .index_banner_nav li {
    display: inline-block;
    margin: 0 18px;
}
.index_banner .index_banner_search input {
    width: 556px;
    height: 40px;
    border: none;
    background: none;
    padding-left: 15px;
    font-size: 14px;
    color: #999;
    border-radius: 3px;
    border-bottom-right-radius: 0;
    border-top-right-radius: 0;
    float: left;
    background: #fff;
}
.index_banner .index_banner_search a {
    position: absolute;
    width: 56px;
    height: 40px;
    background: #FFDE02;
    right: 0;
    top: 0;
    border: 1px solid #FFDE02;
    border-radius: 3px;
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
    float: left;
}
.index_banner .index_banner_search a .search_btn {
    position: relative;
    top: -1px;
    width: 20px;
    height: 20px;
    margin: 10px auto;
    display: block;
    background: url(../img/icon.png);
    background-position: -80px -270px;
}

.diplayBox {
    width: 980px;
    box-sizing: border-box;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
    background: #fff;
    margin: 0 auto;
    margin-bottom: 20px;
    border-radius: 3px;
}
.diplayBox .sub_title {
    width: 100%;
    height: 35px;
    line-height: 35px;
    border-bottom: 1px solid #DEDEDE;
    padding: 0 16px;
    box-sizing: border-box;
    font-size: 15px;
    font-weight: bold;
}
.diplayBox .sub_box {
    box-sizing: border-box;
    padding: 12px 15px 0 15px;
     font-size: 18px;
}
.row{
    margin-bottom: 18px;
    box-sizing: border-box;}
.footer {
	text-align:center;
    width: 1000px;
    margin: 0 auto;
    font-size: 13px;
    color: #888;
    line-height: 20px;
    padding: 60px 0;
}
.detail_box_bot {
    padding-left: 220px;
    background: #fff;
    padding: 12px;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
    margin: 0 auto;
    border-radius: 3px;
    width: 980px;
    height: 250px;
    margin-top: 76px;
    margin-bottom: 20px;
    background-size: cover;
    box-sizing: border-box;
    position: relative;
}
.detail_row {
    font-size: 16px;
    line-height: 1;
    color: #333;
    width: 410px;
}

</style>
</head>
<body>
<div class="header">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
    
      <a class="navbar-brand" href="index.action">资源共享</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.action">首页<span class="sr-only">(current)</span></a></li>
         <li class="classify">
          <a  class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
          <ul class="dropdown-menu">
           <c:forEach items="${lables}" var="lable">
            <li><a href="${pageContext.request.contextPath}/classify.action?lId=${lable.lId}" value="${lable.lId}">${lable.lLableName}</a></li>
            </c:forEach>
          </ul>
        </li>
      </ul>
    <c:if test="${sessionScope.CUSTOMER_SESSION == null}">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="login.action" >登录</a> </li>
      <li><a href="toAddCustomer.action">注册</a></li>
      </ul>
   </c:if>
    <c:if test="${sessionScope.CUSTOMER_SESSION  != null}">
          <ul class="nav navbar-nav navbar-right ">
         <li>
         <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${CUSTOMER_SESSION.cRealName}<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="toAddResource.action">上传资源</a></li>
            <li><a href="${pageContext.request.contextPath}/myresources.action?cId=${CUSTOMER_SESSION.cId}">我的资源</a></li>
            <li><a href="logout.action">退出登录</a></li> 
          </ul>
         </li>
         <li><a href="toAddCustomer.action">注册</a></li>
         </ul>
         
   </c:if>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>

<div class="detail_box_bot">
<c:if test="${resource.lable.lId==1}">
 <div class="detail_row">
 	<img src="${resource.rUrl}" width="50%" height="50%"> 
 	<p>${resource.rName}</p>	
	<p>类型:${resource.lable.lLableName}</p>
 </div>
</c:if>
<c:if test="${resource.lable.lId!=1}">
		<h1>${resource.rName}</h1>	
	<p>类型:${resource.lable.lLableName}</p>
		<p>上传用户:${resource.customer.cRealName}</p>
		<a>下载</a>
		</c:if>
</div>
  <div class="diplayBox">
         <div class="sub_title">
          资源详情
           </div>
           <div class="sub_box clearfix" id="videoBox_new">
           <p>${resource.rContent}</p>
           </div>
           </div>



 <div class="footer">
  <p>本网站所有资源由用户自己上传</p>
   </div>
<script>

	

</script>

</body>

</html>
