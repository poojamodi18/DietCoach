<%@page import="com.utility.MealType"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.beans.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="material-head.jsp"%>
<!-- CSS Files -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
</style>

<!--  <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/css/bootstrap.css" rel="stylesheet"/>  -->

<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-ui.js"></script>
<script src="assets/js/bootstrap.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 						$("[data-toggle='popover']")
						// 								.popover(
						// 										{
						// 											placement : 'right',
						// 											html : true,
						// 											title : 'User Info <a href="" class="close" data-dismiss="alert">&times;</a>',
						// 											content : '<div class="media"><a href="" class="pull-left">link</a><div class="media-body"><h4 class="media-heading">Jhon Carter</h4><hr><p>Excellent Bootstrap popover! I really love it.</p><button type="button" class="close" data-toggle="modal" data-target="#exampleModalLong">List</button></div></div>'
						// 										});
						$(document).on("click", ".popover .close", function() {
							$(this).parents(".popover").popover('hide');
						});

						$("[rel='popover']")
								.popover(
										{
											placement : 'right',
											html : true,
											title : 'User Info <a href="" class="close" data-dismiss="alert">&times;</a>',
											content : '<div class="media"><a href="" class="pull-left">link</a><div class="media-body"><h4 class="media-heading">Jhon Carter</h4><hr><p>Excellent Bootstrap popover! I really love it.</p><button type="button" class="close" data-toggle="modal" data-target="#exampleModalLong">List</button></div></div>'
										});

// 						$(".autocomplete")
// 								.autocomplete(
// 										{
// 											source : function(request, response) {
// 												$
// 														.ajax({
// 															url : '@Url.Content("~/DietPlan/FoodSearchServlet")',
// 															type : 'GET',
// 															contentType : 'application/json',
// 															dataType : "json",
// 															data : JSON
// 																	.stringify({
// 																		foodname : 2,
// 																		searchStr : me
// 																				.val()
// 																	}),
// 															success : function(
// 																	data) {
// 																if (data.success) {
// 																	console
// 																			.log('success');
// 																	response($
// 																			.map(
// 																					data.data,
// 																					function(
// 																							item) {

// 																						return {
// 																							label : "("
// 																									+ item.foodid
// 																									+ ") "
// 																									+ item.foodname
// 																									+ " "
// 																									+ item.calories
// 																									+ ", "
// 																									+ item.mealtype,
// 																							foodid : item.foodid
// 																						}
// 																					}));
// 																}
// 															}
// 														});
// 											},
// 											minLength : 3
// 										});

					});
</script>
</head>

