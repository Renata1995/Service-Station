<%@ page import="sstation.ServiceHour"%>

<!-- Form template for service hour -->

<input type="text" style="display: none" name="sid" value="${shour?.id}"></input>

<!-- The event field is optional. Students can choose the event in a drop down box. When one clicks on the option "Other"
, a text field will show up. One can write the event name in the text field -->
<div
	class="fieldcontain ${hasErrors(bean: shour, field: 'event', 'error')} required">
	<label for="event"> Event: </label>
	<g:select name="shEvent" from="${eventList}" value="${shour?.event}" />

</div>


<div
	class="fieldcontain ${hasErrors(bean: shour, field: 'description', 'error')} required">
	<label for="description"> Description: <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="description" required=""
		value="${shour?.description}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: shour, field: 'campusOrg', 'error')} required">
	<label for="campusOrg"> Campus Organization: </label>

	<g:hiddenField name="tableId_CamOrg" />
	<g:textField name="selected_CamOrg" readonly="readonly" />

	<button type="button" id="btn_CamOrg">Press to Select</button>

</div>

<div class="modal" id="modal2_CamOrg" style="display: none;">

	<h1>Select Campus Organization</h1>

	<br>

	<table id="selectTable_CamOrg" class="table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Contact</th>
			</tr>
		</thead>

		<tbody>
			<g:each in="${fullOrgList?}" status="i" var="co">
				<tr>

					<td id="camOrg_Name+${i}">
						${i} <g:checkBox name="checkCO" value="${i}_${co.name}"
							checked="false" /> : ${co.name}
					</td>

					<td id="camOrg_Contact+${i}">
						${co.contact}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>

	<br>
	<p style="text-align:center"> Current Selected Campus Organization: </p>
	<p id="show_CamOrg" style="text-align:center"></p>
	<br>	<br>
</div>


<script>
	$(function() {
		var dialog_CamOrg = $("#modal2_CamOrg").dialog(
				{//modal_CamOrg
					autoOpen : false,
					resizable : true,
					height : 500,
					width : 800,
					modal : true,
					buttons : {
						Commit : function() {
							//window.alert("commit");

							var id = $("input[name='checkCO']:checked").val();

							//window.alert("id "+id);

							var set = id.split("_");
							var num = set[0];
							//window.alert("num "+num);
							var co = set[1];
							//window.alert("co "+co);
							
							$("#modal2_CamOrg").dialog("close");
							$('#selected_CamOrg').val(co);
							$("#tableId_CamOrg").val(
									$("input[name='checkCO']:checked").val());

						}
					}
				});

		$("#btn_CamOrg").button().on("click", function() {
			dialog_CamOrg.dialog("open");
		});

		$("#selected_CamOrg").click(function() {
			dialog_CamOrg.dialog("open");
		});

		//obtained from Z.C.(Ren)'s code that doesnt allow multiselection
		$("input[name='checkCO']").change(function() {
			$("input[name='checkCO']").not(this).prop('checked', false);
			var id = $("input[name='checkCO']:checked").val();
			var set = id.split("_");
			var co = set[1];
			$('#show_CamOrg').text(co);
		});

		$("#selectTable_CamOrg").DataTable();

	});
</script>

<div
	class="fieldcontain ${hasErrors(bean: shour, field: 'commAg', 'error')} required">
	<label for="commAg"> Community Agency: </label>
	<g:select name="shCommAg" value="${shour?.commAg}" from="${agList}" />

</div>


<div
	class="fieldcontain ${hasErrors(bean: shour, field: 'starttime', 'error')} required">
	<label for="starttime"> Start Time: <span
		class="required-indicator">*</span>
	</label>
	<g:textField id="startdate" name="startdate" required=""
		value="${shour?.starttime?.format('MM/dd/yyyy')}" />
	<g:field type="number" name="starthour" required=""
		value="${shour?.starttime?.format('HH')?:'0'}" class="time_textField" />
	hr
	<g:field type="number" name="startmin" required=""
		value="${shour?.starttime?.format('mm')?:'0'}" class="time_textField" />
	min
</div>

<script>
	$(function() {
		$("#startdate").datepicker();
	});
</script>



<div
	class="fieldcontain ${hasErrors(bean: shour, field: 'duration', 'error')} required">
	<label for="duration"> Duration: <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="duration" required="" value="${shour?.duration?:''}" />
	hr

</div>



<div
	class="fieldcontain ${hasErrors(bean: shour, field: 'eventContactName', 'error')} required">
	<label for="eventContactName"> Contact Name </label>
	<g:textField name="eventContactName" value="${shour?.eventContactName}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: shour, field: 'eventContactPhone', 'error')} required">
	<label for="eventContactPhone"> Contact Phone </label>
	<g:textField name="eventContactPhone"
		value="${shour?.eventContactPhone}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: shour, field: 'eventContactEmail', 'error')} required">
	<label for="eventContactEmail"> Contact Email </label>
	<g:field type="email" name="eventContactEmail"
		value="${shour?.eventContactEmail}" />

</div>



