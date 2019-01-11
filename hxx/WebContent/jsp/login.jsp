<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>登录</title>
		<link type="text/css" rel="stylesheet" href="css/login.css">
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/asyncbox.css">
<link type="text/css" rel="stylesheet" href="css/front.css">


		<script type="text/javascript" src="css/jquery-1.js"></script>
<script type="text/javascript" src="css/utils.js"></script>
<script type="text/javascript" src="css/AsyncBox.js"></script>
<script type="text/javascript" src="css/common.js"></script>


	</head>
<body class="body-login">
<div class="loginbj">
<div class="wrapper">
	<div class="m-login ">
			<form method="post" action="login.action" name="aform" id="aform">
				<input name="furl" value="" type="hidden">
			<div class="m-from">
				<div class="item item-custips">
					<span class="form-tips form-tips-error"></span>
				</div>
				<div class="item">
					<div class="m-ipt-txt">
					<font color="red">
					<span id="message">${msg}</span>
					</font>
						<input class="ipt-txt ipt-txt-mail" id="Account" placeholder="账号" name="cAccount" maxlength="50" type="text">
					</div>
				</div>
				<div class="item">
					<div class="m-ipt-txt">
						<input class="ipt-txt ipt-txt-pwd" id="Pwd"  placeholder="密码" name="cPassword" maxlength="30" type="password">
					</div>
				</div>
				<div class="item item-submit">
					<input class="btn_blueA"  type="submit"  value="登录">
					<span class="form-tips">没有账号？<a href="toAddCustomer.action">立即注册</a></span>
				
				</div>
			</div>
			</form>
		
	</div>
</div>
</div>
<!--云滚动-->
<div id="demo" class="cloud-pic">
<table cellspace="0" align="left" border="0" cellpadding="0"><tbody><tr><td id="demo1" valign="top"><img src="css/cloud-bj.png"><img src="css/cloud-bj.png"></td><td id="demo2" valign="top"><img src="css/cloud-bj.png"><img src="css/cloud-bj.png"></td></tr></tbody></table></div>
<script>
  var speed=60
  demo2.innerHTML=demo1.innerHTML
  function Marquee(){
  if(demo2.offsetWidth-demo.scrollLeft<=0)
  demo.scrollLeft-=demo1.offsetWidth
  else{
  demo.scrollLeft++
  }
  }
  var MyMar=setInterval(Marquee,speed)
  demo.onmouseover=function() {clearInterval(MyMar)}
  demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
  </script>
  <!--云滚动-->
<script>
	//交互demo
	$(".m-ipt-txt").bind({
		click:function(){
			var _this = $(this),
			ipt_txt = _this.find(".ipt-txt"),
			ipt_tips = _this.find(".ipt-tips");
			$(".form-tips-error").html("");
			
			ipt_tips.hide();
			ipt_txt.focus();
			ipt_txt.bind({
				blur:function(w){
					if($(this).val() == ""){
						ipt_tips.show();
					}
					$(this).unbind("blur");
				}
			});
		}
	});


</script>

<div id="asyncbox_cover" unselectable="on" style="opacity:0.9;filter:alpha(opacity=90);background:#333">
</div>
<div id="asyncbox_clone">
</div><div id="asyncbox_focus">
</div><div id="asyncbox_load">
<div>
<span>
</span>
</div>
</div>
</body>
</html>