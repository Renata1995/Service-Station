<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<div class="formHeading greyBar">
	${heading}
</div>

<g:hasErrors bean = "${event}">
	<ul class = "errors" role = "alert">
	<g:eachError bean="${event}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>Please check the ${error.field} </li>
			</g:eachError>
	</ul>
</g:hasErrors>

<form class="mainback" method="POST">
<div class="fieldcontain ${hasErrors(bean: event, field: 'name', 'error')} required">
	<label for="name">
		Name: 
		<span class="required-indicator">*</span>
	</label> 
	<g:textField name="name" value="${event?.name}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: event, field: 'description', 'error')} required">
	<label for="description">
		Description: 
		<span class="required-indicator">*</span> 
	</label>
	<g:textArea rows="5" cols="40"  name="description" required="" value="${event?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: event, field: 'contact', 'error')} required">
	<label for="contact">
		Contact Name: 
		<span class="required-indicator">*</span> 
	</label>
	<g:textField name="contact" required="" value="${event?.contact}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: event, field: 'contactPhone', 'error')} required">
	<label for="contactPhone">
		Contact Phone: 
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactPhone" required="" value="${event?.contactPhone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: event, field: 'contactEmail', 'error')} required">
	<label for="contactEmail">
		Contact Email: 
		<span class="required-indicator">*</span> 
	</label>
	<g:field type="email" name="contactEmail" value="${event?.contactEmail}" required=""/>

</div>

<g:submitToRemote class="btn btn-default" id="${event.id}" value="Save" controller="event" update="eventMain" action="_saveEvent" />
<g:remoteLink class="btn btn-default" action="_eventTable" controller="event" update="eventMain">Cancel</g:remoteLink>
</form>

</html>