<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dbapp_package.*" %>


<html>
    <head>
        <title>Register Asset</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>    
        <jsp:useBean id = "AR" class = "dbapp_package.AssetRentals" scope = "session"/>    
        <h2>Delete Rental Information</h2>
        <form action="delete_rental_processing.jsp">
            Asset ID and Name: <select id="asset_id and rental_date" name="asset_id and rental_date">
                <%
                    AR.getPossibleRentalInfoForDelete();
                    
                    
                    for (int i = 0; i < AR.assetID_DeleteList.size(); i++){                                           
                %>               
                <option value ="<%=AR.assetID_DeleteList.get(i)%>,<%=AR.rentalDate_DeleteList.get(i)%>"><%="Asset ID:   " + AR.assetID_DeleteList.get(i) + " Rental Date:   " + AR.rentalDate_DeleteList.get(i)%></option>
                <%
                    }
                %>          
            </select><br>                  
            <input type="submit" value="Submit">
          
        </form>
        <form action ="index.html">
            <input type="submit" value="Return to Main Menu"><br>              
    
        </form>                
                
    </body>
</html>

