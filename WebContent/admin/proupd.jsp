<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<script>
	function setImgPreview() {
		var docObj = document.getElementById("doc");
		var imgObj = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
					imgObj.style.display = 'block';
					imgObj.style.width = '100px';
					imgObj.style.height = '100px'
			imgObj.src = window.URL.createObjectURL(docObj.files[0]);
		}
	}
	function hide() {
		var obj = document.getElementById('comment');
		if (obj.style.display == 'block') {
			obj.style.display = 'none';
		} else {
			obj.style.display = 'block';
		}
	}
</script>
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<title>ICART外设商城后台</title>
<base href="<%=basePath%> ">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Font CSS (Via CDN) -->
<link rel='stylesheet' type='text/css'
	href='assets\fonts\font\Open.font'>
<link rel="stylesheet" type="text/css"
	href="assets\fonts\font\Roboto.font">
<!-- Theme CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/skin/default_skin/css/theme.css">
<!-- Admin Panels CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/admin-tools/admin-plugins/admin-panels/adminpanels.css">
<!-- Admin Forms CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/admin-tools/admin-forms/css/admin-forms.css">
<link rel="stylesheet" type="text/css" href="css.css" />
<style type="text/css">
a:link {
	text-decoration: none;
}
</style>
<script language="javascript">
	function checkdel() {
		if (!confirm("确认要删除？")) {
			window.event.returnValue = false;
		}
	}
</script>
</head>

