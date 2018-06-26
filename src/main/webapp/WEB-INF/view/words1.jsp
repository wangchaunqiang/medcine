<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>药品查询</title>
    <link href="resources/Bootstrap/css/zxmk.css" rel="stylesheet" type="text/css" />
    <link href="resources/Bootstrap/css/head.css" rel="stylesheet" type="text/css" />
	<link href="resources/Bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="application/javascript" src="resources/Bootstrap/js/jquery-1.11.0.js"></script>
	<script type="application/javascript" src="resources/Bootstrap/js/bootstrap.js"></script>
	<script type="application/javascript" src="resources/Bootstrap/js/bootstrap-table.js"></script>
    <script type="application/javascript" src="resources/Bootstrap/js/bootstrap-table-zh-CN.js"></script>
	<script src="resources/Bootstrap/js/jquery.serializejson.min.js" type="text/javascript"></script>
<style type="text/css">
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
					<a href="temp2"><img class="loge" src="resources/Bootstrap/img/logo.png"></a>
			</div>
			<div class="col-xs-9">
					<h2><marquee behavior="alternate">医疗信息后台系统</marquee></h2>
            </div>
		</div>
	</div>
		<div class="container" style="background-color: white;margin-top: 20px">
			<div class="panel panel-info">
				<div class="panel-heading font-bold text-center">
					<h3>公告留言</h3>
				</div>
				<div class="background-div panel-body">
					<form action="" method="post" id="words_form" class="form-horizontal form-setting" role="form">
						<div class="form-group">
							<label for="wname" class="col-sm-4 control-label">姓名</label>
							<div class="col-sm-5">
								<input type="text" id="wname" name="wname" value="${user1.username}" class="form-control input">
							</div>
						</div>
						<div class="form-group">
							<label for="wtip" class="col-sm-4 control-label">主题</label>
							<div class="col-sm-5">
								<input type="text" id="wtip" name="wtip" placeholder="请输入主题" class="form-control input"> <span
									id="money-span"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="words" class="col-sm-4 control-label">内容：</label>
							<div class="col-sm-6">
								<textarea name="words" id="words" cols="50" rows="10"></textarea>
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

			<!-- 结果模态框 -->
			<div class=" modal modal-lg" id="result_text" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
				 aria-hidden="true">
				<div class="modal-content">
					<div class="modal-body result_text" style="text-align: center;">
					</div>
					<div class="modal-footer" style="text-align: center;">
							<a type="button" class="btn btn-success" href="words_manager" >确认</a>
					</div>
				</div>
			</div>

			<!-- 增加药方处理 -->
			<script type="text/javascript">
                $(function() {
                    $('#submit').click(
                        function() {
                            if ($("#wname").val().length == 0) {
                                alert("姓名不能为空！")
                            } else if ($("#wtip").val().length == 0) {
                                alert("主题不能为空！")
                            }else if ($("#words").val().length == 0) {
                                alert("留言不能为空！")
                            }else {
                                $.ajax({
                                    contentType : "application/json;charset=utf-8",
                                    type : "POST",
                                    url : "words_add",
                                    dataType : "json",
                                    data : JSON.stringify($('#words_form').serializeJSON()),
                                    success : function(data) {
                                        $('.result_text').html("增加成功！");
                                        $("#result_text").modal({
                                            backdrop: 'static',
                                            keyboard: true,
                                            modal : "show"
                                        });
                                    },
                                    error : function(request) {
                                        $('.result_text').html("增加失败！");
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
	</body>
</html>