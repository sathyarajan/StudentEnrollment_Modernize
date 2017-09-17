<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/bootstrap-united.css" rel="stylesheet" />


<style>
.error {
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}

input[type="text"],input[type="password"] {
	height: 40px;
}
</style>

<title>Student Enrollment Login</title>

</head>

<body>
	<script src="jquery-1.8.3.js">
		
	</script>

	<script src="bootstrap/js/bootstrap.js">
		
	</script>

	<div class="navbar navbar-default">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search">
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/">Home</a></li>
				<li><a href="signup-input">Signup</a></li>
				<li class="active"><a href="login-input">Login</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Explore<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Contact us</a></li>
						<li class="divider"></li>
						<li><a href="#">Further Actions</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>

	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Welcome to Online Student Enrollment Login</h1>
				<p>Login to explore the complete features!</p>
			</div>
		</div>

		<div></div>
	</div>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<s:form action="login" modelAttribute="userForm" method="POST"
						    theme="bootstrap" validate="true" class="bs-example form-horizontal">
							<fieldset>
								<legend>Student Enrollment Login Form</legend>
								<div class="form-group">
                                                                <label class="col-xs-3 control-label">User Name</label>
                                <div class="col-xs-7">
                                <spring:bind path="userName">
								<s:input type="text" label="User Name" path="userName"
									class="form-control" placeholder="User Name" />
                                </spring:bind>
                                <s:errors path="userName" class="error"/></div></div>
                                <div class="form-group">
                                                                                                <label class="col-xs-3 control-label">Password</label>
                                <div class="col-xs-7">
                                <spring:bind path="password">
								<s:input type="password" path="password"
									class="form-control" placeholder="Password" />
                                </spring:bind></div></div>
								<div class="col-lg-9 col-lg-offset-3">
								    <button class="btn btn-default" type="submit">Cancel</button>
								    <button class="btn btn-primary" type="submit">Login</button>
								</div>
								<spring:bind path="pageName">
								<s:hidden path="pageName" value="login" />
								</spring:bind>
							</fieldset>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>