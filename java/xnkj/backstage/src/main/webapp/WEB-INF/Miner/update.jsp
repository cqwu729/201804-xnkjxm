<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../jsp/header.jsp"></jsp:include>
</head>
<body>
<div class="wrap js-check-wrap">
	<ul class="nav nav-tabs">
		<li ><a href="<%=request.getContextPath()%>/Miner/index">矿机管理</a></li>
		<li class="active"><a href="#">编辑矿机</a></li>
	</ul>
	<form action="<%=request.getContextPath()%>/Miner/post" method="post" class="form-horizontal js-ajax-forms" >
		<div class="row-fluid">
			<div class="span9">
				<table class="table table-bordered">
					<tr>
						<th style="width: 100px;">矿机名称</th>
						<td>
							<input type="text" style="width: 400px;" name="username" required value="${miner.username}" placeholder="请输入矿机名称"/>
							<input type="hidden" style="width: 400px;" name="id" required value="${miner.id}" placeholder="请输入矿机名称"/>
							<span class="form-required">*</span>
						</td>
					</tr>
					<tr>
						<th>价格</th>
						<td><input type="text" name="price" value="${miner.price}" required style="width: 400px"></td>
					</tr>
					<tr>
						<th>日收益</th>
						<td><input type="text" name="profit" value="${miner.profit}" required style="width: 400px"></td>
					</tr>
					<tr>
						<th>回本时间</th>
						<td><input type="text" name="returnTime" value="${miner.returnTime}" required style="width: 400px">天</td>
					</tr>
					<tr>
						<th>月收益</th>
						<td><input type="text" name="monthlyIncome" value="${miner.monthlyIncome}" required style="width: 400px"></td>
					</tr>
					<tr>
						<th>推荐一代</th>
						<td>
							<input type="text" name="generation" value="${miner.generation}" required style="width: 400px">
							<span class="form-required">(注：格式为0.06，表示为6%)</span>
						</td>
					</tr>
					<tr>
						<th>推荐二代</th>
						<td>
							<input type="text" name="twoGeneration" value="${miner.twoGeneration}" required style="width: 400px">
							<span class="form-required">(注：格式为0.06，表示为6%)</span>
						</td>
					</tr>
					<tr>
						<th>推荐无限代</th>
						<td>
							<input type="text" name="infiniteGeneration" value="${miner.infiniteGeneration}" required style="width: 400px">
							<span class="form-required">(注：格式为0.06，表示为6%，0则表示不存在无限代)</span>
						</td>
					</tr>
					<tr>
						<th>收益说明</th>
						<td>
							<textarea  name="remark" cols="3" style="width: 400px;">${miner.remark}</textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="span3">
				<table class="table table-bordered">
					<tr>
						<th>缩略图</th>
					</tr>
					<tr>
						<td>
							<div style="text-align: center;">
								<input type="hidden" name="picture" id="thumb" value="${miner.picture}">
								<a href="javascript:void(0);" onclick="flashupload('thumb_images', '附件上传','thumb',thumb_images,'1,jpg|jpeg|gif|png|bmp,1,,,1','','','');return false;">
									<c:if test="${not empty miner.picture}">
										<img src="${miner.picture}" id="thumb_preview" width="135" style="cursor: hand" />
									</c:if>
									<c:if test="${empty miner.picture}">
										<img src="<%=request.getContextPath()%>/images/default-thumbnail.png" id="thumb_preview" width="135" style="cursor: hand" />
									</c:if>
								</a>
								<input type="button" class="btn btn-small" onclick="$('#thumb_preview').attr('src','<%=request.getContextPath()%>/images/default-thumbnail.png');$('#thumb').val('');return false;" value="取消图片">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="form-actions">
			<button class="btn btn-primary js-ajax-submit" type="submit">保存</button>
			<a class="btn" href="<%=request.getContextPath()%>/Miner/index">返回</a>
		</div>
	</form>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/content_addtop.js"></script>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/js/ueditor/ueditor.config.js"></script>--%>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/js/ueditor/ueditor.all.min.js"></script>--%>
