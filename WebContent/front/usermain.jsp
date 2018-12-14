<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/front/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/front/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/front/css/bootstrap.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/front/css/userMain.css">

    <title>用户界面</title>
</head>
<body class="body">
<div class="main" style="width: 70%;margin:0 auto;">
    <div style="height:50px"></div>
    <div class="top">
        <p class="bg-success">欢迎~~${sessionScope.user.userName}</p>
        <a href="${pageContext.request.contextPath}/user/translist.action" target="maincontent"><input id="reserve" type="button" value="文件列表" class="btn btn-primary"></a>
        <a href="${pageContext.request.contextPath}/UserServlet?method=userreport" target="maincontent"><input id="document" type="button" value="我的报告" class="btn btn-primary"></a>
        <a href="${pageContext.request.contextPath}/UserServlet?method=testonline" target="maincontent"><input id="upload" type="button" value="在线评估" class="btn btn-primary"></a>
        <a href="${pageContext.request.contextPath}/UserServlet?method=adminlist" target="maincontent"><input id="score" type="button" value="咨询师库" class="btn btn-primary"></a>
        <a href="${pageContext.request.contextPath}/UserServlet?method=mybill" target="maincontent"><input id="logoutUser" type="button" value="我的账户" class="btn btn-primary"></a>
    </div>
</div>
</body>
<script>

</script>
</html>