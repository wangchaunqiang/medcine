<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>药方查询</title>
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
				$('.modal-text').html(row.pinfo);
            	$($element).addClass('info');
            	  $("#manager_check").modal({
      				modal : "show"
      				});
        	});
        });
</script>
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
			<h1 class="text-center text-primary">药方查询</h1>
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
						<h4 class="modal-title" style="text-align: center;">
							药方详情</h4>
					</div>
					<div class="modal-body modal-text">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>