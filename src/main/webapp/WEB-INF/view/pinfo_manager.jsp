<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>药方管理</title>
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
 .result_text2{
	top: 40%;
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
               url: '${pageContext.request.contextPath }/list_prescript',
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
               uniqueId: "mid",         //每一行的唯一标识，一般为主键列
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
                       field : 'pid',
                       title : '药方ID',
                       align : 'center',
                       sortable:true
              	
                   }, {
                       field : 'pname',
                       title : '药方名称',
                       align : 'center'
                      
                   }, {
                       field : 'pgroup',
                       title : '方剂组成',
                       align : 'center'
                      
                   }, {
                       field : 'ptype',
                       title : '分类',
                       align : 'center'
                   },
                   {
                       field : 'pcome',
                       title : '出处',
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
                $('#pname-cancel1').val(row.pname);
                $('#pgroup-cancel1').val(row.pgroup);
                $('#ptype-cancel1').val(row.ptype);
                $('#pcome1').val(row.pcome);
                $('#pinfo1').val(row.pinfo);
            	$($element).addClass('info');
            	  $("#manager_check").modal({
      				modal : "show"
      				});
                $('#prescript_delete').click(function () {
                    $.get("prescript_delete", { pid: row.pid },
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
			<h1 class="text-center text-primary">药方查询</h1>
			<div style="float: left;">
					<a  id="padd" class="btn btn-primary btn-lg" style="margin-top: 10px" >增加药方</a>
			</div>
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
								<a id="prescript_delete" class="btn btn-primary btn-lg" style="margin-top: 10px" >删除该药方</a>
						</div>
						<h4 class="modal-title" style="text-align: center;">
							药方详情</h4>
					</div>
					<div class="modal-body modal-text">
						<form action="#" id="cancel_form1" class="form-horizontal form-setting cancel_form" role="form">
							<div class="form-group">
								<label for="pname-cancel" class="col-sm-4 control-label">药方名：</label>
								<div class="col-sm-6">
									<div class="input-group">
										<input type="text" id="pname-cancel1" name="pname" placeholder="请输入药方名"
											   class="form-control input">
									</div>
								</div>
								<div class="col-sm-2">
									<span id="chargingCardId-span1"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="pgroup-cancel" class="col-sm-4 control-label">药方组成：</label>
								<div class="col-sm-6">
									<input type="text" class="form-control input" id="pgroup-cancel1" name="pgroup" placeholder="请输入药方组成">
								</div>
							</div>
							<div class="form-group">
								<label for="ptype-cancel" class="col-sm-4 control-label">药方种类：</label>
								<div class="col-sm-6">
									<input type="text" id="ptype-cancel1" name="ptype" placeholder="请输入药方种类" class="form-control input"> <span
										id="money-span1"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="pcome" class="col-sm-4 control-label">药方来源：</label>
								<div class="col-sm-6">
									<input type="text" id="pcome1" name="pcome" placeholder="请输入药方来源" class="form-control input"> <span
										id="pcome-span1"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="pinfo" class="col-sm-4 control-label">药方详情：</label>
								<div class="col-sm-6">
									<textarea type="textarea" id="pinfo1" name="pinfo" cols="50" rows="10" placeholder="请输入药方详情" class="form-control"></textarea>
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
			<!-- 修改药方处理 -->
			<script type="text/javascript">
                $(function() {
                    $('#submit-cancel1').click(
                        function() {
                            if ($("#pname-cancel1").val().length == 0) {
                                $('.result_text1').html("药房名不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            } else if ($("#pcome1").val().length == 0) {
                                $('.result_text1').html("药房来源不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }else if ($("#pgroup-cancel1").val().length == 0) {
                                $('.result_text1').html("药房组成不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }else if ($("#ptype-cancel1").val().length == 0) {
                                $('.result_text1').html("药房种类不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }else if ($("#pinfo1").val().length == 0) {
                                $('.result_text1').html("药房种类不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }else {
                                $.ajax({
                                    contentType : "application/json;charset=utf-8",
                                    type : "POST",
                                    url : "prescript_update",
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
			<!--增加药方模态框 -->
			<div class=" modal modal-lg" id="prescript_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
				 aria-hidden="true">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" style="text-align: center;">增加药方</h4>
					</div>
					<div class="modal-body">
						<form action="#" id="cancel_form" class="form-horizontal form-setting cancel_form" role="form">
							<div class="form-group">
								<label for="pname-cancel" class="col-sm-4 control-label">药房名：</label>
								<div class="col-sm-6">
									<div class="input-group">
										<input type="text" id="pname-cancel" name="pname" placeholder="请输入药房名"
											   class="form-control input">
									</div>
								</div>
								<div class="col-sm-2">
									<span id="chargingCardId-span"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="pgroup-cancel" class="col-sm-4 control-label">药方组成：</label>
								<div class="col-sm-6">
									<input type="text" class="form-control input" id="pgroup-cancel" name="pgroup" placeholder="请输入姓名">
								</div>
							</div>
							<div class="form-group">
								<label for="ptype-cancel" class="col-sm-4 control-label">药方种类：</label>
								<div class="col-sm-6">
									<input type="text" id="ptype-cancel" name="ptype" placeholder="请输入药方种类" class="form-control input"> <span
										id="money-span"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="pcome" class="col-sm-4 control-label">药方来源：</label>
								<div class="col-sm-6">
									<input type="text" id="pcome" name="pcome" placeholder="请输入药方来源" class="form-control input"> <span
										id="pcome-span"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="pcome" class="col-sm-4 control-label">药方详情：</label>
								<div class="col-sm-6">
									<textarea type="textarea" id="pinfo" name="pinfo" cols="50" rows="10" placeholder="请输入药方详情" class="form-control"></textarea>
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
                    $('#submit-cancel').click(
                        function() {
                            if ($("#pname-cancel").val().length == 0) {
                                $('.result_text1').html("药房名不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            } else if ($("#pcome").val().length == 0) {
                                $('.result_text1').html("药房来源不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }else if ($("#pgroup-cancel").val().length == 0) {
                                $('.result_text1').html("药房组成不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }else if ($("#ptype-cancel").val().length == 0) {
                                $('.result_text1').html("药房种类不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }else if ($("#pinfo").val().length == 0) {
                                $('.result_text1').html("药房种类不能为空！");
                                $("#result_text1").modal({
                                    modal : "show"
                                });
                            }else {
                                $.ajax({
                                    contentType : "application/json;charset=utf-8",
                                    type : "POST",
                                    url : "prescript_add",
                                    dataType : "json",
                                    data : JSON.stringify($('#cancel_form').serializeJSON()),
                                    success : function(data) {
                                        $('.result_text').html("增加成功！");
                                        $("#result_text").modal({
                                            backdrop: 'static',
                                            keyboard: true,
                                            modal : "show"
                                        });
                                    },
                                    error : function(request) {
                                        $('.result_text').html("增加成功！");
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
    <!-- 结果模态框1 -->
    <div class=" modal modal-lg result_text2" id="result_text1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-hidden="true">
        <div class="modal-content">
            <div class="modal-body result_text1" style="text-align: center;">
            </div>
        </div>
    </div>
    <!-- 结果模态框 -->
    <div class=" modal modal-lg" id="result_text" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-hidden="true">
        <div class="modal-content">
            <div class="modal-body result_text" style="text-align: center;">
            </div>
            <div class="modal-footer" style="text-align: center;">
                <a type="button" class="btn btn-success" href="pinfo_manager" >确认</a>
            </div>
        </div>
    </div>
	</body>
</html>