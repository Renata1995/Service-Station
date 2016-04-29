
<!-- This page shows the basic information of the current selected studnet -->
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Student Management</title>
</head>

<body>
	<!-- Student Main Page. The div "student" is used for ajax -->
	<div style="padding: 10px 0px;rgb(197, 62, 62)">
		
		<!-- Title + Three buttons -->
		<div class="titletop">
			<h1 class="pagetitle">${student.firstname} ${student.lastname}</h1>
			<div class="cornerButtons">
				<g:link controller="acStudent" action="studentList">
					<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
					<b>Back</b>
				</g:link>

				<g:remoteLink controller="acStudent" action="deleteStudent"
					id="${student.id}" update="main">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					<b
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Delete</b>
				</g:remoteLink>
			</div>

			
			
			<!-- Link to the profile or the service hour list of the current student -->
			<ul class="nav nav-tabs">
				<li class="tab1" role="presentation" class="active"><g:remoteLink
						controller="acStudent" action="_showStudent"
						id="${student.id}" update="student">Profile</g:remoteLink></li>
				<li class="tab2" role="presentation"><g:remoteLink
						controller="acStudent" action="_hourList"
						id="${student.id}" update="student">Service Hour List</g:remoteLink></li>
				<li class="tab3" role="presentation"><g:remoteLink
						controller="acStudent" action="_reportAdmin" update="student"
						id="${student.id }">Report</g:remoteLink></li>
			</ul>
		</div>


		<!-- This place will show either the student information, the edit form, or the create form  -->
		<div id="student">
			<g:render template="student/showStudent" />
		</div>
	</div>
</body>
</html>
