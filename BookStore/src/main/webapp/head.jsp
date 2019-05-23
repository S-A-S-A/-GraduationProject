<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="divhead">
	<table cellspacing="0" class="headtable">
		<tr>
			<td><a href="index.jsp"><img src="images/logo.png"
					width="95" height="30" border="0" /> </a></td>
			<td style="text-align:right" width="100%"><img src="images/cart.gif"
				width="20" height="23" style="margin-bottom:-4px" />&nbsp;<a
				href="${pageContext.request.contextPath }/products/myCart">购物车</a> | <a href="#">帮助中心</a> | 
				<c:if test="${user!=null}">
					 <a href="${pageContext.request.contextPath }/user/myAccount" >我的帐户</a>
				</c:if>
				<c:if test="${user==null}">
						<a href="login.jsp">登陆</a>
				</c:if>
				<c:if test="${user.username!=null}">
						|  欢迎您：<font color="red">${user.username }</font>
				</c:if>
				<c:if test="${user==null}">
						| <a href="register.jsp">新用户注册</a>
				</c:if>
				
				</td>
		</tr>
	</table>
</div>