<%@page import="com.utility.MealType"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.beans.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="asset/img/logo.png">
  <link rel="icon" type="image/png" href="asset/img/logo.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Diet Coach</title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="asset/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="asset/css/material-dashboard.min1c51.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="asset/demo/demo.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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

						var allFoodList = '<%=request.getAttribute("allFoodList")%>';
						var breakfastcombinations = '<%=request.getAttribute("breakFastCombinations")%>';
						var lunchcombinations = '<%=request.getAttribute("lunchCombinations")%>';
						var dinnercombinations = '<%=request.getAttribute("dinnerCombinations")%>';
						var snackcombinations = '<%=request.getAttribute("snackCombinations")%>';
						var arr = $.parseJSON(allFoodList);
						var breakfastList = $.parseJSON(breakfastcombinations);
						var lunchList = $.parseJSON(lunchcombinations);
						var dinnerList = $.parseJSON(dinnercombinations);
						var snackList = $.parseJSON(snackcombinations);
						
						foodgen(dinnerList,"#dinner");
						foodgen(snackList,"#snack");
						foodgen(breakfastList,"#breakfast");
						foodgen(lunchList,"#lunch");
						
						
						$("[rel='popover']").popover({
							placement : 'right',
							html : true,
							title : '<a href="" class="close" data-dismiss="alert">&times;</a>',
							content : '<div class="media"><div class="media-body"><button type="button" class="close" data-toggle="modal" data-target="#exampleModalLong" onclick="hidebody()"><p class="blockquote text-primary">List Alternative Meal Combination</p></button></div></div>'
							});
						$("#regenBreakfast").click(function regen() {
							$("#breakfast").empty();
							foodgen(breakfastList,"#breakfast");
						});
						$("#regenLunch").click(function regen() {
							$("#lunch").empty();
							foodgen(lunchList,"#lunch");
						});
						$("#regenDinner").click(function regen() {
							$("#dinner").empty();
							foodgen(dinnerList,"#dinner");
						});
						$("#regenSnack").click(function regen() {
							$("#snack").empty();
							foodgen(snackList,"#snack");
						});
						$("#popBreakfast").click(function list() {
							$("#modalbody").empty();
							for(var cnt=1;cnt<=20;cnt++){
								$("#modalbody").append("<h4>Combination : "+cnt+"</h4>");
							 	foodgen(breakfastList,"#modalbody");
							}
						});
						$("#popLunch").click(function list() {
							$("#modalbody").empty();
							for(var cnt=1;cnt<=20;cnt++){
								$("#modalbody").append("Combination : "+cnt);
							 	foodgen(lunchList,"#modalbody");
							}
						});
						$("#popDinner").click(function list() {
							$("#modalbody").empty();
							for(var cnt=1;cnt<=20;cnt++){
								$("#modalbody").append("Combination : "+cnt);
							 	foodgen(dinnerList,"#modalbody");
							}
						});
						$("#popSnack").click(function list() {
							$("#modalbody").empty();
							for(var cnt=1;cnt<=20;cnt++){
								$("#modalbody").append("Combination : "+cnt);
							 	foodgen(snackList,"#modalbody");
							}
						});
						function foodgen(meal,id) {
							var sr='';
							var carbs=0,protein=0,sugar=0,fat=0,fiber=0;
							var randomIn = randomIntFromInterval(0,meal.length);
							try {
								sr = meal[randomIn].split("~");
								}catch(err) { 
									$("#breakfast").empty();
									$("#lunch").empty();
									$("#dinner").empty();
									$("#snack").empty();
									foodgen(breakfastList,"#breakfast");
									foodgen(lunchList,"#lunch");
									foodgen(dinnerList,"#dinner");
									foodgen(snackList,"#snack");
								}
							for(var k=0;k<sr.length; k++){
							    jQuery.each(arr, function(x, val) {
										if(val.foodid==sr[k]){
											$(id).append("<tr data-id='"+val.foodid+"' data-carbs='"+val.carbs+"' data-protein='"+val.protein+"' data-sugar='"+val.sugar+"' data-fat='"+val.fat+"' data-fiber='"+val.fiber+"'><td><img alt='' src='data:image/jpeg;base64,"+val.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td rel='tooltip' data-html='true' title='<h5>Nutition Value</h5><hr><table><tr><td>Calories</td><td>"+val.calories+"</td></tr><tr><td>Carbs</td><td>"+val.carbs+"g</td></tr><tr><td>Protein</td><td>"+val.protein+"g</td></tr><tr><td>Fat</td><td>"+val.fat+"g</td></tr><tr><td>Sugar</td><td>"+val.sugar+"g</td></tr><tr><td>Fiber</td><td>"+val.fiber+"g</td></tr></table>' data-placement='right'>"+val.foodname+"</td><td>Quantity : "+val.quantity+"&nbsp;"+val.servingType+"</td> <td class='text-right'> <button type='button' rel='tooltip' title='Recipe' data-placement='right' class='btn btn-primary btn-link ' data-foodId='"+val.foodrecipeId+"' data-toggle='modal' data-target='.bd-example-modal-lg'><i class='material-icons'>receipt_long</i></button></td></tr>");
											carbs+=val.carbs;
											protein+=val.protein;
											sugar+=val.sugar;
											fat+=val.fat;
											fiber+=val.fiber;
										}
							    });
							}
							
						}
					});
