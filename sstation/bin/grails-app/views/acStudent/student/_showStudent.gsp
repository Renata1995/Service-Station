<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<!-- Show the details of a specific student -->
<!-- Buttons -->
 <div class="nav cornerButtons showButtons" role="navigation">
		 				<g:remoteLink controller="acStudent" action="_editStudent" id="${student.id}" update="student"><span class="glyphicon glyphicon-edit" aria-hidden="true" style="padding-left:10px"></span> <b>Edit</b></g:remoteLink>
</div>

<!-- Information -->
<div id="show-acStudent" class="content scaffold-show mainback" role="main">
			<ol class="property-list acStudent">
			
				<g:if test="${student?.firstname}">
				<li class="fieldcontain">
					<b>First Name:</b>  ${student.firstname}	
				</li>
				</g:if>
		
				<g:if test="${student?.lastname}">
				<li class="fieldcontain">
					<b>Last Name:</b>  ${student.lastname}					
				</li>
				</g:if>
			
				<g:if test="${student?.acid}">
				<li class="fieldcontain">
					<b>AC ID:</b>  ${student.acid}					
				</li>
				</g:if>
				
				<g:if test="${student?.classification}">
				<li class="fieldcontain">
					<b>Classification:</b>  ${student.classification}					
				</li>
				</g:if>
			
				<g:if test="${student?.acYear}">
				<li class="fieldcontain">
					<b>AC Year:</b>  ${student.acYear}
				</li>
				</g:if>
			
				<g:if test="${student?.acBox}">
				<li class="fieldcontain">
					<b>AC Box:</b>  ${student.acBox}					
				</li>
				</g:if>
			
				<g:if test="${student?.acEmail}">
				<li class="fieldcontain">
					<b>AC Email:</b>  ${student.acEmail}
					
				</li>
				</g:if>
			
			
				<g:if test="${student?.phone}">
				<li class="fieldcontain">
					<b>Phone:</b>  ${student.phone}
					
				</li>
				</g:if>
			
			</ol>
			</div>
  
</html>