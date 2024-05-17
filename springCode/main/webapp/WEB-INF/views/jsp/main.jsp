<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="jakarta.tags.core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String imgServer = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()  + "/img";
%>
 
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="<%=basePath%>css/reset.css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery.min.js" ></script>
		<script type="text/javascript" src="<%=basePath%>jQueryUI/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.min.css" />
		<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.theme.min.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/HeaAndFoo.css"/>
		<script type="text/javascript" src="<%=basePath%>js/public.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/index.js" ></script>
		
		<style>
			
			.content_C{ width: 1200px; height: 100%; margin: 0px auto;}
			
			.bkClassifyList{ float: left; width: 202px; height: 337px; background-color: #FAFAFA;  }
			
			
			.bkClassify{ width: 202px; height: 42px;  margin: 0px 0px; line-height: 45px; 
				text-align: center;  letter-spacing: 2px; font-weight: bold;
			}
			
			.bkClassify:hover{ background-color: #FF2832; color: #fff; border-radius: 10px;}
			
			#carousel{ float: left; width:750px; height: 315px; padding: 10px; border: 1px solid #FF2832; border-radius: 5px; margin: 10px 0px 0px 10px; position: relative;}
			
			#carousel_img{ width:750px; height: 315px; float: left; }
			
			#carousel_img img{ position: absolute; z-index: 98; }
			
			#carousel_Z{ height: 40px; width: 750px; z-index: 99; position: absolute;  top: 145px;}
			
			#carousel #left{ border-right: 35px solid #ccc;  float: left;  }
			
			#carousel #left,#carousel #right{ border-radius: 10px;  border-top: 30px solid transparent;
				border-bottom: 30px solid transparent;
				filter:alpha(opacity=50);   -moz-opacity:0.5;  opacity:0.5; }
			
			#carousel #right{ float: right;  border-left: 35px solid #ccc;  }
			
			.adv{ width: 200px; height: 335px; float: right; margin-top: 10px;}
			
			 
			.bkTitle{ font-size: 20px; margin: 30px 0px 10px 0px; color: #666666; font-weight: bold; }
			
			.bkRecommend{  width: 1198px; height: 550px; border-top: 1px solid #000 !important; border: 1px solid #eee; }
			
			.newBook{ float: left; width: 935px; height: 530px; padding: 10px 10px; border-right: 1px solid #eee; }
			
			.newBook li{ float: left; width: 166px; height: 246px; padding: 10px; }
			
			.rBorder{ border-right: 1px solid #ccc;}
			
			.bBorder{ border-bottom: 1px solid #ccc; }
			
			.newBook .bkName{ width: 170px; height: 42px; margin: 5px 0px 8px 0px;}
			
			.bkPrice{ font-size: 16px; font-weight: bold; color: #E4393C;}
			
			
			#bkTop{ width: 236px; height: 550px; float: right; }
			
			#bkTop li{ margin: 10px auto; }
			
			#bkTop li a{ display: block; width: 230px; height: 30px; overflow: hidden;}
			
			#bkTop li a span.topNum{ display: inline-block; width: 30px; height: 30px; float: left; line-height: 30px; 
				text-align: center; }
			
			#bkTop li a span.bkName{ display: inline-block; width: 200px; height: 30px; text-overflow: ellipsis;
			float: left; line-height: 30px;  white-space: nowrap; overflow: hidden; }
			
		</style>
	</head>
	<body>
		<div class="header">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div class="clear"></div>
		<div class="content">
			<ul class="bkClassifyList">
				<li class="bkClassify">文学类</li>
				<li class="bkClassify">少儿类</li>
				<li class="bkClassify">教育类</li>
				<li class="bkClassify">人文社科类</li>
				<li class="bkClassify">计算机类</li>
				<li class="bkClassify">励志成功类</li>
				<li class="bkClassify">生活类</li>
				<li class="bkClassify">艺术类</li>
			</ul>
			<div id="carousel">
				<div id="carousel_img">
					<img src="img/carousel/carousel1.jpg" alt="" />
					<img src="img/carousel/carousel2.jpg" alt="" />
					<img src="img/carousel/carousel3.jpg" alt="" />
					<img src="img/carousel/carousel4.jpg" alt="" />
					<img src="img/carousel/carousel5.jpg" alt="" />
					<img src="img/carousel/carousel6.jpg" alt="" />
					<img src="img/carousel/carousel7.jpg" alt="" />
				</div>
				<div id="carousel_Z">
					<span id="left"></span>
					<span id="right"></span>
				</div>
			</div>
			<div class="adv">
				<img src="img/adv1.jpg"/>
				<img src="img/adv2.jpg"/>
			</div>
			<div class="clear"></div>
			<h3 class="bkTitle">文学类书籍推荐</h3>
			<!--文学类书籍推荐-->
			<div class="bkRecommend">
				<ul class="newBook">
				   <c:forEach var="bk" items="${books}">
					<li class="rBorder bBorder">
						<a href="<%=basePath%>app/bookInfo?isbn=${bk.isbn}" class="bkImgA">
							<img src="<%=imgServer%>${bk.pic}" class="bkImg"/>
						</a>
						<div class="bkName">
							<a href="">${bk.bname}</a>
						</div>
						<span class="bkPrice">${bk.price}</span>
					</li>		
					</c:forEach>			
				</ul>
				<ul id="bkTop">
					<li><a href="BookDetail.html">
						<span class="topNum">1</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
					<li><a href="BookDetail.html">
						<span class="topNum">2</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
					<li><a href="BookDetail.html">
						<span class="topNum">3</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
					<li><a href="BookDetail.html">
						<span class="topNum">4</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
					<li><a href="BookDetail.html">
						<span class="topNum">5</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
					<li><a href="BookDetail.html">
						<span class="topNum">6</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
					<li><a href="BookDetail.html">
						<span class="topNum">7</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
					<li><a href="BookDetail.html">
						<span class="topNum">8</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
					<li><a href="BookDetail.html">
						<span class="topNum">9</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
					<li><a href="BookDetail.html">
						<span class="topNum">10</span>
						<span class="bkName">JavaEE开发的颠覆者：Spring Boot实战</span>
					</a></li>
				</ul>
			</div>
		</div>
		
		<div class="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>
 