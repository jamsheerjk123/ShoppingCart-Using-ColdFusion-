<cfset cdate=dateTimeFormat(now(),"yyyy-mm-dd HH:nn:ss")>
<cfquery name="product">
select * from product where ID =#ID#

</cfquery>
<cfif #product.Quantity# gt 0 >
<cfset price="#product.Price#">
<cfquery name="updatequantity">

update product set  Quantity =Quantity-#quantity# where ID =#ID#

    

</cfquery>




<cfset Total= "#price#"*"#quantity#">
<cfoutput>#Total#</cfoutput>

<cfquery name="order">
insert into orders (Pro_Id,Cus_Id,Quantity,TotalPrice,Order_date) values(#ID#,#session.user#,#quantity#,#Total#,<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp">)

</cfquery>
<cfelse>
    <cfoutput>Product Out Of Stock</cfoutput>
</cfif>