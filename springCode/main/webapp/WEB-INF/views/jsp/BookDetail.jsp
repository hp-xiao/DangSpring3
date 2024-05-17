<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgServer = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()  + "/img";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<base href="<%=basePath%>">
		<title>图书详情页</title>
		<link rel="stylesheet" href="<%=basePath%>css/reset.css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery.min.js" ></script>
		<script type="text/javascript" src="<%=basePath%>jQueryUI/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.min.css" />
		<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.theme.min.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/HeaAndFoo.css"/>
		<script type="text/javascript" src="<%=basePath%>js/public.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/index.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/bookDetail.js" ></script>
		<style>
			.content_L{ float: left; width: 330px; height: 500px; position: relative; }
			
			.smallImg{ width: 310px; height: 70px; padding: 10px; float: left;}
			
			.smallImg li{ width: 70px; }
			
			.smallImg li img{ width: 70px; } 
			
			#bigImg{ width: 330px; height: 330px; position: relative; float: left; z-index: 100;}
			
			#bigImg img{ width: 100%; height: 100%; }
			
			.scBtn{ display: block; width: 80px; height: 20px; margin-top: 30px; text-align: right; float:left;}
			
			#largeImg{ width: 330px; height: 330px; position:relative;  overflow: hidden; position: absolute; top: 0px; left: 300px;}
			
			 
			#fdj{ display: none; width: 165px; height: 165px; 
				 background-color:#CCC;
	            filter:alpha(opacity=50); 
	            -moz-opacity:0.5; 
	            opacity:0.5;
	            z-index:101;
	            position:absolute;
	            top:0px;
	            left:0px;
             }
             
             #imgB{ display: block; position: absolute; }
			
			.content_C{ float: left; width: 630px; height: 500px;  padding-left: 20px; color: #666666;}
			
			.content_C h2{ margin: 20px 0px; }
			
			.content_C p{ margin: 15px 0px; }
			
			.bkPresent{ width: 500px; height: 80px; }
			
			.blue{ color: #1A66B3; }
			
			.price{ font-size: 18px; color: red; font-weight: bold;}
			
			.addBtn{ width: 120px; height: 40px; background-color: #FF2832; color: #fff; font-weight: bold;
			border: none; font-size: 18px; border-radius: 4px; }
			
			
		</style>
	</head>
	<body>
		<div class="header">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		
		<div class="content">
			
			<div class="content_L">
				 <div id="bigImg">
				 	<div id="fdj"></div>
				 	<img src="<%=imgServer%>${bk.pic}"/>
				 </div>
				 <ul class="smallImg">
				 	<li><img src="<%=imgServer%>${bk.pic}"/></li>
				 </ul>
				 <a class="scBtn">收藏商品</a>
				 <div id="largeImg">
				 	<img src="<%=basePath%>img/bookDetail/gcd_big.jpg" id="imgB"/>
				 </div>
			</div>
			
			
			<div class="content_C">
				<h2>${bk.bname} </h2>
				<p class="bkPresent">天下霸唱原著，足本无删节！盗墓小说开山之作，摸金校尉的地下历险记，引领《盗墓笔记》等书热销狂潮！乌尔善执导，
					天下霸唱编剧，陈坤、黄渤、舒淇、Angelababy、夏雨联袂主演的奇幻巨制《鬼吹灯寻龙诀》热映！ </p>
				<p>作者：<span class="blue">${bk.author} </span></p>
				<p>出版社：<span class="blue">${bk.press}</span></p>
				<p>出版时间：<span>${bk.pdate}</span></p>
				<p><del>定价：${bk.price }￥</del></p>
				<p>当前价：<span class="price">${bk.price}</span></p>
				<p>配送地址选择：<span class="space"></span>省：
					<select name="">
						<option value="">山西</option>
						<option value="">河北</option>
						<option value="">湖南</option>
						<option value="">广东</option>
					</select>
					<span class="space"></span>
					市：
					<select name="">
						<option value="">北京</option>
						<option value="">天津</option>
						<option value="">广州</option>
						<option value="">上海</option>
					</select>
					<span class="space"></span>
					县（区）：
					<select name="">
						<option value="">昌平区</option>
						<option value="">天津</option>
						<option value="">广州</option>
						<option value="">上海</option>
					</select>
				</p>
				<a href="<%=basePath%>app/user/addShopcar?isbn=${bk.isbn}"><button class="addBtn">加入购物车</button></a>
				<p>支持七天无理由退货</p>
			</div>
			<div class="clear"></div>
			
			<div class="clear"></div>
		</div>
		<div class="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>
