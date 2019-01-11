/**
 * 管理员修改个人信息脚本
 * @returns
 */


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

