<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>

<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>

</HEAD>

<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/admin/addAdmin" method="post"
		enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加管理员</STRONG> </strong>
				</td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">用户名：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="username" class="bg" required="required"/>
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">密码：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" required="required"
					name="password" 
					class="bg" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">联系电话：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="phone" class="bg" required="required"/>
				</td>
				
			</tr>
		
			<TR>
				<td align="center" colSpan="4" class="sep1"><img
					src="${pageContext.request.contextPath}/admin/images/shim.gif">
				</td>
			</TR>


			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					
					
						
					<input type="submit" class="button_ok" value="确定">	
						
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					
					
					
					<input type="reset" value="重置" class="button_cancel">

					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1">
					
					</span>
				</td>
			</tr>
		</table>
		<input type="hidden" value="${msg }" id="mymsg">
	</form>
	<script type="text/javascript">
			var msg = $("#mymsg").val();
			if(msg!=null&&msg!=""){
				alert(msg);
			}
	</script>
</body>
</HTML>