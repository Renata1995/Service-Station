<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<style>
.table>thead>tr>th,.table>tbody>tr>td{
	border:none;
	background-color:transparent;
	color:black;
}
.table>tbody>tr>td.term{
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
					<td><input type="checkbox"></td>
					<td>Service Event</td>
					<td>Campus Group</td>
					<td>Community Organization</td>
					<td>Start Time</td>
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
					</g:else>
				</g:each>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>