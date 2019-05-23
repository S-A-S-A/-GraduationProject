<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/order/search" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>查
							询 条 件</strong></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									订单编号</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									收件人：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="receiverName" size="15" value="" id="Form1_userName"
									class="bg" /></td>
							</tr>

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font></td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br>
									<br></td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search"
										value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="reset" name="reset" value="&#37325;&#32622;"
									class="button_view" />
								</td>
							</tr>
						</table>
					</td>

				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>订单列
							表</strong></TD>
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

								<td align="center" width="20%">订单编号</td>
								<td align="center" width="10%">收件人</td>
								<td align="center" width="15%">地址</td>
								<td align="center" width="10%">联系电话</td>
								<td width="11%" align="center">总价</td>
								<td width="8%" align="center">所属用户</td>
								<td width="10%" align="center">订单状态</td>
								<td width="7%" align="center">查看</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<c:forEach items="${orders }" var="order">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="20%">${order.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%">${order.receiverName }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="15%">${order.address }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%">${order.receiverPhone }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">
										${order.sumCast }</td>
									<td width="8%" align="center">${order.user.username }</td>
									<td width="10%" align="center"><c:if
											test="${order.status==0 }">
												未支付
										</c:if> <c:if test="${order.status==1 }">
												已支付
										</c:if> <c:if test="${order.status==2 }">
												等待发货
										</c:if> <c:if test="${order.status==3 }">
												已发货
										</c:if> <c:if test="${order.status==4 }">
												配送中
										</c:if> <c:if test="${order.status==5 }">
												已签收
										</c:if> <c:if test="${order.status==6 }">
												订单完成
										</c:if></td>

									<td align="center" style="HEIGHT: 22px"><a
										href="${pageContext.request.contextPath}/order/${order.id}/findById">
											<img
											src="${pageContext.request.contextPath}/admin/images/button_view.gif"
											border="0" style="CURSOR: hand">
									</a></td>
									<td align="center" style="HEIGHT: 22px"><a href="#"
										onclick="deleteOrder('${order.id}','${order.status }',this)"> <img
											src="${pageContext.request.contextPath}/admin/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a></td>

								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
	<script type="text/javascript">
			function deleteOrder(id,status,t){
				if(status==6||status==0){
					alert("订单未完成，不能删除");
					
				}else{
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
						 
							//$("#DataGrid1").deleteRow(i);
					}
				}
			}
	</script>
</body>
</HTML>

