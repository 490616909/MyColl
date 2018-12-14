<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 导入EL表达式标签库 -->
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
<title></title>
</head>
<body>
<h1 align="center">文件列表</h1>
<form id="form" class="form-inline">
<input id="num" name="num" value="1" type="hidden">
<div align="center">
    <input type="text" class="form-control" name="transName" id="transName" placeholder="请输入文档名">
	<input type="button" value="查询" onclick="search()" class="btn btn-success">  
</div>
<div align="center">
<h3>积分:${sessionScope.user.userScore} 
<a href="#">个人信息</a> 
<a href="${pageContext.request.contextPath}/front/upload.jsp">我要上传</a>
<a href="/File/user/file_download">我要下载</a>
</h3>
</div>
<table border="1" width="100%" align="center" class="table table-striped table-hover table-bordered">
<thead>		
	<tr>
	<th>文档标题</th>
	<th>上传人</th>
	<th>上传时间</th>
	<th>下载积分</th>
	<th>文档类型</th>
	<th>下载次数</th>
	</tr>
</thead>
<tbody id="transbody">
	<c:if test="${not empty pages}">
				<c:forEach items="${pages.records}" var="trans">
					<tr>
						<td>${trans.transName}</td>
						<td>${trans.transUser}</td>
						<td>${trans.uploadTime}</td>
						<td>${trans.transScore}</td>
						<td>${trans.transType}</td>
						<td>${trans.transNo}</td>
					</tr>
				</c:forEach>
			</c:if>
</tbody>
</table>
<div align="center" id="recode">
		共有${pages.totalRecordsNum}条记录
		当前第${pages.currentPageNum}页/共${pages.totalPageNum}页 
		 <input class="btn btn-primary" type='button' value='首页' onclick=search(1)>
		 <input class="btn btn-primary" type='button' value='上一页' onclick="search(${pages.prevPageNum})">
		 <input class="btn btn-primary" type='button' value='下一页' onclick="search(${pages.nextPageNum})"> 
		 <input class="btn btn-primary" type='button' value='尾页' onclick="search(${pages.totalPageNum})">		
	</div>
</form>
</body>
<script type="text/javascript">
function search(num){
	if(num!=null){
	$('#num').val(num);
	}
	console.log(num);
	$.ajax({
		url:"${pageContext.request.contextPath}/user/transsearch.action",
		data : $('#form').serialize(),
		type: "post",
		dataType:"json",
		success : function(data){
			console.log(data)
			if(data.records.length>0){
				$('#transbody').html(null);
				var str="";
				for(var i=0;i<data.records.length;i++){
				str+=
				"<tr>"+
				"<td>"+data.records[i].transName+"</td>"+
				"<td>"+data.records[i].transUser+"</td>"+
				"<td>"+data.records[i].uploadTime+"</td>"+
				"<td>"+data.records[i].transScore+"</td>"+
				"<td>"+data.records[i].transType+"</td>"+
				"<td>"+data.records[i].transNo+"</td>"+
				"</td>"+
				"</tr>";
				$('#transbody').html(str)
				} 
				}else{
					$('#transbody').html(null);
					var str="";
					str+=
						"<td colspan='7' align='center'>"+"查无记录"+"</td>"
					$('#transbody').html(str);
				}
				$('#recode').html(null);
				$('#recode').html("共有"+data.totalRecordsNum+"条记录"+
						"当前第"+data.currentPageNum+"页/共"+data.totalPageNum+"页"+
						"<input class='btn btn-primary' type='button' value='首页'  onclick=search(1)>"+
						"<input class='btn btn-primary' type='button' value='上一页'  onclick=search("+data.prevPageNum+")>"+
						"<input class='btn btn-primary' type='button' value='下一页'   onclick=search("+data.nextPageNum+")>"+
						"<input class='btn btn-primary' type='button' value='尾页' onclick=search("+data.totalPageNum+")>")
		}
	});
};
</script>
</html>