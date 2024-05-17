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
<script type="text/javascript">	
	function unameValid(){
		var uname = document.getElementById("uname").value;
		var regUname = /^[a-zA-Z][\w]{2,20}$/;	
		var unameAlert = document.getElementById("unameAlert");
		if(regUname.test(uname)==false){			
			unameAlert.innerHTML="用户名应为3~20个字符";
			return false;
		}else{
			unameAlert.innerHTML="";
		}	
		$.ajax({
			   type: "POST",
			   url: "<%=basePath%>app/unameValid",
			   data: "uname=" + uname,
			   success: function(msg){
			       if(msg == 0){
			    	   unameAlert.innerHTML = "用户名不能为空";
			       }else if(msg == 1){
			    	   unameAlert.innerHTML = "用户名已存在，不能使用";
			       }else if(msg == 2){
			    	   unameAlert.innerHTML = "用户名可用";
			       }else {
			    	   unameAlert.innerHTML = "网络异常...";
			       }
			   }
			});
	}
	function tijiao(){	
		var uname = document.getElementById("uname").value;
		var pwd = document.getElementById("pwd").value;
		var pwd2 = document.getElementById("pwd2").value;
		var regPwd = /^\w{3,10}$/;
		var pwdAlert = document.getElementById("pwdAlert");
		if(regPwd.test(pwd) == false){
			pwdAlert.innerHTML="密码应为3~10个字符";
			return false;
		}else{
			pwdAlert.innerHTML="";
		}
		if(pwd != pwd2){
			alert("密码和密码确认不一致")
			return false;
		}
		var myform = document.getElementById("myform");
		myform.submit();		
	}
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="content">
		<div align="center">
		<form action="<%=basePath%>app/regist" method="post" id="myform">
			<table>			
			<tr><td>用户名</td><td><input type="text" name="uname" id="uname" onkeyup="unameValid()">
			       <span id="unameAlert" style="color:red;font-size:8px;"></span>
			     </td>
			</tr>
			<tr><td>密码</td><td><input type="password" id="pwd" name="pwd">
				 <span id="pwdAlert" style="color:red;font-size:8px;"></span>
				</td>
			</tr>
			<tr><td>密码确认</td><td><input type="password" id="pwd2"></td></tr>		
			<tr><td>电话</td><td><input type="text" id="tel" name="tel"></td>
			</tr>	
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="提交" onclick="tijiao()">	 &nbsp;
					<span id="msg" style="font-size: 8px; color: red;">${msg}</span>
				</td>
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
