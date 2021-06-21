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
                        <th>Product Name</th>
                        <th>SubCategory Name</th>
                        <th>Category Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                      </thead>
                      <cfquery name="editSub" >
                          select  p.ID,p.Prod_Name,s.Sub_Name,c.CategoryName,p.Price,p.Quantity,p.deacripton from product as p inner join subcategory as s on p.sub_id=s.ID  inner Join category as c on s.Cat_Id=c.ID
                      </cfquery>
                    <tbody>
                        <cfoutput query="editSub">
                             <!--- <cfscript>
                                key = generateSecretKey('AES');
                                encryptedMsg = encrypt(#ID#,key,'AES', 'Base64');
                            </cfscript> --->
                            <tr>
                            <td>#Prod_Name#</td>  
                            <td>#Sub_Name#</td>    
                            <td>#CategoryName#</td>
                            <td>#Price#</td>
                            <td>#Quantity#</td>
                            
                            <td><a href="add_product.cfm?id=#ID#" class="btn btn-primary btn-sm">Edit</a>&nbsp;&nbsp;&nbsp;<a href="add_product.cfm?del=#ID#" class="btn btn-danger btn-sm">Delete</a></td>
                            
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