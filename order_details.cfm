<cfinclude template="header.cfm">
<div class="content">
    <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header card-header-primary">
            <h4 class="card-title ">View And Edit Your Category Here</h4>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered align-items-center table-flush" id="dataTable">
                <thead class=" text-primary">
                  <th>ID</th>
                  <th>Customer  Name</th>
                  <th>Email</th>
                  <th>Phone Number</th>
                  <th>Username</th>
                  <th>OrderDate</th>
                  <th>status</th>
                </thead>
                <cfquery name="order" >

select o.ID,c.CustomerName,p.Prod_Name,o.TotalPrice,o.Quantity,o.Order_date,o.status from orders as o inner join customer as c on o.Cus_Id=c.ID inner JOIN product AS p ON   o.Pro_Id=p.ID ORDER BY o.ID 
                    
                </cfquery>
                
              <tbody>
                  <cfoutput query="order">
                    <cfif #status# EQ 0>
                        <cfset status1="Pending">
                    <cfelseif #status# EQ 1 >
                        <cfset status1="Shipped">
                    <cfelseif #status# EQ 2 >
                        <cfset status1="Cancelled">
                    <cfelseif #status# EQ 3 >
                        <cfset status1="Delivered">
                    </cfif>
                      <tr>
                        
                      <td>#ID#</td>    
                      <td>#CustomerName#</td>    
                      <td>#Prod_Name#</td>
                      <td>#TotalPrice#</td>
                      <td>#Quantity#</td>
                      <td>#Order_date#</td>
                      <td>#status1#</td>
                      
                      
                      </tr>
                      </cfoutput>


               
          </tbody>
      </table>
    </div>
  </div>
</div>
</div>
</div>
</div>
</div>

      
   
<cfinclude template="footer.cfm">