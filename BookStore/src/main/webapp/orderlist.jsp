<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + 
			":" + request.getServerPort() + request.getContextPath() + "/";%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
  <base href="<%=basePath%>">
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>

<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%"><table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="modifyuserinfo.jsp">用户信息修改</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/order/orderlist">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/user/logout">用戶退出</a></td>
						</tr>
					</table>
				</td>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="myAccount.jsp">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单查询
					</div>





					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p>欢迎${user.username }光临商城！</p>
								<p>
									您有<font style="color:#FF0000">${size }</font>个订单
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#A3E6DF" class="tableopentd01">订单号</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">收件人</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">订单时间</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">状态</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
									</tr>


									<c:forEach items="${orders }" var="order">
									<tr>
										<td class="tableopentd02">${order.id }</td>

										<td class="tableopentd02">${order.receiverName }</td>
										<td class="tableopentd02"><fmt:formatDate value="${order.creatDate }"/></td>
										<td class="tableopentd02">
										<c:if test="${order.status==0 }">
												未支付
										</c:if>
										<c:if test="${order.status==1 }">
												已支付
										</c:if>
										
										<c:if test="${order.status==2 }">
												等待发货
										</c:if>
										<c:if test="${order.status==3 }">
												已发货
										</c:if>
										<c:if test="${order.status==4 }">
												配送中
										</c:if>
										<c:if test="${order.status==5 }">
												已签收
										</c:if>
										<c:if test="${order.status==6 }">
												订单完成
										</c:if>
										</td>		
										<td class="tableopentd03"><a href="${pageContext.request.contextPath }/order/${order.id}/orderInfo">查看</a>&nbsp;&nbsp;
											<a onclick="deleteOrder('${order.id}','${order.status }',this)">删除</a>
										</td>
									</tr>
									</c:forEach>
									
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<div id="divfoot">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td rowspan="2" style="width:10%"><img
					src="images/bottomlogo.gif" width="195" height="50"
					style="margin-left:175px" />
				</td>
				<td style="padding-top:5px; padding-left:50px"><a href="#"><font
						color="#747556"><b>CONTACT US</b> </font> </a>
				</td>
			</tr>
			<tr>
				<td style="padding-left:50px"><font color="#CCCCCC"><b>COPYRIGHT
							2008 &copy; eShop All Rights RESERVED.</b> </font>
				</td>
			</tr>
		</table>
	</div>


</body>

<script type="text/javascript">
			function deleteOrder(id,status,t){
				
					if(confirm("确定删除该订单")){
						//var i = t.parentNode.parentNode.rowIndex;
						//t.parentNode.parentNode.remove();
						$.ajax({
							url : '${pageContext.request.contextPath }/order/deleteOrder',
							type : "post",
							dataType : 'text',
							async : false,
							data : {
								id : id
							},
							success : function(data){
								if(data=="yes"){
									alert("删除成功");
									//var i = t.parentNode.parentNode.rowIndex;
									t.parentNode.parentNode.remove();
								}
							},
							error : function(){
								result = "error";
							}
						});
					}
				
			}
	</script>
</html>
