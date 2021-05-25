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
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
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
          <li class="nav-item ">
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
          <li class="nav-item active">
            <a class="nav-link active" href="ProgressFree.jsp">
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
            <a class="navbar-brand" href="javascript:;">Progress</a>
          </div>
		<!-- Nav-file Start -->
		<%@include file="Free-Nav-Bar.jsp"%>
		<!-- Nav-file End-->
      <!-- End Navbar -->
      <div class="content" id="contentpage">
        <div class="content">
          <div class="container-fluid" >
            <div class="row" >
			  <div class="col-md-9">
			  	<div class="card">
                  <div class="card-header card-header-icon card-header-primary">
                    <div class="card-icon">
                      <i class="material-icons">timeline</i>
                    </div>
                    <h4 class="card-title">Today's Diet - 
                    	<small id="total"></small><small> Calories Eaten</small>
                    </h4>
                  </div>
                  <div class="card-body">
                    <div id="todaychart" class="ct-chart"></div>
                  </div>
                </div>
			  </div>
			  <div class="col-md-3">
			  	<div class="card card-stats">
                  <div class="card-header card-header-primary card-header-icon">
                    <div class="card-icon">
                      <i class="fa fa-glass"></i>
                    </div>
                    <p class="card-category">Today's Water Intake (glass)</p>
                    <h3 class="card-title" id="water"></h3>
                  </div>
                  <div class="card-footer">
                  </div>
                </div>
			  </div>
			</div>
            <div class="row" >
			  <div class="col-md-12">
			  	<div class="card">
                  <div class="card-header card-header-icon card-header-primary">
                    <div class="card-icon">
                      <i class="material-icons">timeline</i>
                    </div>
                    <h4 class="card-title">7 Days Diet
                      <small> - Calorie</small>
                    </h4>
                  </div>
                  <div class="card-body">
                    <div id="weeklyChart" class="ct-chart"></div>
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
    	$.post('UserGetTodayIntakeServlet', {
		}, function(responseText) {
			$('#water').text(responseText);
		});
    	var bre=0,lun=0,din=0,sn=0,total=0,ex=0;
    	function gentoday() {
    		var data = {
    				  labels: ['Breakfast', 'Lunch', 'Dinner', 'Snack'],
    				  series: [
    				    [bre, lun, din, sn]
    				  ]
    				};

    				var options = {
    				    seriesBarDistance: 10,
    				    axisX: {
    				        showGrid: false
    				    },
    				    height: "245px"
    				};

    				var responsiveOptions = [
    				  ['screen and (max-width: 640px)', {
    				    seriesBarDistance: 5,
    				    axisX: {
    				      labelInterpolationFnc: function (value) {
    				        return value[0];
    				      }
    				    }
    				  }]
    				];

    				Chartist.Line('#todaychart', data, options, responsiveOptions);
		}
    	$.get('UserGetTodayIntakeServlet', {
    		type : 'Breakfast'
		}, function(responseText) {
			bre = parseInt(responseText);
			total =total+bre;
			$('#total').text(total);
			gentoday();
		});
    	$.get('UserGetTodayIntakeServlet', {
    		type : 'Lunch'
		}, function(responseText) {
			lun = parseInt(responseText);
			total = total+lun;
			$('#total').text(total);
			gentoday();
		});
    	$.get('UserGetTodayIntakeServlet', {
    		type : 'Dinner'
		}, function(responseText) {
			din = parseInt(responseText);
			total = total+din;
			$('#total').text(total);
			gentoday();
		});
    	$.get('UserGetTodayIntakeServlet', {
    		type : 'Snack'
		}, function(responseText) {
			sn = parseInt(responseText);
			total = total+sn;
			$('#total').text(total);
			gentoday();
		});
    	
    		
    	var l1 = moment().format("MMM Do");
    	var l2 = moment().subtract(1, 'days').format("MMM Do");
    	var l3 = moment().subtract(2, 'days').format("MMM Do");
    	var l4 = moment().subtract(3, 'days').format("MMM Do");
    	var l5 = moment().subtract(4, 'days').format("MMM Do");
    	var l6 = moment().subtract(5, 'days').format("MMM Do");
    	var l7 = moment().subtract(6, 'days').format("MMM Do");
    	
    	//weekly
    	var d1=0,d2=0,d3=0,d4=0,d5=0,d6=0,d7;
    	function weeklygen() {
    		var data = {
    				  labels: [l7, l6, l5, l4, l3, l2, l1  ],
    				  series: [
    				    [d7, d6, d5, d4, d3, d2, d1]
//    , 				    [142, 243, 320, 180, 353, 453, 226, 134, 268, 210, 156, 695]
    				  ]
    				};

    				var options = {
    				    seriesBarDistance: 10,
    				    axisX: {
    				        showGrid: false
    				    },
    				    height: "245px"
    				};

    				var responsiveOptions = [
    				  ['screen and (max-width: 640px)', {
    				    seriesBarDistance: 5,
    				    axisX: {
    				      labelInterpolationFnc: function (value) {
    				        return value[0];
    				      }
    				    }
    				  }]
    				];

    				Chartist.Line('#weeklyChart', data, options, responsiveOptions);
		}
    	
    	
    	$.get('GetWeeklyIntakeServlet', {
    		day : '0'
		}, function(responseText) {
			d1 = parseInt(responseText);
			weeklygen();
		});
    	$.get('GetWeeklyIntakeServlet', {
    		day : '1'
		}, function(responseText) {
			d2 = parseInt(responseText);
			weeklygen();
		});
    	$.get('GetWeeklyIntakeServlet', {
    		day : '2'
		}, function(responseText) {
			d3 = parseInt(responseText);
			weeklygen();
		});
    	$.get('GetWeeklyIntakeServlet', {
    		day : '3'
		}, function(responseText) {
			d4 = parseInt(responseText);
			weeklygen();
		});
    	$.get('GetWeeklyIntakeServlet', {
    		day : '4'
		}, function(responseText) {
			d5 = parseInt(responseText);
			weeklygen();
		});
    	$.get('GetWeeklyIntakeServlet', {
    		day : '5'
		}, function(responseText) {
			d6 = parseInt(responseText);
			weeklygen();
		});
		$.get('GetWeeklyIntakeServlet', {
    		day : '6'
		}, function(responseText) {
			d7 = parseInt(responseText);
			weeklygen();
		});
    });
    
  </script>
  
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
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();

      md.initVectorMap();

    });
  </script>
</body>
</html>