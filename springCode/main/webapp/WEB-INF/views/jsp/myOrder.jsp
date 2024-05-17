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
		<style>
			
			.ulTop,.ulBot,table{ width: 960px; height: 50px; margin: 0px auto; color: #646464; }
			
			table{ height: 100%; }
			
			.ulTop>li,.ulBot>li{ float: left; width: 160px; height: 50px; line-height: 50px; text-align: center;  }
			
			
			.goods{ display: block; width: 958px; height: 123px; border: 1px solid #ccc; background-color: #FAFAFA;}
			
			.select,.bkInfo,.price,.numPrice,.addMinus,.do{ width: 160px; height: 123px;  text-align: center; }
			
			#bknum{ width: 30px; height: 30px; margin: 0px -5px 0px -5px; text-align: center; }
			
			#addBtn,#minusBtn{ width: 35px; height: 34px; }
			
			#staBtn{ width: 120px; height: 40px; font-size: 18px; background-color: #FF2832; color: #fff; border: none; border-radius: 6px;}
		</style>
	
	</head>
	<body>
		<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
		</div>
		
		<div class="content">
			<table>
				<tr><td>用户名</td><td>订单号</td><td>购买时间</td><td>付款金额</td></tr>
			  	<c:forEach items="${orders}" var="order">
					<tr>
						<td>${order.uname}</td>
						<td>${order.orderNo}</td>
						<td>${order.payTime}</td>
						<td>￥${order.allMoney}</td>
					</tr>
				</c:forEach>
				<tr>
				  <td colspan=4>
      				<table id="tp" cellSpacing="0" cellPadding="1" width="100%" border="0" style="font-family:arial;color:red;font-size:12px;">	    		
	    			<tr>
	    				<td>总记录数：${tp.allRows}</td> 
	    				<td>总页数：${tp.allPages}</td>
	    				<td>当前页：${tp.page}</td>
	    				<td><a href="<%=basePath%>app/user/myorder?page=1">首页 &nbsp;||</a>
	    				    <a href="<%=basePath%>app/user/myorder?page=${tp.page-1}">《前页&nbsp;||</a>
	    				    <a href="<%=basePath%>app/user/myorder?page=${tp.page+1}">&nbsp;后页》</a>	    				 
	    				</td>
	    			</tr>	    		
	    		</table>	    	
      	</td>
				</tr>
			</table>
		
		</div>
		<div class="clear"></div>
		<div class="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>

