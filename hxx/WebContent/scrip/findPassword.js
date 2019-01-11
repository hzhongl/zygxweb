/**
 * 管理员登录页面脚本
 * @returns
 */
//账号
function toaccounting(){
	var bln=/[a-zA-Z0-9_]{4,15}$/;
	var toaccount=$("#toaccount").val();
	$("#toaccountInfo")[0].innerHTML="";
	if(toaccount.length<6 || toaccount.length>18){
		$("#toaccountInfo")[0].innerHTML="账号长度为4~15位";
		return false;
	}else{
	if(!toaccount.match(bln)){
		$("#toaccountInfo")[0].innerHTML="请输入数字或字母";
		return false;
		}else{
			$("#toaccountInfo")[0].innerHTML="";
			return true;
		}
	}
	
}

//真实姓名
function torealnameing(){
	var bln=/[\u4e00-\u9fa5]{2,}$/;
	var torealname=$("#torealname").val();
	if(torealname.match(bln)){
		$("#torealnameInfo")[0].innerHTML="";
		return true;
	}else{
		$("#torealnameInfo")[0].innerHTML="请输入真实姓名";
		return false;
	}
}

//电话
function tophoneing(){
	var bln=/(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
	var tophone=$("#tophone").val();
	if(tophone.match(bln)){
		$("#tophoneInfo")[0].innerHTML="";
		return true;
	}else{
		$("#tophoneInfo")[0].innerHTML="请输入正确电话号码";
		return false;
	}
}

//身份证
function toidnumbering(){
	var bln=/^\d{15}|\d{18}/;
	var toidnumber=$("#toidnumber").val();
	if(toidnumber.match(bln)){
		$("#toidnumberInfo")[0].innerHTML="";
		return true;
	}else{
		$("#toidnumberInfo")[0].innerHTML="请输入正确身份证号码";
		return false;
	}
}

//忘记密码
function tofind(){
	if(toaccounting()==true && torealnameing()==true && tophoneing()==true && toidnumbering()==true){
		var toaccount=$("#toaccount").val();
		var torealname=$("#torealname").val();
		var tophone=$("#tophone").val();
		var toidnumber=$("#toidnumber").val();
		
		$.ajax({
			url : "findPassword.action",
			type : "post", 
			data :JSON.stringify({uAccount:toaccount,uRealName:torealname,
				uPhone:tophone,uIdNumber:toidnumber}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data){								
					alert(" 查询成功："+data.userPassword);
			},
			error : function(data) {
				alert("查询失败，请输入正确信息");
			}	
		});
	}
}














