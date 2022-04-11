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
</cfif>
<!---End of the login validation--->
<!---Password encrypt--->
<cfset passwordSalt = hash(generateSecretKey("AES"), "SHA-512")/>
<cfset encryptedPassword = #hash(form.uPassword & passwordSalt, "SHA-512")#/>
<!---Data validation--->
<cfset errorMessages = authenticationService.validateUser(form.uLogin, encryptedPassword)/>
<cfif arrayIsEmpty(errorMessages)>
	<!---Login--->
	<cfset isUserLoggedIn = authenticationService.doLogin(form.uLogin, encryptedPassword)/>
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
					<cfif isDefined('loginErrorMessages') AND NOT arrayIsEmpty(loginErrorMessages)>
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
				</div>
            <div class="login">
                <input type="submit" class="login" name="loginSubmit" id="submit-button"
                       value="Submit"></input>
            </div>
            
        </div>
    </cfform>
</body>
</html>