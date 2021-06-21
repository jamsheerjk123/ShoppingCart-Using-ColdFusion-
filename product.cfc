<cfcomponent displayname="product" description="Show aal available products" >
    <cffunction name="allproducts" returntype="query">
        <cfquery name="getallproducts" >
            select p.Prod_Name,c.CategoryName,s.Sub_Name,p.Price,p.deacripton,p.ID,p.Quantity  from product as p inner join subcategory as s on p.sub_id=s.ID inner join category as c on  s.Cat_Id=c.ID
        </cfquery>
        <cfreturn getallproducts>
    </cffunction>

</cfcomponent>