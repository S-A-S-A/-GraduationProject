<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
	<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">

	
<style>
  body{padding: 20px;}
  .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
  .demo-footer{padding: 50px 0; color: #999; font-size: 14px;}
  .demo-footer a{padding: 0 5px; color: #01AAED;}
  </style>

</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/order/salesList" method="post">
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
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
							
							<input type="text" name="range" class="demo-input" placeholder="请选择日期" id="test1">
							</tr>

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br>
									<br></td>
								<td align="center" bgColor="#ffffff" class="ta_01">
								<input type="submit" id="search" name="search" value="查询" class="button_view">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<!-- <input type="submit" id="search" name="search" value="下载" class="button_view"> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  -->
									<input type="reset" name="reset" value="重置" class="button_view" /></td>
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
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								
								<td align="center" width="9%">商品编号</td>
								<td align="center" width="12%">商品名称</td>
								<td align="center" width="9%">商品价格</td>
								<td width="8%" align="center">商品类别</td>
								<td align="center" width="9%">数量</td>
								<td align="center" width="19%">收货地址</td>
								<td align="center" width="10%">收件人</td>
								<td align="center" width="10%">订单金额</td>
								<td align="center" width="13%">下单时间</td>
							</tr>
		
						<c:forEach items="${orderBooks }" var="orderBook">							
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="9%">${orderBook.bookInfo.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="12%">${orderBook.bookInfo.bookName }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="9%">${orderBook.bookInfo.price }</td>
									
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${orderBook.bookInfo.kind.type }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%">${orderBook.order.quantity }本</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="19%">${orderBook.order.address }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%">${orderBook.order.receiverName }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%">${orderBook.order.sumCast }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="13%">${orderBook.order.creatDate }</td>	
								
								</tr>
					</c:forEach>	
						
						</table>
					</td>
				</tr>
				
			</TBODY>
		</table>
		<input  type="hidden" value="${msg}" id="msg">
		
		
	</form>
	
	<script src="${pageContext.request.contextPath}/admin/products/laydate/laydate.js"></script>
</body>
<script>
lay('#version').html('-v'+ laydate.v);

//执行一个laydate实例
laydate.render({
  elem: '#test1',
  type: 'month',
  range: true
});


var msg = $("#msg").val();
if(msg!="" && msg!=null){
	alert(msg);
}
</script>

</HTML>