<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="white"
			data-image="assets/img/sidebar-1.jpg">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
			<!-- Logo Start -->
			<%@include file="material-logo.jsp"%>
			<!-- Logo End -->

			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item active  "><a class="nav-link"
						href="dashboard.jsp"> <i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="user.jsp">
							<i class="material-icons">person</i>
							<p>User Profile</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="tables.jsp">
							<i class="material-icons">content_paste</i>
							<p>Table List</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="typography.jsp"> <i class="material-icons">library_books</i>
							<p>Typography</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="icons.jsp">
							<i class="material-icons">bubble_chart</i>
							<p>Icons</p>
					</a>
					<li class="nav-item "><a class="nav-link"
						href="notifications.jsp"> <i class="material-icons">notifications</i>
							<p>Notifications</p>
					</a>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<%@include file="material-nav.jsp"%>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-7 col-md-12">
							<div class="card">
								<div class="card-header card-header-tabs card-header-primary">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="nav-item"><a class="nav-link active" href=""
													data-toggle="tab"> <i class="material-icons">emoji_food_beverage</i>
														Breakfast
														<div class="ripple-container"></div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active" id="breakfastdiv">
											<table class="table">
												<tbody id="breakfast">
													<!-- 													<button type="button" title="Regenerate meal" -->
													<!-- 														class="btn btn-primary btn-link btn-sm" -->
													<!-- 														id="regenBreakfast"> -->
													<!-- 														<i class="material-icons">refresh</i>Regenerate -->
													<!-- 													</button> -->
													<form class="navbar-form">
														<div class="input-group no-border">
															<input type="text" value="" class="form-control autocomplete"
																placeholder="Search..." id="autocomplete">
															<button type="submit"
																class="btn btn-white btn-round btn-just-icon">
																<i class="material-icons">search</i>
																<div class="ripple-container"></div>
															</button>
														</div>
													</form>
													<!-- 													<button type="button" id="popBreakfast" -->
													<!-- 														class="btn btn-primary" data-toggle="popover" -->
													<!-- 														rel="popover">Click Me</button> -->
													<tr id="">
														<td><img alt='' src="" height=80px " width="80px"
															style="border-radius: 8px;"></td>
														<td>val.foodname</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Food"
																data-placement="right"
																class="btn btn-primary btn-link btn-sm">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove Food"
																data-placement="right"
																class="btn btn-primary btn-link btn-sm">
																<i class="material-icons">more_horiz</i>
															</button>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-7 col-md-12">
							<div class="card">
								<div class="card-header card-header-tabs card-header-primary">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="nav-item"><a class="nav-link active" href=""
													data-toggle="tab"> <i class="material-icons">restaurant</i>
														Lunch
														<div class="ripple-container"></div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active" id="lunchdiv">
											<table class="table">
												<tbody id="lunch">
													<button type="button" title="Regenerate meal"
														class="btn btn-primary btn-link btn-sm" id="regenLunch">
														<i class="material-icons">refresh</i>Regenerate
													</button>
													<button type="button" id="popLunch" class="btn btn-primary"
														data-toggle="popover" rel="popover">Click Me</button>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-7 col-md-12">
							<div class="card">
								<div class="card-header card-header-tabs card-header-primary">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="nav-item"><a class="nav-link active" href=""
													data-toggle="tab"> <i class="material-icons">restaurant</i>
														Dinner
														<div class="ripple-container"></div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active" id="dinnerdiv">
											<table class="table">
												<tbody id="dinner">
													<button type="button" title="Regenerate meal"
														class="btn btn-primary btn-link btn-sm" id="regenDinner">
														<i class="material-icons">refresh</i>Regenerate
													</button>
													<button type="button" id="popDinner"
														class="btn btn-primary" data-toggle="popover"
														rel="popover">Click Me</button>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-7 col-md-12">
							<div class="card">
								<div class="card-header card-header-tabs card-header-primary">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="nav-item"><a class="nav-link active" href=""
													data-toggle="tab"> <i class="material-icons">fastfood</i>
														Snack
														<div class="ripple-container"></div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active" id="snackdiv">
											<table class="table">
												<tbody id="snack">
													<button type="button" title="Regenerate meal"
														class="btn btn-primary btn-link btn-sm" id="regenSnack">
														<i class="material-icons">refresh</i>Regenerate
													</button>
													<button type="button" id="popSnack" class="btn btn-primary"
														data-toggle="popover" rel="popover">Click Me</button>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal starts -->
					<div class="modal fade" id="exampleModalLong" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLongTitle"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">Modal
										title</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="tab-content">
										<table class="table">
											<tbody id="modalbody">
											</tbody>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<!-- 															<button type="button" class="btn btn-primary">Save -->
									<!-- 																changes</button> -->
								</div>
							</div>
						</div>
					</div>
					<!-- Modal ends -->
				</div>
			</div>
			<!-- Footer Start -->
			<%@include file="material-footer.jsp"%>
			<!-- Footer End-->
		</div>
	</div>
	<!-- Setting button Start -->
<%-- 		<%@include file="material-setting.jsp"%> --%>
	<!-- Setting Button End -->
	<!--   Core JS Files   -->
<!-- 	TEST -->

