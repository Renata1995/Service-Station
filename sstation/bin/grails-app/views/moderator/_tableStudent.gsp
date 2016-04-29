<form>
	<div class="row"
		style="background-color: #625D4C; margin: 20px 0px 0px 0px">

		<div class="col-md-6 navbar-right cornerButtons"
			style="margin-top: 7px; margin-bottom: -7px;">
			<g:remoteLink controller="moderator" action="_addModerator"
				update="slist">
				<span style="color: #FFDE97" class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>
				<b>Add moderator</b>
			</g:remoteLink>
			<span style="color: #FFDE97" class="glyphicon glyphicon-trash"
				aria-hidden="true"></span>
			<g:submitToRemote controller="acStudent" action="deletemult"
				update="main" value="Delete" class="tabledelete"></g:submitToRemote>
		</div>
	</div>
	<!-- Student Table -->
	<table id="table" class="table">
		<thead>
			<tr>
				<th style="background-color: #C53C3E; border: none"><input
					type="checkbox"></th>
				<th>AC ID</th>

				<th>Name</th>

				<th>AC Box</th>

				<th>Email</th>

				<th>Classification</th>

				<th>AC Year</th>

			</tr>
		</thead>
		<tbody>
			<g:each in="${list}" status="i" var="s">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'} studentRow" id="${s.id}">

					<td><g:checkBox name="checkstudent" value="${s.id}"
							checked="false" /></td>

					<td id="studentid">
						${s.acid}
					</td>

					<td>
						${s.firstname} ${s.lastname}
					</td>

					<td>
						${s.acBox}
					</td>

					<td>
						${s.acEmail}
					</td>

					<td>
						${s.classification}
					</td>

					<td>
						${s.acYear}
					</td>

				</tr>
			</g:each>
		</tbody>
	</table>

</form>
<script>
  $(document).ready(function(){
	    $('#table').DataTable();
	    
	});
  </script>