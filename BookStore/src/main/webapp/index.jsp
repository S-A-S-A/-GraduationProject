<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String basePath = request.getScheme() + "://" + request.getServerName() + 
			":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>bookStore首页</title>
  <base href="<%=basePath%>">
<%--导入css --%>
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>

<body class="main">

	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<div id="divad">
		<img src="${pageContext.request.contextPath }/ad/index_ad.jpg" />
	</div>

	<div id="divcontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>
				<td width="497"><img src="images/billboard.gif" width="497"
					height="38" />
					<table cellspacing="0" class="ctl">
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">图书3折起，支持在线浏览
									先看再买不后悔,任何商品免费送货</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">Lonely
									Planet 已出版600多种旅行指南，几乎覆盖了全世界的每个角落。</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">2007年中旅游图书畅销榜速递
									中国游,世界游,旅游图书全部7折封顶</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">50万种图书3折,百货团购价热卖
									畅销榜新书速递,促销天天有</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">50万种图书3折,百货团购价热卖
									畅销榜新书速递,促销天天有</a></td>
						</tr>
					</table></td>
				<td style="padding:5px 15px 10px 40px"><table width="100%"
						border="0" cellspacing="0">
						<tr>
							<td><img src="images/hottitle.gif" width="126" height="29" />
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0">
						<tr>
						<c:forEach items="${orderBooks }" var="orderBook">
							<td style="width:50; text-align:center">
							
							<a href="${pageContext.request.contextPath }/products/${orderBook.bookInfo.id}/findBookInfoById">
							<img src="${pageContext.request.contextPath}/${orderBook.bookInfo.imagePath}" 
							width="102" height="130" border="0" /> 
							</a>
							<br /> 
							<a href="${pageContext.request.contextPath }/products/${orderBook.bookInfo.id}/findBookInfoById">${orderBook.bookInfo.bookName}<br />
									作者:${orderBook.bookInfo.author}</a>
									
							</td>
							
						</c:forEach>
							
						</tr>
					</table></td>
			</tr>
		</table>
	</div>

	<jsp:include page="foot.jsp"/>


</body>
</html>
