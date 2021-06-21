<cfinclude template="header.cfm">

<cfif isDefined("url.id")>

    <cfquery name="pro_details">
      select  p.ID,p.Prod_Name,s.Sub_Name,c.CategoryName,p.Price,p.Quantity,p.deacripton,s.ID  as suid ,c.ID as cid from product as p inner join subcategory as s on p.sub_id=s.ID  inner Join category as c on s.Cat_Id=c.ID where p.ID=#id#   
    </cfquery>
    <cfset pro="#pro_details.Prod_Name#">
    <cfset sub="#pro_details.Sub_Name#">
    <cfset subid="#pro_details.suid#">
    <cfset cat="#pro_details.CategoryName#">
    <cfset catid="#pro_details.cid#">
    <cfset price="#pro_details.Price#">
    <cfset quantity="#pro_details.Quantity#">
    <cfset des="#pro_details.deacripton#">
    <cfset button ="Update">
<cfelseif isDefined("url.pro_details")>
    <cfquery name="del_product">
        delete from product where ID=#pro#
    </cfquery>
    <script>alert("Product has been Successfully deleted"); window.location="edit.product.cfm"</script>
    
<cfelse>
    <cfset pro="">
    <cfset sub="">
    <cfset subid="">
    <cfset cat="">
    <cfset catid="">
    <cfset price="">
    <cfset quantity="">
    <cfset des="">
    <cfset button ="Add">

</cfif>
  <!-- Container Fluid-->
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">ADD PRODUCTS</h1>
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
                <label for="exampleInputEmail1"> Product Name</label>
                <input type="text" name="productName" value="<cfoutput>#pro#</cfoutput>" class="form-control"  placeholder="Enter Product Name" required="">
              </div>
            <div>
                <cfquery name="category">
                    Select ID , CategoryName from category
                </cfquery>
                
                <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="cats">
                  <option value="<cfoutput>#catid#</cfoutput>" selected><cfoutput>#cat#</cfoutput></option>
                  <cfoutput query="category">
                      <option value=#ID#>#CategoryName#</option>
                  </cfoutput>

            </div>
              
                
                
              </select>
              <div>
                <cfquery name="subcat">select ID,Sub_Name from subcategory</cfquery>
                <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="subs">
                    <option value="<cfoutput>#subid#</cfoutput>" selected><cfoutput>#sub#</cfoutput></option>
                    <cfoutput query="subcat">
                        <option value=#ID#>#Sub_Name#</option>
                    </cfoutput>
                    
                    
                  </select>

              </div>
              
              <div>     
              <label for="exampleInputEmail1"> Price</label>
                <input type="text" name="prices" class="form-control" value="<cfoutput>#price#</cfoutput>" placeholder="Enter Price" required="">
              </div>
              <div>
              <label for="exampleInputEmail1"> Quantity</label>
                <input type="text" name="quantitys" class="form-control" value="<cfoutput>#quantity#</cfoutput>" placeholder="Enter Quantity" required="">
              </div><br>
              <div class="input-group" >
                <span class="input-group-text">Description</span>
                <textarea class="form-control" aria-label="With textarea" name="Description" value=""><cfoutput>#des#</cfoutput></textarea>
              </div><br>
              <button type="submit" class="btn btn-primary" name ="<cfoutput>#button#</cfoutput>"><cfoutput>#button#</cfoutput></button>
            </form>
          </div>    
        </div>
      </div>
   </div>
   <cfinclude template="footer.cfm">
   <cfif isDefined("Add")>


    <cfquery name="checkpro">
        select Prod_Name from product where Prod_Name="#productName#"
    </cfquery>

    <Cfif checkpro.recordCount gt 0>
        <script>alert("Product Already Added")</script>
    <cfelse>
        
        <cfquery name="addProduct">
        insert into product (Prod_Name,sub_id,cat_id,Price,Quantity,deacripton) values('#productName#',#subs#,#cats#,#prices#,#quantitys#,'#Description#')
        </cfquery>
       <script>alert("Product Added")</script>
        
    </Cfif>
    


   </cfif>
   <cfif isDefined("Update")>

    <cfquery name="update_product">
         update product set Prod_Name='#productName#', sub_id='#subs#' ,cat_id='#cats#',Price=#prices#,Quantity=#quantitys# where ID='#id#'
    </cfquery>
    <script>alert("Product Updated");window.location="edit_product.cfm" </script>

   </cfif>
























