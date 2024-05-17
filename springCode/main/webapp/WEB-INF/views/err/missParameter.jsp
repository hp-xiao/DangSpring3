<%@ page language="java" contentType="text/html"   pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		 ${msg} <br>
		<a href="<%=basePath%>app/main">返回主页</a>	
</body>
</html>