<%@page import="com.beans.MealPlan"%>
<%@page import="com.utility.MealType"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.beans.Food"%>
<%@page import="java.util.ArrayList"%>
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
  
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .card-wizard .choice .icon {
    text-align: inherit;
    vertical-align: middle;
    height: 70px;
    width: 116px;
    border-radius: 5%;
    color: #999;
    margin: 0 auto 20px;
    border: 4px solid #ccc;
    transition: all .2s;
    -webkit-transition: all .2s;
}
/* .card-wizard[data-color=rose] */

  .card-wizard .choice:hover .icon {
    border-color: #9124a3;
    color: #9124a3;
}
.card-wizard .choice.active .icon, .card-wizard .choice:hover .icon {
    border-color: #9124a3;
}
.card-wizard .choice i {
    font-size: 40px;
    line-height: 70px;
}

  .img-thumbnail
  {
  	height: 60px;
  	width: 60px;
  }
  #result, #result1, #result2, #result3{
   position: absolute;
   width: inherit;
/*    max-width:674px;  */
   cursor: pointer;
   overflow-y: auto;
   max-height: 280px;
   box-sizing: border-box;
   z-index: 1001;
  }
  #result1{
  position: absolute;
   width: inherit;
/*    max-width:674px;  */
   cursor: pointer;
   overflow-y: auto;
   max-height: 280px;
   box-sizing: border-box;
   z-index: 1001;
  }
  .link-class:hover{
    background-color:#f1f1f1; 
  }
  .list-group
{
	padding-left:0;margin-bottom:20px
}
.list-group-item
{
	position:relative;display:block;padding:10px 15px;margin-bottom:-1px;background-color:#fff;border:1px solid #ddd
}
.fa-star:before {
    content: "\f005";
}

.rating-list li i.yellow {
    color: #9c27b0;
}

.rating-list li i.gray {
    color: #bbb;
}

.list-inline>li {
    display: inline-block;
    padding-right: 5px;
    padding-left: 5px;
}

.rating-list li {
    padding: 0px;
}
.form-group .fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: 40px;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    transform: translate(0, 0);
}
.customtable tr td{
	padding:0px;
	padding-right: 10px;
}
.customtable td{
	border-top: 1px solid rgba(0,0,0,.06);
	border-bottom: none;
}
.card .table tr:first-child td {
    border-top: 1px solid rgba(0,0,0,.06);
}

