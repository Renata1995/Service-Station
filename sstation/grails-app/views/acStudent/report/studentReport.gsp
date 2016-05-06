<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<style>
.table>tbody>tr>td {
	border: none;
}

.table>thead>tr>th {
	background-color: transparent;
	color: black;
	border-bottom: 1px solid #ddd;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Student Report</title>
</head>
<div class="titletop">
		<h1 class="pagetitle">
			${student.firstname}
			${student.lastname}
		</h1>
		<div class="cornerButtons"></div>
	</div>
	<br/>
<div class="mainback">
	<div class="reportTitle">Austin College Service Hours Report</div>
	<div class="report">
		<b> ${student.firstname} ${student.lastname}
		</b> <br /> <b>Austin College ID: </b>
		${student.acid}
		<br /> <b>Classification: </b>
		${student.classification}
	</div>

	<!-- KPI -->
	<div class="report">
		<b>Service Hours Total: </b>
		${totalSH}hr
	</div>

	<!-- Service Hours List -->
	<div>
		<table id="htable" class="table" style="width: 100%">
			<thead>
				<tr>
					<th>Service Event</th>
					<th>Campus Group</th>
					<th>Community Organization</th>
					<td>Date/Start Time</td>
					<th>Duration</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${list}" status="i" var="s">
					<tr>
						<td>
							${s.event.name}
						
						<td>
							${
								s.campusOrg.name
							}
						</td>

						<td>
							${s.commAg.name}
						</td>

						<td>
							${s.starttime.format('MM/dd/yyyy HH:mm')}
						</td>

						<td>
							${s.duration}
						</td>


					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</div>
</html>