<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="jakarta.tags.core"%>
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
<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.min.css" />
<link rel="stylesheet" 	href="<%=basePath%>jQueryUI/jquery-ui.theme.min.css" />
<link rel="stylesheet" type="text/css" 	href="<%=basePath%>css/HeaAndFoo.css" />

<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bookDetail.js"></script>

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/themes/icon.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
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
<script>
    function isbnValid(){
    	var span = document.getElementById("msg");
    	span.innerHTML = "";        //清除历史信息    
    	var isbn = document.getElementById("isbn").value;
    	var reg =/^\w{13}$/;
    	if(reg.test(isbn) == false){    		
    		span.innerHTML = "isbn必须为13位";    
    		return;
    	}
    	//校验isbn是否可用
    	$.ajax({
  		   type: "POST",
  		   url: "<%=basePath%>app/validISBN",
  		   data: "isbn=" + isbn,
  		   success: function(msg){
  		       if(msg == "0"){
  		    	   span.innerHTML = "isbn可以使用...";
  		       }else if(msg == "1"){
  		    	   span.innerHTML = "isbn库中已存在，请修改...";
  		       }else{
  		    	   span.innerHTML = "网络异常，请和管理员联系...";
  		       }
  		   }
  		});     	
    }
    function tijiao(){
    	var span = document.getElementById("msg");
    	span.innerHTML = "";        //清除历史信息    
    	var isbn = document.getElementById("isbn").value;
    	var reg =/^\w{13}$/;
    	if(reg.test(isbn) == false){    		
    		span.innerHTML = "isbn必须为13位";    
    		return;
    	}
    	var bkname = document.getElementById("bkname").value;
    	if(bkname==""){
    		span.innerHTML = "书名不能为空...";    
    		return;
    	}
    	var price = document.getElementById("price").value;
    	var reg =/^\d{1,5}.\d$/;
    	if(reg.test(price) == false){    		
    		span.innerHTML = "价格参考格式76.5";    
    		return;
    	}   	
    	var myform = document.getElementById("myform");
  	    myform.submit();    	
    }
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="../jsp/header.jsp"></jsp:include>
	</div>

	<div class="content">
		<table align="center">			
			<tr>
				<td align="center"><h2>新书上架</h2></td>
			</tr>
			<tr>
				<td>
					<form action="<%=basePath%>app/back/bookadd" method="post" enctype="multipart/form-data"  id="myform">
						<table>
							<tr>
								<td>目录</td>
								<td><select name="cid">
										<c:forEach var="ca" items="${caList}">
										  <option value="${ca.cid}">${ca.cname}</option>
										</c:forEach>										
								</select></td>

							</tr>
							<tr>
								<td>书号ISBN</td>
								<td><input type="text" name="isbn" id="isbn" onkeyup="isbnValid()"></td>
							</tr>
							<tr>
								<td>书名</td>
								<td><input type="text" name="bname" id="bkname" /><span id="NameNull"></span></td>
							</tr>
							<tr>
								<td>作者</td>
								<td><input type="text" name="author" /></td>
							</tr>
							<tr>
								<td>出版社</td>
								<td><input type="text" name="press" /></td>
							</tr>
							<tr>
								<td>出版日期</td>
								<td><input  name="pdate" class="easyui-datebox" />								 
								</td>
							</tr>
							<tr>
								<td>价格</td>
								<td>
								   <input class="easyui-numberbox" name="price" precision="1" value="0.0" id="price"></input>
								   
								</td>
							</tr>
							<tr>
								<td>封面上传</td>
								<td><input type="file" name="fpic" /></td>
							</tr>
							<tr>
								<td colspan=2 align=center>
									<input type="button" value="提交" onclick="tijiao()"/>
								</td>
							</tr>
							<tr><td colspan="2" align="center">
							<span id="msg" style="font-size:8px;color:red;">${msg}</span> 
							</td></tr>
						</table>
					</form>
				</td>
			</tr>
		</table>

	</div>
	<div class="footer">
		<jsp:include page="../jsp/footer.jsp"></jsp:include>
	</div>
</body>
</html>
