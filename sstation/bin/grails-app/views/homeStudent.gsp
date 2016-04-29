<%@ page contentType="text/html;charset=UTF-8" %>
<!-- This page contains only the navigation bar -->
<!-- Other pages will be displayed in the div "main" using ajax -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Service Station Project</title>

</head>

<body>
  <div class="body" style="margin-top:72px">
 
<!-- Top Bar -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="width:100%;height:9%;border-radius:0px" id="horizontal-nav" >
  <div class="container-fluid" style="height:9%" >
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" >
      <asset:image src="ACIcon.png" id="icon" style="width:45px"/>
      <a class="navbar-brand" href="#">Austin College Service Station</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 
 	 <ul class="nav navbar-nav navbar-right">
        <li><a href="">ZX</a></li>
        <li class="dropdown" style="padding-right:20px">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#"><span class="glyphicon glyphicon-user right-corner" aria-hidden="true"></span>Profile</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-cog right-corner" aria-hidden="true"></span>Setting</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-out right-corner" aria-hidden="true"></span>Log Out</a></li>
          </ul>
        </li>
      </ul>
      
     
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>



<!-- Side Nav Bar -->
<!-- This nav bar contains five remoteLink -->
<nav class="nav-pills nav-stacked" role="navigation" style="height: 92%;margin-top: -20px;" id="navside">
			<div class="sidebar-collapse menu-collapse" style="height:100%">
				<ul class="nav navLink" id="main-menu" style="height:100%">
					<li><g:remoteLink controller="acStudent" action="_hourkpi" update="main"><span class="glyphicon glyphicon-home" aria-hidden="true"></span><br/>Home </g:remoteLink></li>
					<li>
					<g:remoteLink controller="acStudent" id="10" action="_studentHlist" params="[domain:2]" update="main"><span class="glyphicon glyphicon-grain" aria-hidden="true"></span><br/>Hours</g:remoteLink>
					</li>
					
					<li>
					<g:remoteLink controller="acStudent" id="10" action="_studentHlist" params="[domain:2]" update="main"><span class="glyphicon glyphicon-grain" aria-hidden="true"></span><br/>Reports</g:remoteLink>
					</li>
					
					<li><g:remoteLink controller="acStudent" action="_event" update="main"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span><br/>Events</g:remoteLink></li>

					<li><g:remoteLink controller="acStudent" action="_orgMain" update="main" ><span class="glyphicon glyphicon-tower" aria-hidden="true"></span><br/>Organizations</g:remoteLink></li>

				</ul>
			</div>

</nav>
<div class="panel panel-default" style="margin-left:160px" >

<!-- Ajax page will show up -->
<div id="main"> 
<g:render template="kpi/hourkpi"/>
</div>
</div>
  
  </div>
  
</body>
</html>