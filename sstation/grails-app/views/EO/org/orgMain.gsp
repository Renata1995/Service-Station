<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Campus Organization Main Page</title>
</head>
<body>
<!-- Buttons on the top -->
	<div class="titletop">
		<h1 class="pagetitle">Organizations Management</h1>
		<div class="cornerButtons"></div>
	</div>
	<div>

		<!-- Link to the profile or the service hour list of the current student -->
		<ul class="nav nav-tabs">
			<li class="tab1" role="presentation"><g:remoteLink
					controller="acStudent" action="" update="orgMain">Analysis</g:remoteLink></li>
			<li class="tab2"><g:remoteLink controller="acStudent"
					action="_orgList" update="orgMain">
					Table
				</g:remoteLink></li>
		</ul>
		</div>
		
		<div id="orgMain">
			<g:render template="org/orgList"/>
		</div>
</body>
</html>