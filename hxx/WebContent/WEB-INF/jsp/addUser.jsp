<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="${pageContext.request.contextPath }/jspcss/addUser.css" type="text/css" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/bootstrap/js/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增管理员</title>
</head>
<body>
	<fieldset>
		<legend>新增管理员</legend>
		<form id="adduser">
			<div class="form-group has-success">
				<input type="text" class="form-control" id="account"
					onblur="accounting()" placeholder="账号"> <span
					id="accountInfo" class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<!-- <label class="control-label">密码</label>  -->
				<input type="password" class="form-control" id="password"
					onblur="passwording()" placeholder="密码"> <span
					id="passwordInfo" class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<input type="password" class="form-control" id="repassword"
					onblur="repasswording()" placeholder="确认密码"> <span
					id="repasswordInfo" class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<input type="text" class="form-control" id="realname"
					onblur="realnameing()" placeholder="真实姓名"> <span
					id="realnameInfo" class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<input type="text" class="form-control" id="age" onblur="ageing()"
					placeholder="年龄"> <span id="ageInfo" class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<input type="text" class="form-control" id="phone"
					onblur="phoneing()" placeholder="联系电话"> <span
					id="phoneInfo" class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<input type="text" class="form-control" id="idnumber"
					onblur="idnumbering()" placeholder="身份证号"> <span
					id="idnumberInfo" class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<input type="text" class="form-control" id="email"
					onblur="emailing()" placeholder="电子邮箱"> <span
					id="emailInfo" class="help-block"></span>
			</div>
			<div class="button">
				<input type="button" value="添加" class="btn btn-success"
					onclick="return add()"> <input type="reset" value="重置"
					class="btn btn-primary">
			</div>
		</form>

	</fieldset>


</body>
<script src="${pageContext.request.contextPath }/scrip/addUser.js"></script>
<script type="text/javascript">function add() {
	if (accounting() == true && passwording() == true && ageing() == true
			&& realnameing() == true && phoneing() == true
			&& idnumbering() == true && emailing() == true) {
		var account = $("#account").val();
		var password = $("#password").val();
		var age = $("#age").val();
		var realname = $("#realname").val();
		var phone = $("#phone").val();
		var idnumber = $("#idnumber").val();
		var email = $("#email").val();
		$.ajax({
			url : "addUser.action",
			type : "post",
			data : JSON.stringify({
				uAccount : account,
				uPassword : password,
				uPhone : phone,
				uRealName : realname,
				uIdNumber : idnumber,
				uEmail : email,
				uAge : age
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			success : function(data) {
				alert(" 添加成功！");
				$("#account").val() = "";
				$("#password").val() = "";
				$("#age").val() = "";
				$("#realname").val() = "";
				$("#phone").val() = "";
				$("#idnumber").val() = "";
				$("#email").val() = "";
			},
			error : function(data) {
				alert("添加失败");
			}
		});
	} else {
		alert("请填写完信息");
		return false;
	}
}
</script>
	






</html>