// 	function regen() {
// 		foodgen(breakfastList,"#breakfast");
// 		foodgen(lunchlist,"#lunch");
// 	}
	
	function randomIntFromInterval(min, max) { // min and max included 
		  return Math.floor(Math.random() * (max - min + 1) + min);
		}
</script>
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
      <div class="sidebar-wrapper">
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
              </ul>
            </div>
          </div>
        </div>
        <ul class="nav">
          <li class="nav-item ">
            <a class="nav-link" href="dashboard.jsp">
              <i class="material-icons">dashboard</i>
              <p> Dashboard </p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link active" href="MealPlanServlet">
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
            <a class="nav-link" href="Progress.jsp">
              <i class="material-icons">bar_chart</i>
              <p> Progress </p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="UserDisplayBookServlet">
              <i class="material-icons">style</i>
              <p> Book-Shelf </p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="UserDisplayExerciseServlet">
              <i class="material-icons">fitness_center</i>
              <p> Exersice </p>
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
		<div class="main-panel">
			<!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-minimize">
              <button id="minimizeSidebar" class="btn btn-just-icon btn-white btn-fab btn-round">
                <i class="material-icons text_align-center visible-on-sidebar-regular">more_vert</i>
                <i class="material-icons design_bullet-list-67 visible-on-sidebar-mini">view_list</i>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;">Meal Planner</a>
          </div>
          <!-- Nav-file Start -->
		<%@include file="Premium-Nav-Bar.jsp"%>
		<!-- Nav-file End-->
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
												<li class="nav-item"><a class="nav-link active"
													href="" data-toggle="tab"> <i
														class="material-icons">emoji_food_beverage</i> Breakfast
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
														<button type="button" title="Regenerate meal" 
 																class="btn btn-primary btn-link btn-sm" id="regenBreakfast"> 
 																<i class="material-icons">refresh</i>Regenerate 
 															</button>
 														<button type="button" id="popBreakfast" class="btn btn-primary btn-link pull-right" data-toggle="popover" rel="popover"><i class="material-icons">expand_more</i></button>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>	
						<div class="col-md-5">
			                <div class="card card-chart">
			                  <div class="card-header card-header-icon card-header-primary">
			                    <div class="card-icon">
			                      <i class="material-icons">pie_chart</i>
			                    </div>
			                    <h4 class="card-title">Meal Plan Nutrition Value</h4>
			                  </div>
			                  <div class="card-body">
			                    <span><div class="ct-chart" id="piechart" style="height: 335px; width: 370px"></div></span> 
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
												<li class="nav-item"><a class="nav-link active"
													href="" data-toggle="tab"> <i
														class="material-icons">restaurant</i> Lunch
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
 														<button type="button" id="popLunch" class="btn btn-primary btn-link pull-right" data-toggle="popover" rel="popover"><i class="material-icons">expand_more </i></button>
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
												<li class="nav-item"><a class="nav-link active"
													href="" data-toggle="tab"> <i
														class="material-icons">restaurant</i> Dinner
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
 														<button type="button" id="popDinner" class="btn btn-primary btn-link pull-right" data-toggle="popover" rel="popover"><i class="material-icons">expand_more </i></button>
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
												<li class="nav-item"><a class="nav-link active"
													href="" data-toggle="tab"> <i
														class="material-icons">fastfood</i> Snack
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
 														<button type="button" id="popSnack" class="btn btn-primary btn-link pull-right" data-toggle="popover" rel="popover"><i class="material-icons">expand_more </i></button>
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
												aria-hidden="true" >
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLongTitle">Alternative Meal Combinations</h5>
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
								<!-- 			Show Food Recipe modal -->
									<div class="modal fade bd-example-modal-lg" tabindex="-1"
										role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header" id="titlemodal">
													<h4 class="modal-title" id="myLargeModalLabel"></h4>
													<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body" id="addRecipeBody">
													<table class="table">
														<tbody id="recipeCon">
														</tbody>
													</table>
												</div>
											</div>
											<input type="hidden" name="stepforrecipe" id="stepforrecipe">
										</div>
									</div>	
