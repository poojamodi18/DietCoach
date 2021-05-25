<div class="fixed-plugin">
	<div class="dropdown show-dropdown">
		<a href="#" data-toggle="dropdown"><text style="color: white; font-family: TimesNewRoman; font-size: 20px;">Help</text><i class="fa fa-question" style="color:white;"></i></a>
		<ul class="dropdown-menu">
<!-- 			<li class="header-title">Help Center</li> -->
			<li class="header-title">We are here to help.</li>
			<li class="adjustments-line">
			</li>
			<form>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>Have any questions?<br> Submit it here and
							we'll get back to you as soon as possible<br>(usually within
							1 or 2 business days).
						</label> <label class="bmd-label-floating"></label> <input type="text"
							class="form-control" name="email"
							placeholder="Your email address" id="email" required>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<input type="text" class="form-control" name="subject"
							placeholder="Subject" id="subject" required>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<textarea rows="4" class="form-control"
							placeholder="Type your message here" id="question" required></textarea>
					</div>
				</div>
			</div>
			<li class="button-container">
			<button type="button" class="btn btn-primary btn-block" id="sub">Submit Question</button></li>
			</form>
			<li class="button-container" id="notify">
				
			</li>
		</ul>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$("#sub").click(function() {
	var email = $('#email').val();
	var subject = $('#subject').val();
	var question = $('#question').val();
	$.get('InsertQueryServlet', {
		useremail : email,
		subject : subject,
		question : question
	}, function(responseText) {
		$("#notify").append("<div class='alert alert-warning alert-dismissible fade show' role='alert'>"+responseText+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
	});
});
</script>