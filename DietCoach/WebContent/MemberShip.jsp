<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*" %>  
 <%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="asset/img/logo.png">
  <link rel="icon" type="image/png" href="asset/img/logo.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Diet Coach</title>
  
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="GENERATOR" content="Evrsoft First Page">
	
	 <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="asset/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="asset/css/material-dashboard.min1c51.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="asset/demo/demo.css" rel="stylesheet" />
  <style type="text/css">
  	.pricing-page .title {
    color: #fff;
    margin-top: 0px;
	}

	h2.title {
	    margin-bottom: 10px;
	}
  </style>
</head>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<body class="off-canvas-sidebar">

	  <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top text-white">
    <div class="container">
      <div class="navbar-wrapper">
        <a class="navbar-brand" href="javascript:;">Membership Plans</a>
      </div>
      <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
        <span class="sr-only">Toggle navigation</span>
        <span class="navbar-toggler-icon icon-bar"></span>
        <span class="navbar-toggler-icon icon-bar"></span>
        <span class="navbar-toggler-icon icon-bar"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a href="FreeDashboard.jsp" class="nav-link">
              <i class="material-icons">dashboard</i>
              Dashboard
            </a>
          </li>
          <li class="nav-item ">
            <a href="LogoutServlet" class="nav-link">
              <i class="material-icons">fingerprint</i>
              Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- End Navbar -->
	<div class="wrapper wrapper-full-page">
    <div class="page-header pricing-page header-filter" style="background-image: url('asset/img/bg-pricing.jpg')">
      <div class="container">
        <div class="row ">
          <div class="col-md-6 ml-auto mr-auto text-center">
            <h2 class="title">Pick the best plan for you</h2>
          </div>
        </div>        
        <div class="row ">
          <div class="col-md-3 ml-auto mr-auto">
            <div class="card card-pricing ">
              <h3 class="card-category"> 1 Month</h3>
              <div class="card-body">
                <div class="card-icon icon-primary ">
                  <i class="material-icons">account_balance_wallet</i>
                </div>
                <h3 class="card-title">199&#8377;</h3>
                <p class="card-description">Daily Customizable Meal-Plan with Food Recipe<br>Exercise and Workout Plans<br>Daily Food-Intake Log<br>The progress that counts daily consumed and burned calories<br>Free Books.</p>
              </div>
              <div class="card-footer justify-content-center ">
              	<form method="post" action="pgRedirect.jsp">

<!-- 					<label>ORDER_ID::*</label> -->
					<input type="hidden" id="ORDER_ID" tabindex="1" maxlength="20" size="20"
						name="ORDER_ID" autocomplete="off"
						value="ORDS_<%= randomInt %>">

<!-- 					<label>CUSTID ::*</label> -->
					<input type="hidden" id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST001"></td>

<!-- 					<label>INDUSTRY_TYPE_ID ::*</label> -->
					<input type="hidden" id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
<!-- 					<label>Channel ::*</label> -->
					<td><input type="hidden" id="CHANNEL_ID" tabindex="4" maxlength="12"
						size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
					
<!-- 					<label>txnAmount*</label> -->
					<input title="TXN_AMOUNT" tabindex="10"
						type="hidden" name="TXN_AMOUNT"
						value="199">
					
					<input value="Choose Plan" type="submit" class="btn btn-round btn-primary" onclick="">
				</form>
<!--                 <a href="#pablo" class="btn btn-round btn-primary">Choose Plan</a> -->
              </div>
            </div>
          </div>
          <div class="col-md-3 ml-auto mr-auto">
            <div class="card card-pricing ">
              <h3 class="card-category"> 3 Months</h3>
              <div class="card-body">
                <div class="card-icon icon-primary ">
                  <i class="material-icons">account_balance_wallet</i>
                </div>
                <h3 class="card-title">499&#8377;</h3>
                <p class="card-description">Daily Customizable Meal-Plan with Food Recipe<br>Exercise and Workout Plans<br>Daily Food-Intake Log<br>The progress that counts daily consumed and burned calories<br>Free Books.</p>
              </div>
              <div class="card-footer justify-content-center ">
              	<form method="post" action="pgRedirect.jsp">

