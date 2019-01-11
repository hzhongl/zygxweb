<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/jspcss/listResource.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-switch.min.css" rel="stylesheet" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>客户列表</title>
</head>

<body>
<h2>客户信息列表</h2>
	<form class="navbar-form navbar-right" >	
		<div class="form-group">
		<input type="text" placeholder="账号搜索.." class="form-control" id="search">
		<span style="font-size:16px; margin-left:5%;">账号状态</span>
		<select class="form-control" name="resourceType" id="type">
			<option value="">--未选择--</option>
			<option value="1">--正常--</option>
			<option value="0">--封禁--</option>
		</select>
		<input type="button" value="查询" class="btn btn-primary" onclick="find()">
		</div>
	</form>
	<table class="table table-hover">
	<tr>
		<td>账号</td>
		<td>真实姓名</td>
		<td>电话号码</td>
		<td>邮箱</td>
		<td>账号状态</td>
		<td>操作</td>
	</tr>
	<!-- 显示资源信息 -->
	<tbody id="list">
	</tbody>
	</table>
	
	
	<!--显示分页信息-->  
   <div class="row" id="tfood"> 
    </div>  
    
    <!-- 信息详情 -->
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
		tabindex="-1" id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">资源详情</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div>账号:<span id="cAccount"></span></div>
					<div>真实姓名:<span id="cRealName"></span></div>
					<div>年龄:<span id="cAge"></span></div>
					<div>电话:<span id="cPhone"></span></div>
					<div>身份证:<span id="cIdNumber"></span></div>
					<div>电子邮箱:<span id="cEmail"></span></div>
					<div>账号状态:<span id="cType"></span></div>
					<div>上传文件:<span id="cWork"></span></div>
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">
findCustomerList("findCustomerList.action", null);

	function findCustomerList(url) {
		console.log(url);
		$.ajax({
			url: url, 
			type : "post", 
			dataType : "json", 
			success : function(data){
				//打印数据
				console.log(data);
				//清空区域
				$("#list").empty();
				//生成HTML		
				//资源列表
				let content = "";
				$(data.list).each(function(index,element){
					var pass="";
					var style="";
					if(element.cType == 1){
						pass = "正常";
					}else{
						pass = "封禁";
					}
					content += "<tr>"+
					"<input type='hidden' value="+element.cId+" >"+
					"<td>"+element.cAccount+"</td>"+
					"<td>"+element.cRealName+"</td>"+
					"<td>"+element.cPhone+"</td>"+
					"<td>"+element.cEmail+"</td>"+
					"<td>"+
					"<input id="+element.cId+" value="+pass+" type='button' onclick='change("+element.cId+")' class='1' /></td>"+
					"<td>"+
						"<input type='button' value='查看' class='btn btn-info' href='#myModal' data-toggle='modal' onclick='detailes("+ element.cId+")'>"+
					"</td>"+
				"</tr>";
				});
				$("#list").html(content);
				//分页部分
				let up="";
				let num="";
				let page="";
				let next="";
				let foot="";

				$("#tfood").empty();
				
						//判断是否有上一页	
		                if(data.hasPreviousPage){
		                 	up="<a class='ajax' href='#findCustomerList.action?pn="+data.prePage+"' aria-label='Previous'>"+  
		                    	"<span aria-hidden='true'>«</span>"+
		                		"</a>";
		                 	num1="<li><a class='ajax' href='#findCustomerList.action?pn="+data.prePage+"'>"+data.prePage+"</a></li>";
		                 }
		              	//判断是否有下一页
						if(data.hasNextPage){ 
		                       next="<a class='ajax' href='#findCustomerList.action?pn="+data.pages+"'  aria-label='Next'>"+  
		                            " <span aria-hidden='true'>»</span>"+  
		                         	"</a>";
		                       num2="<li><a class='ajax' href='#findCustomerList.action?pn="+data.nextPage+"'>"+data.nextPage+"</a></li>";
							}
		              	
	             	   	num3="<li class='active'><a href='#'>"+data.pageNum+"</a></li>";
	             	   	
		              	
		   				 //循环页号
		                for(var i=0;i<data.lastPage;i++){
		             	  	if(data.navigatepageNums[i] !=data.pageNum){
		             		   	num="<li><a class='ajax' href='#findCustomerList.action?pn="+data.navigatepageNums[i]+"'>"+data.navigatepageNums[i]+"</a></li>";
		             		   
		             	   	} else {
		             	   		num="<li class='active'><a href='#'>"+data.navigatepageNums[i]+"</a></li>";
		             	   	}
		             	  	page=page+num;
		             	 
		                }     
		   				
		              //拼接分页区代码
	             	  	foot="<div class='col-md-6'>"+
		            	"当前第 "+data.pageNum+" 页.总共 "+data.pages+" 页.一共 "+data.total+"条记录 "+
			            "</div>"+
			            "<div class='col-md-6'>"+  
			                "<nav aria-label='Page navigation'>"+
			                    "<ul class='pagination'>"+
			                        "<li><a class='ajax' href='#findCustomerList.action?pn="+data.firstPage+"'>首页</a></li>"+
			                        "<li>"+up+"</li>"+page+"<li>"+next+"</li>"+  
			                        "<li><a class='ajax' href='#findCustomerList.action?pn="+data.lastPage+"'>尾页</a></li>"+  
			                   "</ul>"+  
			                "</nav>"+  
			          "</div>" ;
			          
					$("#tfood").append(foot);
					//加载资源审核状态
					color();
				//绑定事件
				bindClick();
			},
			error : function(data) {
				alert("加载失败");
			}	
		});
	}
	
	function color(){
		$('[value="正常"]').attr("class","btn btn-success");
		$('[value="封禁"]').attr("class","btn btn-danger");
	}
	
	
	function change(data){
		let id="#"+data;
		let num=0;
		 if($(id).val() == "正常"){
			$(id).attr("value","封禁");
			$(id).attr("class","btn btn-danger");
			num=0;
		}else{
			$(id).attr("value","正常");
			$(id).attr("class","btn btn-success");
			num=1;
		} 
		
		 $.ajax({
				url: "changePass.action", 
				type : "post",
				data :JSON.stringify({rId:data,rPass:num}),
				contentType : "application/json;charset=UTF-8",
				dataType : "text", 
				success : function(data){
					alert("成功");
				},error : function(data) {
					alert("失败");
				}
			});
	}
	
	// 绑定事件
	function bindClick() {
		$("a.ajax").on("click", function(){
			//console.log(this.href.substring(this.href.indexOf("#") + 1, this.href.length));
			let href = this.href.substring(this.href.indexOf("#") + 1, this.href.length);
			console.log($("#search").val());
			findCustomerList(href+"&customerAccount="+$("#search").val());
			/* $("#search").val(""); */
		});
	}

	//搜索
	function find(){
		let url="findCustomerList.action?customerAccount="+$("#search").val()+"&type="+$("#type").val();
		findCustomerList(url);
	}
	
	//客户删除
	function deleteOne(id) {
		$.ajax({
			url : "deleteCustomer.action",
			type : "post",
			data : JSON.stringify({
				cId : id
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			success : function() {
				alert("删除成功");
				//刷新当前页面
				window.location.reload();
			},
			error : function() {
				alert("删除失败");
			}
		});
	}

	//信息详情
	function detailes(Id){
		$.ajax({
			url : "CustomerDetails.action",
			type : "post",
			data : JSON.stringify({
				cId : Id
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				console.log(data);
				
				var customer=data.customerOne;
				var res="";
				$(data.resource).each(function(index,element){
					 res=element.rName;
				});
				
				var cAccount=customer.cAccount;
				var cRealName=customer.cRealName;
				var cAge=customer.cAge;
				var cPhone=customer.cPhone;
				var cIdNumber=customer.cIdNumber;
				var cEmail=customer.cEmail;
				var cWork=customer.cWork;
				var cType=customer.cType;
				
				if(cType == 1){
					rPass="正常";
				}else{
					rPass="封禁";
				}
				
				$("#cAccount").html(cAccount);
				$("#cRealName").html(cRealName);
				$("#cAge").html(cAge);
				$("#cPhone").html(cPhone);
				$("#cIdNumber").html(cIdNumber);
				$("#cEmail").html(cEmail);
				$("#cType").html(cType);
				$("#cWork").html("("+res+")");
				
			},
			error : function(data) {
				alert("加载失败");
			}
		});
	}


</script>


<script
	src="${pageContext.request.contextPath }/bootstrap/js/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap-switch.min.js"></script>
</html>
