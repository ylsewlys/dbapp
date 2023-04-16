<%-- 
    Document   : delete_rental_processing
    Created on : 04 16, 23, 8:59:41 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1>Record Deletion in session...</h1>
            <jsp:useBean id = "rentalBean" class = "dbapp_package.AssetRentals" scope = "session"/>
            <%
                
                String[] strValues = request.getParameter("asset_id and rental_date").split(",");
                int v_asset_id = Integer.parseInt(strValues[0]);
                String v_rental_date = strValues[1];
                
                rentalBean.asset_id = v_asset_id;               
                rentalBean.rental_date = v_rental_date;
                rentalBean.DeleteRentalTransaction();
                
                int check = rentalBean.DeleteRentalTransaction();
               if(check == 1){ 
            %>    
            <h1>Deletion Successful</h1>
            <%
                } else{
            %>    
            <h1>Deletion Failed</h1>
            <%
            } 
            %>
            
        
        <form action ="delete_rental.jsp">
            <input type="submit" value="Delete Again"><br>              
        </form>
        
        <form action ="index.html">
            <input type="submit" value="Go back to Main Menu"><br>              
        </form>
        
    </body>
</html>
