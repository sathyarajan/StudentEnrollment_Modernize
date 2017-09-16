<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

<title>Student Enrollment Signup</title>

</head>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/bootstrap-united.css" rel="stylesheet" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-datepicker.min.css" />
<body>
<script src="bootstrap/js/jquery-1.8.3.js"></script>
<script src="bootstrap/js/bootstrap.js">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="bootstrap/js/bootstrap-datepicker.min.js"></script>
		
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
				<li class="active"><a href="signup-input">Signup</a></li>
				<li><a href="login-input">Login</a></li>
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
				<h1>Welcome to Online Student Enrollment Signup</h1>
				<p>Its absolutely quick!</p>
			</div>
		</div>

		<div></div>
	</div>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<s:form modelAttribute="studentForm" action="signup" theme="bootstrap"
							validate="true" cssClass="bs-example form-horizontal"
							method="post">
							<fieldset>
								<legend>Student Enrollment Signup Form</legend>
								<div class="form-group">
                                                                                                <label class="col-xs-3 control-label">User Name</label>
                                <div class="col-xs-7">
                                <spring:bind path="userName">
                                    <s:input type="text" label="User Name" path="userName"
                                    class="form-control" placeholder="User Name" />
                                </spring:bind></div></div>
                                <div class="form-group">
                                   <label class="col-xs-3 control-label">Password</label>
                                <div class="col-xs-7">
                                <spring:bind path="password">
								    <s:input type="password" path="password"
									class="form-control" placeholder="Password" />
                                </spring:bind></div></div>
                                <div class="form-group">
                                                                                                <label class="col-xs-3 control-label">First Name</label>
                                <div class="col-xs-7">
                                <spring:bind path="firstName">
                                    <s:input type="text" label="First Name" path="firstName"
                                    class="form-control" placeholder="First Name" />
                                </spring:bind></div></div>
                                <div class="form-group">
                                                                <label class="col-xs-3 control-label">Last Name</label>
                                <div class="col-xs-7">
                                <spring:bind path="lastName">
                                    <s:input type="text" label="Last Name" path="lastName"
                                    class="form-control" placeholder="Last Name" />
                                </spring:bind></div></div>
                                <div class="form-group">
                                <label class="col-xs-3 control-label">Email Address</label>
                                <div class="col-xs-7">
                                 <spring:bind path="emailAddress">
                                                                    <s:input type="text" label="Email Address" path="emailAddress"
                                                                    class="form-control" placeholder="Email Address" />
                                                                </spring:bind></div>
                                </div>
                                <div class="row">
                                <label class="col-xs-2 control-label">DOB</label>
                                <div class='col-xs-1'></div>
                                        <div class='col-xs-5'>
                                            <div class="form-group">
                                                <div class='input-group date' id='datePicker'>
                                                        <spring:bind path="dateOfBirth">
                                                                <s:input type="text" label="Date Of Birth" path="dateOfBirth"  class="form-control" placeholder="Date Of Birth" />
                                                        </spring:bind>
                                                                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                            </div>
                                            </div>
                                        </div>

								<div class="col-lg-9 col-lg-offset-3">
								    <button class="btn btn-default" type="submit">Cancel</button>
                                	<button class="btn btn-primary" type="submit">Submit</button>
									<div id="themodal" class="modal fade col-lg-9 col-lg-offset-3"
										data-backdrop="static">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h3>Signup Form Submission</h3>
												</div>
												<div class="modal-body">
													<p>Are you sure you want to do this?</p>
													<div class="progress progress-striped active">
														<div id="doitprogress" class="progress-bar"></div>
													</div>
												</div>
												<div class="modal-footer">

												</div>
											</div>
										</div>
									</div>
								</div>
								<spring:bind path="pageName">
                                    <s:hidden path="pageName" value="signup" />
                                </spring:bind>
							</fieldset>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function() {
	    $('#datePicker')
                .datepicker({
                    format: 'mm/dd/yyyy'
                });
                });
	</script>
</body>
</html>