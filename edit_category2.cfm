<cfset cdate=datetimeformat(now(),'yyyy-mm-dd HH:nn:ss')>
<cfquery name="check">
    select CategoryName from category where CategoryName='#catName#'
</cfquery>
<cfif check.recordCount gt 0>
    <cfoutput>This Category Already Exist</cfoutput>
<cfelse>
    <cfquery name="editC">

        update  category set CategoryName='#catName#' ,updated_date=<cfqueryparam value=#cdate# cfsqltype="cf_sql_timestamp"> where ID=#cat#
        
    </cfquery>
    <cfoutput>Updated Successfully</cfoutput>
</cfif>    
