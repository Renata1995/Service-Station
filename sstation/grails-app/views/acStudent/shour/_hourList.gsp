<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<!-- Service Hour List -->
<div class="body">

	<!-- Buttons -->
	<div class="table_buttons" style="height: 2em">
		<div class="col-md-3 navbar-right cornerButtons" style="margin: 0px;">
			<g:remoteLink controller="acStudent" action="_createShour"
				update="main" id="${student.id}">
				<span style="color: #FFDE97" class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>
				<b> New Service Hour</b>
			</g:remoteLink>
		</div>
	</div>
	
	<!-- KPI -->
	<div class="mainback">
		<b>Total Service Hours: </b>
		${stat.get('grandSum')}hr <br /> <b>Total Approved Service Hours: </b>
		${stat.get('aSum')}hr <br /> <b>Total Pending Service Hours: </b>
		${stat.get('pSum')}hr <br /> <b>Total Rejected Service Hours: </b>
		${stat.get('rSum')}hr
	</div>


	<!-- Service Hour Table -->
	<g:render template="/shared/hourTable" />



	<!-- Status Dialog -->
	<div id="statusD">
		<form>
			<div class="form-group">
				<g:hiddenField name="shid" id="shid" />
				<select class="form-control" name="statusChange" id="statusChange">
					<option class="editStatus">APPROVED</option>
					<option class="editStatus">PENDING</option>
					<option class="editStatus">REJECTED</option>
				</select>
			</div>
			<div id="submitStatus">
				<g:submitToRemote value="Update" controller="acStudent"
					action="updateStatus" update="student" />
			</div>
		</form>
	</div>
</div>
<script>
	$(function() {

		$("#htable").DataTable();

		var baseLink = '<g:createLink action="shour" controller="acStudent" id="ID"/>';
		$(".shourRow").on({
			click : function() {
				var idstring = $(this).attr("id");

				window.location.href = baseLink.replace("ID", idstring);
			},
			mouseenter : function() {
				$(this).css("cursor", "pointer");
			}
		});

		$("#statusD").dialog({
			model : true,
			autoOpen : false
		});
		$(".status").on({
			click : function() {
				$("#statusD").dialog("open");
				var getshid = $(this).prop("id");
				$("#shid").val(getshid);

				var text = $(this).children("span.statusValue").prop("id");
				if (text == "Approved") {
					$("#statusChange").prop("selectedIndex", 0);
				} else if (text == "Pending") {
					$("#statusChange").prop("selectedIndex", 1);
				} else if (text == "Reject") {
					$("#statusChange").prop("selectedIndex", 2);
				}
			},
			mouseenter : function() {
				$(this).css("cursor", "pointer");
			}

		});

		$("#submitStatus").click(function() {
			$("#statusD").dialog("close");
		});

	});
</script>
</html>