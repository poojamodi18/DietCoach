<%@page import="com.beans.DietCategory"%>
<%@page import="com.beans.DailyActivity"%>
<%@page import="com.beans.MedicalCondition"%>
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
  <link href="assets/css/custom-select-menu.css" rel="stylesheet" />
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style type="text/css">
		.card-wizard .info-text {
    text-align: center;
    font-weight: 300;
    margin: 10px 0 10px;
}
	</style>
<!-- 	    font-size: 40px; -->
<!--     line-height: 111px; -->
</head>
<body class="off-canvas-sidebar">
    <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top text-white">
    <div class="container">
      <div class="navbar-wrapper">
        <a class="navbar-brand" href="javascript:;">Register</a>
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
            <a href="index.jsp" class="nav-link">
              <i class="material-icons">dashboard</i>
				Home              
            </a>
          </li>
          <li class="nav-item ">
            <a href="Login.jsp" class="nav-link">
              <i class="material-icons">fingerprint</i>
              Login
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
      <!-- End Navbar -->

  <div class="wrapper wrapper-full-page">
    <div class="page-header register-page header-filter" filter-color="black" style="background-image: url('asset/img/home.jpg')">      
      <div class="container">
        <div class="container-fluid">
          <div class="col-md-9 col-12 mr-auto ml-auto">
            <!--      Wizard container        -->
            <div class="wizard-container">
              <div class="card card-wizard" data-color="purple" id="wizardProfile">
                <form action="RegistrationServlet" method="post" id="RegisterValidation">
                  <!--        You can switch " data-color="primary" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
                  <div class="card-header text-center">
                    <h3 class="card-title">
                      Build Your Profile
                    </h3>
                    <h5 class="card-description">This information will let us know more about you.</h5>
                  </div>
                  <div class="wizard-navigation">
                    <ul class="nav nav-pills" >
                      <li class="nav-item">
                        <a class="nav-link active" href="#about" data-toggle="tab" role="tab">
                          Personal Profile
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#account" data-toggle="tab" role="tab">
                          Physical Profile
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#food" data-toggle="tab" role="tab">
                          Food Choices
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#medic" data-toggle="tab" role="tab">
                          Medical Condition
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <div class="tab-content">
                      <div class="tab-pane active" id="about">
                        <div class="row justify-content-center">
                          <div class="col-lg-10 mt-3">
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">face</i>
                                </span>
                              </div>
                              <div class="form-group">
                                <label for="exampleInput1" class="bmd-label-floating">First Name *</label>
                                <input type="text" class="form-control" id="exampleInput1" name="firstname" required="true" aria-required="true" aria-invalid="true">
                              </div>
                            </div>
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">record_voice_over</i>
                                </span>
                              </div>
                              <div class="form-group">
                                <label for="exampleInput11" class="bmd-label-floating">Second Name *</label>
                                <input type="text" class="form-control" id="exampleInput11" name="lastname" required="true" aria-required="true" aria-invalid="true">
                              </div>
                            </div>
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">email</i>
                                </span>
                              </div>
                              <div class="form-group" id="emaildiv">
                                <label for="exampleInput1" class="bmd-label-floating">Email *</label>
                                <input type="email" class="form-control" id="exampleemalil" autocomplete="off" name="email" required>
                              </div>
                            </div>
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">https</i>
                                </span>
                              </div>
                            	<div class="form-group">
                      				<label for="examplePassword" class="bmd-label-floating"> Password *</label>
                      			<input type="password" class="form-control" id="examplePassword" required="true" name="password" minLength="6" aria-required="true" aria-invalid="true">
                    			</div>
                            </div>
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">https</i>
                                </span>
                              </div>
								<div class="form-group">
                     				<label for="examplePassword1" class="bmd-label-floating"> Confirm Password *</label>
                      				<input type="password" class="form-control" id="examplePassword1" required="true" equalTo="#examplePassword" name="password_confirmation" aria-required="true" aria-invalid="true">
                    			</div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" id="account">
                        <h5 class="info-text"> Tell us about yourself<br>
							This info lets us estimate your nutrition requirements for each day. </h5>
						<div class="row justify-content-center">
                          <div class="col-lg-10 mt-3">
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">face</i>
                                </span>
                              </div>
                         		<div class="form-check">
                         			<label for="exampleInput1" class="col-form-label label-checkbox">Gender *</label>
                         			<label class="form-check-label">
                            		<input class="form-check-input" type="radio" name="gender" value="Female" checked> Female
                            		<span class="circle">
                              			<span class="check"></span>
                            		</span>
                          			</label>
                          			<label class="form-check-label">
                            		<input class="form-check-input" type="radio" name="gender" value="Male"> Male
                            		<span class="circle">
                              			<span class="check"></span>
                            		</span>
                          			</label>
                        		</div>
                            </div>
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">format_line_spacing</i>
                                </span>
                              </div>
                              <div class="form-group">
                                <label for="exampleInput11" class="bmd-label-floating">Height </label>
                                <input type="number" class="form-control" name="height"
														placeholder="Height in cm" required="true" aria-required="true" aria-invalid="true">
                              </div>
                            </div>
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">assessment</i>
                                </span>
                              </div>
                              <div class="form-group" id="emaildiv">
                                <label for="exampleInput1" class="bmd-label-floating">Weight </label>
                                <input	type="text" class="form-control" name="weight"
														placeholder="Weight in kg" required="true" aria-required="true" aria-invalid="true">
                              </div>
                            </div>
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">event_note</i>
                                </span>
                              </div>
                            	<div class="form-group">
                      				<label for="examplePassword" class="bmd-label-floating"> Birthdate *</label>
                      				<input type="text" class="form-control datepicker" value="01/01/2000" name="dob" required>
                    			</div>
                            </div>
                            <div class="input-group form-control-lg">
                              <div class="input-group-prepend">
                                <span class="input-group-text">
                                  <i class="material-icons">directions_run</i>
                                </span>
                              </div>
								<div class="form-group">
                     				<label for="examplePassword1" class="bmd-label"> Activity Level *</label>
                     				<input class="custom-slider-bar" id="rangeInput" type="range"
										min="1.2" max="1.9" step="0.01"
					   					oninput="myFunctionActivity()" name="activity"><br>
										<input id="amount" type="text" class="form-control"
      									disabled="disabled">
                    			</div>
                            </div>
                          </div>
                        </div>
                       </div>
                       <div class="tab-pane" id="food">
                       <%
							ArrayList<DietCategory> diettype = (ArrayList<DietCategory>) request.getAttribute("dietcatlist");
						%>
                       <h5 class="info-text">
							Choose a pre-set diet, or exclude the foods you don't like or are allergic to.<br>
							You can edit this later.</h5>
										<h5 class="info-text">What's your primary diet?</h5>
                          
                        <div class="row justify-content-center">
                            	 <select class="selectpicker" data-style="btn btn-primary btn-round" title="Single Select" data-size="7" id="" name="diettype" required>
                            		 <option disabled selected>Choose Diet Category</option>
                                 
                            	<%
									for (DietCategory d : diettype) {
								%>
                              		<option value="<%=d.getDietcategoryid() %>"><%=d.getCategoryname() %></option>
                              <%
									}
								%>
								</select>
						</div>
					 <br><br><h5 class="info-text">Do you have any allergies?</h5>		
					<div class="row justify-content-center">
                         		
                        <div class="form-check ">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" value="Egg" name="allergy"> Eggs
                            <span class="form-check-sign">
                              <span class="check"></span>
                            </span>
                          </label>
                        </div>
                        <div class="form-check ">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" value="Fish" name="allergy"> Fish
                            <span class="form-check-sign">
                              <span class="check"></span>
                            </span>
                          </label>
                        </div>
                        <div class="form-check ">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" value="Peanut" name="allergy"> Peanuts
                            <span class="form-check-sign">
                              <span class="check"></span>
                            </span>
                          </label>
                        </div>
                        <div class="form-check ">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" value="Milk" name="allergy"> Milk	
                            <span class="form-check-sign">
                              <span class="check"></span>
                            </span>
                          </label>
                        </div>
                        <div class="form-check ">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" value="Soy" name="allergy"> Soy
                            <span class="form-check-sign">
                              <span class="check"></span>
                            </span>
                          </label>
                        </div>
                        <div class="form-check ">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" value="Shellfish" name="allergy"> Shellfish
                            <span class="form-check-sign">
                              <span class="check"></span>
                            </span>
                          </label>
                        </div>
                        </div>
                        
                      </div>
                      <div class="tab-pane" id="medic">
                      	<%
                      	ArrayList<MedicalCondition> medicallist = (ArrayList<MedicalCondition>) request.getAttribute("medicalconditionlist");
                      	%>
                       <h5 class="info-text">Tell us about your medical condition<br>
							This info lets us adjust your nutrition requirements and avoid certain food in your diet.</h5><br>
						<h5 class="info-text">Do you have any medical condition mention down below?</h5><br>
                        
                        <div class="row justify-content-center" id="med">
                            	
