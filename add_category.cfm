<cfinclude template="header.cfm">
  <!-- Container Fluid-->
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">ADD CATEGORY</h1>
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
                <label for="exampleInputEmail1">Category Name</label>
                <input type="text" name="catName" class="form-control" value="" placeholder="Enter Category Name" required="">
              </div>
              <button type="submit" class="btn btn-primary" name ="addCategory">Add</button>
            </form>
          </div>
        </div>
      </div>
   </div>
<cfif isDefined("addCategory")>
  <cfset catName = "#catName#">
  <cfset cdate=DateTimeFormat(now(),'yyyy-mm-dd HH:nn:ss')>
  <cfquery name="AddCategory">
    SELECT CategoryName FROM category WHERE CategoryName = '#catName#';
  </cfquery>
  <cfquery name="maxId">
    
    select MAX(ID) as id from category

  </cfquery>
  <cfset ID= #maxId.ID#+1>
  <cfif AddCategory.RecordCount gt 0>
    <script>alert('Already added');</script>
  <cfelse>
    <cfquery name="Insertcategory">
      INSERT INTO category (ID,CategoryName, Date_created, updated_date) VALUES(#ID#,'#catName#',<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp">,<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp">);
    </cfquery>
    <script>alert('Successfully added');</script>
  </cfif>
</cfif>
<cfinclude template="footer.cfm">