<script type="text/javascript">
    $(function() {
        $(".js-ajax-close-btn").on('click', function(e) {
            e.preventDefault();
            Wind.use("artDialog", function() {
                art.dialog({
                    id : "question",
                    icon : "question",
                    fixed : true,
                    lock : true,
                    background : "#CCCCCC",
                    opacity : 0,
                    content : "您确定需要关闭当前页面嘛？",
                    ok : function() {
                        setCookie("refersh_time", 1);
                        window.close();
                        return true;
                    }
                });
            });
        });
        /////---------------------
        Wind.use('validate', 'ajaxForm', 'artDialog', function() {
            //javascript
            //编辑器
            // editorcontent = new baidu.editor.ui.Editor();
            // editorcontent.render('remark');
            // try {
            //     editorcontent.sync();
            // } catch (err) {
            // }
            // //增加编辑器验证规则
            // jQuery.validator.addMethod('editorcontent', function() {
            //     try {
            //         editorcontent.sync();
            //     } catch (err) {
            //     }
            //     return editorcontent.hasContents();
            // });

            var form = $('form.js-ajax-forms');
            //ie处理placeholder提交问题
            if ($.browser.msie) {
                form.find('[placeholder]').each(function() {
                    var input = $(this);
                    if (input.val() == input.attr('placeholder')) {
                        input.val('');
                    }
                });
            }

            var formloading = false;
            //表单验证开始
            form.validate({
                //是否在获取焦点时验证
                onfocusout : false,
                //是否在敲击键盘时验证
                onkeyup : false,
                //当鼠标掉级时验证
                onclick : false,
                //验证错误
                showErrors : function(errorMap, errorArr) {
                    //errorMap {'name':'错误信息'}
                    //errorArr [{'message':'错误信息',element:({})}]
                    try {
                        $(errorArr[0].element).focus();
                        art.dialog({
                            id : 'error',
                            icon : 'error',
                            lock : true,
                            fixed : true,
                            background : "#CCCCCC",
                            opacity : 0,
                            content : errorArr[0].message,
                            cancelVal : '确定',
                            cancel : function() {
                                $(errorArr[0].element).focus();
                            }
                        });
                    } catch (err) {
                    }
                },
                //验证规则
                rules : {
                    'slide_name' : {
                        required : 1
                    }
                },
                //验证未通过提示消息
                messages : {
                    'slide_name' : {
                        required : '请输入名称'
                    }
                },
                //给未通过验证的元素加效果,闪烁等
                highlight : false,
                //是否在获取焦点时验证
                onfocusout : false,
                //验证通过，提交表单
                submitHandler : function(forms) {
                    if (formloading)
                        return;
                    $(forms).ajaxSubmit({
                        url : form.attr('action'), //按钮上是否自定义提交地址(多按钮情况)
                        dataType : 'json',
                        beforeSubmit : function(arr, $form, options) {
                            formloading = true;
                        },
                        success : function(data, statusText, xhr, $form) {
                            formloading = false;
                            if (data.code == 0) {
                                setCookie("refersh_time", 1);
                                //添加成功
                                Wind.use("artDialog", function() {
                                    art.dialog({
                                        id : "succeed",
                                        icon : "succeed",
                                        fixed : true,
                                        lock : true,
                                        background : "#CCCCCC",
                                        opacity : 0,
                                        content : data.msg,
                                        button : [ {
                                            name : '继续编辑？',
                                            callback : function() {
                                                reloadPage(window);
                                                return true;
                                            },
                                            focus : true
                                        }, {
                                            name : '返回列表',
                                            callback : function() {
                                                location.href = "<%=request.getContextPath()%>/Miner/index";
                                                return true;
                                            }
                                        } ]
                                    });
                                });
                            } else {
                                isalert(data.msg);
                            }
                        }
                    });
                }
            });
        });
        ////-------------------------
    });
</script>
</body>
</html>