<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<li class="active"><a href="<%=request.getContextPath()%>/Miner/index">矿机管理</a></li>
		<%--<li><a href="<%=request.getContextPath()%>/Miner/add">添加矿机</a></li>--%>
	</ul>
	<form class="js-ajax-form" method="post">
		<table class="table table-hover table-bordered table-list">
			<thead>
			<tr>
				<th width="50">ID</th>
				<th width="200">矿机名称</th>
				<th width="200">价格</th>
				<th width="50">日收益</th>
				<th width="50">矿机图片</th>
				<th width="50">回本时间</th>
				<th width="50">月收益</th>
				<th width="50">推荐一代</th>
				<th width="50">推荐二代</th>
				<th width="50">无限代</th>
				<%--<th width="100">操作</th>--%>
			</tr>
			</thead>
			<c:forEach items="${pageResult.list}" var="list" varStatus="index">
				<tr>
					<td> ${list.id}</td>
					<td> ${list.username}</td>
					<td> ${list.price}</td>
					<td> ${list.profit}</td>
					<td>
						<c:if test="${not empty list.picture}">
							<a href="${list.picture}" target="_blank">查看</a>
						</c:if>
					</td>
					<td> ${list.returnTime}天</td>
					<td> ${list.monthlyIncome}</td>
					<td>
						<fmt:formatNumber type="number" value="${list.generation*100}" pattern="#.00"/>
					</td>
					<td>
						<fmt:formatNumber type="number" value="${list.twoGeneration*100}" pattern="#.00"/>
					</td>
					<td>
						<fmt:formatNumber type="number" value="${list.infiniteGeneration*100}" pattern="#.00"/>
					</td>
					<%--<td>--%>
						<%--<a href="<%=request.getContextPath()%>/Miner/update?id=${list.id}">编辑</a>--%>
						<%--<a href="<%=request.getContextPath()%>/Miner/delete?id=${list.id}" data-msg="确定要删除吗？" class="js-ajax-delete">删除</a>--%>
					<%--</td>--%>
				</tr>
			</c:forEach>
		</table>
		<jsp:include page="../jsp/page.jsp"></jsp:include>
	</form>
</div>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
</body>
</html>