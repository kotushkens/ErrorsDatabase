<cfcomponent output="false">
    <cfset this.name = "TestingErrorsApplication">
    <cfset this.applicationTimeout = createTimespan(0, 3, 0, 0)>
    <cfset this.datasource = "Testing_errors">
    <cfset this.customTagPaths = expandPath('/GET_IT/custom_tags')>
    <cfset this.sessionManagement = true />
<!---ApplicationStart() scope--->
    <cffunction name="onApplicationStart" returntype="boolean">
        <cfset application.errorsService = createObject("component", 'GET_IT.components.errorsService') />
        <cfreturn true/>
    </cffunction>
<!---RequestStart() scope--->
    <cffunction name="onRequestStart" returntype="boolean">
        <cfargument name="targetPage" type="string" required="true"/>
        <cfif isDefined('url.restartApp')>
            <cfset this.onApplicationStart()/>
        </cfif>
        <cfreturn true/>
    </cffunction>
</cfcomponent>