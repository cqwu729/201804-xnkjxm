<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../jsp/header.jsp"></jsp:include>
<style>
	.table tr td{
		text-align: center;
	}
	.table tr th{
		text-align: center;
	}
</style>
</head>
<body>
<div class="wrap js-check-wrap">
	<ul class="nav nav-tabs">
		<li class="active"><a href="<%=request.getContextPath()%>/Notice/index">公告咨询管理</a></li>
		<li><a href="<%=request.getContextPath()%>/Notice/add">添加公告咨询</a></li>
	</ul>
	<form class="well form-search" action="<%=request.getContextPath()%>/Notice/index">
		文章栏目：
		<select class="select_2" name="columnId" id="columnId">
			<option value="">全部</option>
			<c:forEach items="${columns}" var="column">
				<option value="${column.id}">${column.name}</option>
			</c:forEach>
		</select> &nbsp;&nbsp;
		关键字：
		<input type="text" name="name" style="width: 200px;" value="${name}" placeholder="请输入关键字...">
		<input type="submit" class="btn btn-primary" value="搜索" />
	</form>
	<form class="js-ajax-form" action="# method="post">
		<table class="table table-hover table-bordered table-list" id="menus-table">
			<thead>
			<tr>
				<th width="50">ID</th>
				<th>名称</th>
				<th>分类</th>
				<th>添加时间</th>
				<th width="180">操作</th>
			</tr>
			</thead>

			<tbody>
			<c:forEach items="${pageResult.list}" var="list" varStatus="index">
				<tr>
					<td>${list.id}</td>
					<td>${list.name}</td>
					<td>${list.column.name}</td>
					<td>
						${list.addTime}
					</td>
					<td>
						<!--<a href="{:U('GoodsAttribute/index',array('goodsId' => $list['id']))}">商品属性</a> |-->
						<a href="<%=request.getContextPath()%>/Notice/update?id=${list.id}">编辑</a> |
						<a href="<%=request.getContextPath()%>/Notice/delete?id=${list.id}" data-msg="确定要删除吗？" class="js-ajax-delete">删除</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../jsp/page.jsp"></jsp:include>
	</form>
</div>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
</body>
</html>