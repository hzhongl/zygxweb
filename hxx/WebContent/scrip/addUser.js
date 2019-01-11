/**
 * 管理员登录页面脚本
 * @returns
 */

//账号
function accounting(){
	var bln=/[a-zA-Z0-9_]{4,15}$/;
	var account=$("#account").val();
	$("#accountInfo")[0].innerHTML="";
	if(account.match(bln)){
//		cheekAccount();
		return true;
	}else{
		$("#accountInfo")[0].innerHTML="请输入4~15位数字或字母";
		return false;
	}
}

//验证账号是否被使用
function cheekAccount(){
	$.ajax({
		url : "findAccount.action",
		type : "post", 
		data :JSON.stringify({uAccount:account}),
		contentType : "application/json;charset=UTF-8",
		dataType : "text",
		success : function(data){								
			$("#accountInfo")[0].innerHTML="账号可以使用";
			return true;
		},
		error : function(data) {
			$("#accountInfo")[0].innerHTML="账号以被注册";
			return false;
		}			
	});
}

//密码
function passwording(){
	var bln=/[a-zA-Z0-9_]{6,18}$/;
	$("#passwordInfo")[0].innerHTML="";
	var password=$("#password").val();
	if(password.match(bln)){
		$("#passwordInfo")[0].innerHTML="";
		return true;
	}else{
		$("#passwordInfo")[0].innerHTML="请输入6~18位数字或字母";
		return false;
	}
}

//确认密码
function repasswording(){
	var password=$("#password").val();
	var repassword=$("#repassword").val();
	if(repassword == password){
		$("#repasswordInfo")[0].innerHTML="";
		return false;
	}else{
		$("#repasswordInfo")[0].innerHTML="密码不一致";
		return true;
	}
}

//真实姓名
function realnameing(){
	var bln=/[\u4e00-\u9fa5]{2,}$/;
	var realname=$("#realname").val();
	if(realname.match(bln)){
		$("#realnameInfo")[0].innerHTML="";
		return true;
	}else{
		$("#realnameInfo")[0].innerHTML="请输入真实姓名";
		return false;
	}
}

//年龄
function ageing(){
	var bln=/\d/;
	var age=$("#age").val();
	if(age.match(bln) && age.length<4){
		$("#ageInfo")[0].innerHTML="";
		return true;
	}else{
		$("#ageInfo")[0].innerHTML="请输入正确年龄";
		return false;
	}
}

//电话
function phoneing(){
	var bln=/(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
	var phone=$("#phone").val();
	if(phone.match(bln)){
		$("#phoneInfo")[0].innerHTML="";
		return true;
	}else{
		$("#phoneInfo")[0].innerHTML="请输入正确电话号码";
		return false;
	}
}

//身份证
function idnumbering(){
	var bln=/^\d{15}|\d{18}/;
	var idnumber=$("#idnumber").val();
	if(idnumber.match(bln)){
		$("#idnumberInfo")[0].innerHTML="";
		return true;
	}else{
		$("#idnumberInfo")[0].innerHTML="请输入正确身份证号码";
		return false;
	}
}

//email
function emailing(){
	var bln=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	var email=$("#email").val();
	if(email.match(bln)){
		$("#emailInfo")[0].innerHTML="";
		return true;
	}else{
		$("#emailInfo")[0].innerHTML="请输入正确邮箱号";
		return false;
	}
}


