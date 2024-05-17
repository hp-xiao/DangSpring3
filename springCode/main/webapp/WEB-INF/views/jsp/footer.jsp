<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="footer_T">
	<div class="footerImg">
		<img src="<%=basePath%>img/footer.jpg"/>
	</div>
</div>
<div class="footer_B">
	<ul class="footer_ul">
		<li><a href="">公司简介</a></li>
		<li><a href="">网站联盟</a></li>
		<li><a href="">广告服务</a></li>
		<li><a href="">网站招商</a></li>
		<li><a href="">机构销售</a></li>
		<li><a href="">官方Blog</a></li>
		<li><a href="">手机App</a></li>
		<li><a href="" style="border: none;">热词搜索</a></li>
	</ul>
	<p>Copyright (C) 书香网 2004-2016, All Rights Reserved京ICP证041189号出版物经营许可证 新出发京批字第直0673号</p>
</div>