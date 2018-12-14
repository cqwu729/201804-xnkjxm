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
		<li class="active"><a href="<%=request.getContextPath()%>/Withdraw/index">提现管理</a></li>
	</ul>
	<form class="js-ajax-form" method="post">
		<table class="table table-hover table-bordered table-list">
			<thead>
			<tr>
				<th width="50">ID</th>
				<th width="200">用户</th>
				<th width="50">总收益</th>
				<th width="50">用户余额</th>
				<th width="200">提现金额</th>
				<th width="200">提现时间</th>
				<th width="200">提现状态</th>
				<th width="50">提现银行卡</th>
				<th width="100">操作</th>
			</tr>
			</thead>
			<c:forEach items="${pageResult.list}" var="list" varStatus="index">
				<tr>
					<td> ${list.id}</td>
					<td> ${list.user.phone}</td>
					<td> ${list.user.totalIncome}</td>
					<td> ${list.user.balance}</td>
					<td> ${list.money}</td>
					<td> ${list.updateTime}</td>
					<td> ${list.orderStatus.name}</td>
					<td>
						<c:if test="${not empty list.bankCard.address}">
							${list.bankCard.address}<br>
							<a href="<%=request.getContextPath()%>/Withdraw/ewm?token=${list.bankCard.address}" target="_blank">查看大图</a>
						</c:if>

						<c:if test="${empty list.bankCard.address}">
							${list.bankCard.number}
						</c:if>
					</td>
					<td>
						<c:if test="${list.orderStatus != 'WAIT_FOR_PAY'}">
							<a href="#" class="js-ajax-delete">已审核</a>
						</c:if>
						<c:if test="${list.orderStatus == 'WAIT_FOR_PAY'}">
							<a href="<%=request.getContextPath()%>/Withdraw/deal?id=${list.id}" data-msg="确定已转账吗？" class="js-ajax-delete">审核通过</a>
							<a href="<%=request.getContextPath()%>/Withdraw/unpass?id=${list.id}" data-msg="确定拒绝吗？" class="js-ajax-delete">拒绝</a>
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