<!---Check the user--->
<cfif structKeyExists(session,'loggedInUser')>
	<!---Logout--->
	<cfif structKeyExists(URL, 'logout')>
		<cfset authenticationService = createObject("component", 'GET_IT.components.authenticationService')/>
		<cfset logout = authenticationService.doLogout()/>
		<cflocation url="/GET_IT/index.cfm">
	</cfif>
	<!---Errors table--->
	<cfquery name="getErrors">
		SELECT "id" FROM errors ORDER BY errors.Id
	</cfquery>
	<!---End of ColdFusion scripts--->
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset='utf-8'/>
			<link rel="stylesheet" href="../styles/mainPage.css"/>
			<link rel="stylesheet" href="../styles/header.css"/>
			<link rel="stylesheet" href="../styles/menu.css"/>
			<link rel="stylesheet" href="../styles/newError.css"/>
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
			<div class="header">
				<cf_header>
				</cf_header>
			</div>
			<div class="new-error-window">
				<cfwindow name="newErrorWindow" initshow="false" center="true" title="New error"
		          height="400" source="http://localhost:8600/GET_IT/pages/newError.cfm"/>
			</div>
			<div class="mainPage" id="wrapper">
				<table class="mainPage" id="errors-table"  border="1" width="70%">
					<caption>TESTING ERRORS</caption>
					<tr>
						<th>Id</th>
						<th>Urgency</th>
						<th>Critiality</th>
						<th>Was created at</th>
						<th>Description</th>
						<th>Full description</th>
						<th>Last modified by user</th>
						<th>Status</th>
					</tr>
					<cfoutput query="getErrors">
					<tr>
						<td>#errors.id#</td>
						<td>#errors.urgency#</td>
						<td>Critiality</td>
						<td>Was created at</td>
						<td>Description</td>
						<td>Full description</td>
						<td>Last modified by user</td>
						<td>Status</td>
					</tr>
					</cfoutput>
				</table>
				
			</div>
		</body>
	</html>
<cfelse>
	<cf_errorpage/>
</cfif>