</style>

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
          <li class="nav-item ">
            <a class="nav-link" href="MealPlanServlet">
              <i class="material-icons">list_alt</i>
              <p> Meal Planner </p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link active" href="FoodSearchServlet">
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
            <a class="navbar-brand" href="javascript:;">Daily Intake</a>
          </div>
          <!-- Nav-file Start -->
		<%@include file="Premium-Nav-Bar.jsp"%>
		<!-- Nav-file End-->
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
        	
          <div class="col-md-12 col-12 mr-auto ml-auto">
            <!--      Wizard container        -->
            <div class="wizard-container">
              <div class="card card-wizard" data-color="purple" >
                <form action="#" method="">
                  <!--        You can switch " data-color="primary" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
                  <div class="card-header text-center">
                    <h3 class="card-title">
                      Daily Food Intake
                    </h3>
                    <h5 class="card-description">This information will let us know more about you eat throughout a day.</h5>
                  </div>
                  <div class="wizard-navigation">
                    <ul class="nav nav-pills">
                      <li class="nav-item">
                        <a class="nav-link active" href="#breakfastWiz" data-toggle="tab" role="tab"> 
                          Breakfast
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#lunchWiz" data-toggle="tab" role="tab">
                          Lunch
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#dinnerWiz" data-toggle="tab" role="tab">
                          Dinner
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#snackWiz" data-toggle="tab" role="tab">
                          Sanck
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#water" data-toggle="tab" role="tab">
                          Water
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#exer" data-toggle="tab" role="tab">
                          Exercise
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <div class="tab-content">
                      <div class="tab-pane active" id="breakfastWiz">
                        <div class="row justify-content-center">
                        	<form >
								<div class="col-md-12 col-lg-12">
									<input type="text" name="search" id="search" placeholder="Search Food Items..." class="form-control" autocomplete="off"/>
   									<ul class="list-group" id="result"></ul>
									<input type="hidden" id="idfood"/>
								</div>
							</form>
							<div class="row">
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="breakfastMeal">
                                <div class="choice" data-toggle="wizard-checkbox" >
                                  <input type="checkbox" name="jobb" value="Design">
                                  <div class="icon">
                                    <i class="fa fa-list-alt"></i>
                                  </div>
                                  <h5>Meal-Plan</h5>
                                </div>
                              </div>
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="breakfastMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Code">
                                  <div class="icon">
                                    <i class="fa fa-history"></i>
                                  </div>
                                  <h5>Recent</h5>
                                </div>
                              </div>
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="breakfastMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Develop">
                                  <div class="icon">
                                    <i class="fa fa-refresh"></i>
                                  </div>
                                  <h5>Frequent</h5>
                                </div>
                              </div>
                            </div>
                        	<table class="table">
                        		<thead>
                        			<th>Image</th>
                        			<th>Name</th>
                        			<th>Quantity</th>
                        			<th>Nutrition Value</th>
                        		</thead>
								<tbody id="breakfast">
								</tbody>
							</table>
						</div>
                      </div>
                      <div class="tab-pane " id="lunchWiz">
                        <div class="row justify-content-center">
								<div class="col-md-12 col-lg-12">
									<input type="text" name="search1" id="search1" placeholder="Search Food Items..." class="form-control" autocomplete="off"/>
   									<ul class="list-group" id="result1"></ul>
									<input type="hidden" id="idfood1"/>
								</div>
							<div class="row">
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="lunchMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Design">
                                  <div class="icon">
                                    <i class="fa fa-list-alt"></i>
                                  </div>
                                  <h5>Meal-Plan</h5>
                                </div>
                              </div>
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="lunchMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Code">
                                  <div class="icon">
                                    <i class="fa fa-history"></i>
                                  </div>
                                  <h5>Recent</h5>
                                </div>
                              </div>
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="lunchMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Develop">
                                  <div class="icon">
                                    <i class="fa fa-refresh"></i>
                                  </div>
                                  <h5>Frequent</h5>
                                </div>
                              </div>
                            </div>
                        	<table class="table">
                        		<thead>
                        			<th>Image</th>
                        			<th>Name</th>
                        			<th>Quantity</th>
                        			<th>Nutrition Value</th>
                        		</thead>
								<tbody id="lunch">
								</tbody>
							</table>
						</div>
                      </div>
                      <div class="tab-pane " id="dinnerWiz">
                        <div class="row justify-content-center">
								<div class="col-md-12 col-lg-12">
									<input type="text" name="search2" id="search2" placeholder="Search Food Items..." class="form-control" autocomplete="off"/>
   									<ul class="list-group" id="result2"></ul>
									<input type="hidden" id="idfood2"/>
								</div>
							<div class="row">
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="dinnerMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Design">
                                  <div class="icon">
                                    <i class="fa fa-list-alt"></i>
                                  </div>
                                  <h5>Meal-Plan</h5>
                                </div>
                              </div>
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="dinnerMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Code">
                                  <div class="icon">
                                    <i class="fa fa-history"></i>
                                  </div>
                                  <h5>Recent</h5>
                                </div>
                              </div>
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="dinnerMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Develop">
                                  <div class="icon">
                                    <i class="fa fa-refresh"></i>
                                  </div>
                                  <h5>Frequent</h5>
                                </div>
                              </div>
                            </div>
                        	<table class="table">
                        		<thead>
                        			<th>Image</th>
                        			<th>Name</th>
                        			<th>Quantity</th>
                        			<th>Nutrition Value</th>
                        		</thead>
								<tbody id="dinner">
								</tbody>
							</table>
						</div>
                      </div>
                      <div class="tab-pane " id="snackWiz">
                        <div class="row justify-content-center">
								<div class="col-md-12 col-lg-12 col-sm-12">
									<input type="text" name="search" id="search3" placeholder="Search Food Items..." class="form-control" autocomplete="off"/>
   									<ul class="list-group" id="result3"></ul>
									<input type="hidden" id="idfood3"/>
								</div>
							<div class="row">
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="snackMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Design">
                                  <div class="icon">
                                    <i class="fa fa-list-alt"></i>
                                  </div>
                                  <h5>Meal-Plan</h5>
                                </div>
                              </div>
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="snackMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Code">
                                  <div class="icon">
                                    <i class="fa fa-history"></i>
                                  </div>
                                  <h5>Recent</h5>
                                </div>
                              </div>
                              <div class="col-sm-4" data-toggle='modal' data-target='.bd-example-modal-lg' id="snackMeal">
                                <div class="choice" data-toggle="wizard-checkbox">
                                  <input type="checkbox" name="jobb" value="Develop">
                                  <div class="icon">
                                    <i class="fa fa-refresh"></i>
                                  </div>
                                  <h5>Frequent</h5>
                                </div>
                              </div>
                            </div>
                        	<table class="table">
                        		<thead>
                        			<th>Image</th>
                        			<th>Name</th>
                        			<th>Quantity</th>
                        			<th>Nutrition Value</th>
                        		</thead>
								<tbody id="snack">
								</tbody>
							</table>
						</div>
                      </div>
                      <div class="tab-pane" id="water">
						<h5 class="info-text">Daily wanter intake in glass</h5>
                        <div class="row justify-content-center">
                        	<div class="form-group">
                        		<input type="hidden" id="starvalue" name="water">
                         			<ul class="list-inline rating-list" id="waterlist">
											<li><i class="fa fa-glass gray" id="1"></i></li>&emsp;
											<li><i class="fa fa-glass gray" id="2"></i></li>&emsp;
											<li><i class="fa fa-glass gray" id="3"></i></li>&emsp;
											<li><i class="fa fa-glass gray" id="4"></i></li>&emsp;
											<li><i class="fa fa-glass gray" id="5"></i></li>&emsp;
											<li><i class="fa fa-glass gray" id="6"></i></li>&emsp;
											<li><i class="fa fa-glass gray" id="7"></i></li>&emsp;
											<li><i class="fa fa-glass gray" id="8"></i></li>
									</ul>     
                              </div>
                              <br>
                         </div>
                         <div class="row justify-content-center">
                         <br>
                              <button class="btn btn-primary btn-round" type="button" id="addwater">Add</button>
                         </div>
					  </div>
					  <div class="tab-pane " id="exer">
                        <div class="row justify-content-center">
								<div class="col-md-12 col-lg-12 col-sm-12">
									<input type="text" name="search4" id="search4" placeholder="Search Exercise and Workout Plan..." class="form-control" autocomplete="off"/>
   									<ul class="list-group" id="result4"></ul>
									<input type="hidden" id="idfood4"/>
								</div>
                        	<table class="table">
                        		<thead>
                        			<th>Name</th>
                        			<th>Calories</th>
                        			<th class="text-center">Duration</th>
                        		</thead>
								<tbody id="exercise">
								</tbody>
							</table>
						</div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <!-- wizard container -->
          </div>
        </div>
      </div>
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
														<tbody id="MealCon">
														</tbody>
													</table>
												</div>
											</div>
											<input type="hidden" name="stepforrecipe" id="stepforrecipe">
										</div>
									</div>	
