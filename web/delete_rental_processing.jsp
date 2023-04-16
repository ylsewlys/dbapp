<%-- 
    Document   : register_processing
    Created on : 04 14, 23, 10:19:50 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dbapp_package.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Rental Processing</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id = "AR" class = "dbapp_package.AssetRentals" scope = "session"/>        
            <jsp:useBean id = "R" class = "dbapp_package.Residents" scope = "session"/>               
            <%
               // Receive the values from returnrental.jsp
               
               String[] strValues = request.getParameter("asset_id and rental_date").split(",");
                            
               int v_asset_id = Integer.parseInt(strValues[0]);
               String v_rental_date = strValues[1];
               
               AR.asset_id = v_asset_id;  
               AR.rental_date = v_rental_date;
               
               AR.getOriginalRentalInfo(); // Initialize asset's original rental info
               
              
               int check = AR.deleteRentalInfo();

               if(check == 1){ 
            %>    
            <h1>Delete Rental Information Successful</h1>        
            
            <%
                } else{
            %>    
            <h1>Delete Rental Information Failed</h1>
            <%
            } 
            %>
            <input type="submit" value="Return to Main Menu">
        </form>

    </body>
</html>
