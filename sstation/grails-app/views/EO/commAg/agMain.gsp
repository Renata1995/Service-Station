<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Community Agency Main Page</title>
</head>
<body>
	<div class="body">
		<div class="titletop">
			<h1 class="pagetitle">Community Agency Management</h1>
			<div class="cornerButtons"></div>
		</div><!-- titletop ends -->

		<div>

			<!-- Link to the profile or the service hour list of the current student -->
			<ul class="nav-tabs navGradient nav">
				<li class="tab1"><g:remoteLink controller="EO"
						action="_eventOverallKPI" update="eventMain">Analysis</g:remoteLink></li>
				<li class="tab2"><g:remoteLink controller="EO"
						action="_eventTable" update="eventMain">
						<b>Table</b>
					</g:remoteLink></li>

			</ul>
		</div>
		
		
		<div id="agMain">
			<g:render template="commAg/agTable" />
		</div>

	</div>
</body>
</html>