<!-- 										recipe ends -->

							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">Enter Food Quantity</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <div class="form-group bmd-form-group">
				                      <label for="exampleEmail" class="bmd-label-floating">Quantity</label>
				                      <input type="number" class="form-control" id="quant">
				                    </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" data-dismiss="modal" id="quadd">Add</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">Enter Food Quantity</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <div class="form-group bmd-form-group">
				                      <label for="exampleEmail" class="bmd-label-floating">Quantity</label>
				                      <input type="number" class="form-control" id="quant1">
				                    </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" data-dismiss="modal" id="quadd1">Add</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">Enter Food Quantity</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <div class="form-group bmd-form-group">
				                      <label for="exampleEmail" class="bmd-label-floating">Quantity</label>
				                      <input type="number" class="form-control" id="quant2">
				                    </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" data-dismiss="modal" id="quadd2">Add</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">Enter Food Quantity</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <div class="form-group bmd-form-group">
				                      <label for="exampleEmail" class="bmd-label-floating">Quantity</label>
				                      <input type="number" class="form-control" id="quant3">
				                    </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" data-dismiss="modal" id="quadd3">Add</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">Enter Time Duration</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <div class="form-group bmd-form-group">
				                      <label for="exampleEmail" class="bmd-label-floating">Minutes</label>
				                      <input type="number" class="form-control" id="quant4">
				                    </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" data-dismiss="modal" id="quadd4">Add</button>
							      </div>
							    </div>
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
      // Initialise the wizard
      demo.initMaterialWizard();
      setTimeout(function() {
        $('.card.card-wizard').addClass('active');
      }, 600);
    });
  </script>
  	<script>
