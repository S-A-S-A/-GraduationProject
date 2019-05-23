<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String basePath = request.getScheme() + "://" + request.getServerName() + 
			":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

				<td><div style="text-align: right; margin: 5px 10px 5px 0px">
						<a href="index.html">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="ad/page_ad.jpg" width="666" height="89" />
								<table width="100%" border="0" cellspacing="0" >
									<tr>
										<td><img src="images/buy1.gif" width="635" height="38" />
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="30%">商品名称</td>
													<td width="10%">价格</td>
													<td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
													<td width="10%">库存</td>
													<td width="10%">小计</td>
													<td width="10%">取消</td>
												</tr>
											</table>
											
											<table width="100%" border="0" cellspacing="0" id="myTable">
												<c:forEach items="${b }" var="booklist">
													<tr>
														<td width="10%">${booklist.book.id }</td>
														<td width="30%">${booklist.book.bookName }</td>

														<td width="10%">${booklist.book.price }</td>
														<td width="20%">${booklist.quantity }</td>
														<td width="10%">${booklist.book.count }</td>
														<td width="10%" id="sum">${booklist.sum}</td>

														<td width="10%"><button
																onclick="deleteCart('${booklist.book.id}','${booklist.sum}',this)"
																style="color: #FF0000; font-weight: bold; border: none">删除</button></td>
													</tr>
												</c:forEach>
											</table>



											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align: right; padding-right: 40px;">合计：&nbsp;&nbsp;<font id="allmoney"
														style="color: #FF6600; font-weight: bold">${all }</font>元
													</td>
												</tr>
											</table>
										<div style="text-align: right; margin-top: 10px">
											<a href="${pageContext.request.contextPath }/products/query"><img src="images/gwc_jx.gif"
												border="0" /> </a> &nbsp;&nbsp;&nbsp;&nbsp;<button style="border: none" onclick="buyProducts();"><img
												src="images/gwc_buy.gif" border="0" /> </button>
										</div>
										</td>
									</tr>
								</table></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />
	<script type="text/javascript">
	function deleteCart(id,sum,t){
		if(confirm("确定清除该商品")){
			var all = $("#allmoney").html();
		 $.ajax({
				url : '${pageContext.request.contextPath }/products/deleteCart',
				type : "post",
				dataType : 'text',
				async : false,
				data : {
					id : id
				},
				success : function(data){
					if(data=="yes"){
						var endmenoy = all - sum;
						$("#allmoney").html(endmenoy);
						
					}
				},
				error : function(){
					result = "error";
				}
			});
		 var i = t.parentNode.parentNode.rowIndex;
			
			t.parentNode.parentNode.remove();
			$("#myTable").deleteRow(i);
		}
	}
	
	function buyProducts(){
		var all = $("#allmoney").html();
		if(all==0){
			alert("请先添加商品");
			location.href='${pageContext.request.contextPath }/index';
		}else{
			location.href='${pageContext.request.contextPath }/products/buyProducts';
		}
	}
</script>

</body>
</html>
