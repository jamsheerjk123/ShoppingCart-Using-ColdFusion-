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
        
            
    
        <cfif not  isDefined("session.user")  >
            <cflocation url="Login_Registration.cfm">
            </cfif>
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
            
            
    
            
            <cfquery name="productdetails">
                select p.Prod_Name,c.CategoryName,s.Sub_Name,p.Price,p.deacripton,p.ID  from product as p inner join subcategory as s on p.sub_id=s.ID inner join category as c on  s.Cat_Id=c.ID where p.ID=#url.product#
             </cfquery>
             <div class="container">
                         
                 <div class="row">
                     <cfoutput query="productdetails">
                         
                     
                     <div class=col-4>
                         
                 
                             <div class="card#ID#" style="width: 18rem;margin-top:50px;border:1px solid black">
                                 
                                 <div class="card-body">
                                   <h5 class="card-title">#Prod_Name#</h5>
                                   <p class="card-text">#deacripton#</p>
                                 </div>
                                 <ul class="list-group list-group-flush">
                                   <li class="list-group-item">#Sub_Name#</li>
                                   <li class="list-group-item">#CategoryName#</li>
                                   <li class="list-group-item i3">#Price#</li>
                                 </ul>
                                 <div class="card-body b1">
                                        <span class="s">Quantity:<input   id="inputsm" type="text"style="width:60px"><br><br></span>
                                        <a onclick="placeorder(#ID#)" class="btn btn-primary bt#ID#">Buy</a>
                                     <!--- <span class="1#ID# hide1"  >
                                         Quantity:<input   id="inputsm" type="text"style="width:60px"><br><br>
                                         <a class="btn btn-primary" onclick="orders(#ID#)" >Buy</a><br><br>
                                     </span> --->
                                     
                                     
                                     
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
            
               function placeorder(val){

                
                var q=$('#inputsm').val();
                $.ajax({
                    type:"POST",
                    url:"placeorder.cfm",
                    data:{"ID":val,"quantity":q},
                    success:function(result){
                        

                        $(".i3").hide();
                        $(".s").hide();
                        $(".bt"+val).hide();
                        $("ul").append("<li class='list-group-item'>Total Amount to Pay:"+ result + "</li>");
                        
                        $(".b1").append("<a class='btn btn-primary' onclick='place()' >Go to Payments </a>")

                    }

                })
            
            }
            function place(){

                window.location="home.cfm"


            }
             
              
            
            </script>
    
    </body>
    
    
    
    
    </html>
    

















































