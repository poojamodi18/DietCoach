<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="asset/img/logo.png">
  <link rel="icon" type="image/png" href="asset/img/logo.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Diet Coach</title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!-- Extra details for Live View on GitHub Pages -->
  <!-- Canonical SEO -->
  <link rel="canonical" href="https://www.creative-tim.com/product/material-dashboard-pro" />
  <!--  Social tags      -->
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="asset/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="asset/css/material-dashboard.min1c51.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="asset/demo/demo.css" rel="stylesheet" />
  
</head>

<body class="">

  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="asset/img/side1.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo"><a href="index.jsp" class="simple-text logo-mini">
<!--           icon -->
        </a>
        <a href="index.jsp" class="simple-text logo-normal">
          Diet Coach
        </a></div>
      <div class="sidebar-wrapper" id="sidebarpage">
        <div class="user">
          <div class="photo">
            <img src="asset/img/faces/person.png" />
          </div>
          <div class="user-info">
            <a data-toggle="collapse" href="#collapseExample" class="username">
              <span>
                My Account
                <b class="caret"></b>
              </span>
            </a>
            <div class="collapse" id="collapseExample">
              <ul class="nav">
                <li class="nav-item">
                  <a class="nav-link" href="UserProfileServlet">
<!--                     <span class="sidebar-mini"> MP </span> -->
                    <span class="sidebar-normal"> My Profile </span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="UserPasswordServlet">
<!--                     <span class="sidebar-mini"> EP </span> -->
                    <span class="sidebar-normal"> Edit Password </span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="MemberShip.jsp">