<body class="Home-page sb-l-o sb-r-c">
	<!-- Start: Main -->
	<div id="main">
		<!-- Start: Header -->
		<header class="navbar navbar-fixed-top bg-dark">
		<div class="menu">
			<jsp:include page="../mhead.jsp" />
		</div>
		</header>
		<!-- End: Header -->

		<!-- Start: Sidebar -->
		<aside id="sidebar_left" class="nano nano-primary">
		<div class="nano-content">


			<!-- End: Sidebar Header -->

			<!-- sidebar menu -->
			<ul class="nav sidebar-menu">
				<li class="sidebar-label pt20">系统页面</li>
				<li class="active"><a href="admin/index.jsp"> <span
						class="glyphicons glyphicons-home"></span> <span
						class="sidebar-title">后台首页</span>
				</a></li>
				<li class="sidebar-label pt20">后台管理</li>
				<li><a class="accordion-toggle" href="#"> <span
						class="glyphicons glyphicons-parents"></span> <span
						class="sidebar-title">用户管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="GetAllUserServlet?urole=admin"> <span
								class="glyphicons glyphicons-old_man"></span>管理员信息管理
						</a></li>	
						<li><a href="GetAllUserServlet?urole=orduser"> <span
								class="glyphicons glyphicons-parents"></span>会员信息管理
						</a></li>
					</ul></li>
				<li><a class="accordion-toggle" href="#"> <span
						class="glyphicons glyphicons-file"></span> <span
						class="sidebar-title">订单管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="GetAllOrdServlet"> <span
								class="glyphicons glyphicons-upload"></span>订单信息管理
						</a></li>
					</ul></li>

				<li><a class="accordion-toggle" href="#"> <span
						class="glyphicons glyphicons-iphone"></span> <span
						class="sidebar-title">商品管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="admin/proadd.jsp"> <span
								class="glyphicons glyphicons-more"></span>商品信息录入
						</a></li>
						<li><a href="MainServlet"> <span
								class="glyphicons glyphicons-hand_up"></span>商品信息管理
						</a></li>
					</ul></li>

				<li><a class="accordion-toggle" href=""> <span
						class="glyphicons glyphicons-star"></span> <span
						class="sidebar-title">评论管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="GetAllComServlet"> <span
								class="glyphicons glyphicons-eye_open"></span>评论管理
						</a></li>
					</ul></li>
				<li><a class="accordion-toggle" href=""> <span
						class="glyphicons glyphicons-picture"></span> <span
						class="sidebar-title">轮播管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="admin/albumlist.jsp"> <span
								class="glyphicons glyphicons-picture"></span>轮播管理
						</a></li>
					</ul></li>
			</ul>
			<div class="sidebar-toggle-mini">
				<a href="#"> <span class="fa fa-sign-out"></span>
				</a>
			</div>
		</div>
		</aside>

		<!-- Start: Content -->
		<section id="content_wrapper"> <!-- Start: Topbar-Dropdown -->

		<!-- End: Topbar-Dropdown --> <!-- Start: Topbar --> <header
			id="topbar">
		<div class="topbar-left">
			<ol class="breadcrumb">
				<li class="crumb-active"><a href="#"
					style="text-decoration: none; font-family: 幼圆; font-size: 15px;">商品列表</a>
				</li>
				<li class="crumb-icon"><span class="glyphicon glyphicon-home"></span>
			</ol>
		</div>
		</header> <!-- End: Topbar --> <!-- Begin: Content  This place write function()-->

		<div id="content">
			<div class="row">
				<div class="col-md-12">
					<div class="panel" style="height: 710px;">
						<div class="panel-heading">
							<span class="panel-title">修改商品信息 </span>
						</div>
						<div class="panel-body">
						<div style="position: absolute; margin-left: 700px;">
									<div class="col-lg-4">
									    点击头像可进行修改
										<img src="ProImgServlet?fname=${pro.proname}"
											style="width: 130px; height: 130px; border-radius: 50%;"
											onclick="hide()">
									</div>
									<div id="comment" style="display: none;">
									    <form action="ImgUpdServlet">
										<input type="file" class="form-control" id="doc" name="propic"
											onchange="setImgPreview()">
										<p>
										<div id="LocalImg" align="center">
											<img id="preview" style="display: none;">
										</div>
										</p>
										<br>
										<input type="submit"
											class="btn btn-rounded btn-primary btn-block" value="保存" style="width:150px;"></input>
										</form>
									</div>

								</div>
							<form class="form-horizontal" role="form" method="get"
								action="ProUpdServlet">
								<div class="form-group">
									<label for="inputPassword" class="col-lg-3 control-label">商品名称</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" id="name" value="${pro.proname}"
											name="proname">
									    <input type="hidden" name="proid" value="${pro.proid}" />
									</div>
								</div>


								<div class="form-group">
									<label for="" class="col-lg-3 control-label">商品价格</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" id=""
											value="${pro.proprice}" name="proprice">
									</div>
								</div>

								<div class="form-group">
									<label for="" class="col-lg-3 control-label">商品种类</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" id=""
											value="${pro.proclass}" name="proclass">
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-lg-3 control-label">商品制造商</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" id=""
											value=" ${pro.profirm }" name="profirm">
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-lg-3 control-label">商品数量</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" id=""
											value="${pro.procount }" name="procount">
									</div>
								</div>

								<div class="form-group">
									<div class="col-xs-2"
										style="display: inline-block; position: relative; margin-left: 270px;">
										<input type="submit"
											class="btn btn-rounded btn-primary btn-block" value="提交"></input>
										<a href="MainServlet"
											class="btn btn-rounded btn-primary btn-block"
											style="margin-top: 17px;">返回</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>


		<!-- End: Content  This place write function()--> </section>
		<!-- End: Content-Wrapper -->
	</div>
	<!-- End: Main -->

	<!-- BEGIN: PAGE SCRIPTS -->

	<!-- jQuery -->
	<script type="text/javascript" src="vendor/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

	<!-- Bootstrap -->
	<script type="text/javascript"
		src="assets/js/bootstrap/bootstrap.min.js"></script>

	<!-- Sparklines CDN -->
	<script type="text/javascript" src="assets/js/jquery.sparkline.min.js"></script>

	<!-- Chart Plugins -->
	<script type="text/javascript"
		src="vendor/plugins/highcharts/highcharts.js"></script>
	<script type="text/javascript" src="vendor/plugins/circles/circles.js"></script>
	<script type="text/javascript" src="vendor/plugins/raphael/raphael.js"></script>

	<!-- Holder js  -->
	<script type="text/javascript" src="assets/js/bootstrap/holder.min.js"></script>

	<!-- Theme Javascript -->
	<script type="text/javascript" src="assets/js/utility/utility.js"></script>
	<script type="text/javascript" src="assets/js/main.js"></script>
	<script type="text/javascript" src="assets/js/demo.js"></script>

	<!-- Admin Panels  -->
	<script type="text/javascript"
		src="assets/admin-tools/admin-plugins/admin-panels/json2.js"></script>
	<script type="text/javascript"
		src="assets/admin-tools/admin-plugins/admin-panels/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript"
		src="assets/admin-tools/admin-plugins/admin-panels/adminpanels.js"></script>


	<!-- Datatables -->
	<script type="text/javascript"
		src="vendor/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="vendor/plugins/datatables/media/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="vendor/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>


	<!-- Page Javascript -->
	<script type="text/javascript" src="assets/js/pages/widgets.js"></script>
	<!-- Import  Main Javascript -->
	<script type="text/javascript" src="assets/js/pages/main.js"></script>
	<!-- 千万不能删除此js-->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('pre code').each(function(i, block) {
								hljs.highlightBlock(block);
							});

							// Select all text in CSS Generate Modal
							$('#modal-close').click(function(e) {
								e.preventDefault();
								$('.datatables-demo-modal').modal('toggle');
							});

							$('.datatables-demo-code').on(
									'click',
									function() {
										var modalContent = $(this).prev();
										var modalContainer = $(
												'.datatables-demo-modal').find(
												'.modal-body')

										// Empty Modal of Existing Content
										modalContainer.empty();

										// Clone Content and Place in Modal
										modalContent.clone(modalContent)
												.appendTo(modalContainer);

										// Toggle Modal
										$('.datatables-demo-modal').modal({
											backdrop : 'static'
										})
									});

							// Init Datatables with Tabletools Addon    
							$('#datatable').dataTable();

							$('#datatable2')
									.dataTable(
											{
												"aoColumnDefs" : [ {
													'bSortable' : false,
													'aTargets' : [ -1 ]
												} ],
												"oLanguage" : {
													"oPaginate" : {
														"sPrevious" : "",
														"sNext" : ""
													}
												},
												"iDisplayLength" : 5,
												"aLengthMenu" : [
														[ 5, 10, 25, 50, -1 ],
														[ 5, 10, 25, 50, "All" ] ],
												"sDom" : '<"dt-panelmenu clearfix"lfr>t<"dt-panelfooter clearfix"ip>',
												"oTableTools" : {
													"sSwfPath" : "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
												}
											});

							$('#datatable3')
									.dataTable(
											{
												"aoColumnDefs" : [ {
													'bSortable' : false,
													'aTargets' : [ -1 ]
												} ],
												"oLanguage" : {
													"oPaginate" : {
														"sPrevious" : "",
														"sNext" : ""
													}
												},
												"iDisplayLength" : 5,
												"aLengthMenu" : [
														[ 5, 10, 25, 50, -1 ],
														[ 5, 10, 25, 50, "All" ] ],
												"sDom" : 'T<"dt-panelmenu clearfix"lfr>t<"dt-panelfooter clearfix"ip>',
												"oTableTools" : {
													"sSwfPath" : "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
												}
											});

							$('#datatable4')
									.dataTable(
											{
												"aoColumnDefs" : [ {
													'bSortable' : false,
													'aTargets' : [ -1 ]
												} ],
												"oLanguage" : {
													"oPaginate" : {
														"sPrevious" : "",
														"sNext" : ""
													}
												},
												"iDisplayLength" : 5,
												"aLengthMenu" : [
														[ 5, 10, 25, 50, -1 ],
														[ 5, 10, 25, 50, "All" ] ],
												"sDom" : 'T<"panel-menu dt-panelmenu"lfr><"clearfix">tip',

												"oTableTools" : {
													"sSwfPath" : "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
												}
											});

							// Multi-Column Filtering
							$('#datatable5 thead th')
									.each(
											function() {
												var title = $(
														'#datatable5 tfoot th')
														.eq($(this).index())
														.text();
												$(this)
														.html(
																'<input type="text" class="form-control" placeholder="Search ' + title + '" />');
											});

							// DataTable
							var table5 = $('#datatable5').DataTable({
								"sDom" : 't<"dt-panelfooter clearfix"ip>',
								"ordering" : false
							});

							// Apply the search
							table5
									.columns()
									.eq(0)
									.each(
											function(colIdx) {
												$(
														'input',
														table5.column(colIdx)
																.header())
														.on(
																'keyup change',
																function() {
																	table5
																			.column(
																					colIdx)
																			.search(
																					this.value)
																			.draw();
																});
											});

							// ABC FILTERING
							var table6 = $('#datatable6').DataTable({
								"sDom" : 't<"dt-panelfooter clearfix"ip>',
								"ordering" : false
							});

							var alphabet = $('<div class="dt-abc-filter"/>')
									.append(
											'<span class="abc-label">Search:</span> ');
							var columnData = table6.column(0).data();
							var bins = bin(columnData);

							$('<span class="clear active"/>')
									.data('letter', '').data('match-count',
											columnData.length).html('None')
									.appendTo(alphabet);

							for (var i = 0; i < 26; i++) {
								var letter = String.fromCharCode(65 + i);

								$('<span/>').data('letter', letter).data(
										'match-count', bins[letter] || 0)
										.addClass(!bins[letter] ? 'empty' : '')
										.html(letter).appendTo(alphabet);
							}

							$('#datatable6').parents('.panel').find(
									'.panel-menu').html(alphabet);

							alphabet.on('click', 'span', function() {
								alphabet.find('.active').removeClass('active');
								$(this).addClass('active');

								_alphabetSearch = $(this).data('letter');
								table6.draw();
							});

							var info = $('<div class="alphabetInfo"></div>')
									.appendTo(alphabet);

							var _alphabetSearch = '';

							$.fn.dataTable.ext.search
									.push(function(settings, searchData) {
										if (!_alphabetSearch) {
											return true;
										}
										if (searchData[0].charAt(0) === _alphabetSearch) {
											return true;
										}
										return false;
									});

							function bin(data) {
								var letter, bins = {};
								for (var i = 0, ien = data.length; i < ien; i++) {
									letter = data[i].charAt(0).toUpperCase();

									if (bins[letter]) {
										bins[letter]++;
									} else {
										bins[letter] = 1;
									}
								}
								return bins;
							}

							// ROW GROUPING
							var table7 = $('#datatable7')
									.DataTable(
											{
												"columnDefs" : [ {
													"visible" : false,
													"targets" : 2
												} ],
												"order" : [ [ 2, 'asc' ] ],
												"sDom" : 't<"dt-panelfooter clearfix"ip>',
												"displayLength" : 25,
												"drawCallback" : function(
														settings) {
													var api = this.api();
													var rows = api.rows({
														page : 'current'
													}).nodes();
													var last = null;

													api
															.column(
																	2,
																	{
																		page : 'current'
																	})
															.data()
															.each(
																	function(
																			group,
																			i) {
																		if (last !== group) {
																			$(
																					rows)
																					.eq(
																							i)
																					.before(
																							'<tr class="row-label '
																									+ group
																											.replace(
																													/ /g,
																													'')
																											.toLowerCase()
																									+ '"><td colspan="5">'
																									+ group
																									+ '</td></tr>');
																			last = group;
																		}
																	});
												}
											});

							// Order by the grouping
							$('#datatable7 tbody').on(
									'click',
									'tr.row-label',
									function() {
										var currentOrder = table7.order()[0];
										if (currentOrder[0] === 2
												&& currentOrder[1] === 'asc') {
											table7.order([ 2, 'desc' ]).draw();
										} else {
											table7.order([ 2, 'asc' ]).draw();
										}
									});

							$('.dataTables_filter input').attr("placeholder",
									"Enter Filter Terms Here....");

							$.fn.editable.defaults.mode = 'popup';
							$('.xedit').editable();

						});
	</script>
</body>

</html>