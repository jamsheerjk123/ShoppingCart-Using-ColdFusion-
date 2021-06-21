<cfcomponent displayname="orders" description="Show aal available orders" >
    <cffunction name="allorders" returntype="query">
        <cfquery name="getallorders" >
            select p.Prod_Name,O.TotalPrice,O.Quantity, O.Order_date ,O.ID from orders as O inner join product  as p on O.Pro_Id=p.ID  where O.Cus_Id="#session.user#"
        </cfquery>
        <cfreturn getallorders>
    </cffunction>

</cfcomponent>