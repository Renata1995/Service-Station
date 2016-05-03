<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<style>
.row {
	margin-top: 20px;
}

.list-group-item-heading {
	margin-bottom: 15px;
}

.list-group-item-text {
	margin-bottom: 5px;
}

.more {
	padding-bottom: 20px;
	text-align: center;
}

.more>a {
	text-decoration: underline;
	font-weight: 700;
}
</style>
</head>
<body>
	<div class="body">
			<div class="row">
				<div class="col-md-12" id="reportTopList">
		
					<div class="list-group">
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								<b>Report by AC Group</b>
							</h4>
							<p class="list-group-item-text">
								Generates an aggregate report of hours organized by AC groups.
							</p>
							<g:form controller = "Reports">
								<select name = campusOrgComboBox>
									<g:each in="${campusList}">
										<option value="${it.id}">${it.name}</option>
									</g:each>
								</select>
								<br/>
								<br/>
								<g:actionSubmit value = "Generate Report" action="campusOrgReport" ></g:actionSubmit>
								<div class="cornerButtons listButtons"></div>
							</g:form>
					
							
						</div>
						
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								<b>Report by Event</b>
							</h4>
							<p class="list-group-item-text">
								Generates an aggregate report of hours organized by service events.
							</p>
							<g:link controller="reports" action="eventSelection">Generate Report</g:link>
							<div class="cornerButtons listButtons"></div>
						</div>
						
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								<b>Report by Semester</b>
							</h4>
							<p class="list-group-item-text">
								Generates an aggregate report of hours organized by year/semester.
							</p>
							<g:form controller = "Reports">
								<select name = yearComboBox>
									<g:each in="${yearList}">
										<option value="${it}">${it}</option>
									</g:each>
								</select>
								</br>
								<select name = semesterComboBox>
									<g:each in="${semesterList}">
										<option value="${it}">${it}</option>
									</g:each>
								</select>
								<br/>
								<br/>
								<g:actionSubmit value = "Generate Report" action="semesterReport" ></g:actionSubmit>
								<div class="cornerButtons listButtons"></div>
							</g:form>
							<div class="cornerButtons listButtons"></div>
						</div>
						
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								<b>Report by Organization</b>
							</h4>
							<p class="list-group-item-text">
								Generates an aggregate report of hours organized by community organizations.
							</p>
							<g:link controller="reports" action="commOrgReport">Generate Report</g:link>
								<div class="cornerButtons listButtons"></div>
						</div>
						
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								<b>Report by Year</b>
							</h4>
							<p class="list-group-item-text">
								Generates an aggregate report of hours organized by Years.
							</p>
							<g:link controller="reports" action="yearReport">Generate Report</g:link>
							<div class="cornerButtons listButtons"></div>
						</div>
						
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								<b>Summary Report</b>
							</h4>
							<p class="list-group-item-text">
								Generates an aggregate summary report of hours.
							</p>
							<g:link controller="reports" action="summaryReport">Generate Report</g:link>
							<div class="cornerButtons listButtons"></div>
						</div>
					</div>
					<!-- List-group ends -->

				</div>
				<!-- orgTopList ends -->

			</div>
			<!-- row ends -->
	</div>
</body>

</html>
