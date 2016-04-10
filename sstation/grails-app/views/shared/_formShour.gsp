<%@ page import="success.ServiceHour" %>

<!-- Form template for service hour -->

<input type="text" style="display:none" name="sid" value="${shour?.id}" ></input>

<!-- The event field is optional. Students can choose the event in a drop down box. When one clicks on the option "Other"
, a text field will show up. One can write the event name in the text field -->
<div class="fieldcontain ${hasErrors(bean: shour, field: 'event', 'error')} required">
	<label for="event">
		Event:
	</label> 
	<g:select name="shEvent" from="${eventList}" value="${shour?.event}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: shour, field: 'description', 'error')} required">
	<label for="description">
		Description: 
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${shour?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shour, field: 'campusOrg', 'error')} required">
	<label for="campusOrg">
		Campus Organization: 
	</label>
	<g:select name="shOrg" value="${shour?.campusOrg?.name}" from="${orgList}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shour, field: 'commAg', 'error')} required">
	<label for="commAg">
		Community Agency: 
	</label>
	<g:select name="shCommAg" value="${shour?.commAg}" from="${agList}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: shour, field: 'starttime', 'error')} required">
	<label for="starttime">
		Start Time: 
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="startdate" name="startdate" required="" value="${shour?.starttime?.format('MM/dd/yyyy')}"/>
	<g:field type="number" name="starthour" required="" value="${shour?.starttime?.format('HH')?:'0'}" class="time_textField"/> hr
	<g:field type="number" name="startmin" required="" value="${shour?.starttime?.format('mm')?:'0'}" class="time_textField"/> min
</div>

<g:javascript> 
$(function() {
    $( "#startdate" ).datepicker();
  });
</g:javascript>



<div class="fieldcontain ${hasErrors(bean: shour, field: 'duration', 'error')} required">
	<label for="duration">
		Duration:  
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="duration" required="" value="${shour?.duration?:''}"/> hr

</div>



<div class="fieldcontain ${hasErrors(bean: shour, field: 'eventContactName', 'error')} required">
	<label for="eventContactName">
		Contact Name
	</label>
	<g:textField name="eventContactName"  value="${shour?.eventContactName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shour, field: 'eventContactPhone', 'error')} required">
	<label for="eventContactPhone">
		Contact Phone
	</label>
	<g:textField name="eventContactPhone" value="${shour?.eventContactPhone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shour, field: 'eventContactEmail', 'error')} required">
	<label for="eventContactEmail">
		Contact Email
	</label>
	<g:field type="email" name="eventContactEmail" value="${shour?.eventContactEmail}" />

</div>