<!--                                  <div class="col-sm-10 checkbox-radios"> -->
                            	<%
                            	for (MedicalCondition medical : medicallist) {
								%>
								<div class="form-check form-check-inline">
			                          <label class="form-check-label">
			                            <input class="form-check-input" type="checkbox" name="medicalcondition" value="<%=medical.getMedicalID()%>" data-name="<%=medical.getMedicalConditionName()%>"> <%=medical.getMedicalConditionName() %>
			                            <span class="form-check-sign">
			                              <span class="check"></span>
			                            </span>
			                          </label>
                        		</div>
                              <%
									}
								%>
						</div>
						<br>
                        <div class="row justify-content-center" id="diabetes">
                          <div class="col-sm-12">
                            <h5 class="info-text"> Tell us your average blood sugar level to further modify your diet (for diabetic only)</h5>
                          </div>
                          <div class="col-sm-10">
                            <div class="form-group">
                              <label>Blood Sugar (mg/dL)</label>
                              <input type="number" class="form-control" name="bloodsugar" id="sugar">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer" id="foot">
                    <div class="mr-auto">
                      <input type="button" class="btn btn-previous btn-fill btn-default btn-wd disabled" name="previous" value="Previous">
                    </div>
                    <div class="ml-auto">
                      <input type="button" class="btn btn-next btn-fill btn-primary btn-wd" name="next" value="Next">
                      <input type="submit" class="btn btn-finish btn-fill btn-primary btn-wd" name="finish" value="Finish" style="display: none;">
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </form>
              </div>
            </div>
            <!-- wizard container -->
          </div>
        </div>
      </div>
      <footer class="footer">
        <div class="container">
          <nav class="float-left">
            <ul>
              <li>
                <a href="index.jsp">
                  Diet Coach
                </a>
              </li>
              <li>
                <a href="AboutUs.jsp">
                  About Us
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright float-right">
            &copy;
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="material-icons">favorite</i> by
            <a href="index.jsp" target="_blank">Diet Coach.</a>
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
    	$("#diabetes").find("*").prop("disabled", true);
    	$( "#exampleemalil" ).blur(function() {
    		  var email = $('#exampleemalil').val();
    			$.get('CheckNewUserServlet', {
    				email : email,
    			}, function(responseText) {
					if (responseText.length > 2) {
						$('#error-email').remove();
						$('#emaildiv').append("<label id='error-email' class='error'>"+responseText+"</label>");
						$("#foot").find("*").prop("disabled", true);
					} 
					else{
						$('#error-email').remove();
						$("#foot").find("*").prop("disabled", false);
					}
    			});
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
	<script src="assets/js/core-dash/custom-slide.js"></script>
  <script>
    $(document).ready(function() {
      // Initialise the wizard
      demo.initMaterialWizard();
      setTimeout(function() {
        $('.card.card-wizard').addClass('active');
      }, 600);
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
  <script>
    function setFormValidation(id) {
      $(id).validate({
        highlight: function(element) {
          $(element).closest('.form-group').removeClass('has-success').addClass('has-danger');
          $(element).closest('.form-check').removeClass('has-success').addClass('has-danger');
        },
        success: function(element) {
          $(element).closest('.form-group').removeClass('has-danger').addClass('has-success');
          $(element).closest('.form-check').removeClass('has-danger').addClass('has-success');
        },
        errorPlacement: function(error, element) {
          $(element).closest('.form-group').append(error);
        },
      });
    }

    $(document).ready(function() {
      setFormValidation('#RegisterValidation');
      setFormValidation('#TypeValidation');
      setFormValidation('#LoginValidation');
      setFormValidation('#RangeValidation');
    });
  </script>
</body>
</html>