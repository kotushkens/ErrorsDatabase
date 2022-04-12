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
		SELECT e.id, e.created_at, e.description, e.full_description, u.firstname, u.lastname, cri.critiality, s.status, urg.urgency 
		FROM errors e 
		JOIN error_urgency urg ON (e.urgency = urg.id)
		JOIN users u ON (e.last_modified_by = u.id)
		JOIN error_critiality cri ON (e.critiality = cri.id)
		JOIN error_status s ON (e.status = s.id); 
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
			<link rel="stylesheet" href="../styles/table.css"/>
			<link rel="stylesheet" href="../styles/index.css"/>
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;400&display=swap" 
			      rel="stylesheet">
			<script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
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
			<div class="register">
				<cfwindow name="newUserWindow" initshow="false" center="true" title="New user"
		          height="400" source="http://localhost:8600/GET_IT/pages/registration.cfm"/>
			</div>
			<div class="users-window">
				<cfwindow name="usersListWindow" initshow="false" center="true" title="Users"
		          height="400" source="http://localhost:8600/GET_IT/pages/usersList.cfm"/>
			</div>
			<div class="error-story">
				<cfwindow name="errorStoryWindow" initshow="false" center="true" title="Error story"
				 height="400" source="http://localhost:8600/GET_IT/pages/errorStory.cfm"/>
			<div class="mainPage" id="wrapper">
				<table class="sortable" id="errors-table"  border="1" width="70%">
					<label id="table-title">TESTING ERRORS</label>
					<tr>
						<th>Id</th>
						<th>Urgency</th>
						<th>Critiality</th>
						<th>Was created at</th>
						<th>Status</th>
						<th>Description</th>
						<th>Full description</th>
						<th>Last modified by user</th>
					</tr>
					<cfoutput query="getErrors" >
					<tr onclick="JavaScript:ColdFusion.Window.show('errorStoryWindow')">
						<td>#getErrors.id#</td>
						<td>#getErrors.urgency#</td>
						<td>#getErrors.critiality#</td>
						<td>#DateTimeFormat(getErrors.created_at,"dd-mmm-yyyy")#</td>
						<td>#getErrors.status#</td>
						<td>#getErrors.description#</td>
						<td>#getErrors.full_description#</td>
						<td>#getErrors.firstname# #getErrors.lastname#</td>
					</tr>
					</cfoutput>
				</table>
				
			</div>
		</body>
	</html>
<cfelse>
	<cf_errorpage/>
</cfif>