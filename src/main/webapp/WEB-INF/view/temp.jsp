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
<script src="resources/Bootstrap/js/core.js" type="text/javascript"></script>
<link href="resources/Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="application/javascript" src="resources/Bootstrap/js/jquery-1.11.0.js"></script>
<script type="application/javascript" src="resources/Bootstrap/js/bootstrap.js"></script>
<script type="application/javascript" src="resources/Bootstrap/js/bootstrap-table.js"></script>
<script type="application/javascript" src="resources/Bootstrap/js/bootstrap-table-zh-CN.js"></script>
<script src="resources/Bootstrap/js/jquery.serializejson.min.js" type="text/javascript"></script>
<style type="text/css">
.form-control {
	height: auto;
}

    .modal{
        left: 30%;
        top: 30%;
    }
</style>
<script type="text/javascript">
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});
</script>
</head>
	<body>
	<div class="container-fluid background">
		<div class="row">
			<div class="col-xs-3">
				<a href="temp"><img class="loge" src="resources/Bootstrap/img/logo.png"></a>
			</div>

			<div class="col-xs-6">
				<h2><marquee behavior="alternate">医疗信息查询网</marquee></h2>
			</div>
			<div class="col-xs-3"><h3>欢迎你:${user.username}</h3></div>
		</div>
	</div>
		<div class="index-con" style="z-index: 0">
			<ul>
				<li class="in-jbk in-plan" style="float: left; right: auto;">
					<div class="in-block">
						<a href="info" title="药品查询" style="background: #0be75e;"> <i style="display: block;"></i> <span
							class="ch1" style="display: inline;">药品查询</span> <i class="in-none" style="display: none;"></i> <span
							class="in-text" style="display: none;">不知道有什么药？<br>点这里查询
						</span>
						</a>
					</div>
				</li>
				<li class="in-jbk in-report" style="float: left; right: auto;">
					<div class="in-block">
						<a href="pinfo" title="药方查询" style="background: fuchsia;" > <i
							style="display: block;"></i> <span class="ch1" style="display: inline;">药方查询</span> <i class="in-none"
							style="display: none;"></i> <span class="in-text" style="display: none;">想知道有什么独家药方？<br>这里可以帮您
						</span>
						</a>
					</div>
				<li class="in-jbk in-plan" style="left: 335px; margin-right: 0">
					<div class="in-block">
						<a href="words" title="公告留言"  style="background: #D1B2DB;"> <i
							class="bigger"></i> <span class="ch" style="display: block;">公告留言</span> <i class="in-none"></i> <span
							class="in-text" style="display: none;"> 你有没有什么想说的<br> 来这里留下你的发言
						</span>
						</a>
					</div>
				</li>
				<li class="in-jbk in-plan" style="top: 154px; left: 335px; margin-right: 0">
					<div class="in-block">
						<a href="user_manager" title="信息修改" style="background: #FF9E6D;"> <i style="display: block;"></i> <span
							class="ch1" style="display: inline;">信息修改</span> <i class="in-none" style="display: none;"></i> <span
							class="in-text" style="display: none;"> 想修改信息？<br>来点我吧
						</span>
						</a>
					</div>
				</li>
				<li class="in-jbk in-plan" style="left: 669px;">
					<div class="in-block">
						<a href="words_look" title="留言查看"> <i style="display: block;"></i> <span class="ch1"
							style="display: inline;">留言查看</span> <i class="in-none" style="display: none;"></i> <span class="in-text"
							style="display: none;"> 想知道每天药品实时情况？<br>来这里查看
						</span>
						</a>
					</div>
				</li>
				<li class="in-jbk in-report" style="left: 669px;">
					<div class="in-block">
						<a href="out" title="退出系统" > <i style="display: block;"></i> <span class="ch1" style="display: inline;">退出系统</span>
							<i class="in-none" style="display: none;"></i> <span class="in-text" style="display: none;"> 点击立马退出系统<br>来点击我退出
						</span>
						</a>
					</div>
				</li>
			</ul>
		</div>
		<script>
			seajs.use('jquery', function($) {
				$(function() {
					$(".index-con .in-kct").hover(
							function() {
								$(this).find('i:first').addClass('smaller')
										.removeClass('bigger')
								$(this).find('span:first').fadeOut('')
								$(this).find('.in-text').show('fast').addClass(
										'show1')
								$(this).find('.ch').removeClass('show1')
							},
							function() {
								$(this).find('i:first').removeClass('smaller')
										.addClass('bigger')
								$(this).find('span:first').fadeIn('')
								$(this).find('.in-text').hide('').removeClass(
										'fast')
								$(this).find('.ch').addClass('show1')
							})
					$(".index-con .in-jbk").hover(
							function() {
								$(this).find('i:first').addClass('hide1')
								$(this).find('span:first').hide('')
								$(this).find('.in-text').show('').addClass(
										'show1')
								// var num = $(this).index('.in-jbk') + 1;
								//$(this).find('.in-none').show('').addClass('toLeft' + num).removeClass('toRight' + num)
								$(this).find('.in-none').show('').addClass(
										'toLeft1').removeClass('toRight1')
								$(this).find('.ch1').removeClass('show1')
							},
							function() {
								$(this).find('i:first').addClass('hide1')
								$(this).find('span:first').fadeIn('')
								$(this).find('.in-text').hide('').removeClass(
										'show1')
								//var num = $(this).index('.in-jbk') + 1;
								//$(this).find('.in-none').show('').addClass('toRight' + num).removeClass('toLeft' + num)
								//$(this).find('.in-none').show('').addClass('toRight' + num).removeClass('toLeft' + num)
								$(this).find('.in-none').show('').addClass(
										'toRight1').removeClass('toLeft1')
								$(this).find('.ch1').addClass('show1')
							})
				})
			});
		</script>
    <!-- 结果模态框 -->
    <div class=" modal modal-lg" id="result_text" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-hidden="true">
        <div class="modal-content">
            <div class="modal-body text-primary result_text" style="text-align: center;font-size: 40px">
            </div>
        </div>
    </div>
	</body>
</html>
