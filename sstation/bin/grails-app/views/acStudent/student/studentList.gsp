
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Student Management</title>
</head>
<body>
	<!-- Student list -->
	<div id="list-acStudent" class="content scaffold-list" role="main">

		<!-- Buttons on the top -->
		<div class="titletop">
			<h1 class="pagetitle">Student Management</h1>
			<div class="cornerButtons"></div>
		</div>

		<!-- Link to the profile or the service hour list of the current student -->
		<div>
			<ul class="nav-tabs navGradient nav">
				<li class="tab1"><g:remoteLink controller="acStudent"
						action="_hourkpi" update="slist">Analysis</g:remoteLink></li>
				<li class="tab2"><g:remoteLink controller="acStudent"
						action="_sTable" update="slist">
						<b>Table</b>
					</g:remoteLink></li>

			</ul>
		</div>

		<div id="slist">
			<g:render template="student/sTable" />
		</div>


	</div>
</body>
</html>
