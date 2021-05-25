<%@page import="com.beans.MedicalCondition"%>
<%@page import="com.beans.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="material-head.jsp"%>
</head>

<body class="">
	<%
		ArrayList<MedicalCondition> conditionsList = (ArrayList<MedicalCondition>) request
				.getAttribute("medicalconditionlist");
	%>
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="white"
			data-image="assets/img/sidebar-1.jpg">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->

			<!-- Logo Start -->
			<%@include file="material-logo.jsp"%>
			<!-- Logo End -->
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item  "><a class="nav-link"
						href="dashboard.jsp"> <i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="user.jsp">
							<i class="material-icons">person</i>
							<p>User Profile</p>
					</a></li>
					<li class="nav-item active "><a class="nav-link"
						href="tables.jsp"> <i class="material-icons">list</i>
							<p>Medical Condition List</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="typography.jsp"> <i class="material-icons">library_books</i>
							<p>Typography</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="icons.jsp">
							<i class="material-icons">bubble_chart</i>
							<p>Icons</p>
					</a>
					<li class="nav-item "><a class="nav-link"
						href="notifications.jsp"> <i class="material-icons">notifications</i>
							<p>Notifications</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<%@include file="material-nav.jsp"%>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-header-primary">
									<h4 class="card-title ">Medical Condition List</h4>
									<p class="card-category"></p>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table">
											<thead class=" text-primary">
												<th>ID</th>
												<th>Name</th>
												<th>Update</th>
											</thead>
											<tbody>
												<%
													for (MedicalCondition condition : conditionsList) {
												%>
												<tr>
													<td><%=condition.getMedicalID()%></td>
													<td><%=condition.getMedicalConditionName()%></td>
													<td><a
														href="UpdateMedicalConditionServlet?id=<%=condition.getMedicalID()%>">Update</a></td>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Setting button Start -->
			<%@include file="material-setting.jsp"%>
			<!-- Setting Button End -->
			<!-- Footer Start -->
			<%@include file="material-footer.jsp"%>
			<!-- Footer End-->
		</div>
	</div>
	<!--   Core JS Files   -->
	<%@include file="material-js.jsp"%>
	<!--   End of Js Files -->
</body>

</html>
