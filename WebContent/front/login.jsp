<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 导入EL表达式标签库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/front/css/bootstrap.css">
<title>用户登录</title>
<style>
body {
}
.main {
	/*background-size:100% 100%;*/
	width: 100%;
	height: 600px;
	background-image:url(../front/img/art.jpg);
	background-repeat: repeat-x;
	background-repeat: repeat-y;
}
.footer {
	width: 100%
}
#title1 {
	font-size: 55px;
	font-family: "华文隶书";
	text-align:center;
	padding-top:2%;
}
#head {
	text-align:center;
}
#logo {
	margin-left: 10%;
}
#login{
	width:350px;
	height:380px;
	float:left;
	margin:8%;
	}
th {
	font-size: 18px;
	width: 100px;
	height:30px;
	text-align:right;
}

td {
	font-size: 12px;
	text-align: justify;
	width: 200px;
	height:30px;
}
input{
	height:30px;
	width:200px;
	}
caption{
	font-size: 24px;
	margin-top:10%;
	margin-left:15%;
	
	}
#btLogin {
	position: absolute;
	background-color: #9CF;
	border-radius: 5px 5px 5px 5px;
	width: 200px;
	height: 35px;
	font-size: 18px;
}
#selection{
	width:500px;
	height:400px;
	margin-left:15%;
	margin-top:5%;
	
	float:left;
}
#counselors{
	width:60px;
	height:60px;
	float:left;
	margin-left:52%;
	font-size:24px;
	}
	#reser{
	width:60px;
	height:60px;
	margin-left:15%;
	margin-top:25%;
	}
	#evaluate{
	width:60px;
	height:60px;
	float:right;
	margin-right:3%;
	margin-top:-5%;
	}
	#report{
	width:60px;
	height:60px;
	
	margin-left:15%;
	margin-top:25%;
	}
	#account{
	width:60px;
	height:60px;
	float:right;
	margin-right:23%;
	margin-top:-8%;
	}
</style>
</head>
<body>
<div>
  </div>
  <div class="main">
     <div id="title1">文件分享平台</div>
    <div id="login">
      <form id="form">
        <table>
        <caption>欢迎登陆文件分享平台</caption>
        <tr><th></th></tr>
          <tr>
            <th>用户名:</th>
            <td><input type="text" name="userName" id="userName"></td>
          </tr>
          <tr>
            <th>密&nbsp;&nbsp;&nbsp;码:</th>
            <td><input type="password" name="userPwd" id="userPwd"></td>
          </tr>
       <!--  <tr>
            <th>验证码:</th>
            <td><input type="text" name="check" id="check"></td>
          </tr> -->
        <%--  <tr>
            <th></th>
            <td><img src="${pageContext.request.contextPath}/user/image" id="imgCode" onClick="getCode()">
              </td>
          </tr> --%>
          <tr>
            <th></th>
            <td><input id="btLogin1"  type="button" name="btLogin" value="登录" onCLick="submitForm()"></td>
          </tr>
          <tr>
          <th></th>
          	<td><input id="btLogin2"  type="button" name="btRegister" value="注册" onCLick="toregister()"></td>
           </tr>
        </table>
      </form>
    </div>
  </div>
</body>
<script>
function toregister(){
	window.location.href="${pageContext.request.contextPath}/user/toregister.action"
	/* $.ajax({
		url : "/File/user/toregister",
		data:{
				},
		type : "post",
		success : function(date) {
			//根据后台返回前台的msg给提示信息加HTML
			if (date==1) {
				window.location.href="${pageContext.request.contextPath}/front/register.jsp";
			}
		}
	}); */
};
/* function getCode() {
	var imgCode = document.getElementById("imgCode");
	imgCode.src = "${pageContext.request.contextPath}/user/image?"
			+ Math.random();
} */
function submitForm(){
	var userName=$('#userName').val();
	var userPwd=$('#userPwd').val();
/* 	var check =$('#check').val(); */
	if (userName == null || userName == "") {
		alert("请输入用户名");
		return false;
	};
	if (userPwd == null || userPwd == "") {
		alert("请输入密码");
		return false;
	};
	/* if (check==null||check==""){
		alert("请输入验证码");
		return false;
	}; */
	$.ajax({
		url : "${pageContext.request.contextPath}/user/login.action",
		data : $('#form').serialize(),
		//非表单提交数据 
	//	data:{
	//		"adminName":adminName,
	//		"adminPwd":adminPwd
//	},
		type : "post",
		success : function(date) {
			//根据后台返回前台的msg给提示信息加HTML
			if (date==1) {
				alert("登录成功");
				window.location.href="${pageContext.request.contextPath}/front/main.jsp";
			} else if(date==2){
				window.alert("该账户已被禁用");
			} else {
				window.alert("登录失败，请输入正确的登录信息")
			}
		}
	});
	}
</script>
</html>
