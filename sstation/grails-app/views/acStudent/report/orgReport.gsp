<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<style>
.table>thead>tr>th, .table>tbody>tr>td {
	border: none;
	background-color: transparent;
	color: black;
}

.table>tbody>tr>td.term {
	border-top: 1px solid #ddd;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
</head>
<body>
	<div class="titletop">
		<h1 class="pagetitle">
			${student.firstname}
			${student.lastname}
		</h1>
		<div class="cornerButtons"></div>
	</div>
<<<<<<< HEAD
	<br />
	<div class="mainback">
		<div class="reportTitle">Austin College Service Hours Report</div>
		<!-- Basic Infor -->
		<div class="report">
			<b>
				${student.firstname} ${student.lastname}
			</b> <br />
			<b>Austin College ID: </b>
			${student.acid}
			<br />
			<b>Classification: </b>
			${student.classification}
		</div>

		<!-- KPI -->
		<div class="report">
			<b>Total Approved Service Hours: </b>
			${totalSH}hr
		</div>
=======
	<br/>
<div class="mainback">
	<div class="reportTitle">
	Austin College Service Hours Report
	</div>
	<!-- Basic Infor -->
	<div class="report">
	<b>${student.firstname} ${student.lastname}</b>
	<br/><b>Austin College ID: </b>${student.acid}
	<br/><b>Classification: </b>${student.classification}
	</div>
	
	<!-- KPI -->
	<div class="report">
	<b>Service Hours Total: </b>${totalSH}hr
	</div>
	
	<!-- Service Hours List -->
	<div>
		<table id="htable" class="table table-bordered" style="width: 100%;border:none">
			<thead>
				<tr style="background-color: #C53C3E; border: none">
<<<<<<< HEAD
					<td><input type="checkbox"></td>
					<td>Service Event</td>
					<td>Campus Group</td>
					<td>Community Organization</td>
					<td>Date/Start Time</td>
=======
					<td><input type="checkbox"></td>
					<td>Event</td>
					<td>Campus Organization</td>
					<td>Community Agency</td>
					<td>Date/Start Time</td>
>>>>>>> 8603a618c45b82320fe17df342e5d8c51e663572
					<td>Duration</td>
				</tr>
			</thead>
			<tbody>
				<g:each in="${list}" status="i" var="item">
					<g:if test="${i%2==0}">
						<tr>
							<td colspan="5" class="term">
								${item}
							</td>
						</tr>
					</g:if>
					<g:else>
						<g:each in="${item}" var="s">
							<tr>
								<td>
									${s.event.name}
								
								<td>
									${s.campusOrg.name}
								</td>
>>>>>>> 55ce8af2824bb21040ca3ebba18487fa2e206e5a

		<!-- Service Hours List -->
		<div>
			<table id="htable" class="table table-bordered"
				style="width: 100%; border: none">
				<thead>
					<tr style="background-color: #C53C3E; border: none">
						<td>Campus Organization</td>
						<td>Event</td>
						<td>Community Agency</td>
						<td>Start Time</td>
						<td>Duration</td>
					</tr>
				</thead>
				<tbody>
					<g:each in="${listCO}" status="i" var="co">

						<g:each in="${listSH}" var="sh">
							<g:if test="${sh.campusOrg.name == co.name}">
								<tr>
									<td>
										${sh.campusOrg.name}
									</td>
									<td>
										${sh.event.name}
									</td>


									<td>
										${sh.commAg.name}
									</td>

									<td>
										${sh.starttime.format('MM/dd/yyyy HH:mm')}
									</td>

									<td>
										${sh.duration}
									</td>
								</tr>
								</g:if>
						</g:each>
						
					</g:each>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		

	</script>
</body>
</html>