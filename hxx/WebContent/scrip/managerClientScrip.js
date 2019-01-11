/**
 * 管理员登录页面脚本
 * @returns
 */

//账号
function accounting(){
	var bln=/[a-zA-Z0-9_]{4,15}$/;
	var account=$("#account").val();
	$("#accountInfo")[0].innerHTML="";
	if(!account.match(bln)){
		$("#accountInfo")[0].innerHTML="账号长度为4~15位的数字或字母";
		return false;
		}else{
			$("#accountInfo")[0].innerHTML="";
			return true;
		}
}

//密码
function passwording(){
	var bln=/[a-zA-Z0-9_]{6,18}$/;
	$("#passwordInfo")[0].innerHTML="";
	var password=$("#password").val();
	if(!password.match(bln)){
		$("#passwordInfo")[0].innerHTML="密码长度为6~18位的数字或字母";
		return false;
	}else{
		$("#passwordInfo")[0].innerHTML="";
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

//登录
function client(){
	var account=$("#account").val();
	var password=$("#password").val();
	
	if(accounting()==true && passwording()==true){
		return true;
	}else{
		return false;
		alert("账号密码不能为空");
	}
}















