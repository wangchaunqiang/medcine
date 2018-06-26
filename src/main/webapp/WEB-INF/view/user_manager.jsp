<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>医疗信息查询网</title>
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
	top: 30%;
}
</style>
</head>
<body>
	<div class="container-fluid background">
		<div class="row">
			<div class="col-xs-3">
				<a href="temp"><img class="loge" src="resources/Bootstrap/img/logo.png"></a>
			</div>
			<div class="col-xs-9">
				<h2><marquee behavior="alternate">医疗信息查询网</marquee></h2>
			</div>
		</div>
	</div>
	<div class="container" style="background-color: white;margin-top: 20px">
		<div class="panel panel-info">
			<div class="panel-heading font-bold text-center">
				<h3>用户信息修改</h3>
			</div>
			<div class="background-div panel-body">
				<form id="words_form" class="form-horizontal form-setting" role="form">
						<div class="row form-group">
							<label for="username" class="col-sm-4 control-label">姓名</label>
							<div class="col-sm-8">
								<input type="text" id="username" name="username" value="${user.username}" class="form-control input"
								style="width: 500px">
							</div>
						</div>
					<input type="hidden" name="uid" value="${user.uid}">
					<input type="hidden" name="status" value="${user.status}">
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">密码</label>
						<div class="col-sm-5">
							<input type="password" id="password" value="${user.password}" name="password" class="form-control input"
								   style="width: 500px">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-2">
							<button type="submit" id="submit" class="btn btn-default">提交</button>
						</div>
						<div class="col-sm-2">
							<button type="reset" id="reset" class="btn btn-default">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
		<!-- 修改用户处理 -->
		<script type="text/javascript">
            $(function() {
                $('#submit').click(
                    function() {
                        if ($("#username").val().length == 0) {
                            $('.result_text1').html("留言人不能为空！");
                            $("#result_text1").modal({
                                modal : "show"
                            });
                        } else if ($("#password").val().length == 0) {
                            $('.result_text1').html("留言主题不能为空！");
                            $("#result_text1").modal({
                                modal : "show"
                            });
                        }else {
                            $.ajax({
                                contentType : "application/json;charset=utf-8",
                                type : "POST",
                                url : "user_update",
                                dataType : "json",
                                data : JSON.stringify($('#words_form').serializeJSON()),
                                success : function(data) {
                                    $('.result_text').html("修改成功！");
                                    $("#result_text").modal({
                                        backdrop: 'static',
                                        keyboard: true,
                                        modal : "show"
                                    });
                                },
                                error : function(request) {
                                    $('.result_text').html("修改成功！");
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
	<div class=" modal modal-lg" id="result_text" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		 aria-hidden="true">
		<div class="modal-content">
			<div class="modal-body result_text" style="text-align: center;">
			</div>
			<div class="modal-footer" style="text-align: center;">
				<a type="button" class="btn btn-success" href="index" >请重新登录</a>
			</div>
		</div>
	</div>
</body>
</html>