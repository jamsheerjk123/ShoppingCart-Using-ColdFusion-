<cftry> 
    <cfquery name="userfind">
    SELECT * from customer where username='#username#' and PASSWORD='#password#'  
    </cfquery>
    
    <cfif len(userfind) gt 0 >
        <cflog file="user" application="no" 
        text="User #userfind.username# logged on.">
        <cfset session.user="#userfind.ID#">
        <cfif #userfind.role# EQ 1>
            <cflocation url="admin.cfm">

        <cfelse>

        </cfif>
        
        <cflocation url="home.cfm">
    <cfelse>
        <cfset errormsg="Incorrect Username or Password">
        <cflocation url="Login_Registration.cfm?error=#errormsg#">
    </cfif>
    
    <cfcatch type="Database">
        <cfset errormsg="Incorrect Username or Password">
        <cflocation url="Login_Registration.cfm?error=#errormsg#">
    </cfcatch>
</cftry>