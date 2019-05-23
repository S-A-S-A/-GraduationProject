<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
							href="#">&nbsp;${b.kind.type } </a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${b.bookName }
					</div>





					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="ad/page_ad.jpg" width="645" height="84" />

								<table width="100%%" border="0" cellspacing="0">
									<tr>
										<td width="30%">

											<div class="divbookcover">
												<p>
													<img src="${pageContext.request.contextPath }/${b.imagePath}"
														width="213" height="269" border="0" />
												</p>
											</div>

											<div style="text-align:center; margin-top:25px">
												<button id="addcart" style="border: none" onclick="addCart('${b.id }');">
													<img src="images/addcart.jpg" border="0" width="70" height="25" /> 
												</button>
												<a href="${pageContext.request.contextPath }/products/${b.id }/buy">
													<img src="images/buybutton.gif" border="0" width="70" height="25" /> 
												</a>
											</div></td>
										<td style="padding:20px 5px 5px 5px"><img
											src="images/miniicon3.gif" width="16" height="13" /><font
											class="bookname">&nbsp;&nbsp;${b.bookName }</font>

											<hr />售价：<font color="#FF0000">￥${b.price }</font>
											<hr /> 类别：${b.kind.type }

											<hr />
											<p>
												<b>内容简介：</b>
											</p> ${b.intro }</td>
									</tr>
								</table></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>


	<jsp:include page="foot.jsp" />

<script type="text/javascript">
	
	function addCart(id){
		
		var result = validStock(id);
		if (result == "no") {
			alert("库存不足");
			return false;
		}
		if (result == "error") {
			alert("系统故障");
			return false;
		}
		$.ajax({
			url : '${pageContext.request.contextPath }/products/addCart',
			type : "post",
			dataType : 'text',
			async : false,
			data : {
				id : id
			},
			success : function(resultText){
				if(resultText == "yes"){
					alert("添加成功");
				}
			},
			error : function(){
				alert("系统错误");
			}
		});
	}
	/* 验证库存 */
	function validStock(id){
		var result = "yes";
		
		$.ajax({
			url : '${pageContext.request.contextPath }/products/validStock',
			type : "post",
			dataType : 'text',
			async : false,
			data : {
				id : id
			},
			success : function(resultText){
				result = resultText;
			},
			error : function(){
				result = "error";
			}
		});
		
		return result;
		
	}
</script>
</body>
</html>