<!-- 					<label>ORDER_ID::*</label> -->
					<input type="hidden" id="ORDER_ID" tabindex="1" maxlength="20" size="20"
						name="ORDER_ID" autocomplete="off"
						value="ORDS_<%= randomInt %>">

<!-- 					<label>CUSTID ::*</label> -->
					<input type="hidden" id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST001"></td>

<!-- 					<label>INDUSTRY_TYPE_ID ::*</label> -->
					<input type="hidden" id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
<!-- 					<label>Channel ::*</label> -->
					<td><input type="hidden" id="CHANNEL_ID" tabindex="4" maxlength="12"
						size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
					
<!-- 					<label>txnAmount*</label> -->
					<input title="TXN_AMOUNT" tabindex="10"
						type="hidden" name="TXN_AMOUNT"
						value="499">
					
					<input value="Choose Plan" type="submit" class="btn btn-round btn-primary" onclick="">
				</form>
<!--                 <a href="#pablo" class="btn btn-round btn-primary">Choose Plan</a> -->
              </div>
            </div>
          </div>
          <div class="col-md-3 ml-auto mr-auto">
            <div class="card card-pricing ">
              <h3 class="card-category"> 12 Months</h3>
              <div class="card-body">
                <div class="card-icon icon-primary ">
                  <i class="material-icons">account_balance_wallet</i>
                </div>
                <h3 class="card-title">1499&#8377;</h3>
                <p class="card-description">Daily Customizable Meal-Plan with Food Recipe<br>Exercise and Workout Plans<br>Daily Food-Intake Log<br>The progress that counts daily consumed and burned calories<br>Free Books.</p>
              </div>
              <div class="card-footer justify-content-center ">
              	<form method="post" action="pgRedirect.jsp">

<!-- 					<label>ORDER_ID::*</label> -->
					<input type="hidden" id="ORDER_ID" tabindex="1" maxlength="20" size="20"
						name="ORDER_ID" autocomplete="off"
						value="ORDS_<%= randomInt %>">

<!-- 					<label>CUSTID ::*</label> -->
					<input type="hidden" id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST001"></td>

<!-- 					<label>INDUSTRY_TYPE_ID ::*</label> -->
					<input type="hidden" id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
<!-- 					<label>Channel ::*</label> -->
					<td><input type="hidden" id="CHANNEL_ID" tabindex="4" maxlength="12"
						size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
					
<!-- 					<label>txnAmount*</label> -->
					<input title="TXN_AMOUNT" tabindex="10"
						type="hidden" name="TXN_AMOUNT"
						value="1499">
					
					<input value="Choose Plan" type="submit" class="btn btn-round btn-primary" onclick="">
				</form>
<!--                 <a href="#pablo" class="btn btn-round btn-primary">Choose Plan</a> -->
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--   Footer Start   -->
			<%@include file="material-footer.jsp"%>
			<!--   Footer End -->
    </div>
  </div>
	
	
	
	<!--   Core JS Files   -->
  <script src="asset/js/core/jquery.min.js"></script>
  <script src="asset/js/core/popper.min.js"></script>
  <script src="asset/js/core/bootstrap-material-design.min.js"></script>
  <script src="asset/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>
  <!-- Place this tag in your head or just before your close body tag. -->
  <script async defer src="asset/js/core/buttons.js"></script>
  <!-- Chartist JS -->
  <script src="asset/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="asset/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="asset/js/material-dashboard.min1c51.js?v=2.1.2" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="asset/demo/demo.js"></script>
	<script>
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
          if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
            $('.fixed-plugin .dropdown').addClass('open');
          }

        }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function() {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);

        });
      });
    });
  </script>
  <script>
    $(document).ready(function() {
      md.checkFullPageBackgroundImage();
    });
  </script>
</body>

</html>