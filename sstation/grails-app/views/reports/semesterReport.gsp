<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Semester Report</title>
</head>
<body>
<div>
	<!-- Buttons on the top -->
	<div class="titletop">
		<h1 class="pagetitle">Semester  Report</h1>
		<div class="cornerButtons"></div>
	</div>
	
	<div>
		<g:render template="/shared/hourTable"/>
		
	</div>
	
</div>
<script>
$(function(){
	$('#htable').DataTable();
})
</script>
</body>
</html>