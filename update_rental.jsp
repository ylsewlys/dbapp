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
        <h2>Update Rental Information</h2>
        <form action="update_rental_processing.jsp">
            <jsp:useBean id = "AR" class = "dbapp_package.AssetRentals" scope = "session"/>  
            <jsp:useBean id = "R" class = "dbapp_package.Residents" scope = "session"/> 

            
            Asset: <select id="asset_id and rental_date" name="asset_id and rental_date">
                <%
                    AR.getAssetRecords();
                    for (int i = 0; i < AR.assetID_List.size(); i++){                                           
                %>               
                <option value ="<%=AR.assetID_List.get(i)%>, <%=AR.rentalDate_List.get(i)%>"><%="Asset ID:   " + AR.assetID_List.get(i) + " Asset Name:   " + AR.assetName_List.get(i) + " Rental Date:   " + AR.rentalDate_List.get(i)%></option>
                <%
                    }
                %>          
            </select><br>
            Update Reservation Date:<input type="text" id="reservation_date" name="reservation_date"><br>               
            Update Resident ID:<select id="resident_id" name="resident_id">
                <option value="-1">N/A</option>   
                <%
                    R.getResidentRecords();
                    for (int i = 0; i < R.residentID_List.size(); i++){                                           
                %>               
                <option value ="<%=R.residentID_List.get(i)%>"><%="Resident ID: " + R.residentID_List.get(i) + " Resident Name:   " + R.residentName_List.get(i)%></option>
                <%
                    }
                %>                
            </select><br>
            Update Rental Amount:<input type="text" id="rental_amount" name="rental_amount"><br>              
            Update Discount Amount:<input type="text" id="discount" name="discount"><br>         
            Update Rental Status:<select id="status" name="status">
                <option value="s">N/A</option>                
                <option value="R">Reserved</option>
                <option value="C">Canceled</option>
                <option value="O">On Rent</option>
                <option value="N">Returned</option>      
           
            </select><br>
            Update Inspection Details:<input type="text" id="inspection_details" name="inspection_details"><br>  
            Update Assessed Value:<input type="text" id="assessed_value" name="assessed_value"><br> 
            Update Accepting Officer:<select id="accept_hoid" name="accept_hoid">
                <option value="-1">N/A</option>   
                <%
                    AR.getOfficerRecords();
                    for (int i = 0; i < AR.officerID_List.size(); i++){                                           
                %>               
                <option value ="<%=AR.officerID_List.get(i)%>"><%="Officer ID: " +AR.officerID_List.get(i) + " | Officer Name:   " + AR.officerName_List.get(i) + " | Officer Position: " + AR.officerPosition_List.get(i) + " | Election Date: " + AR.officerElectionDate_List.get(i)%></option>
                <%
                    }
                %>                
            </select><br>
            Update Return Date:<input type="text" id="return_date" name="return_date"><br>  


            
            <input type="submit" value="Submit"><br>        
        </form>
            
        <form action ="index.html">
            <input type="submit" value="Return to Main Menu"><br>              
    
        </form>
    </body>
</html>

