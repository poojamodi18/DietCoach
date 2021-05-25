<%@page import="com.beans.FoodRecipes"%>
<%@page import="com.utility.QuantityType"%>
<%@page import="com.beans.Food"%>
<%@page import="com.beans.DietCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.utility.MealType"%>
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
    <div class="sidebar" data-color="purple" data-background-color="black">
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
                  <a class="nav-link" href="AdminProfileServlet">
                    <span class="sidebar-normal"> My Profile </span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="AdminPasswordServlet">
                    <span class="sidebar-normal"> Edit Password </span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="NewAdmin.jsp">
                    <span class="sidebar-normal"> Add New Admin </span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <ul class="nav">
          <li class="nav-item ">
            <a class="nav-link" href="AdminDashboard.jsp">
              <i class="material-icons">dashboard</i>
              <p> Dashboard </p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" data-toggle="collapse" href="#pagesExamples">
              <i class="material-icons">supervisor_account</i>
              <p> Users
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="pagesExamples">
              <ul class="nav">
                <li class="nav-item ">
                  <a class="nav-link" href="UserListServlet">
                    <span class="sidebar-normal"> User Details </span>
                  </a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="DisplayUserFeedbackServlet">
                    <span class="sidebar-normal"> User Feedback </span>
                  </a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="DisplayQuery">
                    <span class="sidebar-normal"> User Query </span>
                  </a>
                </li>
                
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" data-toggle="collapse" href="#componentsExamples">
              <i class="material-icons">receipt_long</i>
              <p> Food & Recipe
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="componentsExamples">
              <ul class="nav">
                <li class="nav-item ">
                  <a class="nav-link" href="FoodDisplayServlet">
                    <span class="sidebar-normal"> View / Edit Food & Recipe </span>
                  </a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="FoodServlet">
                    <span class="sidebar-normal"> Add Food & Recipe </span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" data-toggle="collapse" href="#dietExamples">
              <i class="material-icons">format_list_bulleted</i>
              <p> Diet Category
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="dietExamples">
              <ul class="nav">
                <li class="nav-item ">
                  <a class="nav-link" href="dietCategoryDisplayServlet">
                    <span class="sidebar-normal"> View / Edit Diet Category </span>
                  </a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="DietCategoryServlet">
                    <span class="sidebar-normal"> Add Diet Category </span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" data-toggle="collapse" href="#formsExamples">
              <i class="material-icons">style</i>
              <p> Book-Shelf
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="formsExamples">
              <ul class="nav">
                <li class="nav-item ">
                  <a class="nav-link" href="DisplayeBook">
                    <span class="sidebar-normal"> View / Edit Books </span>
                  </a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="InsertBook.jsp">
                    <span class="sidebar-normal"> Add Books </span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" data-toggle="collapse" href="#tablesExamples">
              <i class="material-icons">fitness_center</i>
              <p> Exercise
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="tablesExamples">
              <ul class="nav">
                <li class="nav-item ">
                  <a class="nav-link" href="DisplayExerciseServlet">
                    <span class="sidebar-normal"> View / Edit Exercise </span>
                  </a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="InsertExercise.jsp">
                    <span class="sidebar-normal"> Add Exercise </span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="Revenue.jsp">
              <i class="material-icons">account_balance_wallet</i>
              <p> Revenue </p>
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
            <a class="navbar-brand" href="javascript:;">Update Food</a>
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
                <a class="nav-link" href="javascript:;">
                  <i class="material-icons">dashboard</i>
                  <p class="d-lg-none d-md-block">
                    Stats
                  </p>
                </a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="javascript:;" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <a class="dropdown-item" href="AdminProfileServlet">Profile</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="LogoutServlet">Log out</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="content">
          <div class="container-fluid">
            <div class="row">
            	<%
            		Food food = (Food)request.getAttribute("fooddetail");
            	%>
				<div class="col-lg-12 col-md-12">
							<div class="card">
								<div class="card-header card-header-primary">
									<h4 class="card-title">Update Food</h4>
									<p class="card-category"></p>
								</div>
								<div class="card-body">
									<form method="post" action="UpdateFoodServlet"
										enctype="multipart/form-data">
										<div class="row">
											<div class="col-lg-6 col-md-12">
												<%
													ArrayList<DietCategory> diettype = (ArrayList<DietCategory>) request.getAttribute("dietcatlist");
												%>
												<div class="form-group">
													<label class="bmd-label-floating">Diet Type </label>
													<div class="custom-select-menu">
														<select class="selectpicker" data-style="btn btn-primary btn-round" title="Single Select" data-size="7" id="" required name="diettype">
															
																<%
																for (DietCategory d : diettype) {
															%>
															
															<option value="<%=d.getDietcategoryid()%>" <%if(food.getDietid()==d.getDietcategoryid()){ %>selected<% }%> ><%=d.getCategoryname()%>
																<%
																	}
																%>
															
														</select>
													</div>
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Meal Type </label>
													<div class="custom-select-menu">
														<select class="selectpicker" data-style="btn btn-primary btn-round" title="Single Select" data-size="7" id=""  required name="mealtype">
															<option value="<%=MealType.BREAKFAST.getMealCharCode()%>" <%if(food.getMealtype().equalsIgnoreCase(MealType.BREAKFAST.getMealCharCode())){ %>selected<% }%>><%=MealType.BREAKFAST.getMealCharCode()%>
															<option value="<%=MealType.LUNCH.getMealCharCode()%>" <%if(food.getMealtype().equalsIgnoreCase(MealType.LUNCH.getMealCharCode())){ %>selected<% }%>><%=MealType.LUNCH.getMealCharCode()%>
															<option value="<%=MealType.DINNER.getMealCharCode()%>" <%if(food.getMealtype().equalsIgnoreCase(MealType.DINNER.getMealCharCode())){ %>selected<% }%>><%=MealType.DINNER.getMealCharCode()%>
															<option value="<%=MealType.SNACK.getMealCharCode()%>" <%if(food.getMealtype().equalsIgnoreCase(MealType.SNACK.getMealCharCode())){ %>selected<% }%>><%=MealType.SNACK.getMealCharCode()%>
														</select>
													</div>
												</div>
											</div>

										</div>

										<div class="row">
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Name</label> <input
														type="text" class="form-control" name="name" value="<%=food.getFoodname()%>">
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Nutritional
														Information</label> <input type="text" class="form-control" value="<%=food.getNutritionalInfo() %>"
														name="nutritioninfo">
												</div>
											</div>

										</div>

										<div class="row">
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
												<label class="bmd-label-floating">Serving Quantity</label>
													<div class="custom-select-menu">
														<select class="selectpicker" data-style="btn btn-primary btn-round" title="Single Select" data-size="7" id="" name="servingQuantity" required style="width: 100px;">
								                            <option value="1" <%if(food.getQuantity()==1){ %>selected <%} %>>1
															<option value="2" <%if(food.getQuantity()==2){ %>selected <%} %>>2
															<option value="3" <%if(food.getQuantity()==3){ %>selected <%} %>>3
															<option value="4" <%if(food.getQuantity()==4){ %>selected <%} %>>4
															<option value="5" <%if(food.getQuantity()==5){ %>selected <%} %>>5
														</select>
													</div>
												</div>
											</div>

											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Serving Type</label>
													<div class="custom-select-menu">
														<select class="selectpicker" data-style="btn btn-primary btn-round" title="Single Select" data-size="7" id=""  required name="servingType">
															<option value="<%=QuantityType.BOWL.getQuantityType()%>" <%if(food.getServingType().equalsIgnoreCase(QuantityType.BOWL.getQuantityType())){ %>selected<% }%>><%=QuantityType.BOWL.getQuantityType()%></option>
															<option value="<%=QuantityType.CUP.getQuantityType()%>" <%if(food.getServingType().equalsIgnoreCase(QuantityType.CUP.getQuantityType())){ %>selected<% }%>><%=QuantityType.CUP.getQuantityType()%></option>
															<option value="<%=QuantityType.GLASS.getQuantityType()%>" <%if(food.getServingType().equalsIgnoreCase(QuantityType.GLASS.getQuantityType())){ %>selected<% }%>><%=QuantityType.GLASS.getQuantityType()%></option>
															<option value="<%=QuantityType.ITEM.getQuantityType()%>" <%if(food.getServingType().equalsIgnoreCase(QuantityType.ITEM.getQuantityType())){ %>selected<% }%>><%=QuantityType.ITEM.getQuantityType()%></option>
															<option value="<%=QuantityType.SLICE.getQuantityType()%>" <%if(food.getServingType().equalsIgnoreCase(QuantityType.SLICE.getQuantityType())){ %>selected<% }%>><%=QuantityType.SLICE.getQuantityType()%></option>
															<option value="<%=QuantityType.TEASPOON.getQuantityType()%>" <%if(food.getServingType().equalsIgnoreCase(QuantityType.TEASPOON.getQuantityType())){ %>selected<% }%>><%=QuantityType.TEASPOON.getQuantityType()%></option>
														</select>
													</div>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Calories</label> <input
														type="text" class="form-control" name="calories" value="<%=food.getCalories()%>">
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Fiber</label> <input
														type="text" class="form-control" name="fiber" value="<%=food.getFiber() %>">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">carbs</label> <input
														type="text" class="form-control" name="carbs" value="<%=food.getCarbs()%>">
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Protein</label> <input
														type="text" class="form-control" name="protein" value="<%=food.getProtein()%>">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Fat</label> <input
														type="text" class="form-control" name="fat" value="<%=food.getFat()%>">
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Sugar</label> <input
														type="text" class="form-control" name="sugar" value="<%=food.getSugar()%>">
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-lg-6 col-md-12">
						                      <h4 class="title">Food Image</h4>
						                      <div class="fileinput fileinput-new text-center" data-provides="fileinput">
						                        <div class="fileinput-new thumbnail">
						                          <img src="data:image/jpeg;base64,<%=food.getFoodImageString()%>" alt="...">
						                        </div>
						                        <div class="fileinput-preview fileinput-exists thumbnail"></div>
						                        <div>
						                          <span class="btn btn-primary btn-round btn-file">
						                            <span class="fileinput-new">Select image</span>
						                            <span class="fileinput-exists">Change</span>
						                            <input type="file" name="image" id="img">
						                          </span>
						                          <a href="#pablo" class="btn btn-primary btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
						                        </div>
						                      </div>
						                    </div>
											<div class="col-lg-6 col-md-12">
												<%if(food.getFoodrecipeId()>0){
														FoodRecipes foodRecipes = (FoodRecipes) request.getAttribute("foodrecipe");
													%>
													<div class="row">
														<div class="col-lg-12 col-md-12">
															<div class="form-group">
																<label class="bmd-label-floating">Ingredients</label>
																<textarea class="form-control" rows="6" name="ingre"><%=foodRecipes.getFoodIngredients() %></textarea>
															</div>
														</div>
														<div class="col-lg-12 col-md-12">
															<div class="form-group">
																<label class="bmd-label-floating">Recipe</label> 
																<textarea class="form-control" rows="6" name="recipe"><%=foodRecipes.getRecipe() %></textarea>
															</div>
														</div>
													</div>
													<input type="hidden" name="resid" value="<%=foodRecipes.getFoodRecipeId()%>">
												<%}
												else{%>
													<input type="hidden" name="resid" value="0">
												<%} %>
											</div>
										</div>
										<input type="hidden" name="imgval" id="imgval">
										<input type="hidden" name="id" value="<%=food.getFoodid()%>">
										
										<button type="submit" id="up" class="btn btn-primary btn-round pull-right">Update</button>
									</form>
								</div>
							</div>
						</div>            
            
            </div>
          </div>
        </div>
      </div>
      <!--       footer -->
<%@include file="Footer-Admin.jsp"%>
<!-- footer end -->
    </div>
  </div>
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
  <script type="text/javascript">
$(document).ready(function(){
	$('#up').click(function() {
		if( document.getElementById("img").files.length == 0 ){
		    console.log("no files selected");
		    document.getElementById("imgval").value="No";
		}
		else{
			document.getElementById("imgval").value="Yes";
		}
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