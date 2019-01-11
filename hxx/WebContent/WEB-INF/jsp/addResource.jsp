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
.form-c{

    display: block;
    width: 100%;
    height: 100px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
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
          上传资源
           </div>
          <div class="sub_box clearfix" id="videoBox_new">
  <form method="post" action="toAddResource.action" >
  <div class="form-group">
    <label><h4>资源名字</h4></label>
    <input type="text" class="form-control" id="rName" name="rName">
  </div>
  <div class="form-group">
     <label><h4>资源描述</h4></label>
    <input type="text" class="form-c" id="rContent" name="rContent">
  </div>
  <div class="form-group">
    <label><h4>资源上传</h4></label>
    <input type="text" value="未选择文件" id="fileName" onclick="checkFile()">
    <input type="text" hidden="hidden" id="fileURL" name="rUrl">
    <p><h4>选择资源标签</h4></p>
  </div>
  <div class="checkbox">
  <c:forEach items="${lables}" var="lable">
    <label>
      <input type="radio" checked="checked" name="lId" value="${lable.lId}">${lable.lLableName}
    </label>
    </c:forEach>
  </div>
   <input type="text" hidden="hidden" id="cId" name="cId" value="${CUSTOMER_SESSION.cId}">
   <input  type="hidden" id="rHot"  value="0">
   <input type="hidden"  id="rPass" value="0">
</form>
	<form id="fileForm" hidden="hidden">
    	<input id="exampleInputFile" type="file" name="file" onchange="uploadFile()">
    </form>
	<input type="button" value="提交" onclick="add()">
  </div>
 </div>
	</body>
	<script type="text/javascript">
	//var file=document.getElementById("file");
		function uploadFile() {
			$.ajax({
				url:"${pageContext.request.contextPath}/uploadFile.json",
				type:"POST",
				dataType:"json",
				data:new FormData($("#fileForm")[0]),
				processData:false,
		        contentType:false,
				success:function(data) {
				console.log("success");
					console.log(data);
					for (let i in data.successMessages) {
						$("#fileURL").val(data.successMessages[i]);
					}
				},
				error:function(data) {
					console.log("error");

				}
			});
			
		}
		
		function checkFile() {
			$("#exampleInputFile").trigger("click");
		}
		function add(){
			var  rName= $("#rName").val();
			var rContent = $("#rContent").val();
			var rUrl = $("#fileURL").val();
			var cId=$("#cId").val();
			var lId=$("input[name='lId']:checked").val();
			var rHot=$("#rHot").val();
			var rPass=$("#rPass").val();
			if(rName!=""&&rUrl!=""){
				$.ajax({
					url : "addResource.action",
					type : "post", 
					data :JSON.stringify({rName:rName,rContent:rContent,rUrl:rUrl,cId:cId,lId:lId,rHot:rHot,rPass:rPass}),
					contentType : "application/json;charset=UTF-8",
					dataType : "json",
					success : function(data){	    
						if(data != null){					
						  alert("上传成功");
						 window.location.reload();
						}
				
					}
					
				});
			}
			else if(rName==""&&rUrl==""){
			    alert("上传失败");
			}
		}
	</script>
</html>
