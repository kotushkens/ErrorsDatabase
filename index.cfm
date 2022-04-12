<!DOCTYPE html>
<html>
	<head>
		<meta charset='utf-8'/>
		<link rel="stylesheet" href="styles/index.css"/>
		<link rel="stylesheet" href="styles/header.css"/>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;400&display=swap" 
		      rel="stylesheet">
		<title>
			Testing errors
		</title>
	</head>
	<body>
		<cfajaximport tags="cfform">
		<cfwindow name="loginWindow" initshow="false" center="true" title="Log in"
		          height="400" source="http://localhost:8600/GET_IT/pages/login.cfm">
		</cfwindow>
		<cfwindow name="registerWindow" initshow="false" center="true" title="Register"
		          height="400" source="http://localhost:8600/GET_IT/pages/registration.cfm">
		</cfwindow>
		<div class="login-application" id="wrapper">
			<label class="login" id="label">
				<b>
					You are 
					<cfif structKeyExists(session, 'loggedInUser')>
                	<cfoutput >
						logged as <span id="username"> #session.loggedInUser.userName# </span>
					</cfoutput>
					<cfelse> not logged yet
					</cfif>
				</b>
			</label>
			<div class="buttons" id="main-buttons">
			<cfform name="indexMenuForm" method="POST" id="main-form">
				<cfinput name="login-button" value="Login" type="button" class="main-buttons"
				         onclick="JavaScript:ColdFusion.Window.show('loginWindow')">
				<cfinput name="appEnter-button" type="button" value="Check the app" class="main-buttons" 
				         onclick="location.href = '/GET_IT/pages/MainPage.cfm';">
				<cfinput name="register-button" type="button" value="Register" class="main-buttons"
				         onclick="JavaScript:ColdFusion.Window.show('registerWindow')">
			</cfform>
			</div>
		</div>
	</body>
</html>