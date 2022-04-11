
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
    		<li>Просмотр</li>
    		 <br><label>USERS </label>
    		 <hr>
    		 	<li><a href="../pages/profile.cfm">Мой профиль</a></li>
    		<li>Создать юзера</li>
    		<li>Просмотр юзеов</li>
    		<br><a href="/GET_IT/pages/mainPage.cfm?logout"><li>Выход </a></li>
    		</ul>
    </div>
    </div>
    </cfform>
    </div>
</cfif>