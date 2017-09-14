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

<title>Student Enrollment Signup</title>

</head>

<body>

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
				<li><a href="/StudentEnrollmentWithStruts">Home</a></li>
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
                                <spring:bind path="userName">
                                    <s:input type="text" label="User Name" path="userName"
                                    class="col-lg-11" placeholder="User Name" />
                                </spring:bind>
                                <spring:bind path="password">
								    <s:input type="password" path="password"
									class="col-lg-11" placeholder="Password" />
                                </spring:bind>
                                <spring:bind path="firstName">
                                    <s:input type="text" label="First Name" path="firstName"
                                    class="col-lg-11" placeholder="First Name" />
                                </spring:bind>
                                <spring:bind path="lastName">
                                    <s:input type="text" label="Last Name" path="lastName"
                                    class="col-lg-11" placeholder="Last Name" />
                                </spring:bind>

                                <div class="row">
                                        <div class='col-sm-3'>
                                            <div class="form-group">
                                                <div class='input-group date' id='datetimepicker1'>
                                                    <spring:bind path="dateOfBirth">
                                                    <s:input type="text" label="Date Of Birth" path="dateOfBirth"
                                                                                        class="form-control" placeholder="Date Of Birth" />
                                                    </spring:bind>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                 <spring:bind path="emailAddress">
                                    <s:input type="text" label="Email Address" path="emailAddress"
                                    class="col-lg-11" placeholder="Email Address" />
                                </spring:bind>

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



	<script>
		$(function() {
			$("#dateOfBirthInput").datepicker();
		});
		 $(function () {
           var bindDatePicker = function() {
        		$(".date").datetimepicker({
                format:'YYYY-MM-DD',
        			icons: {
        				time: "fa fa-clock-o",
        				date: "fa fa-calendar",
        				up: "fa fa-arrow-up",
        				down: "fa fa-arrow-down"
        			}
        		}).find('input:first').on("blur",function () {
        			// check if the date is correct. We can accept dd-mm-yyyy and yyyy-mm-dd.
        			// update the format if it's yyyy-mm-dd
        			var date = parseDate($(this).val());

        			if (! isValidDate(date)) {
        				//create date based on momentjs (we have that)
        				date = moment().format('YYYY-MM-DD');
        			}

        			$(this).val(date);
        		});
        	}

           var isValidDate = function(value, format) {
        		format = format || false;
        		// lets parse the date to the best of our knowledge
        		if (format) {
        			value = parseDate(value);
        		}

        		var timestamp = Date.parse(value);

        		return isNaN(timestamp) == false;
           }

           var parseDate = function(value) {
        		var m = value.match(/^(\d{1,2})(\/|-)?(\d{1,2})(\/|-)?(\d{4})$/);
        		if (m)
        			value = m[5] + '-' + ("00" + m[3]).slice(-2) + '-' + ("00" + m[1]).slice(-2);

        		return value;
           }

           bindDatePicker();
         });
	</script>

	<script type="text/javascript">
		$(function() {
			var yesButton = $("#yesbutton");
			var progress = $("#doitprogress");

			yesButton.click(function() {
				yesButton.button("loading");

				var counter = 0;
				var countDown = function() {
					counter++;
					if (counter == 11) {
						yesButton.button("complete");
					} else {
						progress.width(counter * 10 + "%");
						setTimeout(countDown, 100);
					}
				};

				setTimeout(countDown, 100);
			});

		});
	</script>
</body>
</html>