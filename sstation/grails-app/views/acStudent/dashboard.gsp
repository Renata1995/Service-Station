<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Dashboard</title>
<style>
tr.even, tr.odd {
	font-size: 13px;
}

.kpiTab {
	padding: 7px;
	width: 200px;
	font-size: 16px;
}

.row {
	margin: 0px;
}

div.formHeading, td#homePendingMore {
	background-color: rgba(247, 243, 234, 0.85);
	text-align:center
}

div.formHeading>a,td#homePendingMore>a {
	color: #5D4F24;
}

div.col-md-7 {
	padding-right: 0px;
}
</style>
<title>Service Station Project</title>
</head>

<body>
	<div class="row">

		<div id="homeCoreInfor" class="mainback col-md-5">
			<b style="font-size: 15px">Core Statistics</b><br /> <br />

			<!-- Main Stats -->
			<b>Total Students: </b>
			${overallStat.get('totalSt')}
			<br> <b>Total Service Hours: </b>
			${overallStat.get('totalSH')}
			hr <br /> <b>Service Hours Per Student: </b>
			${overallStat.get('average')}
			hr <br /> <b>Service Hours in the Current Year:</b>
			${overallStat.get('totalYear')}
			hr <br /> <b>Num. Pending: </b>
			${overallStat.get('pTotal')}
			Service Hours
		</div>
		<!-- homeCoreInfor -->

		<div class="col-md-7">
			<div id="homeTableName" class="formHeading">
				<g:link action="" controller="hour">Pending
				Hours</g:link>
			</div>
			<table id="homePendingTable" class="table">
				<thead>
					<tr id="homeTableHead">
						<th>Student</th>
						<th>AC ID</th>
						<th>Event</th>
						<th>Organization</th>
						<th>Duration</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${list}" var="sh" status="i">
						<tr class="${i%2==0?'even':'odd'}">
							<td><b>
									${sh.acStudent.firstname} ${sh.acStudent.lastname}
							</b></td>
							<td>
								${sh.acStudent.acid}
							</td>
							<td>
								${sh.event?.name}
							</td>
							<td>
								${sh.campusOrg?.name}
							</td>
							<td>
								${sh.duration} hr
							</td>
							<td><g:if test="${sh.status.toString()=="APPROVED"}">
									<span class="label label-success htableLabel"> ${sh.status}
									</span>
								</g:if> <g:elseif test="${sh.status.toString()=="PENDING" }">
									<span class="label label-warning htableLabel"> ${sh.status}
									</span>
								</g:elseif> <g:elseif test="${sh.status.toString()=="REJECTED"}">
									<span class="label label-default htableLabel"> ${sh.status}
									</span>
								</g:elseif></td>
						</tr>
					</g:each>
					<tr>
						<td colspan="6" id="homePendingMore"><g:link
								class="aoListIcon" controller="hour" action="">More</g:link></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- col-md-7 ends -->

	</div>
	<!-- row -->

	<g:render template="kpi/hourkpi" />

</body>
</html>