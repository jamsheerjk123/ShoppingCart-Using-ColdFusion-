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
            <cfinvoke component="myorder" method="allorders" returnvariable="orders"></cfinvoke> 

            <h1 class="text-center display-1" style="color:red;margin-top:20px" >My Orders</h1>

            <div class= "container"style="padding:50px 50px 50px 50px">

            
            <table class="table table-striped">
                <thead>
                  <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total Price</th>
                    <th scope="col">Date Of Order</th>
                  </tr>
                </thead>
                <tbody>
                  <cfoutput query="orders" > 
                    <tr >
                    <th scope="row">#ID#</th>
                    <td>#Prod_Name#</td>
                    <td>#Quantity#</td>
                    <td>#TotalPrice#</td>
                    <td>#Order_date#</td>
                  </tr>
                </cfoutput> 
                </tbody>
              </table>
            </div>
            <script>
        
        
         
                function out(){
               
               
                   
                   window.location="logout.cfm"
               
                }
                
                
                 
               
               </script>
       
       </body>
       
       
       
       
       </html>