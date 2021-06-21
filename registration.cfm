<cfquery name="registration">
        INSERT INTO customer  (CustomerName,Email,PhoneNumber,username,PASSWORD ) values('#fname#','#email#','#phone#','#user#','#password#');

</cfquery>

<cflocation url="Login_Registration.cfm">