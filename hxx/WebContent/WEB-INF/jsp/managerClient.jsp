<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<script src="${pageContext.request.contextPath}/scrip/managerClientScrip.js"></script>
<script src="${pageContext.request.contextPath}/scrip/findPassword.js"></script>
<title>后台登录</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style-responsive.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	<div id="login-page">
		<div class="container">

			<form class="form-login" onsubmit="return client()" action="managerClient.action">
				<h2 class="form-login-heading">管理员登录</h2>
				<div class="login-wrap">
					<input type="text" class="form-control" placeholder="账号" autofocus
						onblur="accounting()" id="account" name="uAccount"> <span
						id="accountInfo"></span> <br> <input type="password"
						class="form-control" placeholder="密码" onblur="passwording()"
						id="password" name="uPassword"> <span id="passwordInfo"></span>
						<div>${msg }</div>
					<label class="checkbox"> <span class="pull-right"> <a
							data-toggle="modal" href="managerClient.jsp#myModal"> 忘记密码?</a>
					</span>
					</label> <input class="btn btn-theme btn-block" type="submit" value="登录">
					<hr>

					<div class="login-social-link centered">
						<div class="registration">制作团队---->♂幻想乡♂</div>

					</div>
				</div>
				<!-- Modal -->
				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
					tabindex="-1" id="myModal" class="modal fade" >
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title">忘记密码?</h4>
							</div>
							<div class="modal-body">
								<p>请填写相关信息</p>
								<input type="text" placeholder="账号"
									class="form-control placeholder-no-fix" onblur="toaccounting()"
									id="toaccount" ><span id="toaccountInfo"></span> <br>
								<input type="text" placeholder="真实姓名"
									class="form-control placeholder-no-fix" onblur="torealnameing()"
									id="torealname" ><span id="torealnameInfo"></span> <br>
								<input type="text" placeholder="联系号码"
									class="form-control placeholder-no-fix" onblur="tophoneing()"
									id="tophone" ><span id="tophoneInfo"></span> <br> 
								<input type="password" placeholder="身份证"
									class="form-control placeholder-no-fix" onblur="toidnumbering()"
									id="toidnumber" ><span id="toidnumberInfo"></span> <br>
							</div>
							<div class="modal-footer">
								<button class="btn btn-theme" type="button"
									onclick="tofind()">提交</button>
								<button data-dismiss="modal" class="btn btn-default"
									type="button">取消</button>
							</div>
						</div>
					</div>
				</div>
				<!-- modal -->

			</form>

		</div>
	</div>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	<!--BACKSTRETCH-->
	<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/jquery.backstretch.min.js"></script>
	<script>
		$.backstretch("assets/img/login-bg.jpg", {
			speed : 500
		});
	</script>
</html>