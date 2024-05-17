<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>图书详情页</title>
<link rel="stylesheet" href="<%=basePath%>css/reset.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jQueryUI/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>jQueryUI/jquery-ui.theme.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/HeaAndFoo.css" />
<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bookDetail.js"></script>
<style>
.content_L {
	float: left;
	width: 330px;
	height: 500px;
	position: relative;
}

.smallImg {
	width: 310px;
	height: 70px;
	padding: 10px;
	float: left;
}

.smallImg li {
	width: 70px;
}

.smallImg li img {
	width: 70px;
}

#bigImg {
	width: 330px;
	height: 330px;
	position: relative;
	float: left;
	z-index: 100;
}

#bigImg img {
	width: 100%;
	height: 100%;
}

.scBtn {
	display: block;
	width: 80px;
	height: 20px;
	margin-top: 30px;
	text-align: right;
	float: left;
}

#largeImg {
	width: 330px;
	height: 330px;
	position: relative;
	overflow: hidden;
	position: absolute;
	top: 0px;
	left: 300px;
}

#fdj {
	display: none;
	width: 165px;
	height: 165px;
	background-color: #CCC;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	opacity: 0.5;
	z-index: 101;
	position: absolute;
	top: 0px;
	left: 0px;
}

#imgB {
	display: block;
	position: absolute;
}

.content_C {
	float: left;
	width: 630px;
	height: 500px;
	padding-left: 20px;
	color: #666666;
}

.content_C h2 {
	margin: 20px 0px;
}

.content_C p {
	margin: 15px 0px;
}

.bkPresent {
	width: 500px;
	height: 80px;
}

.blue {
	color: #1A66B3;
}

.price {
	font-size: 18px;
	color: red;
	font-weight: bold;
}

.addBtn {
	width: 120px;
	height: 40px;
	background-color: #FF2832;
	color: #fff;
	font-weight: bold;
	border: none;
	font-size: 18px;
	border-radius: 4px;
}
</style>
<script type="text/javascript">       
   function tijiao(){	   
	  var span =  document.getElementById("msg");	   
	  var uname =  document.getElementById("uname").value;
	  if(uname == ""){
		span.innerHTML = "用户名不能为空!";
		return;
	  }
	  var pwd =  document.getElementById("pwd").value;
	  if(pwd == ""){
		  span.innerHTML = "密码不能为空!";
		  return;
	  }
	  var myform = document.getElementById("myform");
	  //myform.submit();
	  $.ajax({
		   type: "POST",
		   url: "<%=basePath%>app/login",
		   data: "uname=" + uname + "&pwd=" + pwd,
		   success: function(msg){
		       if(msg == "0"){
		    	   span.innerHTML = "用户名或密码输入错误，请重新输入...";
		       }else if(msg == "1"){
		    	   document.location.href = "<%=basePath%>app/main";
		       }else{
		    	   span.innerHTML = "网络异常，请和管理员联系...";
		       }
		   }
		}); 
   }
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="content">
		<div align="center">
			<form action="<%=basePath%>app/login" method="post" 	id="myform">
				<table>
					<tr height="30"></tr>
					<tr>
						<td>用户名</td>
						<td><input type="text" name="uname" id="uname"></td>
					</tr>
					<tr height=20></tr>
					<tr>
						<td>密码</td>
						<td><input type="password" name="pwd" id="pwd"></td>
					</tr>
					<tr height=10></tr>
					<tr >
						<td align="center" colspan="2"><input type="button"
							onclick="tijiao()" value="提 交">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><span id="msg"
							style="font-size: 8px; color: red;">${msg}</span> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
