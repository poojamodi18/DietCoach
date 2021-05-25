<div class="row">
	<div class="col-lg-4 col-md-6 col-sm-8 ml-auto mr-auto">
		<div class="card card-login">
			<form class="form" method="post" action="ForgotPasswordServlet">
				<div class="card-header card-header-primary text-center">
					<h4 class="card-title">Forgot Password</h4>
				</div>
				<div class="card-body">
					<span class="bmd-form-group">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text">
                          <i class="material-icons">email</i>
                        </span>
                      </div>
                      <input type="email" class="form-control" placeholder="Email..." name="email">
                    </div>
                  </span>
				</div>
				<div class="card-footer justify-content-center">
					<a href="Login.jsp"
						class="btn btn-primary btn-link btn-wd btn-lg">Back to Login</a>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>
