<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="cart.jsp">&nbsp;购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单
					</div>

					<form id="orderForm" action="${pageContext.request.contextPath}/products/addOrder" method="post">
					<input  type="hidden" value="${msg}" id="msg">
					<input type="hidden" value="${token }" id="token" name="token">
						<table cellspacing="0" class="infocontent">
							<tr>
								<td><table width="100%" border="0" cellspacing="0">
										<tr>
											<td><img src="images/buy2.gif" width="635" height="38" />
												<p>您好：${user.username }！欢迎您来到商城结算中心</p></td>
										</tr>
										<tr>
											<td><table cellspacing="1" class="carttable">
													<tr>
														<td width="10%">序号</td>
														<td width="40%">商品名称</td>
														<td width="10%">价格</td>
														<td width="10%">类别</td>
														<td width="10%">数量</td>
														<td width="10%">小计</td>

													</tr>
												</table>

												<table width="100%" border="0" cellspacing="0">
													<c:forEach items="${b }" var="booklist">
													<tr>
														<td width="10%">${booklist.book.id }</td>
														<td width="40%">${booklist.book.bookName }</td>
														<td width="10%">${booklist.book.price }</td>
														<td width="10%">${booklist.book.kind.type }</td>
														<td width="10%"><input name="text" type="text"
															value="${booklist.quantity }" style="width:20px" readonly="readonly" /></td>
														<td width="10%">${booklist.sum }</td>

													</tr>
													</c:forEach>
												</table>


												<table cellspacing="1" class="carttable">
													<tr>
														<td style="text-align:right; padding-right:40px;"><font
															style="color:#FF0000">合计：&nbsp;&nbsp;${all }元</font></td>
													</tr>
												</table>
														
														
												<p>
										
													收货地址：<input id="address" name="address" type="text" value="" required="required"
														style="width:350px" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"></a>
													<br /> 收货人：&nbsp;&nbsp;&nbsp;&nbsp;<input  id="receiverName"
														name="receiverName" type="text" value=""  required="required"
														style="width:150px" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"></a>
													<br /> 联系方式：<input type="text" name="receiverPhone" required="required" id="receiverPhone"
														value="" style="width:150px" />&nbsp;&nbsp;&nbsp;&nbsp;
													
												</p>
												
												<hr />
												<p style="text-align:right">
												<button style="border: none;" id="submitOrder">
													<img src="images/gif53_029.gif" width="204" height="51"
														border="0" />
													</button>
												</p></td>
										</tr>
									</table></td>
							</tr>
						</table>
					</form></td>
			</tr>
		</table>
	</div>


	<jsp:include page="foot.jsp" />

<script type="text/javascript">
	$("#submitOrder").click(function(){
		var address = $("#address").val();  
		var receiverName = $("#receiverName").val();
		var receiverPhone = $("#receiverPhone").val();
		if(address==""||address==null){
			alert("请输入收货地址");
			return false;
		}
		if(receiverName==""||receiverName==null){
			alert("请输入收货人姓名");
			return false;
		}
		if(receiverPhone==""||receiverPhone==null){
			alert("请输入联系方式");
			return false;
		}
	});
	
	
	var msg = $("#msg").val();
	if(msg!="" && msg!=null){
		alert(msg);
	}

</script>
</body>
</html>
