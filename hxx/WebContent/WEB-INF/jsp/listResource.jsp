<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/jspcss/listResource.css"
	type="text/css" rel="stylesheet" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户列表</title>
</head>

<body>

<h2>资源列表</h2>
	<form class="navbar-form navbar-right" >	
		<div class="form-group">
		<input type="text" placeholder="资源名" class="form-control" id="search">
		<span style="font-size:16px; margin-left:2%;">资源类型</span>
		<select class="form-control" name="resourceType" id="type">
			<option value="">--未选择--</option>
			<option value="1">--图片--</option>
			<option value="2">--音乐--</option>
			<option value="3">--工具--</option>
			<option value="4">--视频--</option>
		</select>
		<input type="button" value="查询" class="btn btn-primary" onclick="find()">
		<!-- </a> -->
		</div>
	</form>
	<table class="table table-hover">
	<tr>
		<td>资源名</td>
		<td>类型</td>
		<td>上传时间</td>
		<td>分享人</td>
		<td>热门资源</td>
		<td>状态</td>
		<td>操作</td>
	</tr>
	<!-- 显示资源信息 -->
	<tbody id="list">
	</tbody>
	</table>
	
	
	<!--显示分页信息-->  
   <div class="row" id="tfood"> 
    </div>  
    
    
<!-- 资源详情 -->
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
					<div>资源名:<span id="rName"></span></div>
					<div>资源类型:<span id="Lable"></span></div>
					<div>发布账号:<span id="cAccount"></span></div>
					<div>上传时间:<span id="rCreatetime"></span></div>
					<div>热度:<span id="rHot"></span></div>
					<div>审核:<span id="rPass"></span></div>
					<div>资源说明:<span id="rContent"></span></div>
				</div>
				<div class="modal-footer">
					<a href="" download="" id="rUrl"><button class="btn btn-theme" type="button" onclick="tofind()">下载</button></a>
					<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	findResourceList("findResourceList.action", null);

	function findResourceList(url) {
		console.log(url);
		$.ajax({
					url : url,
					type : "post",
					dataType : "json",
					success : function(data) {
						//打印数据
						console.log(data);
						//清空区域
						$("#list").empty();
						//生成HTML		
						//资源列表
						let content = "";
						$(data.list).each(function(index, element) {
											var pass = "";
											var style = "";
											var hot="";
											if (element.rHot == 1) {
												hot = "热门";
											} else {
												hot = "冷门";
											}
											if (element.rPass == 1) {
												pass = "已通过";
											} else {
												pass = "未通过";
											}
											content += "<tr>"
													+ "<input type='hidden' value="+element.rId+" >"
													+ "<td>"+ element.rName+ "</td>"
													+ "<td>"+ element.lable.lLableName+ "</td>"
													+ "<td>"+ element.rCreatetime+ "</td>"
													+ "<td>"+ element.customer.cRealName+ "</td>"
													+ "<td><input id="+ element.rId + "i value="+ hot+ " type='button' onclick='changehot("+ element.rId+ ")' class='1' /></td>"
													+ "<td><input id="+ element.rId + " value="+ pass+ " type='button' onclick='change("+ element.rId+ ")' class='1' /></td>"
													+ "<td>"+ "<a class='btn btn-info' href='#myModal' data-toggle='modal' onclick='detailes("+ element.rId+")' >查看</a>"
													+ "<input type='button'value=' 删除' class='btn btn-danger' onclick='deleteOne("+ element.rId+ ")' >"
													+ "</td>" 
													+ "</tr>";
										});
						$("#list").html(content);
						//分页部分
						let up = "";
						let num = "";
						let page = "";
						let next = "";
						let foot = "";

						$("#tfood").empty();

						//判断是否有上一页	
						if (data.hasPreviousPage) {
							up = "<a class='ajax' href='#findResourceList.action?pn="
									+ data.prePage
									+ "' aria-label='Previous'>"
									+ "<span aria-hidden='true'>«</span>"
									+ "</a>";
						}
						//判断是否有下一页
						if (data.hasNextPage) {
							next = "<a class='ajax' href='#findResourceList.action?pn="
									+ data.pages
									+ "'  aria-label='Next'>"
									+ " <span aria-hidden='true'>»</span>"
									+ "</a>";
						}

						//循环页号
						for (var i = 0; i < data.lastPage; i++) {
							if (data.navigatepageNums[i] != data.pageNum) {
								num = "<li><a class='ajax' href='#findResourceList.action?pn="
										+ data.navigatepageNums[i]
										+ "'>"
										+ data.navigatepageNums[i]
										+ "</a></li>";

							} else {
								num = "<li class='active'><a href='#'>"
										+ data.navigatepageNums[i]
										+ "</a></li>";
							}
							page = page + num;

						}

						//拼接分页区代码
						foot = "<div class='col-md-6'>" 
								+ "当前第 "+ data.pageNum+ " 页.总共 "+ data.pages+ " 页.一共 "+ data.total+ "条记录 "
								+ "</div>"
								+ "<div class='col-md-6'>"
								+ "<nav aria-label='Page navigation'>"
								+ "<ul class='pagination'>"
								+ "<li><a class='ajax' href='#findResourceList.action?pn="+ data.firstPage+ "'>首页</a></li>"
								+ "<li>"+ up + "</li>"+ page+ "<li>"+ next+ "</li>"
								+ "<li><a class='ajax' href='#findResourceList.action?pn="+ data.lastPage + "'>尾页</a></li>" + "</ul>"
								+ "</nav>" 
								+ "</div>";

						$("#tfood").append(foot);
						//加载资源审核状态
						color();
						//加载热们资源
						hotcolor();
						//绑定事件
						bindClick();
					},
					error : function(data) {
						alert("加载失败");
					}
				});
	}

	function color() {
		$('[value="已通过"]').attr("class", "btn btn-success");
		$('[value="未通过"]').attr("class", "btn btn-danger");
	}

	function change(data) {
		let id = "#" + data;
		let num = 0;
		if ($(id).val() == "已通过") {
			$(id).attr("value", "未通过");
			$(id).attr("class", "btn btn-danger");
			num = 0;
		} else {
			$(id).attr("value", "已通过");
			$(id).attr("class", "btn btn-success");
			num = 1;
		}

		$.ajax({
			url : "changePass.action",
			type : "post",
			data : JSON.stringify({
				rId : data,
				rPass : num
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			success : function(data) {
			},
			error : function(data) {
				alert("失败");
			}
		});
	}
	
	function hotcolor() {
		$('[value="热门"]').attr("class", "btn btn-danger");
		$('[value="冷门"]').attr("class", "btn btn-info");
	}

	function changehot(data) {
		let id = "#" + data+"i";
		let num = 0;
		if ($(id).val() == "热门") {
			$(id).attr("value", "冷门");
			$(id).attr("class", "btn btn-info");
			num = 0;
		} else {
			$(id).attr("value", "热门");
			$(id).attr("class", "btn btn-danger");
			num = 1;
		}

		$.ajax({
			url : "changeHot.action",
			type : "post",
			data : JSON.stringify({
				rId : data,
				rHot : num
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			success : function(data) {
			},
			error : function(data) {
				alert("失败");
			}
		});
	}

	// 绑定事件
	function bindClick() {
		$("a.ajax").on(
				"click",
				function() {
					//console.log(this.href.substring(this.href.indexOf("#") + 1, this.href.length));
					let href = this.href.substring(this.href.indexOf("#") + 1,
							this.href.length);
					console.log($("#search").val());
					findResourceList(href + "&resourceName="
							+ $("#search").val());
					/* $("#search").val(""); */
				});
	}

	//资源搜索查询
	function find() {
		let url = "findResourceList.action?resourceName=" + $("#search").val()+"&type="+$("#type").val();
		findResourceList(url);
	}

	//资源删除
	function deleteOne(id) {
		$.ajax({
			url : "deleteResource.action",
			type : "post",
			data : JSON.stringify({
				rId : id
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
	
	//资源详情
	function detailes(Id){
		$.ajax({
			url : "ResourceDetails.action",
			type : "post",
			data : JSON.stringify({
				rId : Id
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				var rName=data.rName;
				var lLableName=data.lable.lLableName;
				var cAccount=data.customer.cAccount;
				var rCreatetime=data.rCreatetime;
				var rHot=data.rHot;
				var rPass=data.rPass;
				var rContent=data.rContent;
				var rUrl=data.rUrl;
				if(rHot == 1){
					rHot="热门";
				}else{
					rHot="冷门";
				}
				if(rPass == 1){
					rPass="已通过";
				}else{
					rPass="未通过";
				}
				
				$("#rName").html(rName);
				$("#Lable").html(lLableName);
				$("#cAccount").html(cAccount);
				$("#rCreatetime").html(rCreatetime);
				$("#rHot").html(rHot);
				$("#rPass").html(rPass);
				$("#rContent").html(rContent);
				$("#rUrl").attr("href",rUrl);
				$("#rUrl").attr("download",rName);
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
</html>
