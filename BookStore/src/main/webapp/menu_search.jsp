<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/my.js">

</script>
<script type="text/javascript">

window.onload = function() {
			//得到搜索框
			var searchElement = document.getElementById("name");
			//得到div数据
			var div = document.getElementById("context1");
			searchElement.onkeyup = function() {//给文本框注册按键弹起事件
				//获取文本框值
				var name = this.value;
				if(name==""){
					div.style.display = "none";
					return;  //搜索消除打出来的字 当为空的时候自动隐藏显示框
				}
				//获取xhr对象
				var xhr  = getXMLHttpRequest();
				
				//处理结果
				xhr.onreadystatechange = function() {
					if(xhr.readyState == 4){
						if(xhr.status == 200){
							/* var str = xhr.responseText;//得到服务器返回的数据
					
							var ss = str.split(","); */
							var ss = eval("("+xhr.responseText+")");
							var childDivs = "";
							for(var i=0; i<ss.length; i++ ){
								childDivs += "<div onclick='writeText(this)' onmouseover='changeBackground_over(this)' onmouseout='changeBackground_out(this)'>"+ss[i]+"</div>";//把数组中的每个数组元素放到div中
								
							}
		
							div.innerHTML = childDivs;
							div.style.display = "block";
						}
					}
				}
				<%--//  创建连接           加上"&time="+new Date().getTime()避免缓存--%>
				
				xhr.open("get","${pageContext.request.contextPath}/SearchBookAJAXServlet?name="+name+"&time="+new Date().getTime());
				// 发送请求
				xhr.send(null);
			}
		}
		
		function changeBackground_over(div) {
			div.style.backgroundColor = "red";
			
		}
		function changeBackground_out(div) {
			div.style.backgroundColor = "";
		}
		 function writeText(div) {
			//得到搜索框
			var searchElement = document.getElementById("name");
			searchElement.value = div.innerHTML;
			div.parentNode.style.display = "none";  //把context1的div隐藏
		} 


</script>

<div id="divmenu">
	<c:forEach items="${menu }" var="m">
			<a
		href="${pageContext.request.contextPath}/products/${m.id }/findByKind" >${m.type }</a>
	</c:forEach>
	<%-- <a
		href="${pageContext.request.contextPath}/showProductByPage?category=0" >生活</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=1" >文学</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=2">计算机</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=3">外语</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=4">经管</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=5">励志</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=6">社科</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=7">学术</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=8">少儿</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=9">艺术</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=10">原版</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=11">科技</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=12">考试</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPage?category=13">生活百科</a> --%>
	<%-- <a href="${pageContext.request.contextPath}/products/all/findByKind"
		style="color:#FFFF00">全部商品目录</a> --%>
</div>
<div id="divsearch">
	<form action="${pageContext.request.contextPath}/products/findProductBySearch"
		method="post">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td style="text-align:right; padding-right:220px">
				Search <input
					type="text" name="name" class="inputtable" 
					id="name" /> 
					<input type="image" src="images/serchbutton.gif"
					border="0" style="margin-bottom:-4px">
				</td>
			</tr>
		</table>

	</form>
</div>
<div id="context1" style="display:block;background-color:white; width: 128px; position: absolute;
left: 945px; top: 135px;"></div>