<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/check.js"></script>

</HEAD>
<script type="text/javascript">
	/* //设置类别的默认值
	function setProductCategory(t) {
		var category = document.getElementById("category"); //得到下拉链表

		var ops = category.options;  //得到下拉链表中的所有option标签数组
		for ( var i = 0; i < ops.length; i++) {

			if (ops[i].value == t) {   //判断哪一个option选中的value值与t（当前书的名称）相等
				ops[i].selected = true;
				return;
			}
		}

	}; */
</script>
<%-- setProductCategory(t)用于设置回写数据中的类型在body中写上onload onload="setProductCategory('${book.kind.type}')"--%>
<body >
	<form id="userAction_save_do" name="Form1" enctype="multipart/form-data"
		action="${pageContext.request.contextPath }/products/updateProduct" method="post">
		<input type="hidden" value="${book.id }" name="id" />
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>编辑商品</STRONG> </strong></td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" required="required"
					name="bookName" class="bg" value="${book.bookName }" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品价格：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" required="required"
					name="price" class="bg" value="${book.price }" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">图书作者：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"  value="${book.author }"
					name="author" class="bg" required="required"/>
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">出版社：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" required="required" value="${book.publisher }"
					name="publisher" 
					class="bg" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品数量：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" required="required"
					name="count" class="bg" value="${book.count }" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品类别：</td>
				<td class="ta_01" bgColor="#ffffff"><select name="category" value="${book.kind.id }" required="required"
					id="category">
						<option value="${book.kind.id }">--选择商品类别--</option>
						<c:forEach items="${menu }" var="m">
								<option value="${m.id }">${m.type }</option>
						</c:forEach>
				</select></td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品图片：</td>
					
				<td class="ta_01" bgColor="#ffffff" colSpan="3"><input 
					type="file" name="file" size="30" value="" />
					<input type="hidden" name="imagePath" value="${book.imagePath}">
					<img src="${pageContext.request.contextPath}/${book.imagePath}"
						width="150" height="200"
					>
					</td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">商品描述：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3"><textarea
						name="intro" cols="30" rows="3" style="WIDTH: 96%">${book.intro }</textarea>
				</TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1"><img
					src="${pageContext.request.contextPath}/admin/images/shim.gif">
				</td>
			</TR>


			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4"><input type="submit"
					class="button_ok" value="确定"> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>



					<input type="reset" value="重置" class="button_cancel"> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"> </span></td>
			</tr>
		</table>
	</form>





</body>
</HTML>