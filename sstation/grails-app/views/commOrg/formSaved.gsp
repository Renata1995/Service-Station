<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Community Agency Management</title>

</head>
<div class="formHeading greyBar">Your organization has been saved.
</div>
<body>
	<div class="body">
		<h1>You Community Organization Has Been Saved</h1>
		<g:if test='${table==1 }'>
			<h1>
				<g:link controller='commOrg' action='returnToTable'>Back to Community Organizations</g:link>
			</h1>
		</g:if>
		<g:else>
			<h1>
				<g:link controller='commOrg' action='returnToCard'>Back to Community Organizations</g:link>
			</h1>
		</g:else>
	</div>
</body>
</html>