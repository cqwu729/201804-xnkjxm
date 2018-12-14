<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../jsp/header.jsp"></jsp:include>
</head>
<style>
	.table tr th{
		text-align: center;
	}
	.table tr td{
		text-align: center;
	}
</style>
<body>
<div class="wrap js-check-wrap">
	<ul class="nav nav-tabs">
		<li class="active"><a href="<%=request.getContextPath()%>/Advertisement/index">轮播管理</a></li>
		<li><a href="<%=request.getContextPath()%>/Advertisement/add">添加轮播</a></li>
	</ul>
	<form class="js-ajax-form" method="post">
		<table class="table table-hover table-bordered table-list">
			<thead>
			<tr>
				<th width="50">ID</th>
				<th width="200">轮播名称</th>
				<th width="200">跳转链接</th>
				<th width="50">轮播图片</th>
				<th width="100">操作</th>
			</tr>
			</thead>
			<c:forEach items="${pageResult.list}" var="list" varStatus="index">
				<tr>
					<td> ${list.id}</td>
					<td> ${list.username}</td>
					<td> ${list.url}</td>
					<td>
						<c:if test="${not empty list.picture}">
							<a href="${list.picture}" target="_blank">查看</a>
						</c:if>
					</td>
					<td>
						<a href="<%=request.getContextPath()%>/Advertisement/update?id=${list.id}">编辑</a>
						<a href="<%=request.getContextPath()%>/Advertisement/delete?id=${list.id}" data-msg="确定要删除吗？" class="js-ajax-delete">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<jsp:include page="../jsp/page.jsp"></jsp:include>
	</form>
</div>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
</body>
</html>