$(document).ready(function(){
	var allFoodList = '<%=request.getAttribute("allFoodList")%>';
	var food = $.parseJSON(allFoodList);
	var mealplan = '<%=request.getAttribute("mealplan")%>';
	var meal = $.parseJSON(mealplan);
	var exerciseList = '<%=request.getAttribute("exercise")%>';
	var exercise = $.parseJSON(exerciseList);
	
	$.get('GetDailyIntakeServlet', {
  			}, function(responseText) {
					if (responseText.length > 2) {
						var intakelist = $.parseJSON(responseText);
						console.log(intakelist);
						$.each(intakelist, function(k, val){
							if(val.foodid==264){
								$('#waterlist').empty();
								for(var i=1;i<=8;i++){
									if(i<=val.quantity){
										$('#waterlist').append('<li><i class="fa fa-glass yellow" id="'+i+'"></i></li>&emsp;');
									}
									else{
										$('#waterlist').append('<li><i class="fa fa-glass gray" id="'+i+'"></i></li>&emsp;');
									}
								}
							}
						});
						$.each(food, function(key, value){
							$.each(intakelist, function(k, val){
							    if(val.foodid==value.foodid){
							    	console.log(value.foodname);
							    	if (val.mealtype.search('Breakfast') != -1 ){
							    		$('#breakfast').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+value.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td>"+value.foodname+"</td><td>Quantity : "+val.quantity+" "+value.servingType+"</td><td>per "+val.quantity+" "+value.servingType+"<br><table style='padding:0px;' class='customtable'><tr><td>Calories</td><td>"+val.calorie+"</td></tr><tr><td>Carbs</td><td>"+value.carbs*val.quantity+"g</td></tr><tr><td>Protein</td><td>"+value.protein*val.quantity+"g</td></tr><tr><td>Fat</td><td>"+value.fat*val.quantity+"g</td></tr><tr><td>Sugar</td><td>"+value.sugar*val.quantity+"g</td></tr><tr><td>Fiber</td><td>"+value.fiber*val.quantity+"g</td></tr></table></td></tr>");
							    	}
							    	if (val.mealtype.search('Lunch') != -1 ){
							    		$('#lunch').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+value.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td>"+value.foodname+"</td><td>Quantity : "+val.quantity+" "+value.servingType+"</td><td>per "+val.quantity+" "+value.servingType+"<br><table style='padding:0px;' class='customtable'><tr><td>Calories</td><td>"+val.calorie+"</td></tr><tr><td>Carbs</td><td>"+value.carbs*val.quantity+"g</td></tr><tr><td>Protein</td><td>"+value.protein*val.quantity+"g</td></tr><tr><td>Fat</td><td>"+value.fat*val.quantity+"g</td></tr><tr><td>Sugar</td><td>"+value.sugar*val.quantity+"g</td></tr><tr><td>Fiber</td><td>"+value.fiber*val.quantity+"g</td></tr></table></td></tr>");
							    	}
							    	if (val.mealtype.search('Dinner') != -1 ){
							    		$('#dinner').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+value.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td>"+value.foodname+"</td><td>Quantity : "+val.quantity+" "+value.servingType+"</td><td>per "+val.quantity+" "+value.servingType+"<br><table style='padding:0px;' class='customtable'><tr><td>Calories</td><td>"+val.calorie+"</td></tr><tr><td>Carbs</td><td>"+value.carbs*val.quantity+"g</td></tr><tr><td>Protein</td><td>"+value.protein*val.quantity+"g</td></tr><tr><td>Fat</td><td>"+value.fat*val.quantity+"g</td></tr><tr><td>Sugar</td><td>"+value.sugar*val.quantity+"g</td></tr><tr><td>Fiber</td><td>"+value.fiber*val.quantity+"g</td></tr></table></td></tr>");
							    	}
							    	if (val.mealtype.search('Snack') != -1 ){
							    		$('#snack').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+value.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td>"+value.foodname+"</td><td>Quantity : "+val.quantity+" "+value.servingType+"</td><td>per "+val.quantity+" "+value.servingType+"<br><table style='padding:0px;' class='customtable'><tr><td>Calories</td><td>"+val.calorie+"</td></tr><tr><td>Carbs</td><td>"+value.carbs*val.quantity+"g</td></tr><tr><td>Protein</td><td>"+value.protein*val.quantity+"g</td></tr><tr><td>Fat</td><td>"+value.fat*val.quantity+"g</td></tr><tr><td>Sugar</td><td>"+value.sugar*val.quantity+"g</td></tr><tr><td>Fiber</td><td>"+value.fiber*val.quantity+"g</td></tr></table></td></tr>");
							    	}
							    }
							}); 
						});
					} 
  			});
	
	$.post('GetDailyIntakeServlet', {
		}, function(responseText) {
			if (responseText.length > 2) {
				var intakelist = $.parseJSON(responseText);
				console.log(intakelist);
				$.each(exercise, function(key, value){
					$.each(intakelist, function(k, val){
					    if(val.exerciseId==value.exerciseId){
					    	$('#exercise').append("<tr><td >"+value.name+"</td><td>Calorise : "+val.calories+"</td><td>Duration : "+val.time+"Minutes</td></tr>");
					    }
					}); 
				});
			} 
		});
	
$('#addwater').click(function() {
	var water = $('#starvalue').val();
	$.get('UserInsertIntakeServlet', {
		foodid : 264,
		mealtype : 'water',
		quantity : water,
		calorie : 0
	});
})

 $('#search').keyup(function(){
  $('#result').html('');
  $('#state').val('');
  var add="Add";
  var btnid=1;
  var searchField = $('#search').val();
  var n = searchField.length;
  if(n>1){
  var expression = new RegExp(searchField, "i");
   $.each(food, function(key, value){
    if (value.foodname.search(expression) != -1 )
    {
     $('#result').append('<li class="list-group-item link-class"><img src="data:image/jpeg;base64,'+value.foodImageString+'" height="60" width="60" class="img-thumbnail" /> | '+value.foodname+' | Calores : '+value.calories+'</li>');
     $('#idfood').val(value.foodid);
     btnid=btnid+1;
    }
   });   
  }
 });

 var restemp;
 $('#result').on('click', 'li', function() {
	 $('#myModal').modal('show');
  var click_text = $(this).text().split('|');
  $('#search').val($.trim(click_text[1]));
  $("#result").html('');
  restemp = click_text[1];
  console.log(restemp);
//   addrow(res);
 });
 var qua;
 $('#quadd').click(function() {
		 qua = $('#quant').val();
		 if(qua>0){
		 addrow(restemp);
		 $('#quant').val('');
	 }
});
 
 function addrow(re) {
	 var expres = new RegExp(re, "i");
	   $.each(food, function(key, val){
		   var name = val.foodname;
		   name=" "+name+" ";
		   var n = name.localeCompare(re);
	    	if(n == 0)
	    	{
	    		$('#search').val('');
	    		var cal = qua * val.calories;
	    		console.log('called');
	    		$('#breakfast').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+val.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td>"+val.foodname+"</td><td>Quantity : "+qua+" "+val.servingType+"</td><td>per "+qua+" "+val.servingType+"<br><table style='padding:0px;' class='customtable'><tr><td>Calories</td><td>"+val.calories*qua+"</td></tr><tr><td>Carbs</td><td>"+val.carbs*qua+"g</td></tr><tr><td>Protein</td><td>"+val.protein*qua+"g</td></tr><tr><td>Fat</td><td>"+val.fat*qua+"g</td></tr><tr><td>Sugar</td><td>"+val.sugar*qua+"g</td></tr><tr><td>Fiber</td><td>"+val.fiber*qua+"g</td></tr></table></td></tr>");
	    		$.get('UserInsertIntakeServlet', {
	    			foodid : val.foodid,
	    			mealtype : 'Breakfast',
	       			quantity : qua,
	       			calorie : cal
	    		});
	    	}
	 	});
}
 
//  LUNCH
 
 $('#search1').keyup(function(){
	  $('#result1').html('');
	  $('#state').val('');
	  var add="Add";
	  var btnid=1;
	  var searchField = $('#search1').val();
	  var n = searchField.length;
	  if(n>1){
	  var expression = new RegExp(searchField, "i");
	   $.each(food, function(key, value){
	    if (value.foodname.search(expression) != -1 )
	    {
	     $('#result1').append('<li class="list-group-item link-class"><img src="data:image/jpeg;base64,'+value.foodImageString+'" height="60" width="60" class="img-thumbnail" /> | '+value.foodname+' | Calores : '+value.calories+'</li>');
	     $('#idfood1').val(value.foodid);
	     btnid=btnid+1;
	     
	    }
	   });   
	  }
	 });

 	var res1;
	 $('#result1').on('click', 'li', function() {
		 $('#myModal1').modal('show');
	  var click_text = $(this).text().split('|');
	  $('#search1').val($.trim(click_text[1]));
	  $("#result1").html('');
	  res1 = click_text[1];
	 });
	 var qua1;
	 $('#quadd1').click(function() {
			 qua1 = $('#quant1').val();
			 if(qua1>0){
			 addrow1(res1);
			 $('#quant1').val('');
		 }
	});
	 function addrow1(re) {
		// console.log(re+'addrow');
		 var expres = new RegExp(re, "i");
		   $.each(food, function(key, val){
			   var name = val.foodname;
			   name=" "+name+" ";
			   var n = name.localeCompare(re);
		    	if(n == 0)
		    	{
		    		$('#search1').val('');
		    		var cal1 = qua1 * val.calories;
		    		$('#lunch').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+val.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td>"+val.foodname+"</td><td>Quantity : "+qua1+" "+val.servingType+"</td><td>per "+qua1+" "+val.servingType+"<br><table style='padding:0px;' class='customtable'><tr><td>Calories</td><td>"+val.calories*qua1+"</td></tr><tr><td>Carbs</td><td>"+val.carbs*qua1+"g</td></tr><tr><td>Protein</td><td>"+val.protein*qua1+"g</td></tr><tr><td>Fat</td><td>"+val.fat*qua1+"g</td></tr><tr><td>Sugar</td><td>"+val.sugar*qua1+"g</td></tr><tr><td>Fiber</td><td>"+val.fiber*qua1+"g</td></tr></table></td></tr>");
		    		$.get('UserInsertIntakeServlet', {
		    			foodid : val.foodid,
		    			mealtype : 'Lunch',
		       			quantity : val.quantity,
		       			calorie : cal1
		    		});
		    	}
		 	});
	}
 
// 	 DINNER
	 
	 $('#search2').keyup(function(){
		  $('#result2').html('');
		  $('#state').val('');
		  var add="Add";
		  var btnid=1;
		  var searchField = $('#search2').val();
		  var n = searchField.length;
		  if(n>1){
		  var expression = new RegExp(searchField, "i");
		   $.each(food, function(key, value){
		    if (value.foodname.search(expression) != -1 )
		    {
		     $('#result2').append('<li class="list-group-item link-class"><img src="data:image/jpeg;base64,'+value.foodImageString+'" height="60" width="60" class="img-thumbnail" /> | '+value.foodname+' | Calores : '+value.calories+'</li>');
		     $('#idfood2').val(value.foodid);
		     btnid=btnid+1;
		     
		    }
		   });   
		  }
		 });

	 		var res2;
		 $('#result2').on('click', 'li', function() {
			 $('#myModal2').modal('show');
		  var click_text = $(this).text().split('|');
		  $('#search2').val($.trim(click_text[1]));
		  $("#result2").html('');
		  res2 = click_text[1];
		 });
		 var qua2;
		 $('#quadd2').click(function() {
				 qua2 = $('#quant2').val();
				 if(qua2>0){
				 addrow2(res2);
				 $('#quant2').val('');
			 }
		});
		 function addrow2(re) {
			// console.log(re+'addrow');
			 var expres = new RegExp(re, "i");
			   $.each(food, function(key, val){
				   var name = val.foodname;
				   name=" "+name+" ";
				   var n = name.localeCompare(re);
			    	if(n == 0)
			    	{
			    		$('#search2').val('');
			    		var cal2 = qua2 * val.calories;
			    		$('#dinner').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+val.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td>"+val.foodname+"</td><td>Quantity : "+qua2+" "+val.servingType+"</td><td>per "+qua2+" "+val.servingType+"<br><table style='padding:0px;' class='customtable'><tr><td>Calories</td><td>"+val.calories*qua2+"</td></tr><tr><td>Carbs</td><td>"+val.carbs*qua2+"g</td></tr><tr><td>Protein</td><td>"+val.protein*qua2+"g</td></tr><tr><td>Fat</td><td>"+val.fat*qua2+"g</td></tr><tr><td>Sugar</td><td>"+val.sugar*qua2+"g</td></tr><tr><td>Fiber</td><td>"+val.fiber*qua2+"g</td></tr></table></td></tr>");
			    		$.get('UserInsertIntakeServlet', {
			    			foodid : val.foodid,
			    			mealtype : 'Dinner',
			       			quantity : val.quantity,
			       			calorie : cal2
			    		});
			    	}
			 	});
		}
		 
// 		 SNACK
		 
		 $('#search3').keyup(function(){
			  $('#result3').html('');
			  $('#state').val('');
			  var add="Add";
			  var btnid=1;
			  var searchField = $('#search3').val();
			  var n = searchField.length;
			  if(n>1){
			  var expression = new RegExp(searchField, "i");
			   $.each(food, function(key, value){
			    if (value.foodname.search(expression) != -1 )
			    {
			     $('#result3').append('<li class="list-group-item link-class"><img src="data:image/jpeg;base64,'+value.foodImageString+'" height="60" width="60" class="img-thumbnail" /> | '+value.foodname+' | Calores : '+value.calories+'</li>');
			     $('#idfood3').val(value.foodid);
			     btnid=btnid+1;
			     
			    }
			   });   
			  }
			 });

		 	var res3;
			 $('#result3').on('click', 'li', function() {
				 $('#myModal3').modal('show');
			  var click_text = $(this).text().split('|');
			  $('#search3').val($.trim(click_text[1]));
			  $("#result3").html('');
			  res3 = click_text[1];
			 });
			 var qua3;
			 $('#quadd3').click(function() {
					 qua3 = $('#quant3').val();
					 if(qua3>0){
					 addrow3(res3);
					 $('#quant3').val('');
				 }
			});
			 function addrow3(re) {
				// console.log(re+'addrow');
				 var expres = new RegExp(re, "i");
				   $.each(food, function(key, val){
					   var name = val.foodname;
					   name=" "+name+" ";
					   var n = name.localeCompare(re);
				    	if(n == 0)
				    	{
				    		$('#search3').val('');
				    		var cal3 = qua3 * val.calories;
				    		$('#snack').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+val.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td>"+val.foodname+"</td><td>Quantity : "+qua3+" "+val.servingType+"</td><td>per "+qua3+" "+val.servingType+"<br><table style='padding:0px;' class='customtable'><tr><td>Calories</td><td>"+val.calories*qua3+"</td></tr><tr><td>Carbs</td><td>"+val.carbs*qua3+"g</td></tr><tr><td>Protein</td><td>"+val.protein*qua3+"g</td></tr><tr><td>Fat</td><td>"+val.fat*qua3+"g</td></tr><tr><td>Sugar</td><td>"+val.sugar*qua3+"g</td></tr><tr><td>Fiber</td><td>"+val.fiber*qua3+"g</td></tr></table></td></tr>");
				    		$.get('UserInsertIntakeServlet', {
				    			foodid : val.foodid,
				    			mealtype : 'Snack',
				       			quantity : val.quantity,
				       			calorie : cal3
				    		});
				    	}
				 	});
			}
			 
// 			 EXERCISE
			 
			 $('#search4').keyup(function(){
			  $('#result4').html('');
			  $('#state').val('');
			  var add="Add";
			  var btnid=1;
			  var searchField = $('#search4').val();
			  var n = searchField.length;
			  if(n>1){
			  var expression = new RegExp(searchField, "i");
			   $.each(exercise, function(key, value){
			    if (value.name.search(expression) != -1 )
			    {
			     $('#result4').append('<li class="list-group-item link-class"> | '+value.name+' | Calores : '+value.calories+'</li>');
			     $('#idfood4').val(value.exerciseId);
			     btnid=btnid+1;
			     
			    }
			   });   
			  }
			 });

			 var res4;
			 $('#result4').on('click', 'li', function() {
				 $('#myModal4').modal('show');
			  var click_text = $(this).text().split('|');
			  $('#search4').val($.trim(click_text[1]));
			  $("#result4").html('');
			  res4 = click_text[1];
			 });
			 var qua4;
			 $('#quadd4').click(function() {
					 qua4 = $('#quant4').val();
					 if(qua4>0){
					 addrow4(res4);
					 $('#quant4').val('');
				 }
			});
			 function addrow4(re) {
				// console.log(re+'addrow');
				 var expres = new RegExp(re, "i");
				   $.each(exercise, function(key, val){
					   var name = val.name;
					   name=" "+name+" ";
					   var n = name.localeCompare(re);
				    	if(n == 0)
				    	{
				    		$('#search4').val('');
				    		var cal4temp = qua4 * val.calories/val.minutes;
				    		var cal4 =  Math.floor(cal4temp); 
				    		$('#exercise').append("<tr><td >"+val.name+"</td><td>Calorise : "+cal4+"</td><td>Duration : "+qua4+" Minutes</td></tr>");
				    		$.post('UserInsertIntakeServlet', {
				    			exerciseid : val.exerciseId,
				       			time : val.minutes,
				       			calorie : cal4
				    		});
				    	}
				 	});
			}
			 
			 
			 
			 $('#breakfastMeal').click(function() {
					if(meal.breakfast!=null){
						$('#titlemodal h4').empty();
						$('#titlemodal h4').append('Breakfast');
						$('#MealCon').empty();
						$.each(food, function(key, val){
							var breakid = meal.breakfast.split("~");				
							for(var k=0;k<breakid.length; k++)
							{
								var iNum = parseInt(breakid[k]);
								if(iNum == val.foodid)
						    	{
						    		$('#MealCon').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+val.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td data-toggle='tooltip' data-html='true' title='<h5>Nutition Value</h5><table><tr><td>Calories</td><td>"+val.calories+"</td></tr><tr><td>Carbs</td><td>"+val.carbs+"g</td></tr><tr><td>Protein</td><td>"+val.protein+"g</td></tr><tr><td>Fat</td><td>"+val.fat+"g</td></tr><tr><td>Sugar</td><td>"+val.sugar+"g</td></tr><tr><td>Fiber</td><td>"+val.fiber+"g</td></tr></table>' data-placement='right'>"+val.foodname+"</td><td>Quantity : "+val.quantity+" "+val.servingType+"</td></tr>");
						    	}
							}
					 	});
					}
				});
				$('#lunchMeal').click(function() {
					if(meal.lunch!=null){
						$('#titlemodal h4').empty();
						$('#titlemodal h4').append('Lunch');
						$('#MealCon').empty();
						$.each(food, function(key, val){
							var breakid = meal.lunch.split("~");				
							for(var k=0;k<breakid.length; k++)
							{
							
								var iNum = parseInt(breakid[k]);
								if(iNum == val.foodid)
						    	{
						    		$('#MealCon').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+val.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td data-toggle='tooltip' data-html='true' title='<h5>Nutition Value</h5><table><tr><td>Calories</td><td>"+val.calories+"</td></tr><tr><td>Carbs</td><td>"+val.carbs+"g</td></tr><tr><td>Protein</td><td>"+val.protein+"g</td></tr><tr><td>Fat</td><td>"+val.fat+"g</td></tr><tr><td>Sugar</td><td>"+val.sugar+"g</td></tr><tr><td>Fiber</td><td>"+val.fiber+"g</td></tr></table>' data-placement='right'>"+val.foodname+"</td><td>Quantity : "+val.quantity+" "+val.servingType+"</td></tr>");
						    	}
							}
					 	});
					}
				});
				$('#dinnerMeal').click(function() {
					if(meal.dinner!=null){
						console.log(meal.dinner);
						$('#titlemodal h4').empty();
						$('#titlemodal h4').append('Dinner');
						$('#MealCon').empty();
						$.each(food, function(key, val){
							var breakid = meal.dinner.split("~");				
							for(var k=0;k<breakid.length; k++)
							{
								var iNum = parseInt(breakid[k]);
								if(iNum == val.foodid)
						    	{
						    		$('#MealCon').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+val.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td data-toggle='tooltip' data-html='true' title='<h5>Nutition Value</h5><table><tr><td>Calories</td><td>"+val.calories+"</td></tr><tr><td>Carbs</td><td>"+val.carbs+"g</td></tr><tr><td>Protein</td><td>"+val.protein+"g</td></tr><tr><td>Fat</td><td>"+val.fat+"g</td></tr><tr><td>Sugar</td><td>"+val.sugar+"g</td></tr><tr><td>Fiber</td><td>"+val.fiber+"g</td></tr></table>' data-placement='right'>"+val.foodname+"</td><td>Quantity : "+val.quantity+" "+val.servingType+"</td></tr>");
						    	}
							}
					 	});
					}
				});
				$('#snackMeal').click(function() {
					if(meal.snack!=null){
						$('#titlemodal h4').empty();
						$('#titlemodal h4').append('Snack');
						$('#MealCon').empty();
						$.each(food, function(key, val){
							var breakid = meal.snack.split("~");				
							for(var k=0;k<breakid.length; k++)
							{
								var iNum = parseInt(breakid[k]);
								if(iNum == val.foodid)
						    	{
						    		$('#MealCon').append("<tr><td><img alt='' src='data:image/jpeg;base64,"+val.foodImageString+"' height='80px' width='80px' style='border-radius: 8px;'></td> <td data-toggle='tooltip' data-html='true' title='<h5>Nutition Value</h5><table><tr><td>Calories</td><td>"+val.calories+"</td></tr><tr><td>Carbs</td><td>"+val.carbs+"g</td></tr><tr><td>Protein</td><td>"+val.protein+"g</td></tr><tr><td>Fat</td><td>"+val.fat+"g</td></tr><tr><td>Sugar</td><td>"+val.sugar+"g</td></tr><tr><td>Fiber</td><td>"+val.fiber+"g</td></tr></table>' data-placement='right'>"+val.foodname+"</td><td>Quantity : "+val.quantity+" "+val.servingType+"</td></tr>");
						    	}
							}
					 	});
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
      // Initialise the wizard
      demo.initMaterialWizard();
      setTimeout(function() {
        $('.card.card-wizard').addClass('active');
      }, 600);
    });
  </script>
  <script type="text/javascript">
	var current_star_statusses = [];

	star_elements = $('.fa-glass').parent();

	star_elements.find(".fa-glass").each(function(i, elem) {
	  current_star_statusses.push($(elem).hasClass('yellow'));
	});

	star_elements.find(".fa-glass").mouseenter(changeRatingStars);
	star_elements.find(".fa-glass").mouseleave(resetRatingStars);

	/**
	 * Changes the rating star colors when hovering over it.
	 */
	function changeRatingStars() {
	  // Current star hovered
	  var star = $(this);

	  // Removes all colors first from all stars
	  $('.fa-glass').removeClass('gray').removeClass('yellow');

	  // Makes the current hovered star yellow
	  star.addClass('yellow');

	  // Makes the previous stars yellow and the next stars gray
	  star.parent().prevAll().children('.fa-glass').addClass('yellow');
	  star.parent().nextAll().children('.fa-glass').addClass('gray');
 	  var numItems =$(star).closest('i').attr('id');
 	 document.getElementById("starvalue").value = numItems;
	  
	}

	/**
	 * Resets the rating star colors when not hovered anymore.
	 */
	function resetRatingStars() {
	  star_elements.each(function(i, elem) {
	    $(elem).removeClass('yellow').removeClass('gray').addClass(current_star_statusses[i] ? 'yellow' : 'gray');
	  });
	}
	</script>
</body>
</html>