<!-- 										recipe ends -->
				</div>
			</div>
			<!-- Footer Start -->
			<%@include file="Premium-Footer.jsp"%>
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
<!--   breakfast recipe -->
  <script>
    $(document).ready(function() {
    	var btn = $('#breakfast tr td button');
   	 	var container = $('#recipeCon');
   	 	$('#titlemodal h4').empty();
		container.empty();
		
   	 	btn.on('click',function(){
		 	var $this = $(this),
		 	foodid = $this.data('foodid');
		 	$('#titlemodal h4').empty();
			container.empty();
			if(foodid>0){
	 			$.post('GetFoodRecipeByIDServlet', {
					foodid : foodid
	 			}, 
	 			function(responseText) {
						if (responseText.length > 2) {
							var val = JSON.parse(responseText);
							var ing = val.foodIngredients;
		 					var ingre = ing.split(".");
		 					var finaling = "<div class='row'><div class='col-md-4'>Ingredients</div><div class='col-md-4'>Quantity</div></div>";
		 					for(var k=0;k<ingre.length-1; k++)
		 					{
		 						var item = ingre[k].split("-");
								finaling=finaling+"<div class='row'><div class='col-md-4'>"+item[0]+"</div><div class='col-md-4'>"+item[1]+"</div></div>";
		 					}
		 					var resstep = val.recipe;
		 					var steps = resstep.split(";");
		 					var finalstep = "<div class='row'><div class='col-md-12'>Recipe Steps</div></div><br>";
		 					for(var n=0,m=1;n<steps.length;n++,m++)
		 					{
		 						finalstep=finalstep+"<div class='row'><div class='col-md-12'>Step "+m+" : "+steps[n]+"</div></div><br>";
		 					}
		 					$('#titlemodal h4').append(val.FoodName);
		 					container.append("<tr><td>"+finaling+"</td></tr><tr><td>"+finalstep+"</td></tr>");
						} 
						else{
							
						}
	 			});
			}else{
				container.append("<h4>Oops! Looks like we don't have recipe.</h4>");
			}
     });
    });
  </script>
<!--   lunch recipe -->
  <script>
    $(document).ready(function() {
    	var btn = $('#lunch tr td button');
   	 	var container = $('#recipeCon');
   	 	$('#titlemodal h4').empty();
		container.empty();
		
   	 	btn.on('click',function(){
		 	var $this = $(this),
		 	foodid = $this.data('foodid');
		 	$('#titlemodal h4').empty();
			container.empty();
			if(foodid>0){
	 			$.post('GetFoodRecipeByIDServlet', {
					foodid : foodid
	 			}, 
	 			function(responseText) {
						if (responseText.length > 2) {
							var val = JSON.parse(responseText);
							var ing = val.foodIngredients;
		 					var ingre = ing.split(".");
		 					var finaling = "<div class='row'><div class='col-md-4'>Ingredients</div><div class='col-md-4'>Quantity</div></div>";
		 					for(var k=0;k<ingre.length-1; k++)
		 					{
		 						var item = ingre[k].split("-");
								finaling=finaling+"<div class='row'><div class='col-md-4'>"+item[0]+"</div><div class='col-md-4'>"+item[1]+"</div></div>";
		 					}
		 					var resstep = val.recipe;
		 					var steps = resstep.split(";");
		 					var finalstep = "<div class='row'><div class='col-md-12'>Recipe Steps</div></div><br>";
		 					for(var n=0,m=1;n<steps.length;n++,m++)
		 					{
		 						finalstep=finalstep+"<div class='row'><div class='col-md-12'>Step "+m+" : "+steps[n]+"</div></div><br>";
		 					}
		 					$('#titlemodal h4').append(val.FoodName);
		 					container.append("<tr><td>"+finaling+"</td></tr><tr><td>"+finalstep+"</td></tr>");
						} 
						else{
							
						}
	 			});
			}else{
				container.append("<h4>Oops! Looks like we don't have recipe.</h4>");
			}
     });
    });
  </script>
