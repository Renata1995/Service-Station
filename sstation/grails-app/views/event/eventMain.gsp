<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Event Main Page</title>
</head>
<body>
	<div class="body">
		<div class="titletop">
			<h1 class="pagetitle">Event Management</h1>
			<div class="cornerButtons"></div>
		</div>
		
		<div>
	
	<!-- Link to the profile or the service hour list of the current student -->
		<ul class="nav-tabs navGradient nav">
				<li class="tab1"><g:remoteLink controller="event" action="_eventTable" update="eventMain"><b>Event List</b></g:remoteLink></li>
				<li class="tab2"><g:remoteLink controller="event" action="_eventOverallKPI" update="eventMain">Analysis</g:remoteLink></li>
				
 	</ul>
 	</div>
 	<div id="eventMain">
		<g:render template="eventTable" />
	</div>

	</div>
</body>
</html>