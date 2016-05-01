<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<style>
.list-group-item-heading {
	margin-bottom: 15px;
}
.list-group-item-text {
	margin-bottom: 5px;
}
a.eventTime{
	text-decoration:underline;
	font-weight:600;
	margin-right:10px;
}

</style>
</head>
<body>
	
	<div class="list-group">

		<g:each in="${li}" status="i" var="event">
			
			<div class="list-group-item">
				<!-- heading -->
				<h4 class="list-group-item-heading">
					<b> ${event[0].name}
					</b>
				</h4>

				<!-- Information -->
				<p class="list-group-item-text">
					${event[0].description}
				</p>
				<ol class="contactInfor">
					<li>Contact: ${event[0].contact}</li>
					<li>Contact Phone: ${event[0].contactPhone}</li>
					<li>Contact Email: ${event[0].contactEmail}</li>
				</ol>
				<div id="${event[0].id}">
					<!--  <a class="eventTime aoListIcon">2015</a> <a class="eventTime aoListIcon">2014</a> <a
						class="eventTime aoListIcon">2013</a>
						-->
				</div>
				
				
			</div>

		</g:each>
	</div>




	
</body>

</html>