<!--   dinner recipe -->
  <script>
    $(document).ready(function() {
    	var btn = $('#dinner tr td button');
   	 	var container = $('#recipeCon');
   	 	$('#titlemodal h4').empty();
		container.empty();
		
   	 	btn.on('click',function(){
		 	var $this = $(this),
		 	foodid = $this.data('foodid');
		 	$('#titlemodal h4').empty();
			container.empty();
			if(foodid>0){
	 			$.post('GetFoodRecipeByIDServlet', {
					foodid : foodid
	 			}, 
	 			function(responseText) {
						if (responseText.length > 2) {
							var val = JSON.parse(responseText);
							var ing = val.foodIngredients;
		 					var ingre = ing.split(".");
		 					var finaling = "<div class='row'><div class='col-md-4'>Ingredients</div><div class='col-md-4'>Quantity</div></div>";
		 					for(var k=0;k<ingre.length-1; k++)
		 					{
		 						var item = ingre[k].split("-");
								finaling=finaling+"<div class='row'><div class='col-md-4'>"+item[0]+"</div><div class='col-md-4'>"+item[1]+"</div></div>";
		 					}
		 					var resstep = val.recipe;
		 					var steps = resstep.split(";");
		 					var finalstep = "<div class='row'><div class='col-md-12'>Recipe Steps</div></div><br>";
		 					for(var n=0,m=1;n<steps.length;n++,m++)
		 					{
		 						finalstep=finalstep+"<div class='row'><div class='col-md-12'>Step "+m+" : "+steps[n]+"</div></div><br>";
		 					}
		 					$('#titlemodal h4').append(val.FoodName);
		 					container.append("<tr><td>"+finaling+"</td></tr><tr><td>"+finalstep+"</td></tr>");
						} 
						else{
							
						}
	 			});
			}else{
				container.append("<h4>Oops! Looks like we don't have recipe.</h4>");
			}
     });
    });
  </script>
