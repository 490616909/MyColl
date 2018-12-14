<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 导入EL表达式标签库 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery.min.js"></script>
<!DOCTYPE html>
<meta charset="utf-8" />
	<title>用户登录</title>
	<frameset rows="20%,*">
		<frame frameborder="0" noresize="noresize" src="${pageContext.request.contextPath}/front/usermain.jsp">
		<frame frameborder="0"  name="maincontent" src="${pageContext.request.contextPath}/front/maindown.jsp">
	</frameset>
</html>