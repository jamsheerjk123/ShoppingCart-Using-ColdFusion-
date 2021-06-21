<html>
<head>
    <title>
        Shopping Home
    </title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<style>
    .navcustom{
      background: #d1b932;
      padding:20px 0px 20px 0px;
    }
    .hide1{
        display: none;
    }
    .suc{
            display: none;
    }
</style>
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

    <cfif not  isDefined("session.user")  >
        <cflocation url="Login_Registration.cfm">
        </cfif>
        
        
        

        
        <cfinvoke component="product" method="allproducts" returnvariable="products"></cfinvoke> 
        <div class="container">
            <span class="suc" style="color:red">Added To Cart Successfully</span>
            
            <div class="row">
                <cfoutput query="products">
                    
                
                <div class=col-4>
                    
            
                        <div class="card#ID#" style="width: 18rem;margin-top:50px;border:1px solid black">
                            
                            <div class="card-body">
                              <h5 class="card-title">#Prod_Name#</h5>
                              <p class="card-text">#deacripton#</p>
                            </div>
                            <ul class="list-group list-group-flush">
                              <li class="list-group-item">#Sub_Name#</li>
                              <li class="list-group-item">#CategoryName#</li>
                              <cfif #Quantity# lt 1  >
                                <li class="list-group-item"><strong>Out of Stock</strong></li>   
                              </cfif>
                              <li class="list-group-item">#Price#</li>
                            </ul>
                            <div class="card-body">
                                <a href="order.cfm?product=#ID#" class="btn btn-primary bt#ID#">Buy</a>
                                <!--- <span class="1#ID# hide1"  >
                                    Quantity:<input   id="inputsm" type="text"style="width:60px"><br><br>
                                    <a class="btn btn-primary" onclick="orders(#ID#)" >Buy</a><br><br>
                                </span> --->
                                
                                
                                <a class="btn btn-primary"onclick="cart(#ID#)" >Add Cart</a>
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
         function cart(val){
             $.ajax({
                 type:"POST",
                 url:"cart.cfm",
                 data:{"ID":val},
                 success:function(result){

                    $(".suc").fadeIn(500)
                    $(".suc").fadeOut(500)
                 }
             })
         }
           function showq(val){

                $(".bt"+val).hide()
                $(".1"+val).show()

           }
           
         
          
        
        </script>

</body>




</html>

