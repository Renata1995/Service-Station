<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Semester Report</title>
<style>
.table>tbody>tr>td {
	border: none;
}

.table>thead>tr>th {
	background-color: transparent;
	color:black;
	border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
	<div class="mainback">
	
	<div class="reportTitle">
	Service Station Service Hours Report Summary<br>
	<h4>Total Hours: ${totalHours}</h4>
	</div>
	
	<div class="report">
	</div>

	<!-- Service Hours List -->
	<div>
		<table id="stationYeartable" class="table" style="width: 100%">
			<thead>
				<tr>
					<th>AC Groups</th>
					<th>Events</th>
					<th>Community Agencies</th>
				
				</tr>
			</thead>
			
			<tbody>
			
				<g:each in="${(0..<constant) }" var="i">
					<tr>
						<td>
							${topOrgs.get(i).name}: ${orgHours.get(i)}
						</td>
						<td>
							${topEvs.get(i).name}: ${evHours.get(i)}
						</td>
						<td>
							${topAgs.get(i).name}: ${agHours.get(i)}
						</td>

					</tr>
				</g:each>
				
			</tbody>
			
		</table>
	
	</div>
</div>

</body>
</html>