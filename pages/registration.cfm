
<!--- Roles dropdown list --->
<cfquery name="rolesList">
    SELECT "Role_id", "Role_name"
    FROM roles
</cfquery>
<!--- End of the Roles list --->
<!---Registration validation--->
<cfif structKeyExists(form, 'registrationSubmit')>
	<cfset isRegistered = false />
    <cfset registrationErrorMessages = arrayNew(1)/>
    <cfif form.uLogin EQ ''>
        <cfset arrayAppend(registrationErrorMessages, 'Fill the username field')/>
    </cfif>
    <cfif form.uFirstname EQ ''>
        <cfset arrayAppend(registrationErrorMessages, 'Fill the firstname field')/>
    </cfif>
    <cfif form.uLastname EQ ''>
        <cfset arrayAppend(registrationErrorMessages, 'Fill the lastname field')/>
    </cfif>
    <cfif form.uRole EQ ''>
        <cfset arrayAppend(registrationErrorMessages, 'Choose the role')/>
    </cfif>
    <cfif form.uPassword EQ ''>
        <cfset arrayAppend(registrationErrorMessages, 'Fill the password field')/>
    </cfif>
    <cfif form.uRepPassword EQ ''>
        <cfset arrayAppend(registrationErrorMessages, 'Fill the repeated password field')/>
    </cfif>
<!---End of the registration validation--->
    <cfif isDefined('registrationErrorMessages') AND arrayIsEmpty(registrationErrorMessages)>
<!---Check if the login exists--->
<cfquery name="checkLogin">
	select "login" from users where "login" = '#form.uLogin#';
</cfquery>
<!---Send registration data to server--->
<cfif checkLogin.recordCount NEQ 0>
    	 <cfset arrayAppend(registrationErrorMessages, 'This username already exists')/>
    </cfif>
        <cfif form.uPassword EQ form.uRepPassword>
        	 <cfset passwordSalt = hash(generateSecretKey("AES"),"SHA-512")/>
        	 <cfset encryptedPassword = #hash(form.uPassword & passwordSalt,"SHA-512")#/>
        	     <cfelse>
    	        <cfset arrayAppend(registrationErrorMessages, 'Passwords do not match')/>
    	        </cfif>
        	 <cfif arrayIsEmpty(registrationErrorMessages)>
        	 <cfset isRegistered = true />
            <cfquery>
                INSERT INTO users
                (login, firstname, lastname, password, role, password_salt) VALUES
                ('#form.uLogin#', '#form.uFirstname#', '#form.uLastname#', '#encryptedPassword#', '#form.uRole#', '#passwordSalt#');
        </cfquery>
      	</cfif>
    </cfif>
    </cfif>
<!---End of the sending registration data--->
<!---Registration page--->
<!DOCTYPE html>
<body>
    <cfform name="registerForm">
        <div class="register" id="wrapper">
            <div class="register">
                <label for="uLogin"><b>Username:</b></label>
                <input type="text" placeholder="Enter username" name="uLogin" required/>
            </div>
            <div class="register">
                <label for="uFirstname" id="firstname"><b>Firstname:</b></label>
                <input type="text" placeholder="Enter firstname" name="uFirstname" required>
            </div>
            <div class="register">
                <label for="uLastname" id="lastname"><b>Lastname:</b></label>
                <input type="text" placeholder="Enter lastname" name="uLastname" required>
            </div>
        <div class="register">
            <label for="uRole"><b>Role:</b></label>
        <cfselect name="uRole" query="rolesList" value="Role_id" display="Role_name">
        </cfselect>
        </div>
            <div class="register">
                <label for="uPassword"><b>Password:</b></label>
                <input type="password" placeholder="Enter password" name="uPassword" required/>
            </div>
            <div class="register">
                <label for="uRepPassword"><b>Repeat password:</b></label>
                <input type="password" placeholder="Repeat password" name="uRepPassword" required/>
            </div>
            <div class="register">
            	<cfif isDefined('registrationErrorMessages') AND NOT arrayIsEmpty(registrationErrorMessages)>
        		<cfoutput>
            	<cfloop array="#registrationErrorMessages#" index="message">
                <p class="registrationErrorMessage">#message#</p>
            	</cfloop>
        	</cfoutput>
        	</cfif>
        	<cfif structKeyExists(form, 'registrationSubmit') AND (isRegistered EQ true)>
        		<cf_processSuccessful/>
				</cfif>
            </div>
            <div class="register">
                <input type="submit" class="register" name="registrationSubmit" id="submit-button"
                       value="Submit"></input>
            </div>
            
        </div>
    </cfform>
</body>
</html>