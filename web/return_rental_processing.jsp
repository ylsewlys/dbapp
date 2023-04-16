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
        <title>Return Rental Processing</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id = "AR" class = "dbapp_package.AssetRentals" scope = "session"/>        
            <jsp:useBean id = "R" class = "dbapp_package.Residents" scope = "session"/>               
            <%
               // Receive the values from returnrental.jsp
               
               String[] strValues = request.getParameter("asset_id, rental_date, and asset_name").split(",");
               
               
               int v_asset_id = Integer.parseInt(strValues[0]);
               String v_rental_date = strValues[1];
               String v_asset_name = strValues[2];
               
               AR.asset_id = v_asset_id;  
               AR.asset_name = v_asset_name;
               AR.rental_date = v_rental_date;
               
               AR.getOriginalRentalInfo(); // Initialize asset's original rental info
               
               String v_reservation_date = AR.original_reservation_date;       
               int v_resident_id = AR.original_resident_id;          
               Double v_rental_amount = AR.original_rental_amount;                            
               Double v_discount = AR.original_discount;                       
               String v_status = AR.original_status;            
               String v_inspection_details = AR.original_inspection_details;                              
               Double v_assessed_value = AR.original_assessed_value;
               Integer v_accept_hoid = AR.original_accept_hoid;
               String v_accept_position = AR.original_accept_position;
               String v_accept_electiondate = AR.original_accept_electiondate;
               String v_return_date = AR.original_return_date;
              

               AR.reservation_date = v_reservation_date;
               AR.resident_id = v_resident_id; 
               AR.rental_amount = v_rental_amount;
               AR.discount = v_discount;
               AR.status = v_status;
               AR.inspection_details = v_inspection_details;
               AR.assessed_value = v_assessed_value;
               AR.accept_hoid = v_accept_hoid;
               AR.accept_position = v_accept_position;
               AR.accept_electiondate = v_accept_electiondate;
               AR.return_date = v_return_date;
               
               int check = AR.returnAssetRentalRecord();

               if(check == 1){ 
            %>    
            <h1>Returned the following rented asset:</h1>
            <h4><%=AR.str_asset_id%></h4>
            <h4><%=AR.str_asset_name%></h4>            
            <h4><%=AR.str_rental_date%></h4>
            <h4><%=AR.str_reservation_date%></h4>
            <h4><%=AR.str_resident_id%></h4>
            <h4><%=AR.str_rental_amount%></h4>
            <h4><%=AR.str_discount%></h4>
            <h4><%=AR.str_status%></h4>
            <h4><%=AR.str_inspection_details%></h4>
            <h4><%=AR.str_assessed_value%></h4>
            <h4><%=AR.str_accept_hoid%></h4>
            <h4><%=AR.str_accept_position%></h4>
            <h4><%=AR.str_accept_electiondate%></h4>
            <h4><%=AR.str_return_date%></h4>            
            
            <%
                } else{
            %>    
            <h1>Return Rental Information Failed</h1>
            <%
            } 
            %>
            <input type="submit" value="Return to Main Menu">
        </form>

    </body>
</html>
