<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="jakarta.tags.core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="header_T">
	<div class="header_T_C">
	    <c:choose>
	       <c:when test="${sessionScope.user == null}">
	         <a id="regBtn" href="<%=basePath%>app/regist">注册</a> | <a id="loginBtn" href="<%=basePath%>app/login">登录</a>
	       </c:when>
	       <c:otherwise>
	           	 欢迎：${sessionScope.user.uname}  | <a href="<%=basePath%>app/user/logout">退出</a>
	               <c:if test="${user.role == 1}">
	                 |  <a href="<%=basePath%>app/back/bookadd">后台</a>
	               </c:if>
	       </c:otherwise>
	    </c:choose>	   
		 | <a href="<%=basePath%>jsp/personalCenter.jsp">个人中心</a>
	</div>
</div>
<div class="header_C">
	<img src="<%=basePath%>img/logo.jpg" alt="" class="logo" />
	<input type="text" name="" class="serchTxt" value="" />
	<button class="serchBtn">搜索</button>
	
	<c:if test="${user != null}">
		<div class="shopcarBtn">
			<a href="<%=basePath%>app/user/showShopcar" class="num">购物车</a>
			<a href="<%=basePath%>app/user/myorder" class="order">我的订单</a>
		</div>
	</c:if>
	
</div>
<ul class="banner">
	<li id="liOne">全部商品分类</li>
	<li class="bannerLi"><a href="<%=basePath%>app/main">首页</a></li>
	<li class="bannerLi"><a href="">电子书</a></li>
	<li class="bannerLi"><a href="">特色书店</a></li>
	<li class="bannerLi"><a href="">文化用品</a></li>
	<li class="bannerLi"><a href="">数字音乐</a></li>
	<li class="bannerLi"><a href="">特价</a></li>
</ul>
<div class="bannerBorder" style="width: 100%; height: 2px; background-color: #FF2832;" ></div>
