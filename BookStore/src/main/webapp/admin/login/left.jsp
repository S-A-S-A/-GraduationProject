<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/admin/css/left.css" rel="stylesheet" type="text/css">
<link rel="StyleSheet" href="${pageContext.request.contextPath}/admin/css/dtree.css" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">

	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/dtree.js"></script>
	<script type="text/javascript">
		
		d = new dTree('d');
		d.add(0,-1,'系统菜单树');
		d.add(1,0,'商品管理','/BookStore/admin/login/welcome.jsp','','mainFrame');
		d.add(2,0,'订单管理','/BookStore/admin/login/welcome.jsp','','mainFrame');
		d.add(3,0,'管理员管理','/BookStore/admin/login/welcome.jsp','','mainFrame');
		d.add(4,0,'用户管理','/BookStore/admin/login/welcome.jsp','','mainFrame');
		
		//子目录添加
		d.add(11,1,'商品查看','${pageContext.request.contextPath}/products/findAll','','mainFrame');
		
		d.add(12,1,'商品类别','${pageContext.request.contextPath}/kinds/findAll','','mainFrame')
		
		d.add(13,1,'销售榜单','${pageContext.request.contextPath}/order/salesList','','mainFrame')
		
		d.add(21,2,'订单查看','${pageContext.request.contextPath}/order/findAll','','mainFrame');
	
		d.add(31,3,'查看管理员','${pageContext.request.contextPath}/admin/findAll','','mainFrame');
		
		d.add(41,4,'查看用户','${pageContext.request.contextPath}/admin/userlist','','mainFrame');
		
		document.write(d); 
		
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>
