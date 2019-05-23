<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>

<body class="main">
	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="modifyuserinfo.jsp">用户信息修改</a></td>
						</tr>

						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/order/orderlist">订单查询</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/user/logout" >用戶退出</a>
							</td>
						</tr>
					</table></td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="myAccount.jsp">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;用户信息修改
					</div>





					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<form action="${pageContext.request.contextPath }/user/updatePwd" method="post">
								<input type="hidden" name="id" value="${user.id }">
									<table width="100%" border="0" cellspacing="2" class="upline">
										<tr>
											<td style="text-align:right; width:30%">会员邮箱：${user.email } </td>
											<td style="width:40%; padding-left:20px"></td>
											<td>&nbsp;</td>


										</tr>
										<tr>
											<td style="text-align:right width:10%">会员名：${user.username }</td>
											<td style="padding-left:20px "></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right width:40%" >修改密码：</td>
											<td style="text-align:right width:40%" ><input type="password" name="password" id="password"
												class="textinput" />
											</td>
											<td><font color="#999999">密码设置至少6位，请区分大小写</font>
											</td>
										</tr>
										<tr>
											<td style="text-align:right width:40%">重复密码：</td>
											<td style="text-align:right width:40%"><input id="repassword" type="password" class="textinput" />
											</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right width:40%">性别：</td>
											<td colspan="2">&nbsp;&nbsp;<input type="radio"
												name="gender" value="男" ${user.gender=="男"? "checked='checked' ":"" } /> 男
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
												type="radio" name="gender" value="女" ${user.gender=="女"? "checked='checked' ":"" } /> 女</td>
										</tr>
										<tr>
											<td style="text-align:right width:40%">联系方式：</td>
											<td colspan="2"><input name="telephone" type="text"
												value="${user.telephone }" class="textinput" />
											</td>
										</tr>

										<tr>
											<td style="text-align:right">&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</table>





									<p style="text-align:center">

										<input id="submit" type="image" src="images/botton_gif_025.gif" border="0">

									</p>
									<p style="text-align:center">&nbsp;</p>
								</form></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />

<script type="text/javascript">
	$("#submit").click(function(){
		var repassword = $("#repassword").val();
		var password = $("#password").val();
		if ((password==null || password=="")) {
			alert("请输入密码");
			return false;
		}
		if (repassword==null || repassword=="") {
			alert("请输入确认密码");
			return false;
		}
		if(password!=repassword){
			alert("密码不一致");
			return false;	
		}
	});
</script>
</body>
</html>
