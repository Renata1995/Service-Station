<%@ page contentType="text/html;charset=UTF-8"%>
<table id="htable" class="table" style="width: 100%">
	<thead>
		<tr style="background-color: #C53C3E; border: none">
			<th><input type="checkbox" id="mainCheckBox"></th>
			<th>Student</th>
			<th>Service Event</th>
			<th>Campus Group</th>
			<th>Community Organization</th>
			<th>Start Time</th>
			<th>Duration</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${list}" status="i" var="s">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'} shourRow" id="${s.id}">
				<td id="tableCheckBox" ><g:checkBox class="studentCB" name="checkStudent" value="${s.id}"
						checked="false" /></td>

				<td>
					${s.acStudent.firstname} ${s.acStudent.lastname}
				</td>
				<td>
					${s.event?.name}
				</td>

				<td>
					${s.campusOrg?.name}
				</td>

				<td>
					${s.commAg?.name}
				</td>

				<td>
					${s.starttime.format('MM/dd/yyyy HH:mm')}
				</td>

				<td>
					${s.duration}
				</td>

				<td class="status" id="${s.id}"><g:if
						test="${s.status.toString()=="APPROVED"}">
						<span class="label label-success htableLabel"> ${s.status}
						</span>
					</g:if> <g:elseif test="${s.status.toString()=="PENDING" }">
						<span class="label label-warning htableLabel"> ${s.status}
						</span>
					</g:elseif> <g:elseif test="${s.status.toString()=="REJECTED"}">
						<span class="label label-default htableLabel"> ${s.status}
						</span>
					</g:elseif></td>

			</tr>
		</g:each>
	</tbody>
</table>