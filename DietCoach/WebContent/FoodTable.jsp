<%@page import="com.beans.DietCategory"%>
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
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="asset/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="asset/css/material-dashboard.min1c51.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="asset/demo/demo.css" rel="stylesheet" />

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	var recipelist = '<%=request.getAttribute("foodrecipelist")%>';
//	var recipelist = $.parseJSON(foodrecipeList);	
	container = $('#recipeCon');
	var btn= $('#tbody tr td button');
	
	btn.on('click',function(){
		$('#titlemodal h4').empty();
		container.empty();
		console.log('click');
		var $this = $(this),
		recipeid = $this.data('recipeid');
		fooditemid = $this.data('fooditemid');
		fooditemname = $this.data('name');
		console.log(recipeid);
		if(recipeid>0)
		{
		$.each(JSON.parse(recipelist), function(x, val) {
// 			console.log(val.foodRecipeId);
 				if(val.foodRecipeId==recipeid){
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
	    });
		}
		if(recipeid==0){
			rname = $this.data('name');
			$('#titlemodal h4').append(rname);
			//container.append("<tr><td>Add</td></tr><tr><td>Recipe</td></tr>");
			//$('#titlemodal h4').append(val.FoodName);
//			container.append("<h4 class='modal-title'>Add Recipe"+rname+"</h4>");
			container.append("<div id='newlines'><div class='form-group bmd-form-group'><div class='input-group'><input type='text' class='form-control'placeholder='Ingredient Name' name='ingredientname' id='ingreds'>&nbsp;&nbsp;&nbsp;<input type='text' class='form-control'placeholder='Ingredient Quantity' name='ingredientgram' id='ingreqty'></div></div><div class='form-group bmd-form-group'><div class='input-group'><button type='button' id='addingre' class='btn btn-primary btn-sm'>Add Ingredient</button></div></div><div class='form-group bmd-form-group'><div class='input-group'><textarea class='form-control' placeholder='Ingredient list' id='ingrearea' name='ingredients'></textarea></div></div><div class='form-group bmd-form-group'><div class='input-group'><input type='text' class='form-control' placeholder='Step 1' name='step1'></div></div><div class='form-group bmd-form-group'><div class='input-group'></div><input type='text' placeholder='Step 2' name='step2' class='form-control'></div><div class='form-group bmd-form-group'><div class='input-group'></div><input type='text' placeholder='Step 3' name='step3' class='form-control'></div></div><div class='form-group bmd-form-group'><input type='hidden' id='steps' name='step'><input type='hidden' id='steps' name='step'> <input type='hidden' name='foodidforrecipe' id='foodidforrecipe'><button type='button' class='btn btn-primary btn-link btn-wd btn-lg' id='addmore'>Add More Step</button><button type='submit' id='stepcountadd' class='btn btn-primary btn-link btn-wd btn-lg' data-dismiss='modal' aria-hidden='true'>Add</button><button type='button' class='btn btn-primary btn-link btn-wd btn-lg' data-dismiss='modal' aria-hidden='true'>Close</button><div>");

			var stp = 3;
			var rowcnt = 4;
			$('#addmore').on('click',function(){
				console.log('new line function');		
				$('#newlines').append("<div class='form-group bmd-form-group'><div class='input-group'></div><input type='text' placeholder='Step "+rowcnt+"' name='step"+rowcnt+"' class='form-control'></div>");
				rowcnt = rowcnt + 1;
				stp = stp + 1;
				if (rowcnt > 10) {
					document.getElementById(btn.id).disabled = true;
				}
			});
			
			$('#stepcountadd').on('click',function(){
				console.log('Step count');
				document.getElementById("steps").value = stp;
				console.log(stp);
				console.log(fooditemid);
				document.getElementById("stepforrecipe").value = stp;
				document.getElementById("foodidforrecipe").value = fooditemid;
				
				var ingredientname = $("textarea[name=ingredients]").val();
				var stpname = $("input[name=step1]").val();
				var steplist="";
				for(var ss=1;ss<=stp;ss++){
					var st = "step"+ss;
					var sts = "input[name="+st+"]";
					var stpname = $(sts).val();
					steplist = steplist+stpname;
					if(ss<stp){
						steplist = steplist+" ; ";
					}
				}
				
				
				
				console.log(ingredientname);
				console.log(stpname);
				
				$.post('AddRecipeServlet', {
					fooditemid : fooditemid,
					fooditemname : fooditemname,
					ingredientname : ingredientname,
					steplist : steplist,
    			}, function(responseText) {
					if (responseText.length > 2) {
						location.reload();
					} 
					else{
						
					}
    			});
				
				
				
			});
			$('#addingre').on('click',function(){
				var cntrl = $("#ingreds").val();
				cntrl=cntrl+" - ";
				cntrl=cntrl+$("#ingreqty").val();
				console.log(cntrl);
				var showcntrl = cntrl;
				showcntrl=showcntrl+'.';
				$("#ingrearea").append(showcntrl+"\n");
				$("#ingreds").val("");
				$("#ingreqty").val("");
			});
			
			$('#ingrearea')
		    .focus(function(){ this.rows=7 })
		    .blur( function(){ this.rows=2 });
			
		}	
	});
	
	
});
</script>
</head>

