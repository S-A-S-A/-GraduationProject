<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String basePath = request.getScheme() + "://" + request.getServerName() + 
			":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;订单详细信息
					</div>



					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<p></p></td>
									</tr>
									<tr>
										<td>
										
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">订单编号</td>
													<td width="40%">商品名称</td>
													<td width="10%">价格</td>
													<td width="10%">数量</td>
													<td width="10%">小计</td>

												</tr>
											</table>
											<c:forEach items="" var=""></c:forEach>
											<table width="100%" border="0" cellspacing="0">
												<tr>
													<td width="10%">${order.id }</td>
													<td width="40%">${order.bookInfo.bookName }</td>
													<td width="10%">${order.bookInfo.price }</td>
													<td width="10%">${order.quantity }</td>
													<td width="10%">${order.sumCast }</td>
												</tr>
												
											</table>
										

											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font
														style="color:#FF0000">合计：&nbsp;&nbsp;1000</font></td>
												</tr>
											</table>

											
											<hr>
											<p>
												收货地址：${orders.address }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												收货人：&nbsp;&nbsp;&nbsp;&nbsp;${orders.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												联系方式：${orders.receiverPhone }&nbsp;&nbsp;&nbsp;&nbsp;

											</p>
											<p style="text-align:right">
												<a href="pay.jsp"><img src="images/gif53_029.gif" width="204"
													height="51" border="0" /> </a>
											</p>
										</td>
									</tr>
								</table>
							</td>


						</tr>


					</table>
				</td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
