<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0"/>
    <title>医疗信息后台系统</title>
    <script type="text/javascript" src="resources/Bootstrap/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/Bootstrap/css/bootstrap.min.css"/>
    <script type="application/javascript" src="resources/Bootstrap/js/bootstrap.js"></script>
    <style type="text/css">
        html,
        body {
            background: -webkit-radial-gradient(top left ellipse, rgba(222, 11, 70, 0.26) -160%, rgba(255, 255, 255, 0) 103%), -webkit-radial-gradient(center, ellipse cover, #0C1019 0%, #0B0B0E 100%);
            background: radial-gradient(ellipse at top left, rgba(222, 11, 70, 0.26) -160%, rgba(255, 255, 255, 0) 103%), -webkit-radial-gradient(center, ellipse cover, #0C1019 0%, #0B0B0E 100%);
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
            background-color: #385286;
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
            background-color: #385286;
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
            background-color: #2A3C62;
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
            left: 30%
        }
    </style>
</head>
<body>
<div class="box">
    <div class="div"></div>
    <div class="login-box">
        <div class="img-responsive">
            <img src="resources/Bootstrap/img/logo.png"  style="float: left;margin: 20px;width: 120px;height: 60px;margin-left: 0
"/>
        </div>
        <div class="login-title text-center">
            <h1>
                <small style="margin-right: 150px;">管理员登录界面</small>
            </h1>
        </div>
        <div class="login-content ">
            <div class="form">
                <form action="muserLogin" method="post">
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
                    <div class="form-group form-actions">
                        <div class="col-xs-4 col-xs-offset-4 ">
                            <button type="submit" class="btn btn-sm btn-info"><span
                                    class="glyphicon glyphicon-off"></span> 登录
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