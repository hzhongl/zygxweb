<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="supporth5/html5shiv.min.js"></script>
<script src="supporth5/respond.min.js"></script>

<title>注册</title>
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
        <li ><a href="index.action">首页<span class="sr-only">(current)</span></a></li>

         <li class="classify">
          <a href="javascript;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
          <ul class="dropdown-menu">
           <c:forEach items="${lables}" var="lable">
            <li><a href="${pageContext.request.contextPath }/classify.action?lId=${lable.lId}" >${lable.lLableName}</a></li>
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
         注册
           </div>
          <div class="sub_box clearfix" id="videoBox_new">
  <form method="post" action="toAddCustomer.action" >
  	<div class="form-group">
  	
    <label><h4>账号</h4></label>
    <input type="text" class="form-control" id="cAccount" name="cAccount" >
  	</div>
  	<div class="form-group">
     <label><h4>密码</h4></label>
    <input type="password" class="form-control" id="cPassword" name="cPassword">
  	</div>
  	<div class="form-group">
 	<label><h4>昵称</h4></label>
    <input type="text" class="form-control" id="cRealName" name="cRealName">
  	</div>
  	<div class="form-group">
 	<label><h4>年龄</h4></label>
    <input type="text" class="form-control" id="cAge" name="cAge">
  	</div>
  	<div class="form-group">
  	<label><h4>手机号码</h4></label>
    <input type="number" class="form-control" id="cPhone" name="cPhone">
  	</div>
  	<div class="form-group">
  	<label><h4>身份证</h4></label>
    <input type="number" class="form-control" id="cIdNumber" name="cIdNumber">
  	</div>
  	<div class="form-group">
  	<label><h4>邮箱</h4></label>
   	 <input type="email" class="form-control" id="cEmail" name="cEmail">
  </div>
  <input type="hidden" value="1" id="cType">
	</form>
	<input type="button" value="注册" onclick="add()">
  </div>
 </div>
	</body>
	<script type="text/javascript">
		function add(){
			var  cAccount= $("#cAccount").val();
			var cPassword = $("#cPassword").val();
			var cRealName = $("#cRealName").val();
			var cAge=$("#cAge").val();
			var cPhone=$("#cPhone").val();
			var cEmail=$("#cEmail").val();
			var cIdNumber=$("#cIdNumber").val();
			var cType=$("#cType").val();
			if(cAccount!=""&&cPassword!=""){
				$.ajax({
					url : "addCustomer.action",
					type : "post", 
					data :JSON.stringify({cAccount:cAccount,cPassword:cPassword,cRealName:cRealName,cPhone:cPhone,cEmail:cEmail,cIdNumber:cIdNumber,cType:cType,cAge:cAge}),
					contentType : "application/json;charset=UTF-8",
					dataType : "json",
					success : function(data){	    
						if(data != null){					
						  alert("注册成功");
						  window.location.href="${pageContext.request.contextPath }/login.action";
						}
				
					}
					
				});
			}
			else if(cAccount==""&&cPassword==""&&cRealName==""&&cPhone==""&&cEmail==""){
			    alert("请填写完整的信息");
			}
		}
	</script>
</html>
