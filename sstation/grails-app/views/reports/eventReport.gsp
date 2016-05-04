<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>

<title>Station Report by Event</title>
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
</head>
<body>
	<div class="mainback">

		<div class="reportTitle">Service Station Service Hours Report by
			Event</div>

		<div class="report"></div>

		<!-- Service Hours List -->
		<div>
			<table id="stationEventTable" class="table" style="width: 100%">
				<thead>
					<tr>
						<th>Event Name</th>
						<th>Total Service Hours (hr)</th>
						<th>Average by Student (hr)</th>
						<th>Average by AC Groups (hr)</th>
						<th>Average by Community Organizations (hr)</th>
						<th></th>
					</tr>
				</thead>

				<tbody>


					<tr>
						<td>
							${list['name']}
						</td>
						<td>
							${list['total'] }
						</td>
						<td>
							${list['avgByStudent']}
						</td>

						<td>
							${list['avgByGroup']}
						</td>

						<td>
							${list['avgByCommOrg']}
						</td>

						<td>
							<div class="btn btn-default eventDetail" id="${list['event']}">Details</div>
						</td>
					</tr>

				</tbody>

			</table>
			<div id="eventDialog"></div>
		</div>
	</div>
	<script>
		$(function() {
			$("#eventDialog").dialog({
				autoOpen : false,
				resizable : true,
				height : 600,
				width : 800,
				modal : true
			});

			$(".eventDetail").click(function() {
				$("#eventDialog").dialog("open");
				var event = $(this).prop("id");
				$.ajax({
					type : 'GET',
					data : {
						event : event
					},
					url : '/sstation/reports/_hoursByEvent',
					success : function(data, textStatus) {
						$('#eventDialog').html(data);
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
					}
				});
			});

		})
	</script>
</body>
</html>