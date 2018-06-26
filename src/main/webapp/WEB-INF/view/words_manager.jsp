<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言查看</title>
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
			top: 20%;
		}
	</style>
<script type="application/javascript">
        $(function(){
        	function init(){
           $("#device_table").bootstrapTable({
               method:'get',
               dataType:'json',
               cache: false,
               striped: true,
               dataField: "rows",
               totalField: "total",
               sidePagination: "server",      
               url: '${pageContext.request.contextPath }/words_list',
               pagination:true,
               queryParamsType:'',
               queryParams : function(params) {
                   return {  
                       pageNumber: params.pageNumber,   //页面大小
                       pageSize:  params.pageSize,//页码
                       searchText: params.searchText
                   };
               },
               minimumCountColumns:2,
               search : true,	
               pageNumber:1,                       //初始化加载第一页，默认第一页
               pageSize: 10, 					 //每页的记录行数（*）
               pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
               uniqueId: "wid",         //每一行的唯一标识，一般为主键列
               search : true,
               clickToSelect: true,//是否启用点击选中行
               responseHandler:function(res) {
              	 console.log(res);
                 return {
                     'total': res[0].total,
                     'rows': res[0].rows
                    
                 };
             },
               columns: [{
                   //field: 'Number',//可不加
                   title: 'Number',//标题  可不加
                   formatter: function (value, row, index) {
                       return index+1;
                   }
               },
                   {
                       field : 'wid',
                       title : '留言ID',
                       align : 'center',
                       sortable:true
              	
                   }, {
                       field : 'wname',
                       title : '留言人',
                       align : 'center'
                      
                   }, {
                       field : 'wtip',
                       title : '留言主题',
                       align : 'center'
                      
                   }]
           });
        	}
        	 init();
        	 $("#refresh").click(function() {
         		$("#device_table").bootstrapTable('destroy'); 
         		init();
         	});
        });
        $(function() {
        	$('#device_table').on('click-row.bs.table', function (e,row,$element) {
            	$('.info').removeClass('info');//去除之前选中的行的，选中样式
                $('#wid').val(row.wid);
                $('#wname').val(row.wname);
                $('#wtip').val(row.wtip);
                $('#words').val(row.words);
            	$($element).addClass('info');
            	  $("#manager_check").modal({
      				modal : "show"
      				});
                $('#words_delete').click(function () {
                    $.get("words_delete", { wid: row.wid },
                        function(data){
                            $('.result_text').html("删除成功！");
                            $("#result_text").modal({
                                backdrop: 'static',
                                keyboard: true,
                                modal : "show"
                            });
                        })
                })
        	});
        });
</script>
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
			<h1 class="text-center text-primary">留言查看</h1>
			<div class="row" style="margin: 40px">
				<table class="col-xs-12 table table-bordered" id="device_table">
				</table>
			</div>
			<div class=" modal modal-lg" id="manager_check" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
				aria-hidden="true">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<div style="float: left;">
								<a id="words_delete" class="btn btn-primary btn-lg" style="margin-top: 10px" >删除该留言</a>
						</div>
						<h4 class="modal-title" style="text-align: center;">留言</h4>
					</div>
					<div class="modal-body modal-text">
						<form action="#" id="cancel_form1" class="form-horizontal form-setting cancel_form" role="form">
							<div class="form-group">
								<label for="wname" class="col-sm-4 control-label">留言人：</label>
								<div class="col-sm-6">
									<div class="input-group">
										<input type="text" id="wname" name="wname" placeholder="请输入留言人"
											   class="form-control input">
									</div>
								</div>
							</div>
							<input type="hidden" id="wid" name="wid">
							<div class="form-group">
								<label for="wtip" class="col-sm-4 control-label">留言主题：</label>
								<div class="col-sm-6">
									<input type="text" id="wtip" name="wtip" placeholder="请输入留言主题" class="form-control input"> <span
										id="money-span1"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="words" class="col-sm-4 control-label">留言：</label>
								<div class="col-sm-6">
									<textarea type="textarea" id="words" name="words" placeholder="请输入留言"  cols="50" rows="10" class="form-control"></textarea>
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
		</div>
	<!-- 修改留言处理 -->
	<script type="text/javascript">
        $(function() {
            $('#submit-cancel1').click(
                function() {
                    if ($("#wname").val().length == 0) {
                        $('.result_text1').html("留言人不能为空！");
                        $("#result_text1").modal({
                            modal : "show"
                        });
                    } else if ($("#wtip").val().length == 0) {
                        $('.result_text1').html("留言主题不能为空！");
                        $("#result_text1").modal({
                            modal : "show"
                        });
                    }else if ($("#words").val().length == 0) {
                        $('.result_text1').html("留言不能为空！");
                        $("#result_text1").modal({
                            modal : "show"
                        });
                    }else {
                        $.ajax({
                            contentType : "application/json;charset=utf-8",
                            type : "POST",
                            url : "words_update",
                            dataType : "json",
                            data : JSON.stringify($('#cancel_form1').serializeJSON()),
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

	<!-- 删除模态框 -->
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

	</body>
</html>