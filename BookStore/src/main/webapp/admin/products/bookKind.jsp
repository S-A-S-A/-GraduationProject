
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>图书分类</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/userlist.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script>
</head>

<body>
	<h1 class="title">图书分类</h1>
	<table class="list">
		<tr class="title-tr">
			<td>Id</td>
			<td>图书分类目录</td>
			<td>创建时间</td>
			<td>修改时间</td>
			<td>操作</td>
		</tr>
		
		<c:forEach items="${kinds }" var="k">
		<tr class="value-tr">
			<td class="value-td">${k.id }</td>
			<td class="value-td">${k.type }</td>
			<td class="value-td"><fmt:formatDate value="${k.creatTime }"/> </td>
			<td class="value-td"><fmt:formatDate value="${k.updateTime }"/></td>
			<td class="value-botton">
				<button type="button" class="update">修改</button>
				<button type="button" class="delete">删除</button>
			</td>
		</tr>
		</c:forEach>	
		
	</table>
	<button type="button" class="add" id="add">增加</button>
	<div class="box">
		<form action="" id="form" method="post">
			<button type="button" id="close" class="close">关闭</button>
			<div>
				<p id="id-p">ID</p>
				<input type="text" name="id" id="id" />
			</div>
			<div class="box-th">
				<p>图书类别名</p>
				<input type="text" name="type" id="type" />
			</div>
			<input type="button" class="submit" value="提交" />
		</form>
	</div>
	<div class="box-shadow"></div>
</body>
<script type="text/javascript">
  	function fun(){
  		$(".box").css({
			"display" : "none"
		});

		$(".box-shadow").css({
			"display" : "none"
		});
		/* 清空残留数据 */
		$("#id").val("");
		$("#type").val("");
		$(".submit").removeClass("add_submit").removeClass("update_submit");
  	}
	/*关闭按钮*/
	$("#close").click(function() {
		fun();
	});

	/*添加按钮*/
	$("#add").click(function() {
		if ($(".box").css("display") == "none") {
			/*先让添加框显示*/
			$(".box").css({
				"display" : "block"
			});

			$(".submit").attr({
				"value" : "添加"
			});

			$(".submit").addClass("add_submit");//.attr("class")

			$(".box-shadow").css({
				"display" : "block"
			});

			//提交事件
			$(".submit").click(function(event){
				//event.preventDefault(); 避免submit多次提交,取消form表单的默认提交
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/kinds/addKind",
				data:$('#form').serialize(),
				dataType:'json',
				async:false,
				success:function(data){
					alert(data.msg);
					window.location.reload();
					/* fun();
					$(".list").append("<tr class='value-tr'>"+
							"<td class='value-td'>"+data.kind.id+"</td>"+
							"<td class='value-td'>"+data.kind.type+"</td>"+
							"<td class='value-botton'>"+
							"<button type='button' class='update'>修改</button>"+
							"<button type='button' class='delete'>删除</button>"+
							"</td></tr>"); */
				}
			});
		})
		}
	})

	/*更新按钮*/
	$(".update").click(function() {
		/*获取我们对应的 id  type  */
		var id = $(this).parents("tr").find("td").eq(0).html();
		var type = $(this).parents("tr").find("td").eq(1).html();
		var _that = $(this);
		if ($(".box").css("display") == 'none') {

			$(".box").css({
				"display" : "block"
			});

			$(".submit").attr({
				"value" : "修改"
			});

			$(".submit").addClass("update_submit");

			/* 阴影 */
			$(".box-shadow").css({
				"display" : "block"
			});

			//先给前端修改页面显示：修改数据($().val())
			$("#id").val(id);
			$("#type").val(type);
		}
		//修改按钮
		$(".submit").click(function(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/kinds/updateKind",
				data:$("#form").serialize(),
				async:false,
				dataType:'json',
				success:function(data){
					alert(data.msg);
					window.location.reload();
					/* _that.parents("tr").find("td").eq(1).html(data.kind.type);
					fun(); */
				}
			});
		})
	})
	/*删除按钮*/
	$(".delete").click(function(){
			var kId = $(this).parents("tr").find("td").eq(0).html();	
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/kinds/deleteKind?kId="+kId,
				async:false,
				dataType:'json',
				success:function(data){
					alert(data.msg);
					window.location.reload();
				/* 	fun();
					var i = $(".list").parentNode.parentNode.rowIndex;
					alert(i); */
				//	$(".lst").delete(i);
				}
			});
		})
</script>
</html>