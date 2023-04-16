<%--
    Document   : register_rental
    Created on : 04 16, 23, 2:36:46 PM
    Author     : Steven Aaron Yu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Record Rentals</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body> 
        <jsp:useBean id = "assetsrentals" class = "dbapp_package.AssetRentals" scope = "session"/>
        <jsp:useBean id = "residents" class = "dbapp_package.Residents" scope = "session"/>
        <h2>Record Rental Information</h2>
        <form action="record_rental_processing.jsp">
            Asset: <select id="asset_id and rental_date" name="asset_id and rental_date">
                <%
                    assetsrentals.getAssetRecords();
                    for (int i = 0; i < assetsrentals.assetID_List.size(); i++){                                           
                %>               
                <option value ="<%=assetsrentals.assetID_List.get(i)%>, <%=assetsrentals.rentalDate_List.get(i)%>"><%="Asset ID:  " + assetsrentals.assetID_List.get(i) + " Asset Name:   " + assetsrentals.assetName_List.get(i) + " Rental Date:   " + assetsrentals.rentalDate_List.get(i)%></option>
                <%
                    }
                %> 
            </select><br>
            Reservation Date: <input type="date" id="reservation_date" name="reservation_date"><br>
            Resident ID:<select id="resident_id" name="resident_id">
                <%--<option value="-1">N/A</option>--%>   
                <%
                    residents.getResidentRecords();
                    for (int i = 0; i < residents.residentID_List.size(); i++){                                           
                %>               
                <option value ="<%=residents.residentID_List.get(i)%>"><%="Resident ID: " + residents.residentID_List.get(i) + ", Resident Name:   " + residents.residentName_List.get(i)%></option>
                <%
                    }
                %>                
            </select><br>
            Rental Amount: <input type="text" id="rental_amount" name="rental_amount"><br> 
            Discount Amount:<input type="text" id="discount" name="discount"><br>
            Rental Status:<select id="status" name="status">
                <option value="s">N/A</option>                
                <option value="R">Reserved</option>
                <option value="C">Canceled</option>
                <option value="O">On Rent</option>
                <option value="N">Returned</option>      
           
            </select><br>
            
            Inspection Details:<input type="text" id="inspection_details" name="inspection_details"><br>
            Assessed Value:<input type="text" id="assessed_value" name="assessed_value"><br> 
            
            Accepting Officer:<select id="accept_hoid" name="accept_hoid">
                <option value="-1">N/A</option>   
                <%
                    assetsrentals.getOfficerRecords();
                    for (int i = 0; i < assetsrentals.officerID_List.size(); i++){                                           
                %>               
                <option value ="<%=assetsrentals.officerID_List.get(i)%>"><%="Officer ID: " +assetsrentals.officerID_List.get(i) + " | Officer Name:   " + assetsrentals.officerName_List.get(i) + " | Officer Position: " + assetsrentals.officerPosition_List.get(i) + " | Election Date: " + assetsrentals.officerElectionDate_List.get(i)%></option>
                <%
                    }
                %>                
            </select><br>
            Return Date:<input type="date" id="return_date" name="return_date"><br>
      
            <input type="submit" value="Submit">
          
        </form>
        <form action ="index.html">
            <input type="submit" value="Return to Main Menu"><br>              
    
        </form>
    </body>
</html>