<!-- <script src="assets/js/core-dash/jquery.min.js"></script> -->
	<script src="assets/js/core-dash/popper.min.js"></script>
	<script src="assets/js/core-dash/bootstrap-material-design.min.js"></script>
	<script src="assets/js/plugins-dash/perfect-scrollbar.jquery.min.js"></script>
	<!-- Plugin for the momentJs  -->
	<script src="assets/js/plugins-dash/moment.min.js"></script>
	<!--  Plugin for Sweet Alert -->
	<script src="assets/js/plugins-dash/sweetalert2.js"></script>
	<!-- Forms Validations Plugin -->
	<script src="assets/js/plugins-dash/jquery.validate.min.js"></script>
	<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
	<script src="assets/js/plugins-dash/jquery.bootstrap-wizard.js"></script>
	<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
	<script src="assets/js/plugins-dash/bootstrap-selectpicker.js"></script>
	<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script src="assets/js/plugins-dash/bootstrap-datetimepicker.min.js"></script>
	<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
	<script src="assets/js/plugins-dash/jquery.dataTables.min.js"></script>
	<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
	<script src="assets/js/plugins-dash/bootstrap-tagsinput.js"></script>
	<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
	<script src="assets/js/plugins-dash/jasny-bootstrap.min.js"></script>
	<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
	<script src="assets/js/plugins-dash/fullcalendar.min.js"></script>
	<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
	<script src="assets/js/plugins-dash/jquery-jvectormap.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="assets/js/plugins-dash/nouislider.min.js"></script>
	<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
	<!-- Library for adding dinamically elements -->
	<script src="assets/js/plugins/arrive.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chartist JS -->
	<script src="assets/js/plugins-dash/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="assets/js/plugins-dash/bootstrap-notify.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/material-dashboard.js?v=2.1.1"
		type="text/javascript"></script>
	<script src="assets/js/core/custom-select-menu.js"
		type="text/javascript"></script>
	<script>
		$(document)
				.ready(
						function() {
							$()
									.ready(
											function() {
												$sidebar = $('.sidebar');

												$sidebar_img_container = $sidebar
														.find('.sidebar-background');

												$full_page = $('.full-page');

												$sidebar_responsive = $('body > .navbar-collapse');

												window_width = $(window)
														.width();

												fixed_plugin_open = $(
														'.sidebar .sidebar-wrapper .nav li.active a p')
														.html();

												if (window_width > 767
														&& fixed_plugin_open == 'Dashboard') {
													if ($(
															'.fixed-plugin .dropdown')
															.hasClass(
																	'show-dropdown')) {
														$(
																'.fixed-plugin .dropdown')
																.addClass(
																		'open');
													}

												}

												$('.fixed-plugin a')
														.click(
																function(event) {
																	// Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
																	if ($(this)
																			.hasClass(
																					'switch-trigger')) {
																		if (event.stopPropagation) {
																			event
																					.stopPropagation();
																		} else if (window.event) {
																			window.event.cancelBubble = true;
																		}
																	}
																});

												$(
														'.fixed-plugin .active-color span')
														.click(
																function() {
																	$full_page_background = $('.full-page-background');

																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data-color',
																						new_color);
																	}

																	if ($full_page.length != 0) {
																		$full_page
																				.attr(
																						'filter-color',
																						new_color);
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.attr(
																						'data-color',
																						new_color);
																	}
																});

												$(
														'.fixed-plugin .background-color .badge')
														.click(
																function() {
																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'background-color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data-background-color',
																						new_color);
																	}
																});

												$('.fixed-plugin .img-holder')
														.click(
																function() {
																	$full_page_background = $('.full-page-background');

																	$(this)
																			.parent(
																					'li')
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.parent(
																					'li')
																			.addClass(
																					'active');

																	var new_image = $(
																			this)
																			.find(
																					"img")
																			.attr(
																					'src');

																	if ($sidebar_img_container.length != 0
																			&& $('.switch-sidebar-image input:checked').length != 0) {
																		$sidebar_img_container
																				.fadeOut(
																						'fast',
																						function() {
																							$sidebar_img_container
																									.css(
																											'background-image',
																											'url("'
																													+ new_image
																													+ '")');
																							$sidebar_img_container
																									.fadeIn('fast');
																						});
																	}

																	if ($full_page_background.length != 0
																			&& $('.switch-sidebar-image input:checked').length != 0) {
																		var new_image_full_page = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						'img')
																				.data(
																						'src');

																		$full_page_background
																				.fadeOut(
																						'fast',
																						function() {
																							$full_page_background
																									.css(
																											'background-image',
																											'url("'
																													+ new_image_full_page
																													+ '")');
																							$full_page_background
																									.fadeIn('fast');
																						});
																	}

																	if ($('.switch-sidebar-image input:checked').length == 0) {
																		var new_image = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						"img")
																				.attr(
																						'src');
																		var new_image_full_page = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						'img')
																				.data(
																						'src');

																		$sidebar_img_container
																				.css(
																						'background-image',
																						'url("'
																								+ new_image
																								+ '")');
																		$full_page_background
																				.css(
																						'background-image',
																						'url("'
																								+ new_image_full_page
																								+ '")');
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.css(
																						'background-image',
																						'url("'
																								+ new_image
																								+ '")');
																	}
																});

												$('.switch-sidebar-image input')
														.change(
																function() {
																	$full_page_background = $('.full-page-background');

																	$input = $(this);

																	if ($input
																			.is(':checked')) {
																		if ($sidebar_img_container.length != 0) {
																			$sidebar_img_container
																					.fadeIn('fast');
																			$sidebar
																					.attr(
																							'data-image',
																							'#');
																		}

																		if ($full_page_background.length != 0) {
																			$full_page_background
																					.fadeIn('fast');
																			$full_page
																					.attr(
																							'data-image',
																							'#');
																		}

																		background_image = true;
																	} else {
																		if ($sidebar_img_container.length != 0) {
																			$sidebar
																					.removeAttr('data-image');
																			$sidebar_img_container
																					.fadeOut('fast');
																		}

																		if ($full_page_background.length != 0) {
																			$full_page
																					.removeAttr(
																							'data-image',
																							'#');
																			$full_page_background
																					.fadeOut('fast');
																		}

																		background_image = false;
																	}
																});

												$('.switch-sidebar-mini input')
														.change(
																function() {
																	$body = $('body');

																	$input = $(this);

																	if (md.misc.sidebar_mini_active == true) {
																		$(
																				'body')
																				.removeClass(
																						'sidebar-mini');
																		md.misc.sidebar_mini_active = false;

																		$(
																				'.sidebar .sidebar-wrapper, .main-panel')
																				.perfectScrollbar();

																	} else {

																		$(
																				'.sidebar .sidebar-wrapper, .main-panel')
																				.perfectScrollbar(
																						'destroy');

																		setTimeout(
																				function() {
																					$(
																							'body')
																							.addClass(
																									'sidebar-mini');

																					md.misc.sidebar_mini_active = true;
																				},
																				300);
																	}

																	// we simulate the window Resize so the charts will get updated in realtime.
																	var simulateWindowResize = setInterval(
																			function() {
																				window
																						.dispatchEvent(new Event(
																								'resize'));
																			},
																			180);

																	// we stop the simulation of Window Resize after the animations are completed
																	setTimeout(
																			function() {
																				clearInterval(simulateWindowResize);
																			},
																			1000);

																});
											});
						});
	</script>
<!-- test2 -->
	<script type="text/javascript">
		// 	$(function () {
		// 		  $('[data-toggle="popover"]').popover()
		// 		})
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
	</script>
	<script type="text/javascript">
	$(function() {
		  var availableTags = [
		    "ActionScript", "AppleScript", "Asp", "BASIC", "C", "C++",
		    "Clojure", "COBOL", "ColdFusion", "Erlang", "Fortran",
		    "Groovy", "Haskell", "Java", "JavaScript", "Lisp", "Perl",
		    "PHP", "Python", "Ruby", "Scala", "Scheme"
		  ];
		  
		  $(".autocomplete").autocomplete({
		    source: availableTags
		  });
		});
	</script>
	<!--   End of Js Files -->
</body>
</html>