<cfset cdate=dateTimeFormat(now(),"yyyy-mm-dd HH:nn:ss")>
<cfquery name ="product_to_cart">select * from product where ID=#ID#</cfquery>#
<cfquery name="insert_to_cart"> INSERT INTO cart(Pro_Id,Cus_Id,date_created,Quantity,TotalPrice) values(#product_to_cart.ID#,#session.user#,<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp">,1,#product_to_cart.Price#) </cfquery>
