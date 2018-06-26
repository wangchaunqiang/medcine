<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0"/>
    <title>医疗信息查询网</title>
    <script type="text/javascript" src="resources/Bootstrap/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/Bootstrap/css/bootstrap.min.css"/>
    <script type="application/javascript" src="resources/Bootstrap/js/bootstrap.js"></script>
    <script src="resources/Bootstrap/js/jquery.serializejson.min.js" type="text/javascript"></script>
    <style type="text/css">
        html,
        body {
            background-image: url(resources/Bootstrap/img/背景4.jpg);
            height: 100%;
        / / box-shadow: 5 px 10 px 5 px #000;
        }

        .box {
            margin: 0 auto;
            position: relative;
            width: 100%;
            height: 100%;

        }

        .login-box {
            background-color: #84cb00;
            width: 100%;
            max-width: 500px;
            height: 400px;
            position: absolute;
            top: 50%;
            margin-top: -200px;
        / / box-shadow: 2 rem 2 rem gray;
            /*设置负值，为要定位子盒子的一半高度*/
        }

        @media screen and (min-width: 500px) {
            .login-box {
                left: 50%;
                /*设置负值，为要定位子盒子的一半宽度*/
                margin-left: -250px;
            }
        }

        .form {
            width: 100%;
            max-width: 500px;
            height: 275px;
            margin: 25px auto 0px auto;
            padding-top: 25px;
        }

        .login-content {
            height: 300px;
            width: 100%;
            max-width: 500px;
            background-color: #84cb00;
            float: left;
        }

        .input-group {
            margin: 0px 0px 30px 0px !important;
        }

        .form-control,
        .input-group {
            height: 40px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }

        .login-title {
            padding: 20px 10px;
            background-color: #84cb00;
        }

        .login-title h1 {
            margin-top: 10px !important;
        }

        .login-title small {
            color: #fff;
        }

        .link p {
            line-height: 20px;
            margin-top: 30px;
        }

        .btn-sm {
            margin-left: 20px;
            padding: 8px 24px !important;
            font-size: 16px !important;
        }

        .modal{
            left: 30%;
            top: 30%;
        }
    </style>
</head>
<body>
<div class="box">
    <div class="div"></div>
    <div class="login-box">
        <div class="img-responsive">
            <img src="resources/Bootstrap/img/logo.png" width="100px" height="40px" style="float: left;margin: 20px;"/>
        </div>
        <div class="login-title text-center">
            <h1>
                <small style="margin-right: 150px;">登录界面</small>
            </h1>
        </div>
        <div class="login-content ">
            <div class="form">
                <form action="userLogin" method="post">
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="text" id="username" name="username" class="form-control " placeholder="账号">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-bell"></span></span>
                                <input type="password" id="password" name="password" class="form-control " placeholder="密码">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-4 col-xs-offset-2 ">
                            <button type="submit" class="btn btn-sm btn-info"><span
                                    class="glyphicon glyphicon-off"></span> 登录
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-4 ">
                            <button type="button" id="padd" class="btn btn-sm btn-info">注册<span
                                    class="glyphicon glyphicon-arrow-right"></span>
                            </button>
                        </div>
                    </div>
                </form>
                <!-- 增加药方处理 -->
                <script type="text/javascript">
                    $(function() {
                        $('#username').blur(
                            function() {
                                if ($("#username").val().length == 0) {
                                    $('.result_text1').html("姓名不能为空！");
                                    $("#result_text1").modal({
                                        modal : "show"
                                    });
                                }
                            });
                        $('#password').blur(function() {
                            if ($("#password").val().length == 0) {
                                $('.result_text1').html("密码不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }
                        });
                    });
                </script>
                <script type="application/javascript">
                    $(function(){
                        $('#padd').click(function () {
                            $("#prescript_add").modal({
                                backdrop: 'static',
                                keyboard: true,
                                modal : "show"
                            });
                        });
                    })
                </script>
            </div>
            <!--注册模态框 -->
            <div class=" modal modal-lg" id="prescript_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true" >
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title" style="text-align: center;">用户注册</h4>
                    </div>
                    <div class="modal-body">
                        <form action="#" id="cancel_form" class="form-horizontal form-setting cancel_form " role="form">
                            <div class="form-group">
                                <label for="pname-cancel" class="col-sm-4 control-label">注册账号：</label>
                                <div class="col-sm-6">
                                    <input type="text" id="pname-cancel" name="username" placeholder="请输入注册账号"
                                               class="form-control input">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pcome" class="col-sm-4 control-label">注册密码：</label>
                                <div class="col-sm-6">
                                    <input type="password" id="pcome" name="password" class="form-control input">
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

            <!-- 用户注册处理 -->
            <script type="text/javascript">
                $(function() {
                    $('#submit-cancel').click(
                        function() {
                            if ($("#pname-cancel").val().length == 0) {
                                $('.result_text1').html("注册账号不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            } else if ($("#pcome").val().length == 0) {
                                $('.result_text1').html("注册密码不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }else {
                                $.ajax({
                                    contentType : "application/json;charset=utf-8",
                                    type : "POST",
                                    url : "user_register",
                                    dataType : "json",
                                    data : JSON.stringify($('#cancel_form').serializeJSON()),
                                    success : function(data) {
                                        $('.result_text').html("注册成功！");
                                        $("#result_text").modal({
                                            backdrop: 'static',
                                            keyboard: true,
                                            modal : "show"
                                        });
                                    },
                                    error : function(request) {
                                        $('.result_text').html("注册成功！");
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
                    <a type="button" class="btn btn-success" href="index" >确认</a>
                </div>
            </div>
        </div>

            <!-- 结果模态框1 -->
            <div class=" modal modal-lg" id="result_text1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
                 aria-hidden="true">
                <div class="modal-content">
                    <div class="modal-body result_text1" style="text-align: center;">
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
</body>