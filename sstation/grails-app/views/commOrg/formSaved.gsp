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
		<g:if test='${table==1 }'>
			<g:link controller='commOrg' action='returnToTable'>Back to Organizations</g:link>
		</g:if>
		<g:else>
			<g:link controller='commOrg' action='returnToCard'>Back to Organizations</g:link>
		</g:else>
	</div>
</body>
</html>