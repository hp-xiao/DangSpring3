<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<base href="<%=basePath%>">
		<title>购物车</title>		
		<link rel="stylesheet" href="<%=basePath%>css/reset.css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery.min.js" ></script>
		<script type="text/javascript" src="<%=basePath%>jQueryUI/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.min.css" />
		<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.theme.min.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/HeaAndFoo.css"/>
		<script type="text/javascript" src="<%=basePath%>js/public.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/ShopCar.js" ></script>
		
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/themes/icon.css">	
		<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>	
	</head>
	<body>
		<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
		</div>
		
		<div class="content">
		    <table id="dg" style="width:70%"></table>  
		      <script>		
				$(function(){
					$('#dg').datagrid({    
					    url:'<%=basePath%>app/user/myorder2',
					    pagination:true,
						rownumbers:true,
						singleSelect:true,
						pageSize:5,
						pageList:[5],
						loadMsg : 'processing, please wait …',	
					    columns:[[    
							{field:'orderNo',title:'订单编号',width:200,align:'center'},    
					        {field:'uname',title:'用户名',width:150,align:'center'},    
					        {field:'payTime',title:'付款时间',width:150,align:'center'},
							{field:'allMoney',title:'总价',width:120,align:'center'}							
		             ]]    
		           });  
				});
			</script>			
		</div>
		<div class="clear"></div>
		<div class="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
		  
	</body>
</html>

