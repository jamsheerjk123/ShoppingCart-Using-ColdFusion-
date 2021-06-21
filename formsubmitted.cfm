

    
    
        <cfquery name="inserdata">
        INSERT INTO customer  (CustomerName,Email,PhoneNumber,status ) values('#name#','#email#','#contact#',#status#);
        </cfquery>
        <cfif name gt 1>
            Success
            <cfelse>
                Failed
        </cfif>
        
        

