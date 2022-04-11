
<!---Custom tag for header--->
<cfif thisTag.executionMode EQ 'start'>
    <div class="header-wrapper">
<cfelse>
        <div class="login-data" id="wrapper">
            <div class="login-data" id="div">
                <span class="login-data" id="span">
                	<cfif structKeyExists(session, 'loggedInUser')>
                	<cfoutput >
                		Hello, #session.loggedInUser.userName#!
                	</cfoutput>
                	</cfif>
                </span>
            </div>
            <cfif structKeyExists(session, 'loggedInUser')>
            <cf_menu></cf_menu>
            </cfif>
        </div>
    </div>
</cfif>