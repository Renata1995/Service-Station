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
				<div class="col-md-12" id="orgTopList">
		
					<div class="list-group">
						<div class="list-group-item more">
							<g:remoteLink class="aoListIcon" controller="ACGroup" action="_createOrg" update="main"
								params="[orgAgMain:1]">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New Campus Organization</g:remoteLink>
						</div>
						<g:each in="${list}" status="i" var="org">

							<div class="list-group-item">
								<!-- heading -->
								<h4 class="list-group-item-heading">
									<b> ${org.name}
									</b>
								</h4>

								<!-- Information -->
								<p class="list-group-item-text">
									${org.description}
								</p>
								<ol class="contactInfor">
									<li>Contact: ${org.contact}</li>
									<li>Contact Phone: ${org.contactPhone}</li>
									<li>Contact Email: ${org.contactEmail}</li>
								</ol>

								<!-- Buttons -->
								<div class="cornerButtons listButtons">
									<g:remoteLink class="aoListIcon" controller="ACGroup" id="${org.id}" action="_editOrg"
										update="main" params="[orgAgMain:1]">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
										<b>Edit</b>
									</g:remoteLink>

									<g:remoteLink class="orgAgMainDelete aoListIcon" controller="ACGroup"
										action="_deleteOnCard" id="${org.id}">
										<span class="glyphicon glyphicon-trash"
											style="padding-left: 20px" aria-hidden="true"></span>
										<b>Delete</b>
									</g:remoteLink>
								</div>
								<!-- list-button -->

							</div>
							<!-- list-group-item -->

						</g:each>

						<div class="list-group-item more">
							<g:link controller="ACGroup" action="orgTableView" class="aoListIcon">More</g:link>
						</div>

					</div>
					<!-- List-group ends -->

				</div>
				<!-- orgTopList ends -->

			</div>
			<!-- row ends -->
	</div>
	<script>
		$(function() {
			$(".orgAgMainDelete").click(function() {
				$(this).parents("div.list-group-item").remove();
			});
		});
	</script>
</body>

</html>