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
        <title>Update Rental Processing</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id = "AR" class = "dbapp_package.AssetRentals" scope = "session"/>        
            <jsp:useBean id = "R" class = "dbapp_package.Residents" scope = "session"/>               
            <%
               // Receive the values from updaterental.jsp
               
               String[] strValues = request.getParameter("asset_id and rental_date").split(",");
               
               
               int v_asset_id = Integer.parseInt(strValues[0]);
               String v_rental_date = strValues[1];
               
               AR.asset_id = v_asset_id;               
               AR.rental_date = v_rental_date;
               
               AR.getOriginalRentalInfo(); // Initialize asset's original rental info
               
               String v_reservation_date;
               if (!(request.getParameter("reservation_date").compareTo("") == 0)){
                    v_reservation_date = java.sql.Date.valueOf(request.getParameter("reservation_date")).toString();                   
               }else{
                   v_reservation_date = AR.original_reservation_date;
               }

               
               
               int v_resident_id;
               
               if (!(Integer.parseInt(request.getParameter("resident_id")) == -1)){
                   v_resident_id = Integer.parseInt(request.getParameter("resident_id")); // UPDATE ONE OF THE FIELDS IN RESIDENTS                   
               }else{
                   v_resident_id = AR.original_resident_id;
               }

               
               Double v_rental_amount;
               
               if(!(request.getParameter("rental_amount").compareTo("") == 0)){
                   v_rental_amount = Double.parseDouble(request.getParameter("rental_amount"));                   
               }else{
                   v_rental_amount = AR.original_rental_amount;
               }
               
               
               Double v_discount;
               if(!(request.getParameter("discount").compareTo("") == 0)){
                   v_discount = Double.parseDouble(request.getParameter("discount"));                   
               }else{
                   v_discount = AR.original_discount;
               }          
               
               String v_status;
               if (!(request.getParameter("status").compareTo("s") == 0)){
                   v_status = request.getParameter("status");                   
               } else{
                   v_status = AR.original_status;
               }

               
               String v_inspection_details;
               if(!(request.getParameter("inspection_details").compareTo("") == 0)){
                   v_inspection_details = request.getParameter("inspection_details");
               }else{
                   v_inspection_details = AR.original_inspection_details;
               }

               
               
               Double v_assessed_value;
               if(!(request.getParameter("assessed_value").compareTo("") == 0)){
                   v_assessed_value = Double.parseDouble(request.getParameter("assessed_value"));                   
               }else{
                   v_assessed_value = AR.original_assessed_value;
               }

               Integer v_accept_hoid;
               if(!(request.getParameter("accept_hoid").compareTo("") == 0)){
                   v_accept_hoid = Integer.parseInt(request.getParameter("accept_hoid"));                   
               }else{
                   v_accept_hoid = AR.original_accept_hoid;
               }

               String v_return_date;
               if(!(request.getParameter("return_date").compareTo("") == 0)){
                   v_return_date = java.sql.Date.valueOf(request.getParameter("return_date")).toString();                   
               }else{
                   v_return_date = AR.original_return_date;
               }

               
               
               
               
               
               
               
               

               AR.reservation_date = v_reservation_date;
               AR.resident_id = v_resident_id; 
               AR.rental_amount = v_rental_amount;
               AR.discount = v_discount;
               AR.status = v_status;
               AR.inspection_details = v_inspection_details;
               AR.assessed_value = v_assessed_value;
               AR.accept_hoid = v_accept_hoid;
               AR.return_date = v_return_date;
               
               int check = AR.updateRentalInformation();

               if(check == 1){ 
            %>    
            <h1>Update Rental Information Successful</h1>
            <%
                } else{
            %>    
            <h1>Update Rental Information Failed</h1>
            <%
            } 
            %>
            <input type="submit" value="Return to Main Menu">
        </form>

    </body>
</html>