<!--   snack recipe -->
  <script>
    $(document).ready(function() {
    	var btn = $('#snack tr td button');
   	 	var container = $('#recipeCon');
   	 	$('#titlemodal h4').empty();
		container.empty();
		
   	 	btn.on('click',function(){
		 	var $this = $(this),
		 	foodid = $this.data('foodid');
		 	$('#titlemodal h4').empty();
			container.empty();
			if(foodid>0){
	 			$.post('GetFoodRecipeByIDServlet', {
					foodid : foodid
	 			}, 
	 			function(responseText) {
						if (responseText.length > 2) {
							var val = JSON.parse(responseText);
							var ing = val.foodIngredients;
		 					var ingre = ing.split(".");
		 					var finaling = "<div class='row'><div class='col-md-4'>Ingredients</div><div class='col-md-4'>Quantity</div></div>";
		 					for(var k=0;k<ingre.length-1; k++)
		 					{
		 						var item = ingre[k].split("-");
								finaling=finaling+"<div class='row'><div class='col-md-4'>"+item[0]+"</div><div class='col-md-4'>"+item[1]+"</div></div>";
		 					}
		 					var resstep = val.recipe;
		 					var steps = resstep.split(";");
		 					var finalstep = "<div class='row'><div class='col-md-12'>Recipe Steps</div></div><br>";
		 					for(var n=0,m=1;n<steps.length;n++,m++)
		 					{
		 						finalstep=finalstep+"<div class='row'><div class='col-md-12'>Step "+m+" : "+steps[n]+"</div></div><br>";
		 					}
		 					$('#titlemodal h4').append(val.FoodName);
		 					container.append("<tr><td>"+finaling+"</td></tr><tr><td>"+finalstep+"</td></tr>");
						} 
						else{
							
						}
	 			});
			}else{
				container.append("<h4>Oops! Looks like we don't have recipe.</h4>");
			}
     });
    });
  </script>
	
	<script type="text/javascript">
		function hidebody() {
		}
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
		 google.charts.load('current', {'packages':['corechart']});
	     google.charts.setOnLoadCallback(drawChart);
	     var options = {
		         title: ''
		       };
		var totalcarbs=0;
		var totalprotein=0;
		var totalsugar=0;
		var totalfat=0;
		var totalfiber=0;
		var breakfastCookie="0";
		var lunchCookie="0";
		var dinnerCookie="0";
		var snackCookie="0";
	     function drawChart() {
	    	
	    	 calculateData();	
	    	 var data = google.visualization.arrayToDataTable([
	         ['Nutrition Value', 'Per Daily Meal Plan'],
	         ['Carbs',     totalcarbs],
	         ['Protein',      totalprotein],
	         ['Sugar',  totalsugar],
	         ['Fat',	totalfat],
	         ['Fiber',    totalfiber]
	       ]);
	          var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	       chart.draw(data, options);
	       var userId = '<%=request.getAttribute("userId")%>';
	       $.get('UserMealCookieServlet', {
   			breakfast : breakfastCookie,
   			lunch : lunchCookie,
   			dinner : dinnerCookie,
   			snack : snackCookie,
   			userId : userId
   			}, function(responseText) {	   
   			breakfastCookie="0";
   			lunchCookie="0";
   			dinnerCookie="0";
   			snackCookie="0";
   			});
	       
	       function calculateData() {
	    	   $('#breakfast > tr').each(function() {
	    		   	var id = $(this).data("id");
					var carb = $(this).data("carbs");
					var protein = $(this).data("protein");
					var sugar = $(this).data("sugar");
					var fat = $(this).data("fat");
					var fiber = $(this).data("fiber");
					
					totalcarbs=totalcarbs+carb;
					totalprotein=totalprotein+protein;
					totalsugar=totalsugar+sugar;
					totalfat=totalfat+fat;
					totalfiber=totalfiber+fiber;
					breakfastCookie=breakfastCookie+"~"+id;
				});
				$('#lunch > tr').each(function() {
					var id = $(this).data("id");
					var carb = $(this).data("carbs");
					var protein = $(this).data("protein");
					var sugar = $(this).data("sugar");
					var fat = $(this).data("fat");
					var fiber = $(this).data("fiber");

					totalcarbs=totalcarbs+carb;
					totalprotein=totalprotein+protein;
					totalsugar=totalsugar+sugar;
					totalfat=totalfat+fat;
					totalfiber=totalfiber+fiber;
					lunchCookie=lunchCookie+"~"+id;
					
				});
				$('#dinner > tr').each(function() {
					var id = $(this).data("id");
					var carb = $(this).data("carbs");
					var protein = $(this).data("protein");
					var sugar = $(this).data("sugar");
					var fat = $(this).data("fat");
					var fiber = $(this).data("fiber");

					totalcarbs=totalcarbs+carb;
					totalprotein=totalprotein+protein;
					totalsugar=totalsugar+sugar;
					totalfat=totalfat+fat;
					totalfiber=totalfiber+fiber;
					dinnerCookie=dinnerCookie+"~"+id;
					
				});
				$('#snack > tr').each(function() {
					var id = $(this).data("id");
					var carb = $(this).data("carbs");
					var protein = $(this).data("protein");
					var sugar = $(this).data("sugar");
					var fat = $(this).data("fat");
					var fiber = $(this).data("fiber");

					totalcarbs=totalcarbs+carb;
					totalprotein=totalprotein+protein;
					totalsugar=totalsugar+sugar;
					totalfat=totalfat+fat;
					totalfiber=totalfiber+fiber;
					snackCookie=snackCookie+"~"+id;
					
				});
		}
	       
	       $("#regenBreakfast,#regenLunch,#regenDinner,#regenSnack").click(function updatepie(){
	    	   calculateData();
	    	   var newdata = google.visualization.arrayToDataTable([
	    	         ['Nutrition', 'Value'],
	    	         ['Carbs',     totalcarbs],
	    	         ['Protein',      totalprotein],
	    	         ['Sugar',  totalsugar],
	    	         ['Fat',	totalfat],
	    	         ['Fiber',    totalfiber]
	    	       ]);
	    	   chart.draw(newdata, options);
	    		var userId = '<%=request.getAttribute("userId")%>';
	    	   $.get('UserMealCookieServlet', {
	    			breakfast : breakfastCookie,
	    			lunch : lunchCookie,
	       			dinner : dinnerCookie,
	       			snack : snackCookie,
	    			userId : userId
	    		}, function(responseText) {	   
	    			breakfastCookie="0";
	    			lunchCookie="0";
	    			dinnerCookie ="0";
	    			snackCookie="0";
	    		});
	    	totalcarbs=0;
	   		totalprotein=0;
	   		totalsugar=0;
	   		totalfat=0;
	   		totalfiber=0;
	   		
	   });
	       
	     }
		
	</script>
	
	<!--   End of Js Files -->
</body>
</html>