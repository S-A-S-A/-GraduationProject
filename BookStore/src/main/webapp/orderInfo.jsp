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
						<a href="${pageContext.request.contextPath}/">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;订单详细信息
					</div>
					
					<table cellSpacing="1" cellPadding="5" width="100%" align="center"
		bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
				height="26"><strong><STRONG>订单详细信息</STRONG> </strong></td>
		</tr>

		<tr>
			<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
				订单编号：</td>
			<td class="ta_01" bgColor="#ffffff">${orders.id}</td>
			<td align="center" bgColor="#f5fafe" class="ta_01">所属用户：</td>
			<td class="ta_01" bgColor="#ffffff">${orders.user.username }</td>
		</tr>

		<tr>
			<td align="center" bgColor="#f5fafe" class="ta_01">收件人：</td>
			<td class="ta_01" bgColor="#ffffff">${orders.receiverName }</td>
			<td align="center" bgColor="#f5fafe" class="ta_01">联系电话：</td>
			<td class="ta_01" bgColor="#ffffff">${orders.receiverPhone }</td>
		</tr>
		<tr>
			<td align="center" bgColor="#f5fafe" class="ta_01">送货地址：</td>
			<td class="ta_01" bgColor="#ffffff">${orders.address}</td>
			<td align="center" bgColor="#f5fafe" class="ta_01">总价：</td>
			<td class="ta_01" bgColor="#ffffff">${orders.sumCast }</td>
		</tr>
		<tr>
			<td align="center" bgColor="#f5fafe" class="ta_01">下单时间：</td>
			<td class="ta_01" bgColor="#ffffff" colSpan="3">${orders.creatDate}</td>
		</tr>

		<TR>
			<TD class="ta_01" align="center" bgColor="#f5fafe">商品信息</TD>
			<TD class="ta_01" bgColor="#ffffff" colSpan="3">
				<table cellspacing="0" cellpadding="1" rules="all"
					bordercolor="gray" border="1" id="DataGrid1"
					style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
					<tr
						style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
						<td align="center" width="7%">序号</td>
						<td width="8%" align="center">商品</td>
						<td align="center" width="18%">商品编号</td>
						<td align="center" width="10%">商品名称</td>
						<td align="center" width="10%">商品价格</td>
						
						<td width="7%" align="center">商品类别</td>
						<td width="31%" align="center">商品描述</td>
					</tr>

					<c:forEach items="${orders.orderBooks}" var="orderBook" varStatus="vs">
						<tr
							style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #eeeeee">
							<td align="center" width="7%">${vs.count }</td>
							<td width="8%" align="center"><img
								src="${pageContext.request.contextPath}${orderBook.bookInfo.imagePath}"
								width="50" height="50"></td>

							<td align="center" width="18%">${orderBook.bookInfo.id }</td>
							<td align="center" width="10%">${orderBook.bookInfo.bookName }</td>
							<td align="center" width="10%">${orderBook.bookInfo.price }</td>
							
							<td width="7%" align="center">${orderBook.bookInfo.kind.type }</td>
							<td width="31%" align="center">${orderBook.bookInfo.intro}</td>
						</tr>
					</c:forEach>

				</table>
			</TD>
		</TR>

		<TR>
			<td align="center" colSpan="4" class="sep1"><img
				src="${pageContext.request.contextPath}/admin/images/shim.gif">
			</td>
		</TR>
		<TR>
			<td class="ta_01" style="WIDTH: 100%" align="right" bgColor="#f5fafe"
				colSpan="4"><FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
				<!-- <INPUT class="button_ok" type="button" onclick="history.go(-1)"
				value="返回" />  --><span id="Label1"></span>
				
				<c:if test="${orders.status==0 }">
					<p style="text-align:right">
					<a href="${pageContext.request.contextPath}/order/toPay?orderId=${orders.id}"><img src="images/gif53_029.gif" width="204"
						height="51" border="0" /> </a>
					</p>
				</c:if>
				</td>
		</TR>
	</table>
					
					
					
				</td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>



<%-- <table cellspacing="0" class="infocontent">
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
											<c:forEach items="${orders.orderBooks}"  var="orderBooks">
												
												<table width="100%" border="0" cellspacing="0">
														<tr>
															<td width="10%">${orders.id }</td>
															<td width="40%">${orderBooks.bookInfo.bookName }</td>
															<td width="10%">${orderBooks.bookInfo.price }</td>
															<td width="10%">${orders.quantity }</td>
															<td width="10%">${orders.sumCast }</td>
														</tr>
														
												</table>
											
										</c:forEach>
					
											<!-- <table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font
														style="color:#FF0000">合计：&nbsp;&nbsp;1000</font></td>
												</tr>
											</table> -->

											
											<hr>
											<p>
												收货地址：${orders.address }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												收货人：&nbsp;&nbsp;&nbsp;&nbsp;${orders.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												联系方式：${orders.receiverPhone }&nbsp;&nbsp;&nbsp;&nbsp;

											</p>
											<c:if test="${orders.status==0 }">
											<p style="text-align:right">
												<a href="${pageContext.request.contextPath}/order/toPay?orderId=${orders.id}"><img src="images/gif53_029.gif" width="204"
													height="51" border="0" /> </a>
											</p>
											</c:if>
										</td>
									</tr>
								</table>
							</td>


						</tr>


					</table>  --%>
