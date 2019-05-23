<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>bookStore注册页面</title>
<%--导入css --%>
<link rel="stylesheet" href="css/main.css" type="text/css" />

<script type="text/javascript">
	function checkPassword() {
		if (form1.password.value.length < 6) {
			alert("密码设置至少6位");
		}
		var password = form1.password.value;
		var repassword = form1.repassword.value;
		if (password != repassword) {
			alert("两次密码不一致，请重新输入");
		}
	}
	
	
</script>
</head>


<body class="main">
	<%@include file="head.jsp"%>
	<%--导入头 --%>
	<%@include file="menu_search.jsp"%><%--导入导航条与搜索 --%>

	<div id="divcontent">
		<form action=""
			method="post" name="form1" id="form">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding:30px">
						<h1>新会员注册${user_msg }</h1>
						
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">会员邮箱：</td>
								<td style="width:40%">
								<input type="text" class="textinput"
									name="email" /></td>
								<td><font color="#999999">请输入有效的邮箱地址</font><span id="msg1"></span></td>
							</tr>
							<tr>
								<td style="text-align:right">用户名：</td>
								<td>
									<input type="text" class="textinput" name="username" />
								</td>
								<td><font color="#999999">用户名设置至少6位</font>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msg"></span></td>
							</tr>
							<tr>
								<td style="text-align:right">密码：</td>
								<td><input type="password" class="textinput"
									name="password" /></td>
								<td><font color="#999999">密码设置至少6位</font></td>
							</tr>
							<tr>
								<td style="text-align:right">重复密码：</td>
								<td><input type="password" class="textinput"
									name="repassword"  /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align:right">性别：</td>
								<td colspan="2">&nbsp;&nbsp;<input type="radio"
									name="gender" value="男" checked="checked" /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="gender" value="女" /> 女</td>
							</tr>
							<tr>
								<td style="text-align:right">联系电话：</td>
								<td colspan="2"><input type="text" class="textinput"
									style="width:350px" name="telephone" onclick="checkPassword()" /></td>
							</tr>
							<tr>
								<td style="text-align:right">个人介绍：</td>
								<td colspan="2"><textarea class="textarea" name="introduce"></textarea>
								</td>
							</tr>

						</table>
						</table>
						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top:20px; text-align:center"><input id="submit"
									type="image" src="images/signup.gif" name="submit" border="0">
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</div>



	<div id="divfoot">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td rowspan="2" style="width:10%"><img
					src="images/bottomlogo.gif" width="195" height="50"
					style="margin-left:175px" /></td>
				<td style="padding-top:5px; padding-left:50px"><a href="#"><font
						color="#747556"><b>CONTACT US</b> </font> </a></td>
			</tr>
			<tr>
				<td style="padding-left:50px"><font color="#CCCCCC"><b>COPYRIGHT
							2017 &copy; eShop All Rights RESERVED.</b> </font></td>
			</tr>
		</table>
	</div>
<script type="text/javascript">
$(function(){
	
	$("#submit").click(function(){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/user/register',
			async:false,
			dataType:'json',
			data : $("#form").serialize(),
			success : function(data){
				
				if(data.msg=="true"){
					alert("注册成功");	
				}else{
					alert(data.msg);
				}
				
			}
		});
	});
	
	
	
	
});
</script>
</body>
</html>