<body class="">
	<%
		ArrayList<Food> foodlist = (ArrayList<Food>) request.getAttribute("foodlist");
		ArrayList<DietCategory> diettype = (ArrayList<DietCategory>) request.getAttribute("dietcatlist");
	%>
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
            <div class="collapse " id="pagesExamples">
              <ul class="nav">
                <li class="nav-item ">
                  <a class="nav-link " href="UserListServlet">
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
            <div class="collapse show" id="componentsExamples">
              <ul class="nav">
                <li class="nav-item active">
                  <a class="nav-link active" href="FoodDisplayServlet">
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
            <a class="navbar-brand" href="javascript:;">Food Details</a>
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
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">assignment</i>
                  </div>
                  <h4 class="card-title">User Details</h4>
                </div>
                <div class="card-body">
                  <div class="toolbar">
                    <!--        Here you can write extra buttons/actions for the toolbar              -->
                  </div>
                  <div class="material-datatables">
                    <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                      <thead>
                        <tr>
                        	<th>ID</th>
							<th style="width: 180px;" >Name</th>
							<th>Meal Type</th>
							<th>Diet Type</th>
							<th>Calories</th>
							<th>Image</th>
							<th style="width: 110px;">Recipe</th>
                         	<th class="disabled-sorting text-right" style="width: 120px;">Actions</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                        	<th>ID</th>
							<th>Name</th>
							<th>Meal Type</th>
							<th>Diet Type</th>
							<th>Calories</th>
							<th>Image</th>
							<th>Recipe</th>
                          	<th class="text-right">Actions</th>
                        </tr>
                      </tfoot>
											<tbody id="tbody">
												<%
													for (Food f : foodlist) {
												%>
												<tr>
													<td><%=f.getFoodid()%></td>
													<td><%=f.getFoodname()%></td>
													<td><%=f.getMealtype()%></td>
													<td>
														<%
															for (DietCategory d : diettype) {
																	if ((d.getDietcategoryid()) == f.getDietid()) {
														%><%=d.getCategoryname()%> <%
 	}
 		}
 %>
													</td>
													<td><%=f.getCalories()%></td>
													<%-- 													<td><%=f.getCarbs()%>g</td> --%>
													<%-- 													<td><%=f.getProtein()%>g</td> --%>
													<%-- 													<td><%=f.getFat()%>g</td> --%>
													<%-- 													<td><%=f.getSugar()%>g</td> --%>
													<%-- 													<td><%=f.getFiber()%>g</td> --%>
													<%-- 													<td><%=f.getNutritionalInfo()%></td> --%>
													<%-- 													<td><%=f.getQuantity()%> <%=f.getServingType()%></td> --%>
													<td><img
														src="data:image/jpeg;base64,<%=f.getFoodImageString()%>"
														width="80px" height="80px" style="border-radius: 8px;"></td>
													<td>
														<%
															if (f.getFoodrecipeId() > 0) {
														%>
														<button type="button" class="btn btn-primary btn-link"
															data-recipeid="<%=f.getFoodrecipeId()%>" data-fooditemid="<%=f.getFoodid() %>"
															data-toggle="modal" data-target=".bd-example-modal-lg"
															id="showrecipe" data-onck="rec">Show Recipe</button> <%
 	} else {
 %>
														<button type="button" class="btn btn-primary btn-link"
															data-recipeid="<%=f.getFoodrecipeId()%>" data-fooditemid="<%=f.getFoodid()%>"
															data-name="<%=f.getFoodname()%>" data-toggle="modal"
															data-target=".bd-example-modal-lg">Add Recipe</button> <%
 	}
 %>
													</td>
													<td><a href="UpdateFoodServlet?id=<%=f.getFoodid()%>&resid=<%=f.getFoodrecipeId() %>"
														rel="tooltip" title="Update Food"
														class="btn btn-primary btn-link btn-sm"> <i
															class="material-icons">edit</i>
													</a><a href="DeleteFoodServlet?id=<%=f.getFoodid()%>"
														rel="tooltip" title="Delete Food"
														class="btn btn-primary btn-link btn-sm"> <i
															class="material-icons">delete</i>
													</a></td>

												</tr>
												<%
													}
												%>
											</tbody>
					</table>
                  </div>
                </div>
                <!-- end content-->
              </div>
              <!--  end card  -->
            </div>
            <!-- end col-md-12 -->
          </div>
          <!-- end row -->
        </div>
      </div>
			<!-- 			Show Food Recipe modal -->
			<div class="modal fade bd-example-modal-lg" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<form action='AddRecipeServlet' method='post'>
					<div class="modal-content">
						<div class="modal-header" id="titlemodal">
							<h4 class="modal-title" id="myLargeModalLabel"></h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
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
					</form>
				</div>
			</div>

			<!-- Footer Start -->
<%@include file="Footer-Admin.jsp"%>
<!-- footer end -->
		</div>
	</div>
	<!--   Core JS Files   -->
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
      $('#datatables').DataTable({
        "pagingType": "full_numbers",
        "lengthMenu": [
          [10, 25, 50, -1],
          [10, 25, 50, "All"]
        ],
        responsive: true,
        language: {
          search: "_INPUT_",
          searchPlaceholder: "Search records",
        }
      });

      var table = $('#datatable').DataTable();

      // Edit record
      table.on('click', '.edit', function() {
        $tr = $(this).closest('tr');
        var data = table.row($tr).data();
        alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
      });

      // Delete a record
      table.on('click', '.remove', function(e) {
        $tr = $(this).closest('tr');
        table.row($tr).remove().draw();
        e.preventDefault();
      });

      //Like record
      table.on('click', '.like', function() {
        alert('You clicked on Like button');
      });
    });
  </script>
  <script>
    $(document).ready(function() {
      // Initialise Sweet Alert library
      demo.showSwal();
    });
  </script>
	<!--   End of Js Files -->
	<script>
function myFunction() {
	  var x = document.getElementById("mySelect").selectedIndex;
	  x=x-1;
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[x];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</body>

</html>
