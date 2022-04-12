
<!---Custom tag for the left-hand menu--->
<cfif thistag.executionmode EQ 'start'>
    <div class="menu-wrapper">
<cfelse>
    <div class="main-page" id="menu-wrapper">
    	 <cfform method="post">
    	 <input	type="checkbox" class="hidden-menu-ticker" id="hmt">
    	<label class="main-page" id="btn-menu" for="hmt">
        <div class="menu-label"> MENU
        </div>
  		</label>
    	<ul class="hidden-menu">
    		<label> ERRORS </label>
    		<hr>
    		<li onclick="JavaScript:ColdFusion.Window.show('newErrorWindow')">New error</li>
    		<li><a href="../pages/mainPage.cfm">Errors database</a></li>
    		 <br><label>USERS </label>
    		 <hr>
    		 <li><a href="../pages/profile.cfm">My profile</a></li>
    		<li onClick="JavaScript:ColdFusion.Window.show('newUserWindow')">Create new user</li>
    		<li onclick="JavaScript:ColdFusion.Window.show('usersListWindow')">List of users</li>
    		<br><a href="/GET_IT/pages/mainPage.cfm?logout"><li>Logout</a></li>
    		</ul>
    </div>
    </div>
    </cfform>
    </div>
</cfif>