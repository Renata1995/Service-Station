<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<asset:javascript src="aoMain.js"/>
</head>
<body>
	<div class="table_buttons" style="height: 2em">
		<div class="col-md-3 navbar-right cornerButtons" style="margin: 0px;">
			<g:remoteLink controller="EO" action="_createOrg"
				update="main">
				<span style="color: #FFDE97" class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>
				<b> Add Campus Organization</b>
			</g:remoteLink>
		</div>
	</div>

	<table id="otable" class="table" style="width: 100%">
		<thead>
			<tr>
				<th><input type="checkbox"></th>
				<th>Name</th>
				<th>Description</th>
				<th>Contact</th>
				<th>Contact Phone</th>
				<th>Contact Email</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${list}" status="i" var="s">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'} aoRow">
					<td><g:checkBox name="checkOrg" value="${s.id}"
							checked="false" /></td>

					<td>
						${s.name}
					</td>

					<td>
						${s.description}
					</td>

					<td>
						${s.contact}
					</td>

					<td>
						${s.contactPhone}
					</td>

					<td>
						${s.contactEmail}
					</td>

					<td class="aoTableIcon"><g:remoteLink controller="EO"
							action="_editOrg" update="main" id="${s.id}">
							<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
						</g:remoteLink> <g:remoteLink controller="EO" id="${s.id}"
							action="_deleteOrgOnMain" update="orgMain">
							<span class="glyphicon glyphicon-trash" style="padding-top: 10px"
								aria-hidden="true"></span>
						</g:remoteLink></td>



				</tr>
			</g:each>
		</tbody>
	</table>
	<script>
	$(function(){
	$("#otable").DataTable();
		});
	</script>
</body>
</html>