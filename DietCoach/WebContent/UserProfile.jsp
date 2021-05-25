<!DOCTYPE html>
<%@page import="com.beans.MedicalCondition"%>
<%@page import="com.beans.DietCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.User"%>
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
  <link href="assets/css/custom-select-menu.css" rel="stylesheet" />
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
            <div class="collapse show" id="collapseExample">
              <ul class="nav">
                <li class="nav-item active">
                  <a class="nav-link active" href="UserProfileServlet">
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
            <a class="navbar-brand" href="javascript:;">My Profile</a>
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
                <a class="nav-link" href="FreeDashboard.jsp">
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
                  <a class="dropdown-item" href="UserProfileServlet">Profile</a>
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
					User user = (User) request.getAttribute("user");
            		ArrayList<DietCategory> diettype = (ArrayList<DietCategory>) request.getAttribute("dietcatlist");
            		ArrayList<MedicalCondition> medicallist = (ArrayList<MedicalCondition>) request.getAttribute("medicalconditionlist");
				%>
						<div class="col-md-10">
							<div class="card">
								<div class="card-header card-header-primary">
									<h4 class="card-title">Profile</h4>
									<p class="card-category">Edit profile</p>
								</div>
								<div class="card-body">
									<form action="UserProfileUpdateServlet" method="post">
										<input type="hidden" value="<%=user.getUserId()%>" name="userid">
										<div class="row">
											<div class="col-md-6">
												<input type="hidden" name="id" value="<%=user.getUserId()%>">
												<div class="form-group">
													<label class="bmd-label-floating">Fist Name</label> <input
														type="text" class="form-control"
														value="<%=user.getFirstName()%>" name="fname">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Last Name</label> <input
														type="text" class="form-control"
														value="<%=user.getLastName()%>" name="lname">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Email address</label> <input
														type="email" class="form-control"
														value="<%=user.getEmailId()%>" name="email">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Height</label> <input
														type="number" class="form-control"
														value="<%=user.getHeight()%>" name="height">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Weight</label> <input
														type="text" class="form-control"
														value="<%=user.getWeight()%>" name="weight">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
				                     				<label for="examplePassword1" class="bmd-label"> Activity Level *</label>
				                     				<input class="custom-slider-bar" id="rangeInput" type="range"
														min="1.2" max="1.9" step="0.01" value="<%=user.getActivityId() %>"
									   					oninput="myFunctionActivity()" name="activity"><br>
														<input id="amount" type="text" class="form-control"
				      									disabled="disabled">
				                    			</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<label>Primary Diet Category</label><br>
												<select class="selectpicker" data-style="btn btn-primary btn-round" title="Single Select" data-size="7" id="" name="diettype" required>
				                            		 <option disabled >Choose Diet Category</option>
				                                 
				                            	<%
													for (DietCategory d : diettype) {
												%>
				                              		<option value="<%=d.getDietcategoryid() %>" <%if(user.getDietcategory()==d.getDietcategoryid()){ %> selected <%} %>><%=d.getCategoryname() %></option>
				                              <%
													}
												%>
												</select>
											</div>
											
											<div class="col-md-6">
                         							<label>Allergy</label><br>
												<div class="form-check form-check-inline">
							                        <div class="form-check ">
							                          <label class="form-check-label">
							                            <input class="form-check-input" type="checkbox" value="Fish" name="allergy" <%if(user.getAllergy().contains("Fish")){ %>checked<%} %>> Fish
							                            <span class="form-check-sign">
							                              <span class="check"></span>
							                            </span>
							                          </label>
							                        </div>
							                        <div class="form-check ">
							                          <label class="form-check-label">
							                            <input class="form-check-input" type="checkbox" value="Egg" name="allergy" <%if(user.getAllergy().contains("Egg")){ %>checked<%} %>> Eggs
							                            <span class="form-check-sign">
							                              <span class="check"></span>
							                            </span>
							                          </label>
							                        </div>
						                      </div>
						                      <br>
						                      <div class="form-check form-check-inline">
							                        <div class="form-check ">
							                          <label class="form-check-label">
							                            <input class="form-check-input" type="checkbox" value="Milk" name="allergy" <%if(user.getAllergy().contains("Milk")){ %>checked<%} %>> Milk	
							                            <span class="form-check-sign">
							                              <span class="check"></span>
							                            </span>
							                          </label>
							                        </div>
							                        <div class="form-check ">
							                          <label class="form-check-label">
							                            <input class="form-check-input" type="checkbox" value="Peanut" name="allergy" <%if(user.getAllergy().contains("Peanut")){ %>checked<%} %>> Peanuts
							                            <span class="form-check-sign">
							                              <span class="check"></span>
							                            </span>
							                          </label>
							                        </div>
							                    </div>
							                    <br>
							                    <div class="form-check form-check-inline">
							                        <div class="form-check ">
							                          <label class="form-check-label">
							                            <input class="form-check-input" type="checkbox" value="Soy" name="allergy" <%if(user.getAllergy().contains("Soy")){ %>checked<%} %>> Soy
							                            <span class="form-check-sign">
							                              <span class="check"></span>
							                            </span>
							                          </label>
							                        </div>
							                        <div class="form-check ">
							                          <label class="form-check-label">
							                            <input class="form-check-input" type="checkbox" value="Shellfish" name="allergy" <%if(user.getAllergy().contains("Shellfish")){ %>checked<%} %>> Shellfish
							                            <span class="form-check-sign">
							                              <span class="check"></span>
							                            </span>
							                          </label>
							                        </div>
							                    </div>
											</div>
										</div>
										
									<hr>
									<div id="medic">
										<div class="row">
											<div class="col-md-12" id="med">
													<label>Medical Condition</label><br>
													<%
													String condi[] = user.getMedicalConditionIds().split("~");
					                            	for (MedicalCondition medical : medicallist) {
													%>
													<div class="form-check form-check-inline">
								                          <label class="form-check-label">
								                            <input class="form-check-input" type="checkbox" 
								                            name="medicalcondition" value="<%=medical.getMedicalID()%>" 
								                            data-name="<%=medical.getMedicalConditionName()%>" 
								                           <% for(int i=0;i<condi.length;i++)
				                     				{
								                       	int cond = Integer.parseInt(condi[i]);
				                     					if(cond==medical.getMedicalID()){
				                     					%>
				                     					checked
				                     					<%}
				                     				}%>  > <%=medical.getMedicalConditionName() %>
								                            <span class="form-check-sign">
								                              <span class="check"></span>
								                            </span>
								                          </label>
					                        		</div>
					                              <%
														}
													%>
											</div>
										</div>
										<div class="row" id="diabetes"> 
					                        <div class="col-md-12">
					                            <div class="form-group">
					                              <label>Blood Sugar (mg/dL) (for diabetic only)</label>
					                              <input type="number" class="form-control" name="bloodsugar" id="sugar">
					                            </div>
					                        </div>
										</div>
									</div>
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label class="bmd-label-floating">Gender</label> <input
														type="text" class="form-control"
														value="<%=user.getGender()%>" disabled>
														<input type="hidden" name="gender" value="<%=user.getGender()%>">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label class="bmd-label-floating">Age</label> <input
														type="text" class="form-control" 
														value="<%=user.getAge()%>" disabled>
														<input type="hidden" name="age" value="<%=user.getAge()%>">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label class="bmd-label-floating">Registration Date</label><input
														type="text" class="form-control" 
														value="<%=user.getRegisterDate()%>" disabled>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 col-md-12">
												<button type="submit" class="btn btn-primary pull-right">Update</button>
											</div>
											<div class="clearfix"></div>
										</div>
									</form>
								</div>
							</div>
						</div>
						
							<div class="col-md-2">
							  <%
							  	Cookie day = null;
							  	Cookie cookies[] = request.getCookies();
							  	 if( cookies != null ) {
							            
							            for (int i = 0; i < cookies.length; i++) {
				// 			               day = cookies[i];
							               if(cookies[i].getName().equalsIgnoreCase("PremiumDay")){
							            	   day = cookies[i];
							            	   %>
							            	   <div class="card">
								                  <div class="card-header card-header-primary card-header-icon">
								                    <div class="card-icon">
								                      <i class="material-icons">date_range</i>
								                    </div>
								                  </div>
								                  <div class="card-body">
								                  	<h3 class="card-title"><%=day.getValue() %>&nbsp;Days</h3>
								                  	<p class="card-category">Left in your current plan.</p>
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
      </div>
      
			<!--   Footer Start   -->
			<%@include file="Premium-Footer.jsp"%>
			<!--   Footer End -->
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
    	var x = document.getElementById("rangeInput");
    	var currentVal = parseFloat(x.value);
    	var v1=parseFloat(1.2);
    	var v2=parseFloat(1.375);
    	var v3=parseFloat(1.55);
    	var v4=parseFloat(1.725);
    	var v5=parseFloat(1.9);
    	var condition1 =((parseFloat(currentVal) <= v1) && (parseFloat(currentVal) > 0));
    	if(condition1)
    	{
    	 	document.getElementById('amount').value = "Little or no excercise";
    	}
    	else if((parseFloat(currentVal) <= v2) && (parseFloat(currentVal) > v1))
    	{
    	 	document.getElementById('amount').value ="Light excercise / sports 1-3 days a week";
    	}
    	else if((parseFloat(currentVal) <= v3) && (parseFloat(currentVal) > v2)) 
    	{
    		document.getElementById('amount').value ="Modrate excercise / sports 3-5 days a week";
    	}
    	else if((parseFloat(currentVal) <= v4) && (parseFloat(currentVal) > v3)) 
    	{
    		document.getElementById('amount').value ="Hard excercise / sports 6-7 days a week";
    	}
    	else if((parseFloat(currentVal) <= v5) && (parseFloat(currentVal) > v4)) 
    	{
    		document.getElementById('amount').value ="Twice excercise per day / Extra heavy workouts";
    	}
    	
    	var inputValue = $(this).data("name");   
        if ($(this).is(":checked")) {
        	$("#diabetes").find("*").prop("disabled", false);
        }
        else{
        	$("#diabetes").find("*").prop("disabled", true);
        }
    	
    	$('input[type="checkbox"]').click(function(){
            var inputValue = $(this).data("name");   
            if ($(this).is(":checked")) {
            	if(inputValue==="Diabetes")
            	{
            		$("#diabetes").find("*").prop("disabled", false);
            	}
                if(inputValue==="None"){
                	$('#med div input').prop("checked",false);
                	$('sugar').val("");
                	$("#diabetes").find("*").prop("disabled", true);
                	$(this).prop("checked",true);
                }
                else
                {
                	$('#med div input[value="1"]').prop("checked",false);
                }
            }
        });
    	
    	
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
  <script>
    $(document).ready(function() {
      // initialise Datetimepicker and Sliders
      md.initFormExtendedDatetimepickers();
      if ($('.slider').length != 0) {
        md.initSliders();
      }
    });
  </script>
</body>
</html>