<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Insert title here</title>
</head>
<body>
	<div class="body">

		<div class="titletop">
			<h1 class="pagetitle">Campus Organizations Management(AC Groups)</h1>
			<div class="cornerButtons">
			<g:remoteLink
					controller="ACGroup" action="_orgCardMain" update="orgMainType">
					<span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
					Card View </g:remoteLink>
				<g:remoteLink controller="ACGroup"
					action="_orgTableMain" update="orgMainType">
					<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
					Table View </g:remoteLink>
			</div>
		</div>
		<!-- titletop ends -->

		


		<div id="orgMainType">
		<g:if test="${table==1}">
			<g:render template="orgTable" />
			</g:if>
			<g:else>
			<g:render template="orgCardMain"/>
			</g:else>
		</div>



	</div>
</body>
</html>