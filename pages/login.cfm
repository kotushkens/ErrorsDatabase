<!---Form processing--->
<cfif structKeyExists(form, 'loginSubmit')>
	<cfset authenticationService = createObject("component", 'GET_IT.components.authenticationService')/>
	<!---Login validation--->
	<cfset loginErrorMessages = arrayNew(1)/>
	<cfif form.uLogin EQ ''>
		<cfset arrayAppend(loginErrorMessages, 'Fill the login field')/>
	</cfif>
	<cfif form.uPassword EQ ''>
		<cfset arrayAppend(loginErrorMessages, 'Fill the password field')/>
	</cfif>
<!---End of the login validation--->
<!---Data validation--->
<cfset loginErrorMessages = authenticationService.validateUser(form.uLogin, form.uPassword)/>
<cfif arrayIsEmpty(loginErrorMessages)>
	<!---Login--->
	<cfset isUserLoggedIn = authenticationService.doLogin(form.uLogin, form.uPassword)/>
</cfif>
</cfif>
<!---Login page--->
<!DOCTYPE html>
<body>
    <cfform name="loginForm">
        <div class="login" id="wrapper">
            <div class="login">
                <label for="uLogin"><b>Username:</b></label>
                <input type="text" placeholder="Enter username" name="uLogin" required/>
            </div>

            <div class="login">
                <label for="uPassword"><b>Password:</b></label>
                <input type="password" placeholder="Enter password" name="uPassword" required/>
            </div>
         <div class="login">
					<cfif structKeyExists(form, 'loginSubmit') AND NOT arrayIsEmpty(loginErrorMessages)>
						<cfoutput>
							<cfloop array="#loginErrorMessages#" index="message">
								<p class="loginErrorMessage">
									#message#
								</p>
							</cfloop>
						</cfoutput>
						</cfif>
					<cfif isUserLoggedIn EQ true>
						<cf_processsuccessful/>
						</cfif>
					<cfif structKeyExists(form, 'loginSubmit') AND isUserLoggedIn EQ false>
						<p>User does not exist. Check if the login and password are correct and try again</p>
					</cfif>
				</div>
            <div class="login">
                <input type="submit" class="login" name="loginSubmit" id="submit-button"
                       value="Submit"></input>
            </div> 
        </div>
    </cfform>
</body>
</html>