<cfcomponent output="false" name="authenticationService">
<!---ValidateUser()--->
    <cffunction name="validateUser" access="public"
            output="false" returntype="array">
        <cfargument name="uLogin" type="string" required="true"/>
        <cfargument name="uPassword" type="string" required="true"/>
        <cfset var errorMessages = arrayNew(1)/>
<!---Validate login--->
        <cfif (arguments.uLogin EQ '')>
            <cfset arrayAppend(errorMessages, 'login is invalid')>
        </cfif>
        <cfreturn errorMessages/>
<!---Validate password--->
        <cfif arguments.uPassword EQ ''>
            <cfset arrayAppend(errorMessages, 'password is invalid')>
        </cfif>
        <cfreturn errorMessages/>
    </cffunction>
<!---doLogin()--->
    <cffunction name="doLogin" access="public"
            output="false" returntype="boolean">
        <cfargument name="uLogin" type="string" required="true"/>
        <cfargument name="uPassword" type="string" required="true"/>
        <cfset var isUserLoggedIn = false/>
<!---Get the user from db--->
	<cfquery name="getPassword">
		select users.password, users.password_salt, users.key from users where users.login = '#uLogin#'
	</cfquery>
	<cfif getPassword.recordCount EQ 1>
	<cfset encryptedPassword = #hash(uPassword & getPassword.password_salt,"SHA-512")#/>	
	<cfif encryptedPassword EQ getPassword.password>
        <cfquery name="getUser">
            select users.id, users.login, users.password, users.firstname
            from users where users.login = '#uLogin#' 
        </cfquery>
<!---Check that getUser returns 1 value--->
            <cflogin>
                <cfloginuser name="#getUser.login#" password="#getUser.password#" roles="administrator">
            </cflogin>
<!---Save the user in scope--->
            <cfset session.loggedInUser = {'uLogin' = getUser.login, 'userName' = getUser.firstname, 'uPassword' = getUser.password, 'uId' = getUser.id}/>
            <cfset var isUserLoggedIn = true />
        </cfif>
        </cfif>
        <cfreturn isUserLoggedIn/>
       <cflocation url="/GET_IT/pages/mainPage.cfm" >
    </cffunction>
<!---doLogout()--->
    <cffunction name="doLogout" access="public"
            output="false" returntype="void">
            <cfset structdelete(session,'loggedInUser') />
		<!---Log the user out--->
		<cflogout />
		    <cflocation url="/GET_IT/index.cfm" >
    </cffunction>
</cfcomponent>