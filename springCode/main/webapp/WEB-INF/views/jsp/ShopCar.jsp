<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
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
		  function checkout(){
		    	var r=confirm("请确认是否结算？")
		    	if (r==true){
		    		document.location.href = "<%=basePath%>app/user/checkout";
		    	 }		    	
		    }
		    function clearCar(){
		    	var r=confirm("请确认是否清空购物车？")
		    	if (r==true){
		    		document.location.href = "<%=basePath%>app/user/clearShopcar";
		    	 }		    	
		    }
		    function add(isbn,price){
				  var bknum =  $('#bknum-'+isbn).val();
				  var num = Number(bknum);
				  num = num + 1;
				  $('#bknum-'+isbn).val(num);
				  var numPrice = price*(num);  
				  numPrice = numPrice.toFixed(1);
				  $('#price-'+isbn).text(numPrice);       //小计价格显示				  
				  var allPrice = 0;
				  $(".numPrice").each(function(i){				  
					  allPrice += Number($(this).text()); 
				  });
				  allPrice = allPrice.toFixed(1);           //double只显示一位小数
				  var span = $('#allPrice').html(allPrice);
				  //ajax访问服务器，同步购物车中的商品数量
				  $.ajax({
					   type: "POST",
					   url: "<%=basePath%>app/user/numShopcar",
					   data: "isbn="+ isbn +"&num=" + num,
					   success: function(msg){
					      console.log("msg=" + msg);
					   }
					}); 
			 }		
			 
			   function minus(isbn,price){
				   var bknum =  $('#bknum-'+isbn).val();
				   var num = Number(bknum);	
				   num = num - 1;
				   var numPrice;
				   if(num<1){
					   num = 1;
				   }  
			  	   $('#bknum-'+isbn).val(num);  
			  	   numPrice = price*num;           
			  	   numPrice = numPrice.toFixed(1);
				   $('#price-'+isbn).text(numPrice);              //小计价格显示
				   var allPrice = 0;
				   $(".numPrice").each(function(i){
						  allPrice += Number($(this).text());					  
				  });				  
				  allPrice = allPrice.toFixed(1);
				  var span = $('#allPrice').text(allPrice);
				  //ajax访问服务器，同步购物车中的商品数量
				   $.ajax({
						   type: "POST",
						   url: "<%=basePath%>app/user/numShopcar",
						   data: "isbn="+ isbn +"&num=" + num,
						   success: function(msg){
							   console.log("msg=" + msg);
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
			<ul class="ulTop">
				<li>&nbsp;</li>
				<li>商品信息</li>
				<li>单价（元）</li>
				<li>数量</li>
				<li>金额</li>
				<li>操作</li>
			</ul>
			<table>
			    <c:forEach var="bk" items="${books}">
				<tr class="goods">
					<td class="select"><input type="checkbox" name="" id="" value="" /></td>
					<td class="bkInfo">${bk.bname}</td>
					<td class="price">￥${bk.price}</td>
					<td class="addMinus">
							<input type="button" onclick="minus('${bk.isbn}',${bk.price})" value="-" style="width:25px">
							<input type="text"  id="bknum-${bk.isbn}" value="${shopcar.get(bk.isbn)}" size="1" />
							<input type="button" onclick="add('${bk.isbn}',${bk.price})" value="+" style="width:25px">
					</td>
					<td class="price"> 
						￥<span class="numPrice" id="price-${bk.isbn}">						
							<fmt:formatNumber value="${bk.price*shopcar.get(bk.isbn)}" pattern=".0"/>
						</span>
					</td>
					<td class="do">收藏<br /><a href="<%=basePath%>app/user/removeShopcar?isbn=${bk.isbn}">移除</a></td>
				</tr>
				</c:forEach>
			</table>
			<ul class="ulBot">
			</ul>
			<ul class="ulBot">
				<li><input type="checkbox" name="" id="" value="" /><span class="space"></span>全选</li>
				<li>批量删除</li>
				<li>已选1件</li>
				<li> 总计：<span style="color:red;font-size:18px;" id="allPrice">					
					<fmt:formatNumber value="${allPrice}" pattern=".0"/>
					</span>
				</li>				
				<c:if test="${shopcar.size() > 0}">		
					<li><button id="staBtn" onclick="clearCar()">清空购物车</button></li>	
					<li><button id="staBtn" onclick="checkout()">结算</button></li>	
				</c:if>			
			</ul>			
		</div>
		<div class="clear"></div>
		<div class="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>

