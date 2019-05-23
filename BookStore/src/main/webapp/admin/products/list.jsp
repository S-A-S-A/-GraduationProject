<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script type="text/javascript">
	function addProduct() {
		window.location.href = "${pageContext.request.contextPath}/admin/products/add.jsp";
	}
	
	<%--全选与全不选--%>
	
	function checkAll() {
		<%--得到ckAll元素，并得到它的状态--%>
		var flag = document.getElementById("ckAll").checked;
		<%--//得到所有的ids值--%>
		var ids = document.getElementsByName("ids");
		<%--//循环给每个复选框赋值--%>
		for(var i=0; i<ids.length; i++){
			ids[i].checked = flag;<%--//把每一个ckAll的状态赋值给ids--%>
		}
	}
	//批量删除
	function delAllBooks() {
		//得到所有的ids值
		var ids = document.getElementsByName("ids");
		
		var str = "";
		for(var i=0; i<ids.length; i++){
			if(ids[i].checked){
				str+= ids[i].value + "&";
			}
		}
		str = str.substring(0,str.length-1);
		if(str==null||str==""){
			alert("请勾选所删除的数据");
			return false;		
		}
		location.href = "${pageContext.request.contextPath}/products/deleteAll?str="+str;
		<%-- 后面不加ids= --%>
	}
</script>
</HEAD>
<body>
	<br>
	
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>查
							询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
					<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/products/search"
		method="post">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									商品编号</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									类别：</td>
								<td class="ta_01" bgColor="#ffffff"><select name="category"
									id="category">
										<option value="" selected="selected">--选择商品类加--</option>
										<c:forEach items="${menu }" var="m">
													<option value="${m.id }">${m.type }</option>
										</c:forEach>
								</select></td>
							</tr>

							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									商品名称：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="bookName" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									价格区间(元)：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="minprice" size="10" value="" />- <input type="text"
									name="maxprice" size="10" value="" /></td>
							</tr>

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font>
								</td>
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
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>商品列表</strong>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>${book_msg }</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
		<%--批量删除 --%>
					<button type="button" id="del" name="del" value="批量删除"
							class="button_add" onclick="delAllBooks()">批量删除
						</button>
						<button type="button" id="add" name="add" value="&#28155;&#21152;"
							class="button_add" onclick="addProduct()">&#28155;&#21152;
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%"><input type="checkbox" id="ckAll" onclick="checkAll()">全选/全不选</td>
								<td align="center" width="24%">商品编号</td>
								<td align="center" width="18%">商品名称</td>
								<td align="center" width="9%">商品价格</td>
								<td align="center" width="9%">商品数量</td>
								<td width="8%" align="center">商品类别</td>
								<td width="8%" align="center">编辑</td>

								<td width="8%" align="center">删除</td>
							</tr>
		<%--循环显示数据 --%>
						<c:forEach items="${books }" var="b">							
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="7%"><input type="checkbox" name="ids" value="${b.id }"></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="20%">${b.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="18%">${b.bookName }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%">${b.price }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%">${b.count }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${b.kind.type }</td>
									<td align="center" style="HEIGHT: 22px" width="8%"><a
										href="${pageContext.request.contextPath}/products/findById?id=${b.id}">
											<img
											src="${pageContext.request.contextPath}/admin/images/i_edit.gif"
											border="0" style="CURSOR: hand"> </a>
									</td>
							<%-- 数据删除功能 跳转到delBookServlet 并将id 传送过去作为删除的主键 
						不增加提示功能用法	<td align="center" style="HEIGHT: 22px" width="7%"><a
										href="${pageContext.request.contextPath }/delBookServlet?id=${b.id}">
										
						增加提示功能使用Javascript
							--%>
									<td align="center" style="HEIGHT: 22px" width="7%"><a
										onclick="deleteBook('${b.id }',this)">
											<img
											src="${pageContext.request.contextPath}/admin/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a>
									</td>
								</tr>
					</c:forEach>	
						
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
		<input type="hidden" value="${msg }" id="mymsg">
	</form>
	<script type="text/javascript">
			var msg = $("#mymsg").val();
			if(msg!=null&&msg!=""){
				alert(msg);
			}
			
			<%--提示用户是否删除该数据--%>
			function deleteBook(id,t) {
				if(confirm("是否确定要删除")){
				 	
					

					/* location.href="${pageContext.request.contextPath }/products/deleteById?id="+id; */
					$.ajax({
						url : '${pageContext.request.contextPath }/products/deleteById',
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
						
							}else{
								alert("删除失败");
							}
						},
						error : function(){
							result = "error";
						}
					}); 
				}
			}
	</script>
</body>
</HTML>

