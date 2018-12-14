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
		<li class="active"><a href="<%=request.getContextPath()%>/Order/index">订单管理</a></li>
	</ul>
	<form class="well form-search js-ajax-form" action="<%=request.getContextPath()%>/Order/index">
		订单状态：
		<select class="select_2" name="orderStatus">
			<option value="">全部</option>
			<c:forEach items="${orderStatusLists}" var="orderStatusList">
				<option value="${orderStatusList}" <c:if test="${orderStatus == orderStatusList}">selected</c:if>>${orderStatusList.name}</option>
			</c:forEach>
		</select> &nbsp;&nbsp;
		关键字：
		<input type="text" name="keyword" style="width: 200px;" value="${keyword}" placeholder="请输入用户手机号">
		<input type="submit" class="btn btn-primary" value="搜索" />
	</form>
	<form class="js-ajax-form" method="post">
		<table class="table table-hover table-bordered table-list">
			<thead>
			<tr>
				<th width="50">ID</th>
				<th width="200">用户</th>
				<th width="200">矿机</th>
				<th width="200">订单数量</th>
				<th width="200">价格</th>
				<th width="50">订单状态</th>
				<th width="50">购买时间</th>
				<th width="100">操作</th>
			</tr>
			</thead>
			<c:forEach items="${pageResult.list}" var="list" varStatus="index">
				<tr>
					<td> ${list.id}</td>
					<td> ${list.user.phone}</td>
					<td> ${list.miner.username}</td>
					<td> ${list.count}</td>
					<td> ${list.price}</td>
					<td> ${list.orderStatus.name}</td>
					<td> ${list.updateTime}</td>
					<td>
						<c:if test="${list.orderStatus != 'WAIT_FOR_PAY'}">
							<a href="#">${list.orderStatus.name}</a>
						</c:if>
						<c:if test="${list.orderStatus == 'WAIT_FOR_PAY'}">
							<a href="<%=request.getContextPath()%>/Order/pass?orderId=${list.id}" data-msg="确定审核通过吗？" class="js-ajax-delete">审核通过</a><br>
							<%--<a href="<%=request.getContextPath()%>/Order/unpass?orderId=${list.id}" data-msg="确定审核不通过吗？" class="js-ajax-delete">审核不通过</a>--%>
						</c:if>
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