<!---Get the user from database--->
<cfquery name="getUser">
 select users.login, users.firstname, users.lastname, users.role
            from users where users.login = 'session.loggedInUser.uLogin' and users.password = 'session.loggedInUser.uPassword'
	</cfquery>
<!DOCTYPE html>
<html>
	<head>
		<meta charset='utf-8'/>
		<link rel="stylesheet" href="../styles/header.css"/>
		<link rel="stylesheet" href="../styles/menu.css"/>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;400&display=swap" 
		      rel="stylesheet">
		<title>
			Testing errors
		</title>
	</head>
	<body>
		<div class="header">
			<cf_header>
			</cf_header>
		</div>
		<cfform name="update-profile">
			<div class="user-data" id="main-wrapper">
				
			</div>
		</cfform>
	</body>
</html>