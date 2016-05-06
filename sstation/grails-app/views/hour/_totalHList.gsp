<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<div class="table_buttons" style="height: 2em">
	<div class="navbar-right cornerButtons" style="margin: 0px">
		<g:remoteLink controller="hour" action="_createShour"
			update="totalhour">
			<span style="color: #FFDE97" class="glyphicon glyphicon-plus"
				aria-hidden="true"></span>
			<b> New Service Hour</b>
		</g:remoteLink>
	</div>

	<g:textField name="holdingStatus" readonly="readonly" value="" />

</div>

<div class="modal" id="modal_Status" style="display: none;">

	<h3>Status Selection</h3>

	<table>
		<thead>
		</thead>
		<tbody>
			<tr>
				<td><g:checkBox name="checkS" value="1" checked="false" /></td>
				<td><g:checkBox name="checkS" value="2" checked="false" /></td>
				<td><g:checkBox name="checkS" value="3" checked="false" /></td>
			</tr>
		</tbody>
	</table>
	<br>
	<p style="text-align: center">Selected Status</p>
	<p id="show_S" style="text-align: center"></p>
	<br>

</div>

<g:render template="/shared/hourTable" />
<script>
	$(document)
			.ready(
					function() {

						var table = $('table').DataTable({
							"order" : [ [ 5, "desc" ] ]
						});

						var baseLink = '<g:createLink action="shour" controller="hour" id="ID"/>';
						$(".shourRow").on(
								{
									click : function() {
										var idstring = $(this).attr("id");

										window.location.href = baseLink
												.replace("ID", idstring);
									},
									mouseenter : function() {
										$(this).css("cursor", "pointer");
									}
								});

						$("#input[name='checkStudent']").on({
							click : function() {
								return false;
							}
						});

						$("#modal_Status").dialog({
							autoOpen : false,
							resizable : true,
							height : 500,
							width : 500,
							modal : true,
							button : {
								Confirm : function() {

									var n = $("input:checked").val();

									$('#holdingStatus').val(n);
								}
							}
						});

						$("input[name='checkS']").change(
								function() {
									$("input[name='checkS']").not(this).prop(
											'checked', false);
									var i = $("input[name='checkS']:checked")
											.val();
									$('#show_S').text(i);
								});

						$(".htableLabel")
								.on(
										{
											click : function() {

												window.alert("clicked now opening");

												$("#modal_Status").dialog("open");

												var num = $("#holdingStatus").val();

												var toInput = '';
												var approved = '<span class="label label-success htableLabel"> Approved	</span>';//1
												var pending = '<span class="label label-success htableLabel"> Pending	</span>';//2
												var rejected = '<span class="label label-success htableLabel"> Rejected	</span>';//3

												if (num == 1) {
													toInput = approved;
												} else if (num == 2) {
													toInput = pending;
												} else if (num == 3) {
													toInput = rejected;
												}

												$(this).replaceWith(toInput);

												return false;
											}
										});

					});
</script>
</html>