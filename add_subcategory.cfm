<cfinclude template="header.cfm">
<cfif isDefined("url.id")>
    <cfquery name="subcategory_details">

        select  s.ID,s.Sub_Name,c.CategoryName,s.Date_created,s.updated_date ,c.ID as cid from subcategory as s  inner Join category as c on s.Cat_Id=c.ID where s.ID=#id#
    

    </cfquery>
    
    <cfset button="Update">
    <cfset sub="#subcategory_details.Sub_Name#">
    <cfset cat="#subcategory_details.CategoryName#">
    <cfset catid="#subcategory_details.cid#">
<cfelse> 
    <cfset button="Add">
    <cfset sub="">
    <cfset cat="Choose Your Category">
    <cfset catid=""     >  


</cfif>
  <!-- Container Fluid-->
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">

      <h1 class="h3 mb-0 text-gray-800"><cfoutput>#button#</cfoutput> SUBCATEGORY</h1>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <!-- Form Basic -->
        <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary"></h6>
          </div>
          <div class="card-body">
            <form method="post">
              <div class="form-group">
                <label for="exampleInputEmail1">Sub Category Name</label>
                <input type="text" name="subName" class="form-control" value="<cfoutput>#sub#</cfoutput>" placeholder="Enter Subcategory Name" required="">
              </div>
              <cfquery name="category">
                  Select ID , CategoryName from category
              </cfquery>
              
              <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="cats">
                <option value=<cfoutput>#catid#</cfoutput>  selected><cfoutput>#cat#</cfoutput></option>
                <cfoutput query="category">
                    <option value=#ID#>#CategoryName#</option>
                </cfoutput>
                
                
              </select><br><br>
              <button type="submit" class="btn btn-primary" name ="<cfoutput>#button#</cfoutput>"><cfoutput>#button#</cfoutput></button>
            </form>
          </div>
        </div>
      </div>
   </div>

<cfset cdate=DateTimeFormat(now(),'yyyy-mm-dd HH:nn:ss')>
<cfif isDefined("Add")>
    

    <cfquery name="checksub">select Sub_Name from subcategory where Sub_Name="#subName#"</cfquery>

    <cfif checksub.recordCount gt 0>

   <script> alert("Already Added")</script> 
    <cfelse>
        <cfquery name="add_subcategory">


            insert into subcategory (Sub_Name,Cat_Id,Date_created,updated_date) values ('#subName#','#cats#',<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp">,<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp"> )
            
        </cfquery>
        <script>alert("Successfully Created")</script>

    </cfif>
</cfif>
<cfif isDefined("Update")>

    <cfquery name="updatesub">
        update subcategory set Sub_Name='#subName#' ,Cat_Id='#cats#',updated_date=<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp">where ID='#id#'
    </cfquery>
    <script>alert('Successfully Updated');window.location="edit_subcategory.cfm"</script>

</cfif>
<cfinclude template="footer.cfm">
