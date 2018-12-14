<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/front/css/bootstrap.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">用户注册</h1>
	<form id="form">
		<table border="1" style="width:50%" align="center" class="table table-striped table-hover table-bordered">
			<tr>
				<td>
				 <label for="exampleInputEmail2">用户名：</label>
				</td>
   				<td>
   				<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名">
				<span id="userCheck"></span>
				</td>
			</tr>
			<tr>
				<td>
				 <label for="exampleInputEmail2">密码：</label>
				</td>
   				<td>
   				<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="请输入密码">
				<span></span>
				</td>
			</tr>
			<tr>
				<td>
				 <label for="exampleInputEmail2">确认密码：</label>
				</td>
   				<td>
   				<input type="password" class="form-control" id="userPwd2" name="userPwd2" placeholder="请确认密码">
				<span></span>
				</td>
			</tr>
			<tr>
				<th>性别:</th>
				<td><select id="userSex" name="userSex" class="form-control">
						<option value="男" selected>男</option>
						<option value="女">女</option>
				</select></td>
			</tr>
			<tr>
				<th>
				 <label for="exampleInputEmail2">学历：</label>
				</th>
				<td><select name="userMajor" class="form-control">
				<c:if test="${not empty study}">
				<c:forEach items="${study}" var="study">
				<option value="${study.studyName}">${study.studyName}</option>
				</c:forEach></c:if>
				</select>
				</td>
			</tr>
			<tr>
				<th>
				 <label for="exampleInputEmail2">工作：</label>
				</th>
   				<td><select id="userJob" name="userJob" class="form-control">
						<option value="0" selected>请选择</option>
						<option value="学生">学生</option>
						<option value="服务员">服务员</option>
						<option value="清洁工">清洁工</option>
						<option value="扫地工">扫地工</option>
						<option value="快递员">快递员</option>
				</select></td>
			</tr>
			<tr>
				<td>
				 <label for="exampleInputEmail2">手机号：</label>
				</td>
   				<td>
   				<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="请输入手机号">
				<span></span>
				</td>
			</tr>
			<tr>
				<td>
				 <label for="exampleInputEmail2">E-mail：</label>
				</td>
   				<td>
   				<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="请输入电子邮件">
				<span></span>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
				<input class="btn btn-primary" type="button" value="保存" style="width: 150px" onclick="register()"> 
				<input class="btn btn-primary" type="button" value="返回" style="width: 150px" onclick="back()">
				</td>
			</tr>
		</table>
		<br>
	</form>
</body>
<script type="text/javascript">
var result=false;
function back(){
	window.location.href="${pageContext.request.contextPath}/front/login.jsp";
}
function register(){
	var userName=$('#userName').val();
	var userPwd=$('#userPwd').val();
	var check =$('#check').val();
	var userPwd2=$("#userPwd2").val();
	var userMajor=$('#userMajor').val();
	var userJob=$('#userJob').val();
	var re = /^[0-9]+.?[0-9]*$/;
	var userPhone=$("#userPhone").val();
	var userEmail=$('#userEmail').val();
	if (userName == null || userName == "") {
		alert("请输入用户名");
		return false;
	};
	if (userPwd == null || userPwd == "") {
		alert("请输入密码");
		return false;
	};
	if(userPwd2!=userPwd){
		alert("两次密码不一致");
		return false;
	};
	if(userMajor==0){
		alert("请选择学历");
		return false;
	}
	if(userJob==0){
		alert("请选择工作");
		return false;
	}	
	if(userPhone==null||userPhone==""){
		alert("请输入您的手机号");
		return false;
	}else if(userPhone.length!=11){
		alert("请输入11位手机号");
		return false;
	}else if(!re.test(userPhone)){
		alert('手机号只能为数字');
		return false;
	}
	if(userEmail==null||userEmail==""){
		alert("请输入电子邮箱");
		return false;
	}
	$.ajax({
		url : "${pageContext.request.contextPath}/user/register.action",
		data : $('#form').serialize(),
		type : "post",
		success : function(date) {
			console.log(date);
			//根据后台返回前台的msg给提示信息加HTML
			if (date==1) {
				window.alert("注册成功");
				window.location.href="${pageContext.request.contextPath}/front/login.jsp";
			} else {
				window.alert("注册失败")
			}
		}
	});
	
	
		};
		function check(){
			var userName=$('#userName').val();
			if(userName==null||userName==''){
				console.log(userName)
				$("#userCheck").text("用户名不能为空");
				result=false;
				return;
			}
			$.ajax({
				async:false,
				type : "post",
				url : "/File/user/namecheck",
				data : {
						"userName" : userName,
						},
				success : function(data) {
				if (data ==1) {
						$("#userCheck").text("用户名可用");
						result=true;
				} else {
						$("#userCheck").text("用户名已存在，请重新输入");
						result=false;
				}
					}
						});
						return result;
		}
$("#userName").blur(
		function(){
	var che=check();
		});

</script>
</html>