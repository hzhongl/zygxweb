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

<title>上传资源</title>
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
}
.footer {
	text-align:center;
    width: 1000px;
    margin: 0 auto;
    font-size: 13px;
    color: #888;
    line-height: 20px;
    padding: 60px 0;
}
.col-md-3{
	height: 100px;
    width: 25%;
    float: left;
    margin-bottom: 18px;
    box-sizing: border-box;
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
          <a href="classify.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
          <ul class="dropdown-menu">
           <c:forEach items="${lables}" var="lable">
            <li><a href="${pageContext.request.contextPath}/classify.action?lId=${lable.lId}" >${lable.lLableName}</a></li>
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
<div class="index_banner">

           <div class="diplayBox">
           <div class="sub_title"> 
      我上传的资源
           </div>
          <div class="sub_box clearfix" id="videoBox_new">
          <div class="row">
     
  	 <div class="sub_box clearfix" id="videoBox_new">
          <table class="table table-hover">
          <tr>
			<td>资源名字</td>
			<td>资源上传时间</td>
			<td>资源状态</td>
			<td>资源类型</td>
		</tr>
		 <c:forEach items="${resources.list}" var="resource"> 
			<tr>
            <td><a href="${pageContext.request.contextPath}/findResourceByrId.action?rId=${resource.rId}">${resource.rName}</a></td>
            	<td>${resource.rCreatetime}</td>
            	<td><c:if test="${resource.rPass==1}">
            	已通过审核
            	</c:if>
            	<c:if test="${resource.rPass==0}">
            	等待审核
            	</c:if>
            	</td>
            <td>${resource.lable.lLableName } </td>
            </tr>
            </c:forEach>
		</table>
           </div>
	<div class="row">
        <!--文字信息-->
        <div class="col-md-6">
            当前第 ${resources.pageNum} 页.总共 ${resources.pages} 页.一共 ${resources.total} 条记录
        </div>
 
        <!--点击分页-->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    
                    <li><a href="${pageContext.request.contextPath}/myresources.action?pn=1&cId=${CUSTOMER_SESSION.cId}">首页</a></li>
                    
                    <!--上一页-->
                    <li>
                        <c:if test="${resources.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/myresources.action?pn=${resources.pageNum-1}&cId=${CUSTOMER_SESSION.cId}" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                            </a>
                        </c:if>
                    </li>
 
                    <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->
                    <c:forEach items="${resources.navigatepageNums}" var="page_num">
                        <c:if test="${page_num == resources.pageNum}">
                            <li class="active"><a href="#">${page_num}</a></li>
                        </c:if>
                        <c:if test="${page_num != resources.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/myresources.action?pn=${page_num}&cId=${CUSTOMER_SESSION.cId}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>
 
                    <!--下一页-->
                    <li>
                        <c:if test="${resources.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/myresources.action?pn=${resources.pageNum+1}&cId=${CUSTOMER_SESSION.cId}"
                               aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </c:if>
                    </li>
                    
                    <li><a href="${pageContext.request.contextPath}/myresources.action?pn=${resources.pages}&cId=${CUSTOMER_SESSION.cId}">尾页</a></li>
                </ul>
            </nav>
        </div>
 
    </div>


           </div>
           </div>
          </div>
          </div>
           <div class="footer">
           
           <p>本网站所有资源由用户自己上传</p>
           </div>

</body>
</html>