<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
		<script type="text/javascript">
		 function pay(){
		    	var r=confirm("请确认是否付款？")
		    	if (r==true){
		    		document.location.href = "<%=basePath%>app/user/pay";
		    	 }		    	
		    }
		</script>
	</head>
	<body>
		<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
		</div>
		
		<div class="content">
			<ul class="ulTop">				
				<li>商品信息</li>
				<li>单价（元）</li>
				<li>数量</li>
				<li>金额</li>			
			</ul>
			<table>
			    <c:forEach var="bk" items="${books}">
				<tr class="goods">
					<td class="bkInfo">${bk.bname}</td>
					<td class="price">￥${bk.price}</td>		
					<td class="price">￥${bk.num}</td>		
					<td class="price">￥${bk.num*bk.price}</td>				
				</tr>
				</c:forEach>
			</table>
			<ul class="ulBot">
			</ul>
			<ul class="ulBot">	
			    <li>&nbsp;</li>	
			    <li>&nbsp;</li>	
			    <li>总价：${allMoney}</li>
			    <li>账户余额：${user.account}</li>	
			    <c:if test="${user.account >= allMoney }">
					<li><button id="staBtn" onclick="pay()">付款</button></li>	
				</c:if>	
				<c:if test="${user.account < allMoney }">
					<font style="color:red;font-size:12px">账户余额不足，请尽快充值！</font>
				</c:if>							
			</ul>			
		</div>
		<div class="clear"></div>
		<div class="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>