<!--                     <span class="sidebar-mini"> EP </span> -->
                    <span class="sidebar-normal"> Membership Plans </span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <ul class="nav">
          <li class="nav-item active">
            <a class="nav-link" href="FreeDashboard.jsp">
              <i class="material-icons">dashboard</i>
              <p> Dashboard </p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="MealPlanServlet">
              <i class="material-icons">list_alt</i>
              <p> Meal Planner </p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="FoodSearchServlet">
              <i class="material-icons">post_add</i>
              <p> Daily Intake </p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="ProgressFree.jsp">
              <i class="material-icons">bar_chart</i>
              <p> Progress </p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="PurchaseBookServlet">
              <i class="material-icons">style</i>
              <p> Book-Shelf </p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="#" class="btn btn-primary" data-toggle="modal" data-target="#exersiceModal">
              <i class="material-icons">fitness_center</i>
              <p> Exercise </p>
            </a>
          </li>
          
          <li class="nav-item ">
            <a class="nav-link" href="LogoutServlet">
              <i class="material-icons">fingerprint</i>
              <p> Logout </p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel" >
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper" id="rowpage">
            <div class="navbar-minimize">
              <button id="minimizeSidebar" class="btn btn-just-icon btn-white btn-fab btn-round">
                <i class="material-icons text_align-center visible-on-sidebar-regular">more_vert</i>
                <i class="material-icons design_bullet-list-67 visible-on-sidebar-mini">view_list</i>
              </button>
            </div >
            <a class="navbar-brand" href="javascript:;">Dashboard</a>
          </div>
		<!-- Nav-file Start -->
		<%@include file="Free-Nav-Bar.jsp"%>
		<!-- Nav-file End-->
      <!-- End Navbar -->
      <div class="content" id="contentpage">
        <div class="content">
          <div class="container-fluid" >
            <div class="row" id="rowpage">
			  <div class="col-md-8">
			    <div class="rotating-card-container" style="height: 130%;">
			        <div class="card card-rotate card-background">
			            <div class="front front-background" style="background-image:url('asset/img/Dash.jpg');">
			                <div class="card-body">
			                    <h6 class="card-category"></h6>
			                    <a href="javascript:;">
			                        <h3 class="card-title">Meal Planner</h3>
			                    </a>
			                    <p class="card-description">
			                        Your daily meal plan personalized according to your preferences.
			                        <br>Every meal in this plan is made especially for you, We have also kept your daily nutritional value in mind for your health.
			                    </p>
			                </div>
			            </div>
			
			            <div class="back back-background" style="background-image: url('asset/img/Dash.jpg');">
			                <div class="card-body">
			                    <h5 class="card-title">
			                        More Information
			                    </h5>
			                    <p class="card-description">View your today's meal plan.</p>
			                    <div class="footer justify-content-center">
			                        <a href="MealPlanServlet" class="btn btn-primary">
			                            <i class="material-icons">subject</i>Meal Plan
			                        </a>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			  </div>
			  <div class="col-md-3">
			  <div class="row">
			  	<div class="col-md-12">
			  <%
			  	Cookie day = null;
			  	Cookie cookies[] = request.getCookies();
			  	 if( cookies != null ) {
			            
			            for (int i = 0; i < cookies.length; i++) {
// 			               day = cookies[i];
			               if(cookies[i].getName().equalsIgnoreCase("FreeDay")){
			            	   day = cookies[i];
			            	   %>
			            	   <div class="card card-stats">
				                  <div class="card-header card-header-primary card-header-icon">
				                    <div class="card-icon">
				                      <i class="material-icons">date_range</i>
				                    </div>
				                    <p class="card-category">Days</p>
				                    <input type="hidden" value="<%=day.getValue()%>" id="days">
				                    <h3 class="card-title"><%=day.getValue() %></h3>
				                  </div>
				                  <div class="card-body">
				                  	<p class="card-category">Left in your current plan.</p>
				                  </div>
				                  <div class="card-footer">
				                    <div class="stats">
				                      <i class="material-icons text-primary">warning</i>
				                      <a href="UserProfileServlet">Get More information</a>
				                    </div>
				                  </div>
				                </div>
			            	   
			            	   <%
			               }
			            }
			     } 
			   %>
			   </div>
			  </div>
              </div>
			</div>
            
            
            <h3>Other Features</h3>
            <br>
            <div class="row">
              <div class="col-md-4 ">
                <div class="card card-product">
                  <div class="card-header card-header-image" data-header-animation="true">
                    <a href="#pablo">
                      <img class="img" src="asset/img/Progress.JPG" >
                    </a>
                  </div>
                  <div class="card-body">
                    <div class="card-actions text-center">
                      <button type="button" class="btn btn-danger btn-link fix-broken-card">
                        <i class="material-icons">build</i> Fix Header!
                      </button>
                      <a href="MealPlanServlet" class="btn btn-primary btn-link" rel="tooltip" data-placement="bottom" title="View">
                        <i class="material-icons">art_track</i>
                      </a>
                    </div>
                    <h4 class="card-title">
                      <a href="#pablo">Progress</a>
                    </h4>
                    <div class="card-description">
                      Check your progress based on your daily food intake and exercise.
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4 ">
                <div class="card card-product">
                  <div class="card-header card-header-image" data-header-animation="true">
                    <a href="#pablo">
                      <img class="img" src="asset/img/Book.jpg" >
                    </a>
                  </div>
                  <div class="card-body">
                    <div class="card-actions text-center">
                      <button type="button" class="btn btn-danger btn-link fix-broken-card">
                        <i class="material-icons">build</i> Fix Header!
                      </button>
                      <a href="PurchaseBookServlet" class="btn btn-primary btn-link" rel="tooltip" data-placement="bottom" title="View">
                        <i class="material-icons">art_track</i>
                      </a>
                    </div>
                    <h4 class="card-title">
                      <a href="PurchaseBookServlet">eBooks</a>
                    </h4>
                    <div class="card-description">
						Download and read Books to expand your knowledge on health.
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4 ">
                <div class="card card-product">
                  <div class="card-header card-header-image" data-header-animation="true">
                    <a href="#pablo">
                      <img class="img" src="asset/img/Exercise.jpg" >
                    </a>
                  </div>
                  <div class="card-body">
                    <div class="card-actions text-center">
                      <button type="button" class="btn btn-danger btn-link fix-broken-card">
                        <i class="material-icons">build</i> Fix Header!
                      </button>
                      <a class="btn btn-primary btn-link" rel="tooltip" data-placement="bottom" title="View" data-toggle="modal" data-target="#exersiceModal">
                        <i class="material-icons">art_track</i>
                      </a>
                    </div>
                    <h4 class="card-title">
                      <a href="#" data-toggle="modal" data-target="#exersiceModal">Workout & Exercise</a>
                    </h4>
                    <div class="card-description">
						Exercise and workout plan to maintain your body.
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
		<!-- Footer Start -->
		<%@include file="material-footer.jsp"%>
		<!-- Footer End-->
    </div>
  </div>
  <!-- Setting button Start -->
	<%@include file="material-setting.jsp"%>
	<!-- Setting Button End -->
  <!--   Core JS Files   -->
  <script src="asset/js/core/jquery.min.js"></script>
  <script src="asset/js/core/popper.min.js"></script>
  <script src="asset/js/core/bootstrap-material-design.min.js"></script>
  <script src="asset/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="asset/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="asset/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="asset/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="asset/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="asset/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="asset/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="asset/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="asset/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="asset/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="asset/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="asset/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="asset/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
  <script src="asset/js/core/core.js"></script>
  <!-- Library for adding dinamically elements -->
  <script src="asset/js/plugins/arrive.min.js"></script>
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
    	var day = $('#days').val();
    	if(day<0){
    		$("#sidebarpage").css("opacity", "0.4");
    		$("#sidebarpage").css("pointer-events", "none");
    		$("#contentpage").css("opacity", "0.4");
    		$("#contentpage").css("pointer-events", "none");
    		$("#navpage").css("opacity", "0.4");
    		$("#navpage").css("pointer-events", "none");
    		$("footer").css("opacity", "0.4");
    		$("footer").css("pointer-events", "none");
    		$("#rowpage").append('<div class="alert alert-primary alert-dismissible fade show" role="alert"><strong>Oops!</strong> Your Free membership plan of 30 days is ended.<br> If you want to continue using Diet coach <a href="MemberShip.jsp">click here</a> to get premium membership.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
    	}
    	
    	
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
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();

      md.initVectorMap();

    });
  </script>
</body>
</html>