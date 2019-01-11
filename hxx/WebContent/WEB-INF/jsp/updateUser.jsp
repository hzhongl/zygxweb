<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="">
<link href="${pageContext.request.contextPath }/jspcss/addUser.css"
	type="text/css" rel="stylesheet" />
<title>客户查询</title>
<style type="text/css">
table tr td input {
	border: 0px;
}
</style>

<body>
	<fieldset>
		<legend>修改个人信息</legend>
		
			<input type="hidden" value="${user.uId }" id="id">
			<div class="form-group has-success">
				<label class="control-label">账号</label> <input type="text"
					class="form-control" id="account" onblur="accounting()"
					readonly="readonly" value="${user.uAccount }"> <span
					id="accountInfo" class="help-block"></span>
			</div>
			<form id="adduser">
			<div class="form-group has-success">
				<label class="control-label">密码</label> <input type="password"
					class="form-control" id="password" onblur="passwording()"
					value="${user.uPassword }"> <span id="passwordInfo"
					class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<label class="control-label">真实姓名</label> <input type="text"
					class="form-control" id="realname" onblur="realnameing()"
					value="${user.uRealName }"> <span id="realnameInfo"
					class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<label class="control-label">年龄</label> <input type="text"
					class="form-control" id="age" onblur="ageing()"
					value="${user.uAge }"> <span id="ageInfo"
					class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<label class="control-label">联系号码</label> <input type="text"
					class="form-control" id="phone" onblur="phoneing()"
					value="${user.uPhone }"> <span id="phoneInfo"
					class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<label class="control-label">身份证号码</label> <input type="text"
					class="form-control" id="idnumber" onblur="idnumbering()"
					value="${user.uIdNumber }"> <span id="idnumberInfo"
					class="help-block"></span>
			</div>
			<div class="form-group has-success">
				<label class="control-label">电子邮箱</label> <input type="text"
					class="form-control" id="email" onblur="emailing()"
					value="${user.uEmail }"> <span id="emailInfo"
					class="help-block"></span>
			</div>
			<div class="button">
				<input type="button" value="提交" class="btn btn-success"
					onclick="return update()"> <input type="reset" value="重置"
					class="btn btn-primary">
			</div>
		</form>

	</fieldset>
</body>

<script src="/hxx/scrip/updateUser.js"></script>
<script type="text/javascript">
	function update() {
		if (passwording() == true && ageing() == true && realnameing() == true
				&& phoneing() == true && idnumbering() == true
				&& emailing() == true) {
			var id = $("#id").val();
			var account = $("#account").val();
			var password = $("#password").val();
			var age = $("#age").val();
			var realname = $("#realname").val();
			var phone = $("#phone").val();
			var idnumber = $("#idnumber").val();
			var email = $("#email").val();
			$.ajax({
				url : "updateUser.action",
				type : "post",
				data : JSON.stringify({
					uId : id,
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
				success : function() {
					alert(" 修改成功！需要重新登录");
					window.location.replace("outmanagerClient.action");

				},
				error : function() {
					alert("修改失败");
				}
			});
		} else {
			alert("请填写完整的个人信息");
			return false;
		}
	}
</script>
</html>