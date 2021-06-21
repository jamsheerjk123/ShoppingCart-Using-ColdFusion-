<html>
    <head>
        <title>
            Mycart
        </title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <style>

        .navcustom{
            background: #d1b932;
            padding:20px 0px 20px 0px;
        }
    </style>
    <cfif not  isDefined("session.user")  >
      <cflocation url="Login_Registration.cfm">
      </cfif>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navcustom "  >
            <div class="container-fluid">
              <!--- <a class="navbar-brand" href="#">Navbar</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button> --->
              <div class="collapse navbar-collapse " id="navbarNav">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="home.cfm">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="mycart.cfm">My cart</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="myorders.cfm">My Orders</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><button class="btn btn-danger"type="button" onClick="out()" >Logout</button></a>
                  </li>
                  
                </ul>
              </div>
            </div>
          </nav>
        <cfquery name=detailsproduct>
            select p.Prod_Name ,p.deacripton,c.TotalPrice,c.Quantity,c.date_created,c.ID from cart as c inner join product as p on c.Pro_Id=p.ID where Cus_Id="#session.user#"
        </cfquery>

<div class="container">
            
    <div class="row">
        <cfoutput query="detailsproduct">
            
        
        <div class=col-4>
            
    
                <div class="card#ID#" style="width: 18rem;margin-top:50px;border:1px solid black">
                    
                    <div class="card-body">
                      <h5 class="card-title">#Prod_Name#</h5>
                      <p class="card-text">#deacripton#</p>
                    </div>
                    <ul class="list-group list-group-flush">
                      
                      <li class="list-group-item">Quantity:#Quantity#</li>
                      <li class="list-group-item">#TotalPrice#</li>
                      <li class="list-group-item">#date_created#</li>
                    </ul>
                    <div class="card-body">
                        <a href='order.cfm?product=#ID#' class="btn btn-primary">Buy</a>
                        <button class="btn btn-danger" onclick="removecartitem(#ID#)">Remove From Cart</button>
                        
                        
                    </div>
                
                </div>
                
            
           
            

        </div>
    </cfoutput>
    </div>

        
</div>
<script>
    function out(){
   
   
       
       window.location="logout.cfm"
   
    }


    function removecartitem(id){
        $.ajax({
            type:"POST",
            url:"removecart.cfm",
            data:{"ID":id},
            success:function(){

                $(".card"+id).remove()
                
                
            }
        });

    }

</script>


        
</body>
</html>




