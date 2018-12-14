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
		<li class="active"><a href="<%=request.getContextPath()%>/Authentication/index">认证审核</a></li>
	</ul>
	<form class="js-ajax-form" method="post">
		<table class="table table-hover table-bordered table-list">
			<thead>
			<tr>
				<th width="50">ID</th>
				<th width="100">用户</th>
				<th width="100">身份证正面</th>
				<th width="100">身份证反面</th>
				<th width="100">认证状态</th>
				<th width="50">认证时间</th>
				<th width="50">身份证号</th>
				<th width="50">姓名</th>
				<th width="100">操作</th>
			</tr>
			</thead>
			<c:forEach items="${pageResult.list}" var="list" varStatus="index">
				<tr>
					<td> ${list.id}</td>
					<td> ${list.user.phone}</td>
					<td>
						<c:if test="${not empty list.positive}">
							<a href="${list.positive}" target="_blank">查看大图</a>
						</c:if>
					</td>
					<td>
						<c:if test="${not empty list.opposite}">
							<a href="${list.opposite}" target="_blank">查看大图</a>
						</c:if>
					</td>
					<td> ${list.authenticationStatus.name}</td>
					<td> ${list.addTime}</td>
					<td> ${list.idCardNumber}</td>
					<td> ${list.username}</td>
					<td>
						<c:if test="${list.authenticationStatus != 'WAIT'}">
							<a href="#">${list.authenticationStatus.name}</a>
						</c:if>
						<c:if test="${list.authenticationStatus == 'WAIT'}">
							<a href="<%=request.getContextPath()%>/Authentication/pass?id=${list.id}" data-msg="确定审核通过吗？" class="js-ajax-delete">审核通过</a><br>
							<a href="<%=request.getContextPath()%>/Authentication/unpass?id=${list.id}" data-msg="确定审核不通过吗？" class="js-ajax-delete">审核不通过</a>
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