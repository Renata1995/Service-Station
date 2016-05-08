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
				<td id="tableCheckBox"><g:checkBox class="studentCB"
						name="checkStudent" value="${s.id}" checked="false"
						onclick="click2()" /></td>

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
						<span class="label label-success htableLabel">
							${s.status}
						</span>
					</g:if> <g:elseif test="${s.status.toString()=="PENDING" }">
						<span class="label label-warning htableLabel">
							${s.status}
						</span>
					</g:elseif> <g:elseif test="${s.status.toString()=="REJECTED"}">
						<span class="label label-default htableLabel">
							${s.status}
						</span>
					</g:elseif></td>

			</tr>
		</g:each>
	</tbody>
</table>

<div class="modal" id="modal_Status" style="display: none;">

	<h1>Status Selection</h1>

	<br>

	<table>
		<thead>
		</thead>
		<tbody>
			<tr>
				<td><g:checkBox name="checkS" value="1" checked="false" />APPROVED</td>
				<td><g:checkBox name="checkS" value="2" checked="false" />PENDING</td>
				<td><g:checkBox name="checkS" value="3" checked="false" />REJECTED</td>
			</tr>
		</tbody>
	</table>
	<br>
	<p style="text-align: center">Selected Status</p>
	<p id="show_S" style="text-align: center"></p>
	<br>
	
	<p style="text-align: center">
	<button onclick="changeStatus()" style="text-align: center"> Change Status</button>
	</p>
</div>

<script>
	var toLink = true;
	var currentStatusabel = null;

	$(document).ready(function() {

		var table = $('#htable').DataTable({
			"order" : [ [ 5, "desc" ] ]
		});

		$("#modal_Status").dialog({
			autoOpen : false,
			resizable : true,
			height : 500,
			width : 500,
			modal : true
		});

		$("input[name='checkS']").change(function() {
			$("input[name='checkS']").not(this).prop('checked', false);
			var i = $("input[name='checkS']:checked").val();
			$('#show_S').text(i);
			console.log("new status= "+i);
		});

	});

	var baseLink = '<g:createLink action="shour" controller="hour" id="ID"/>';

	$(".shourRow").on({
		click : function() {
			var idstring = $(this).attr("id");

			if (toLink) {
				window.location.href = baseLink.replace("ID", idstring);
			}
		},
		mouseenter : function() {
			$(this).css("cursor", "pointer");
		}
	});

	$(".htableLabel")
			.on(
					{
						click : function() {

							console.log("Clicking status");
							toLink = false;
							
							$("#modal_Status").dialog("open");
							currentStatusabel = $(this);
						}
					});

	function changeStatus(){
		var n = $("input[name='checkS']:checked").val();
		console.log("changing status with "+n);

		//$('#holdingStatus').val(n);
		$("#modal_Status").dialog("close");

		var num = n;
			//$("#holdingStatus").val();

		var toInput = '';
		var approved = '<span class="label label-success htableLabel"> APPROVED	</span>';//1
		var pending = '<span class="label label-warning htableLabel"> PENDING	</span>';//2
		var rejected = '<span class="label label-default htableLabel"> REJECTED	</span>';//3

		if (num == 1) {
			toInput = approved;
		} else if (num == 2) {
			toInput = pending;
		} else if (num == 3) {
			toInput = rejected;
		}

		currentStatusabel.replaceWith(toInput);

		return false;
		
	}
	
	function click2() {
		console.log("Clicking checkbox");
		toLink = false;
	}
</script>