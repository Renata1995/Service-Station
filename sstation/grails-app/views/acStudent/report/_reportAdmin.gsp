<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<div style="padding-top:20px">
<ul class="nav-tabs navGradient nav">
	<li class="tab1"> <g:remoteLink controller="acStudent" action="_studentReport"
		update="reportAdmin" id="${student.id}">Overall Report</g:remoteLink></li>
	<li class="tab2"><g:remoteLink controller="acStudent" action="_semesterReport"
		update="reportAdmin" id="${student.id}">By Semesters</g:remoteLink></li>
	<li class="tab3"><g:remoteLink controller="acStudent" action="_orgReport"
		update="reportAdmin" id="${student.id}">By Organizations</g:remoteLink></li>
		</ul>
</div>

<div id="reportAdmin" class="mainback"></div>

</html>