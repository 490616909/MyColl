<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div style="width:200px" align="center" >
<form action="/File/user/file_upload" method="post" enctype="multipart/form-data">
<s:file name="upload"></s:file>
<input type="text" name="transfer.transName" class="form-control" placeholder="请输入文件名">
<input type="text" name="transfer.transScore" class="form-control" placeholder="请输入下载积分">
<s:submit value="上传"></s:submit>
</form>
</div>
</body>
</html>