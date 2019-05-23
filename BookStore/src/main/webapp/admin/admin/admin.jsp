<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/admin/findAll" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>查询 条 件</strong></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									管理员ID</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="id" size="15" value="" id="id" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									管理员用户名：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="username" size="15" value="" id="username"
									class="bg" /></td>
							</tr>

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font></td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br>
									<br>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search"
										value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="reset" name="reset" value="&#37325;&#32622;"
									class="button_view" /></td>
							</tr>
						</table></td>

				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>管理员列表</strong></TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="&#28155;&#21152;"
							class="button_add" onclick="addAdmin()">&#28155;&#21152;
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="right"></td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="20%">ID</td>
								<td width="10%" align="center">用户名</td>
								<td width="10%" align="center">注册时间</td>
								<td align="center" width="10%">级别</td>
								
								<td width="11%" align="center">电话</td>
								<td width="8%" align="center">更新时间</td>
								
								<td width="7%" align="center">删除</td>
							</tr>
								<c:forEach items="${admins }" var="admin">
							<tr onmouseover="this.style.backgroundColor = 'white'"
								onmouseout="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="20%">${admin.id }</td>
									<td width="10%" align="center">${admin.username}</td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="10%">${admin.creatTime}</td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="15%"><c:if test="${admin.level==2}">
												普通管理员
										</c:if></td>
								
								<td style="CURSOR: hand; HEIGHT: 22px" align="center">
									${admin.phone }</td>
								<td width="8%" align="center">
								  ${admin.updateTime}
								</td>
								

								<td align="center" style="HEIGHT: 22px"><a
									href="#" onclick="delAdmin('${admin.id}',this)">
										<img
										src="${pageContext.request.contextPath}/admin/images/i_del.gif"
										border="0" style="CURSOR: hand"> </a></td>
								

							</tr>
							</c:forEach>
						</table></td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
<script type="text/javascript">

function delAdmin(id,t)
{
	if(confirm("确认删除")){
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/admin/deleteById",
		data:{
			"id":id,
		},
		dataType:"text",
		async : false,
		success:function(data)
		{
			alert("删除成功");
			t.parentNode.parentNode.remove();
			
		}
	});
	}
}


function addAdmin() {
	window.location.href = "${pageContext.request.contextPath}/admin/admin/add.jsp";
}
</script>
</HTML>

