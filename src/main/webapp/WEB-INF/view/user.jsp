<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>医疗信息后台系统</title>
    <link href="resources/Bootstrap/css/zxmk.css" rel="stylesheet" type="text/css" />
    <link href="resources/Bootstrap/css/head.css" rel="stylesheet" type="text/css" />
	<link href="resources/Bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="application/javascript" src="resources/Bootstrap/js/jquery-1.11.0.js"></script>
	<script type="application/javascript" src="resources/Bootstrap/js/bootstrap.js"></script>
	<script type="application/javascript" src="resources/Bootstrap/js/bootstrap-table.js"></script>
	<script type="application/javascript" src="resources/Bootstrap/js/bootstrap-table-zh-CN.js"></script>
	<script src="resources/Bootstrap/js/jquery.serializejson.min.js" type="text/javascript"></script>
<style type="text/css">
.input {
	width: 250px;
}
.modal{
	left: 30%;
	top: 20%;
}
</style>
</head>
<body>
	<div class="container-fluid background">
		<div class="row">
			<div class="col-xs-3">
				<a href="temp2"><img class="loge" src="resources/Bootstrap/img/logo.png"></a>
			</div>
			<div class="col-xs-9">
				<h2><marquee behavior="alternate">医疗信息后台系统</marquee></h2>
			</div>
		</div>
	</div>
	<div class="container" style="background: white; margin-top: 20px">
		<h1 class="text-center text-primary">用户管理</h1>
			<button class="btn btn-primary btn-lg" id="addUser">增加用户</button>
		<p></p>
		<div class="table-responsive">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>编号</th>
						<th>登录账户</th>
						<th>人员姓名</th>
						<th>账户类型</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listSysUsers}" var="item" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${item.username }</td>
							<td>${item.username }</td>
							<td>${item.status eq 0 ? "管理员" : "用户" }</td>
							<input type="hidden" class="idtx" value="${item.uid}"/>
							<td>
								<c:if test="${user1.status eq 0}">
                                    <a class="btn btn-info btn-lg"
                                       href="userDelete?uid=${item.uid}">删除</a> &nbsp;&nbsp;
									&nbsp;&nbsp;
								</c:if>
								<c:if test="${user1.username eq item.username}">
									<a class="btn btn-danger btn-lg updateUser"
                                    >修改信息</a>
								</c:if>
                            </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!--修改信息模态框 -->
		<div class=" modal modal-lg" id="updateUserModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			 aria-hidden="true">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" style="text-align: center;">修改信息</h4>
				</div>
				<div class="modal-body">
					<form  id="cancel_form1" class="form-horizontal form-setting cancel_form" role="form">
						<div class="form-group">
							<label for="pname-cancel" class="col-sm-4 control-label">姓名：</label>
							<div class="col-sm-6">
								<div class="input-group">
									<input type="text" id="pname-cancel1" name="username" disabled="disabled"
										value="${user1.username}"   class="form-control input">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="pgroup-cancel" class="col-sm-4 control-label">密码：</label>
							<div class="col-sm-6">
								<input type="password" value="${user1.password}" class="form-control input" id="pgroup-cancel1" name="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="status" class="col-sm-4 control-label">用户种类：</label>
							<div class="col-sm-6">
								<select name="status">
									<c:if test="${user1.status eq 0}">
										<option value="0" selected="selected">管理员</option>
										<option value="1">用户</option>
									</c:if>
									<c:if test="${user1.status eq 1}">
										<option value="0">管理员</option>
										<option value="1" selected="selected">用户</option>
									</c:if>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-4">
								<button type="submit" id="submit-cancel1" class="btn btn-default">提交</button>
							</div>
							<div class="col-sm-4">
								<button type="reset" id="reset-cancel1" class="btn btn-default">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 用户删除-->
		<script type="text/javascript">
            $(function() {

                if("${delete}" == "删除成功！"){
                    $('.result_text').html("操作员删除成功!");
                    $("#result_text").modal({
                        backdrop: 'static',
                        keyboard: true,
                        modal : "show"
                    });
                }
                    })
        </script>

		<script type="text/javascript">
            $(function() {
                $('.updateUser').each(function () {
                    $(this).click(
                        function () {
                            $("#updateUserModel").modal({
                                backdrop: 'static',
                                keyboard: true,
                                modal: "show"
                            });
                            $("#cancel_form1").submit(function () {
                                $.ajax({
                                    contentType : "application/json;charset=utf-8",
                                    type : "POST",
                                    url : "user_update",
                                    dataType : "json",
                                    data : JSON.stringify($('#cancel_form1').serializeJSON()),
                                    success : function(data) {
                                        $('.result_text').html(data);
                                        $("#result_text").modal({
                                            backdrop: 'static',
                                            keyboard: true,
                                            modal : "show"
                                        });
                                    },
                                    error : function(request) {
                                        $('.result_text').html("更新成功！");
                                        $("#result_text").modal({
                                            backdrop: 'static',
                                            keyboard: true,
                                            modal : "show"
                                        });
                                    }
                                });
                                return false;
                            })
                        }
                    );
                });

            });
		</script>

		<!--增加药方模态框 -->
		<div class=" modal modal-lg" id="addUserModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			 aria-hidden="true">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" style="text-align: center;">增加用户</h4>
				</div>
				<div class="modal-body">
					<form action="#" id="cancel_form" class="form-horizontal form-setting cancel_form" role="form">
						<div class="form-group">
							<label for="pname-cancel" class="col-sm-4 control-label">姓名：</label>
							<div class="col-sm-6">
								<div class="input-group">
									<input type="text" id="pname-cancel" name="username" placeholder="请输入姓名"
										   class="form-control input">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="pgroup-cancel" class="col-sm-4 control-label">密码：</label>
							<div class="col-sm-6">
								<input type="password" class="form-control input" id="pgroup-cancel" name="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="status" class="col-sm-4 control-label">用户种类：</label>
							<div class="col-sm-6">
								<select name="status" id="status">
									<option value="0" selected="selected">管理员</option>
									<option value="1">用户</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-4">
								<button type="submit" id="submit-cancel" class="btn btn-default">提交</button>
							</div>
							<div class="col-sm-4">
								<button type="reset" id="reset-cancel" class="btn btn-default">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 增加药方处理 -->
		<script type="text/javascript">
            $(function() {
                $('#addUser').click(
                    function() {
                        $("#addUserModel").modal({
                            backdrop: 'static',
                            keyboard: true,
                            modal : "show"
                        });
                }
				);


                $('#cancel_form').submit(
                    function() {
                        if ($("#pname-cancel").val().length == 0) {
                            $('.result_text1').html("姓名不能为空！");
                            $("#result_text1").modal({
                                modal : "show"
                            });
                        } else if ($("#pgroup-cancel").val().length == 0) {
                            $('.result_text1').html("密码不能为空！");
                            $("#result_text1").modal({
                                modal : "show"
                            });
                        }else {
                            $.ajax({
                                contentType : "application/json;charset=utf-8",
                                type : "POST",
                                url : "user_add",
                                dataType : "json",
                                data : JSON.stringify($('#cancel_form').serializeJSON()),
                                success : function(data) {
                                    $('.result_text').html(data);
                                    $("#result_text").modal({
                                        backdrop: 'static',
                                        keyboard: true,
                                        modal : "show"
                                    });
                                },
                                error : function(request) {
                                    $('.result_text').html("添加成功！");
                                    $("#result_text").modal({
                                        backdrop: 'static',
                                        keyboard: true,
                                        modal : "show"
                                    });
                                }
                            });
                        }
                        return false;
                    });
            });
		</script>
	</div>
	<!-- 结果模态框 -->
	<div class=" modal modal-lg" id="result_text" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		 aria-hidden="true">
		<div class="modal-content">
			<div class="modal-body result_text" style="text-align: center;">
			</div>
			<div class="modal-footer" style="text-align: center;">
				<a type="button" class="btn btn-success" href="user" >确认</a>
			</div>
		</div>
	</div>
	</div>

	<!-- 结果模态框1 -->
	<div class=" modal modal-lg result_text2" id="result_text1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		 aria-hidden="true">
		<div class="modal-content">
			<div class="modal-body result_text1" style="text-align: center;">
			</div>
		</div>
	</div>
</body>
</html>