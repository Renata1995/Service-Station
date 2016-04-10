<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Insert title here</title>
</head>
<body>
	<div class="body">
		<!-- Title + Three buttons -->
		<div class="titletop">
			<h1 class="pagetitle">
				${event.name}
			</h1>
			<div class="cornerButtons">
				<g:link controller="EO" action="eventMain">
					<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
					<b>Back</b>
				</g:link>

				<g:remoteLink controller="EO" action="_deleteEvent" id="${event.id}"
					update="main">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					<b
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Delete</b>
				</g:remoteLink>
			</div>

			<!-- Link to the profile or the service  hour list of the current student -->
			<ul class="nav nav-tabs">
				<li class="tab1" role="presentation" class="active"><g:remoteLink
						controller="EO" action="_showEvent" id="${event.id}"
						update="student">Information</g:remoteLink></li>
				<li class="tab2" role="presentation"><g:remoteLink
						controller="EO" action="_eventKPI" id="${event.id}"
						update="student">Analysis</g:remoteLink></li>
			</ul>
		</div><!-- titleTop ends -->


		<!-- This place will show either the student information, the edit form, or the create form  -->
		<div id="event">
			<g:render template="event/showEvent" />
		</div>
	</div>
</body>
</html>