<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="<%=basePath%>css/reset.css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery.min.js" ></script>
		<script type="text/javascript" src="<%=basePath%>jQueryUI/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.min.css" />
		<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.theme.min.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/HeaAndFoo.css"/>
		<script type="text/javascript" src="<%=basePath%>js/public.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/personalCenter.js" ></script>
		<style>
		
			.defBtn{ width: 120px; height: 40px;  background-color: #FF2832; color: #fff; font-weight: bold; 
			font-size: 16px; border:none; border-radius: 6px;}
			.content_L{ width: 200px; height: 500px; border: 1px solid #ccc; border-radius: 10px; float: left; }
			
			.content_L li{ width: 180px; height: 40px; margin: 15px auto; line-height: 40px; text-align: center; }
			
			.content_L li:hover{ background-color: #FF2832; color: #fff; font-weight: bold; border-radius: 6px; }
			
			.content_R{ width: 900px; height: 500px; border: 1px solid #ccc; border-radius: 10px; float: right; margin-right: 40px;  }
			
			.content_R>div{ display: none; }
			
			#userInfo{ width: 400px; height: 400px; margin: 20px 55px;  }
			#userInfo>p{ margin: 25px auto; }
			
			
			#account{ width: 400px; height: 400px; margin: 30px auto; }
			#account>p{ margin: 40px auto; }
			#account>p>input{ width: 200px; height: 30px;  }
			
			#buyRecords{ width: 860px; height: 460px; margin: 10px auto;  }
			#buyRecords>table{ width: 860px; }
			#buyRecords>table tr{ width: 90%; height: 50px;   }
			.record{  border: 1px solid #ccc; text-align: center; height: 30px !important;}
			.record td{ border: 1px solid #ccc; }
			
			#myCollection{ width: 860px; height: 100%; margin: 15px auto; }
			.collection{ width:150px; height: 240px; border: 1px solid #ccc; float: left;}
			.collection>img{ width: 100%; }
			.collection .bkName{ width: 120px; height: 50px; margin-top: 10px; margin: 0px auto; text-align: center; overflow: hidden;}
			.bkPrice{ width: 120px; height: 20px;margin: 0px auto; text-align: center;}
			
			#passRevise{ width: 700px; height: 300px; margin: 80px auto; text-align: center;  }
			#passRevise>p{ margin: 40px auto; font-size: 16px; }
			#passRevise>p>input{ width: 200px; height: 30px; text-indent: 6px; font-size: 16px;}
			
			
		</style>
	</head>
	<body>
		
		<div class="header">
			<jsp:include page="header.jsp"></jsp:include>		
		</div>
		
		<div class="content">
			
			<ul class="content_L">
				<li>个人信息</li>
				<li>个人账户</li>
				<li>购买记录</li>
				<li>我的收藏</li>
				<li>密码修改</li>
			</ul>
			
			<div class="content_R">
				<div class="lcActive" id="userInfo">
					<p>用户名：u0001</p>
					<p>昵称：<input type="text" name="nickname" id="" value="" /></p>
					<p>出生日期：<input type="text" /></p>
					<p>性别：<input type="radio" name="sex" /> 男<span class="space"></span><input type="radio" name="sex" /> 女</p>
					<p>手机号：<input type="text" /></p>
					<p>真实姓名：<input type="text" /></p>
					<p>身份证号：<input type="text" /></p>
					<p><button class="defBtn">修改</button></p>
				</div>
				
				<div id="account">
					<p>账户余额：</p>
					<p>充值金额：<input type="text" /></p>
					<p><button class="defBtn">确认充值</button></p>
				</div>
				
				<div id="buyRecords">
					<table>
						<tr>
							<th>订单号</th>
							<th>商品信息</th>
							<th>单价（元）</th>
							<th>数量</th>
							<th>实付款</th>
							<th>交易状态</th>
						</tr>
						<tr class="record">
							<td>isbn00001</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				
				<div id="myCollection">
					<div class="collection">
						<img src="img/test/bookimg1.jpg" alt="" />
						<p class="bkName">图书名称</p>
						<p class="bkPrice">价格</p>
					</div>
				</div>
				
				<div id="passRevise">
					<p>
						请输入旧密码：<input type="password" />
					</p>
					<p>
						请输入新密码：<input type="password" />
					</p>
					<p>
						请确认新密码：<input type="password" />
					</p>
					<button class="defBtn">提交</button>
				</div>
			</div>
		<div class="clear"></div>
		</div>
		
		<div class="clear"></div>
		<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>
