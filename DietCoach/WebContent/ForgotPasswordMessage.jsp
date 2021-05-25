<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="asset/img/logo.png">
  <link rel="icon" type="image/png" href="asset/img/logo.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Diet Coach</title>

<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="asset/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="asset/css/material-dashboard.min1c51.css?v=2.1.2"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="asset/demo/demo.css" rel="stylesheet" />
</head>

<body class="off-canvas-sidebar">
	<!-- Extra details for Live View on GitHub Pages -->
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top text-white">
		<div class="container">
			<div class="navbar-wrapper">
				<a class="navbar-brand" href="javascript:;">Forgot Password</a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				aria-controls="navigation-index" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="sr-only">Toggle navigation</span> <span
					class="navbar-toggler-icon icon-bar"></span> <span
					class="navbar-toggler-icon icon-bar"></span> <span
					class="navbar-toggler-icon icon-bar"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end">
				<ul class="navbar-nav">
					<li class="nav-item"><a href="index.jsp"
						class="nav-link"> <i class="material-icons">dashboard</i>
							Home
					</a></li>
					<li class="nav-item "><a href="RegistrationServlet" class="nav-link">
							<i class="material-icons">person_add</i> Register
					</a></li>
					<li class="nav-item"><a href="Login.jsp"
						class="nav-link"> <i class="material-icons">fingerprint</i>
							Login
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->
	<div class="wrapper wrapper-full-page">
		<div class="page-header login-page header-filter" filter-color="black"
			style="background-image: url('asset/img/home.jpg'); background-size: cover; background-position: top center;">
			<!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
			<div class="container" id="con">
				<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-8 ml-auto mr-auto">
						<div class="card card-nav-tabs text-center">
							<div class="card-header card-header-primary"><h4 class="card-title">Check your mailbox</h4></div>
							<div class="card-body">
								<h4 class="card-title"><%=request.getAttribute("email") %></h4>
								<p class="card-text">We have sent you a mail with your login details. Please log in with the given details in the mail and change your login details for your convenience.</p>
								<a href="Login.jsp" class="btn btn-primary">Go back to login</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">
				<div class="container">
					<nav class="float-left">
						<ul>
							<li><a href="index.jsp"> Diet Coach
									</a></li>
							<li><a href="AboutUs.jsp">
									About Us </a></li>
						</ul>
					</nav>
					<div class="copyright float-right">
						&copy;
						<script>
							document.write(new Date().getFullYear())
						</script>
						, made with <i class="material-icons">favorite</i> by <a
							href="index.jsp" target="_blank">Diet Coach
							</a>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script src="asset/js/core/jquery.min.js"></script>
	<script src="asset/js/core/popper.min.js"></script>
	<script src="asset/js/core/bootstrap-material-design.min.js"></script>
	<script src="asset/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>
	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="asset/js/core/buttons.js"></script>
	<!-- Chartist JS -->
	<script src="asset/js/plugins/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="asset/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="asset/js/material-dashboard.min1c51.js?v=2.1.2"
		type="text/javascript"></script>
	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="asset/demo/demo.js"></script>
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
	<script>
		$(document).ready(function() {
			md.checkFullPageBackgroundImage();
			setTimeout(function() {
				// after 1000 ms we add the class animated to the login/register card
				$('.card').removeClass('card-hidden');
			}, 700);
		});
	</script>
</body>
</html>