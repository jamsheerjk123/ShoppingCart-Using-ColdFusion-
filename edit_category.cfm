<cfinclude template="header.cfm">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    .edit{
            display:none;
    }
</style>
  <!-- Container Fluid-->
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">EDIT CATEGORY</h1>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <cfquery name="category">
            Select ID , CategoryName from category
        </cfquery>
        <form action="" method="post" id="editform">
            <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="cat">
                <option selected>Choose Category</option>
                <cfoutput query="category">
                    <option value=#ID#>#CategoryName#</option>
                </cfoutput>
                
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
                
              </select>
              
            </div> 
           <br> <button  class="btn btn-primary" type="submit" name ="">Edit</button>
        </form>
        <cfinclude template="footer.cfm">




       <script>
       $("#editform").submit(function(e){
           e.preventDefault();
           var form=$(this)
           $.ajax({
               type: "POST",
               url:"edit_category2.cfm",
               data:form.serialize(),
               success: function(result){
                   alert(result)
                   $("#editform")[0].reset();
               }

           })
       })

      
       </script>       