<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Organizations Management</title>
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
		<div class="titletop">
			<h1 class="pagetitle">Organizations Management</h1>
			<div class="cornerButtons"></div>
		</div>
		<!-- titletop ends -->

		<div>

			<div class="row">
				<div class="col-md-6" id="orgTopList">
					<div class="greyBar formHeading">
						<g:link controller="EO" action="orgMain">Campus Organizations</g:link>
					</div>
					<div class="list-group">
						<div class="list-group-item more">
							<g:remoteLink class="aoListIcon" controller="EO" action="_createOrg" update="main"
								params="[orgAgMain:1]">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New Campus Organization</g:remoteLink>
						</div>
						<g:each in="${orgList}" status="i" var="org">

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
									<g:remoteLink class="aoListIcon" controller="EO" id="${org.id}" action="_editOrg"
										update="main" params="[orgAgMain:1]">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
										<b>Edit</b>
									</g:remoteLink>

									<g:remoteLink class="orgAgMainDelete aoListIcon" controller="EO"
										action="_deleteOrgOnOA" id="${org.id}">
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
							<g:link controller="EO" action="orgMain" class="aoListIcon">More</g:link>
						</div>

					</div>
					<!-- List-group ends -->

				</div>
				<!-- orgTopList ends -->





				<div class="col-md-6" id="agTopList">
					<div class="greyBar formHeading">
						<g:link controller="EO" action="agMain">Community Agencies</g:link>
					</div>
					<div class="list-group">
						<div class="list-group-item more">
							<g:remoteLink controller="EO" class="aoListIcon" action="_createAgency" update="main"
								params="[orgAgMain:1]">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New Community Agency</g:remoteLink>
						</div>
						<g:each in="${agList}" status="i" var="ag">

							<div class="list-group-item">
								<!-- heading -->
								<h4 class="list-group-item-heading">
									<b> ${ag.name}
									</b>
								</h4>

								<!-- Information -->
								<p class="list-group-item-text">
									${ag.description}

								</p>
								<ol class="contactInfor">
									<li>Contact: ${ag.contact}</li>
									<li>Contact Phone: ${ag.contactPhone}</li>
									<li>Contact Email: ${ag.contactEmail}</li>
									<li>Address: ${ag.address}</li>
								</ol>

								<!-- Buttons -->
								<div class="cornerButtons listButtons">
									<g:remoteLink class="aoListIcon" controller="EO" params="[orgAgMain:1]"
										id="${ag.id}" action="_editAgency" update="main">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
										<b>Edit</b>
									</g:remoteLink>

									<g:remoteLink class="orgAgMainDelete aoListIcon" controller="EO"
										id="${ag.id}" action="_deleteAgencyOnOA">
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
							<g:link controller="EO" action="agMain" class="aoListIcon">More</g:link>
						</div>

					</div>
					<!-- List-group ends -->
				</div>
				<!-- agTopList ends -->

			</div>
			<!-- row ends -->
		</div>
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