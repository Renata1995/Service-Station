<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<!-- Log In Page -->
<!-- This page does not use main.gsp as layout template -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/sunny/jquery-ui.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<asset:javascript src="style.js" />
<asset:stylesheet src="style.css" />
<asset:javascript src="indexForm.js"/>

<style>
body{
	background-image: url('${resource(dir: "images", file: "")}');
	background-repeat: no-repeat;
	background-size:cover;
}
.panel{
	margin: 100px 650px; 
	width: 40%; 
	padding-bottom:20px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
}
.indexForm{
	margin:30px;
}
ul.nav-tabs>li{
	width:100%;

}
label.loginLabel{
	text-align:left;
}

</style>
</head>


<body>
	<div id="indexDiv">
		
		<div class="panel panel-danger">
			<ul class="nav nav-tabs">
			<li class="tab1" role="presentation" ><a>Log In</a></li>
		
			</ul>
		
			
			<!-- Log in form -->
			<g:form controller="home" class="indexForm form-horizontal" id="logInForm">

				<!-- Domin Selection -->
				<div class="form-group">
					<label for="domain" class="loginLabel col-md-3 control-label"
						style="text-align: left;">Domain</label>
					<div class="col-md-7">
						<select class="form-control" name="domain" value="">
							<option value="1">Admin</option>
							<option value="2">Student</option>
						</select>
					</div>
				</div>


				<!-- Email Input -->
				<div class="form-group">
					<label for="inputEmail3" class="loginLabel col-md-3 control-label"
						style="text-align: left;">Email</label>
					<div class="col-md-7">
						<input type="email" class="form-control" id="inputEmail3"
							placeholder="Email">
					</div>
				</div>

				<!-- Password Input -->
				<div class="form-group">
					<label for="inputPassword3"
						class="loginLabel col-md-3 control-label"
						style="text-align: left;">Password</label>
					<div class="col-md-7">
						<input type="password" class="form-control" id="inputPassword3"
							placeholder="Password">
					</div>
				</div>

				<!-- Remember Me -->
				<div class="form-group">
					<div class="col-md-offset-3 col-md-7">
						<div class="checkbox">
							<label> <input type="checkbox"> Remember me
							</label>
						</div>
					</div>
				</div>

				<!-- Log in button -->
				<div class="form-group">
					<div class="col-md-offset-3 col-md-7">
						<g:actionSubmit controller="home" action="index" method="POST"
							class="btn btn-default" value="Log In" />
					</div>
				</div>
			</g:form>	<!-- Log in Form -->
			
			
			
			
			
			<!-- Sign up Form -->
			<g:form class="indexForm form-horizontal" controller="home" id="signUpForm" style="display:none">

				<!-- Domin Selection -->
				<div class="form-group">
					<label for="domain" class="loginLabel col-md-3 control-label"
						style="text-align: left;">Domain</label>
					<div class="col-md-7">
						<select class="form-control" name="domain" value="">
							<option value="1">Admin</option>
							<option value="2">Student</option>
						</select>
					</div>
				</div>


				<!-- Email Input -->
				<div class="form-group">
					<label for="inputEmail3" class="loginLabel col-md-3 control-label"
						style="text-align: left;">Email</label>
					<div class="col-md-7">
						<input type="email" class="form-control" id="inputEmail3"
							placeholder="Email">
					</div>
				</div>

				<!-- Password Input -->
				<div class="form-group">
					<label for="inputPassword3"
						class="loginLabel col-md-3 control-label"
						style="text-align: left;">Password</label>
					<div class="col-md-7">
						<input type="password" class="form-control" id="inputPassword3"
							placeholder="Password">
					</div>
				</div>

				<!-- Log in button -->
				<div class="form-group">
					<div class="col-md-offset-3 col-md-7">
						<g:actionSubmit controller="home" action="index" method="POST"
							class="btn btn-default" value="Sign Up" />
					</div>
				</div>
			</g:form><!-- Sign Up Form -->
		</div>

	</div>
</body>
</html>