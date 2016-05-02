<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Campus Organization Management</title>

</head>
<div class="formHeading greyBar">Your organization has been saved.
</div>
<body>
	<div class="body">
		<g:if test='${table==1 }'>
			<g:link controller='ACGroup' action='returnToTable'>Back to Campus Organizations</g:link>
		</g:if>
		<g:else>
			<g:link controller='ACGroup' action='returnToCard'>Back to Campus Organizations</g:link>
		</g:else>
	</div>
</body>
</html>