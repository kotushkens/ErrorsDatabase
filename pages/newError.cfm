<!---Get the list of status, urgency and critiality fields--->
<cfquery name="errorStatusList">
	select "id", "status" from error_status;
</cfquery>
<cfquery name="errorUrgencyList">
	select "id", "urgency" from error_urgency;
</cfquery>
<cfquery name="errorCritialityList">
	select "id", "critiality" from error_critiality;
</cfquery>
<!---Send data to the server--->
<cfif structKeyExists(form, 'newErrorSubmit')>
   <cfquery name="newError">
                INSERT INTO errors
                (created_at, description, full_description, last_modified_by, status, urgency, critiality) VALUES
                (#Now()#,'#form.eDesc#', '#form.eFullDesc#', '#session.loggedInUser.uId#', '#form.eStatus#', '#form.eUrgency#', '#form.eCritiality#')
        </cfquery>
        <cfquery name="updateErrorStory">
        	INSERT INTO error_story 
        	(date_when_modified, action, modified_by) VALUES
        	(#Now()#, 'Created', '#session.loggedInUser.uId#')
        </cfquery>
        </cfif>
<!DOCTYPE html>
<body>
	<cfform id="newErrorForm">
	<div class="new-error" id="wrapper">
		<div class="new-error">
                <label for="eDesc"><b>Short description:</b></label>
                <input type="text" placeholder="Enter short description" name="eDesc" required/>
            </div>
		<div class="new-error">
			<label for="eFullDesc"><b>Full description:</b></label>
			 <p><textarea rows="10" cols="100" placeholder="Enter full description" name="eFullDesc" id="full-desc"></textarea></p>
	</div>
	<div class="new-error">
			<label for="eStatus"><b>Status:</b></label>
		<cfselect name="eStatus" query="errorStatusList" value="id" display="status">
        </cfselect>
	</div>
	<div class="new-error">
			<label for="eUrgency"><b>Urgency:</b></label>
			<cfselect name="eUrgency" query="errorUrgencyList" value="id" display="urgency">
        </cfselect>
	</div>
	<div class="new-error">
			<label for="eCritiality"><b>Critiality:</b></label>
			<cfselect name="eCritiality" query="errorCritialityList" value="id" display="critiality">
        </cfselect>
	</div>
	<div class="new-error">
	        <input type="submit" class="new-error" name="newErrorSubmit" id="new-error-button" value="Submit"></input>
	        </div>
	 </div>
	</cfform>
</body>
</html>