<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<div class="formHeading greyBar">
	${heading}
</div>

<g:form class="mainback" controller="EO" id="${agency.id}" method="POST">
	<div
		class="fieldcontain ${hasErrors(bean: agency, field: 'name', 'error')} required">
		<label for="name"> Name: <span class="required-indicator">*</span>
		</label>
		<g:textField name="name" required="" value="${agency?.name}" />

	</div>
	<div
		class="fieldcontain ${hasErrors(bean: agency, field: 'description', 'error')} required">
		<label for="description"> Description: <span
			class="required-indicator">*</span>
		</label>
		<g:textField name="description" required=""
			value="${agency?.description}" />

	</div>
	<div
		class="fieldcontain ${hasErrors(bean: agency, field: 'address', 'error')} required">
		<label for="address"> Address: <span
			class="required-indicator">*</span>
		</label>
		<g:textField name="address" required="" value="${agency?.address}" />

	</div>
	<div
		class="fieldcontain ${hasErrors(bean: agency, field: 'contact', 'error')} required">
		<label for="contact"> Contact: <span
			class="required-indicator">*</span>
		</label>
		<g:textField name="contact" required="" value="${agency?.contact}" />

	</div>
	<div
		class="fieldcontain ${hasErrors(bean: agency, field: 'contactPhone', 'error')} required">
		<label for="contactPhone"> Contact Phone: <span
			class="required-indicator">*</span>
		</label>
		<g:textField name="contactPhone" required=""
			value="${agency?.contactPhone}" />

	</div>
	<div
		class="fieldcontain ${hasErrors(bean: agency, field: 'contactEmail', 'error')} required">
		<label for="contactEmail"> Contact Email: <span
			class="required-indicator">*</span>
		</label>
		<g:textField name="contactEmail" required=""
			value="${agency?.contactEmail}" />

	</div>
	<div>
		<g:if test="${params.orgAgMain=='1'}">
			<g:actionSubmit class="btn btn-default" action="_saveAgencyToOA"
				value="Save"/>
		</g:if>
		<g:else>
			<g:actionSubmit class="btn btn-default" action="_saveAgencyToAgMain"
				value="Save"/>
		</g:else>
	</div>
</g:form>
</html>