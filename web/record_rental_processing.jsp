<%-- 
    Document   : record_rental_processing
    Created on : 04 16, 23, 6:18:38 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dbapp_package.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rental Record Processing</title>
    </head>
    <body>
        <form action = "index.html">
            <jsp:useBean id = "assets" class = "dbapp_package.Assets" scope = "session"/>
            <jsp:useBean id = "assetsrentals" class = "dbapp_package.AssetRentals" scope = "session"/>
            <jsp:useBean id = "hoa" class = "dbapp_package.HOA" scope = "session"/>
            <jsp:useBean id = "residents" class = "dbapp_package.Residents" scope = "session"/>
            <%
              //Gets values from register_rental
               
              String[] strValues = request.getParameter("asset_id and rental_date").split(",");
               
               
              int v_asset_id = Integer.parseInt(strValues[0]);
              String v_rental_date = strValues[1];
               
              
              String v_reservation_date = java.sql.Date.valueOf(request.getParameter("reservation_date")).toString();                   
              int v_resident_id = Integer.parseInt(request.getParameter("resident_id"));
              Double v_rental_amount = Double.parseDouble(request.getParameter("rental_amount"));                   
              Double v_discount = Double.parseDouble(request.getParameter("discount"));                   
              String v_status = request.getParameter("status");                   
              String v_inspection_details = request.getParameter("inspection_details");
              Double v_assessed_value = Double.parseDouble(request.getParameter("assessed_value"));                   
              Integer v_accept_hoid = Integer.parseInt(request.getParameter("accept_hoid"));                   
              String v_return_date = java.sql.Date.valueOf(request.getParameter("return_date")).toString();
              
              assetsrentals.asset_id = v_asset_id;               
              assetsrentals.rental_date = v_rental_date;
              assetsrentals.reservation_date = v_reservation_date;
              assetsrentals.resident_id = v_resident_id;
              assetsrentals.rental_amount = v_rental_amount;
              assetsrentals.discount = v_discount;
              assetsrentals.status = v_status;
              assetsrentals.inspection_details = v_inspection_details;
              assetsrentals.assessed_value = v_assessed_value;
              assetsrentals.return_date = v_return_date;
              
              int check = assetsrentals.registerRental();
              if(check == 1){ 
            %>    
            <h1>Record Rental Information Successful</h1>
            <%
                } else{
            %>    
            <h1>Record Rental Information Failed</h1>
            <%
            } 
            %>
            <input type="submit" value="Return to Main Menu">
               
        </form>
                      
    </body>
</html>

