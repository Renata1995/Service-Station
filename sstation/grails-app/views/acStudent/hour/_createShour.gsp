<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="sstation.Status"%>
<%@ page import="sstation.AcStudent"%>
<html>
<head>
<style>
div.panel {
	border: 1px solid rgba(150, 149, 149, 0.38);
	height: 100%;
	margin-bottom: 100px;
}

div#row1 {
	height: 600px;
}

div#selectedStudent {
	height: 100%;
	padding-bottom: 100px;
}

.table>tbody>tr>td {
	border-top: 0px;
	background-color: #F7F3EA;
}

.table>thead>tr>th {
	background-color: #B20938;
}

.table {
	border: 1px solid #DAD7D0;
}

div.panel-heading {
	background-color: #B20938;
	color: white;
	font-weight: 700;
}

div.btn-group-vertical {
	width: 100%;
}
</style>
</head>
<!-- Create Service Hour Page -->
<g:form>
<div id="totalCreateSH" class="mainback">
	<g:set var="shour" value="${new sstation.ServiceHour()}" />
	<div id="create-servicehour" class="content scaffold-create"
		role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<g:hasErrors bean="${shour}">
			<ul class="errors" role="alert">
				<g:eachError bean="${shour}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}";${news}=${false}</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>

			<fieldset class="form">
				<g:render template="formShour" />
				<div
					class="fieldcontain ${hasErrors(bean: shour, field: 'status', 'error')} required">
					<label for="status"> Status: </label>
					<g:select name="status" from="${Status.values()}" />

				</div>
			</fieldset>
			<fieldset class="buttons">

				<div class="btn btn-default" id="totalNext">Next</div>

			</fieldset>
	</div>
</div>
<!-- totalCreateSH ends -->




<div id="totalSelectST" class="mainback" style="display: none">
	<div class="row" id="row1">
		<div class="col-md-7">
			<table id="selectStudentTable" class="table">
				<thead>
					<tr>
						<th><g:checkBox name="overall" value="" checked="false" /></th>
						<th>Name</th>
						<th>AC ID</th>
						<th>Classification</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${list}" status="i" var="s">
						<tr>
							<td><g:checkBox name="checkstudent" value="${s.id}"
									checked="false" /></td>
							<td class="name">
								${s.firstname} ${s.lastname}
							</td>

							<td id="studentid">
								${s.acid}
							</td>

							<td>
								${s.classification}
							</td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="col-md-2" style="padding-top: 10%;">
			<div class="btn-group-vertical">
				<div class="btn btn-warning" id="add">Add</div>
				<div class="btn btn-warning" id="remove">Remove</div>
			</div>
		</div>

		<div id="selectedStudent" class="col-md-3">
			<div class="panel">
				<div class="panel-heading"><g:checkBox name="stList" value=" "
									checked="false" /> Selected Student</div>
				<div class="panel-body">
					<ul id="selectedList"></ul>
				</div>
			</div>
		</div>

	</div>
	<!-- Row End -->
	<div class="row col-md-offset-6">
		<g:hiddenField name="idList" value=""/>
		<div class="btn btn-default" id="totalPrevious">Previous</div>
		<div class="btn btn-default" id="totalCreate">Create</div>
	</div>
</div>
</g:form>
<script>
	$(function() {
		$("#totalNext").click(function() {
			$("#totalCreateSH").hide();
			$("#totalSelectST").show();
		});
		$("#totalPrevious").click(function() {
			$("#totalCreateSH").show();
			$("#totalSelectST").hide();
		});
		$("#selectStudentTable").DataTable();

		var ss = new Array();/*Stores finally selected students*/
		var hideStudent=new Array();/*Stores check boxs of student rows which are hidden*/
		
		$("#add").click(function() {
							$("input[name='checkstudent']:checked").map(function() {
										/*Append the student on the list*/
										var id=$(this).val();
										var name=$(this).parents("tr").children("td.name").html();
										var string = "<li><input type='checkbox' name='stList' value='"+id+"'/> "
										+name+ "</li>"; 
										$("#selectedList").append(string);

										/*Change the table*/
										var tr=$(this);
										hideStudent.push(tr); 
										$(this).parents("tr").hide();
										$(this).prop("checked",false);
										return $(this).val();
										
								});

		});


		
		/*When the Remove button is clicked*/
		$("#remove").click(function(){
			$("input[name='stList']:checked").map(function(){
					var id=$(this).val();
					//Show corresponding student rows
					for(var i=0;i<hideStudent.length;i++){
						if(hideStudent[i].val()==id){
							hideStudent[i].parents("tr").show();
						}
					}
					//Remove the current student from the selected student list
					$(this).parents("li").remove();
				});
		});


		/*When Create Button is clicked*/
		$("#totalCreate").click(function() {
			//Collect selected student
			$("input[name='stList']").map(function(){
				var id = parseInt($(this).val());
				ss.push(id);
			});
			//Put id list in the #idList hiddenField
			$("#idList").val(ss);
			alert($("#idList").val());

			//Post data to the controller and go to the show servicehour page
			$.ajax({
				type:"POST",
				data:$(this).parents('form:first').serialize(),
				url:'/Success/acStudent/saveShourTotal',
				success: function(data,textStatus){
					$('#totalhour').html(data);
				},
				error:function(XMLHttpRequest,textStatus,errorThrown){}
			});
		});
		
	});
</script>
</html>