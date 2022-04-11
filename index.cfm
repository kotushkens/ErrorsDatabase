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
		<cf_header>
		<cf_header/>
		<cfwindow name="loginWindow" initshow="false" center="true" title="Log in"
		          height="400" source="http://localhost:8600/GET_IT/pages/login.cfm">
		</cfwindow>
		<cfwindow name="registerWindow" initshow="false" center="true" title="Register"
		          height="400" source="http://localhost:8600/GET_IT/pages/registration.cfm">
		</cfwindow>
		<div class="login-application" id="wrapper">
			<label class="login" id="label">
				<b>
					You are not logged
				</b>
			</label>
			<cfform name="indexMenuForm" method="POST">
				<cfinput name="login-button" value="Login" type="button" 
				         onclick="JavaScript:ColdFusion.Window.show('loginWindow')">
				<cfinput name="appEnter-button" type="button" value="Check the app" onClick="location.href = '/GET_IT/pages/MainPage.cfm';">
				<cfinput name="register-button" type="button" value="Register" 
				         onclick="JavaScript:ColdFusion.Window.show('registerWindow')">
			</cfform>
		</div>
	</body>
</html>