<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- Contains all resource import -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=2.0">


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

<script
	src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css" />

<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<asset:javascript src="style.js" />
<asset:stylesheet src="style.css" />

<style>
body {
	max-width: none;
}
</style>
<g:layoutHead />
</head>
<body>
	<div class="body" id="homeOverallDiv">

		<!-- Top Bar -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			style="width: 100%; height: 9%; border-radius: 0px"
			id="horizontal-nav">
			<div class="container-fluid" style="height: 9%">

				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header" style="font-size: 20px; color: white;">
					<asset:image src="ACIcon.png" id="icon" style="width:45px" />
					Austin College Service Station
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">

					<ul class="nav navbar-nav navbar-right">
						<li><a href="">ZX</a></li>
						<li class="dropdown" style="padding-right: 20px"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"><span
								class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#"><span
										class="glyphicon glyphicon-user right-corner"
										aria-hidden="true"></span>Profile</a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-cog right-corner"
										aria-hidden="true"></span>Setting</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-log-out right-corner"
										aria-hidden="true"></span>Log Out</a></li>
							</ul></li>
					</ul>


				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>



		<!-- Side Nav Bar -->
		<!-- This nav bar contains five remoteLink -->
		<nav class="nav-pills nav-stacked" id="sideBar">
			<div class="sidebar-collapse menu-collapse" style="height: 100%">
				<ul class="nav navLink" id="main-menu" style="height: 100%">
					<li><g:link controller="acStudent" params="[domain:1]" action="dashboard">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
							<br/>Home </g:link></li>
					<li><g:link controller="hour" action="overall">
							<span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
							<br />Overall</g:link></li>
					<li><g:link controller="acStudent" action="studentList">
							<span class="glyphicon glyphicon-education" aria-hidden="true"></span>
							<br /> Students</g:link></li>

					<li><g:link controller="EO" action="eventMain">
							<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
							<br />Events</g:link></li>

					<li><g:link controller="EO" action="orgAgMain">
							<span class="glyphicon glyphicon-tower" aria-hidden="true"></span>
							<br />Organizations</g:link></li>

				</ul>
			</div>

		</nav>
		<div class="panel panel-default" style="margin-left: 160px">

			<!-- Ajax page will show up -->
			<div id="main">
				<g:layoutBody />
				<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
			</div>
			<!-- main end -->
		</div>
		<!-- panel end -->

	</div>


</body>
</html>
