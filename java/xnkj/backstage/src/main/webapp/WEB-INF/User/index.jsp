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
		<li class="active"><a href="<%=request.getContextPath()%>/User/index">用户管理</a></li>
	</ul>
	<form class="well form-search js-ajax-form" action="<%=request.getContextPath()%>/User/index">
		关键字：
		<input type="text" name="keyword" style="width: 200px;" value="${keyword}" placeholder="请输入关键字">
		<input type="submit" class="btn btn-primary" value="搜索" />
	</form>
	<form class="js-ajax-form" method="post">
		<table class="table table-hover table-bordered table-list">
			<thead>
			<tr>
				<th width="200">手机号</th>
				<th width="200">推荐码</th>
				<th width="200">余额</th>
				<th width="200">矿机</th>
				<th width="50">身份证号</th>
				<th width="50">身份证正面</th>
				<th width="50">身份证反面</th>
				<th width="50">姓名</th>
				<th width="50">总收益</th>
				<th width="50">昨日收益</th>
				<th width="50">每日收益</th>
				<th width="50">用户状态</th>
				<th width="100">操作</th>
			</tr>
			</thead>
			<c:forEach items="${pageResult.list}" var="list" varStatus="index">
				<tr>
					<td> ${list.phone}</td>
					<td> ${list.recommendCode}</td>
					<td> ${list.balance}</td>
					<td> ${list.miner.username}</td>
					<td> ${list.idCardNumber}</td>
					<td>
						<c:if test="${not empty list.authentication}">
							<a href="${list.authentication.positive}" target="_blank">查看大图</a>
						</c:if>
					</td>
					<td>
						<c:if test="${not empty list.authentication}">
							<a href="${list.authentication.opposite}" target="_blank">查看大图</a>
						</c:if>
					</td>
					<td> ${list.username}</td>
					<td> ${list.totalIncome}</td>
					<td> ${list.yesterdayIncome}</td>
					<td> ${list.profit}</td>
					<td> ${list.roleStatus.name}</td>
					<td>
						<c:if test="${list.roleStatus == 'ENABLE'}">
							<a href="<%=request.getContextPath()%>/User/dealStatus?id=${list.id}&status=DISABLE" data-msg="确定禁用吗？" class="js-ajax-delete">禁用</a>
						</c:if>
						<c:if test="${list.roleStatus != 'ENABLE'}">
							<a href="<%=request.getContextPath()%>/User/dealStatus?id=${list.id}&status=ENABLE" data-msg="确定启用吗？" class="js-ajax-delete">启用</a>
						</c:if>
						<a href="<%=request.getContextPath()%>/User/recharge?id=${list.id}">充值</a>
						<a href="<%=request.getContextPath()%>/User/miners?id=${list.id}">高配低开配置</a>
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