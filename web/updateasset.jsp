<%-- 
    Document   : updateasset
    Created on : 04 16, 23, 12:27:31 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset Information</title>
    </head>
    <body>
        <h2>Update Asset Information</h2>
        <form action="update_asset_processing.jsp">
            <jsp:useBean id = "hoa" class = "dbapp_package.HOA" scope = "session"/>         
            <jsp:useBean id = "assets" class = "dbapp_package.Assets" scope = "session"/>                  
            Asset ID and Name: <select id="asset_id" name="asset_id">
                <%
                    assets.getAssetIdRecords();
                    assets.getAssetNameRecords();
                    
                    
                    for (int i = 0; i < assets.assetID_List.size(); i++){                                           
                %>               
                <option value ="<%=assets.assetID_List.get(i)%>"><%="Asset ID:   " + assets.assetID_List.get(i) + " Asset Name:   " + assets.assetName_List.get(i)%></option>
                <%
                    }
                %>          
            </select><br>
            Update Asset Name:<input type="text" id="asset_name" name="asset_name"><br>    
            Update Asset Description:<input type="text" id="asset_description" name="asset_description"><br>    
            Update Asset Acquisition Date:<input type="date" id="acquisition_date" name="acquisition_date"><br>
            Update Asset For Rent Status:<select id="forrent" name="forrent">
                <option value="-1">N/A</option>
                <option value="1">True</option>
                <option value="0">False</option>                           
            </select><br>             
            Update Asset Value:<input type="text" id="asset_value" name="asset_value"><br>               
            Update Asset Type:<select id="type_asset" name="type_asset">
                <option value="x">N/A</option>                
                <option value="P">Property</option>
                <option value="F">Furniture</option>
                <option value="E">Equipment</option>
                <option value="O">Others</option>                                 
            </select><br>                   
            Update Asset Status:<select id="status" name="status">
                <option value="NA">N/A</option>                
                <option value="W">Working Condition</option>
                <option value="D">Deteriorated</option>
                <option value="P">For Repair</option>
                <option value="S">For Disposal</option>      
                <option value="X">Disposed</option>                 
            </select><br>       
            Update Latitude Location:<input type="text" id="loc_lattitude" name="loc_lattitude"><br>             
            Update Longitude Location:<input type="text" id="loc_longiture" name="loc_longiture"><br>        
            Update Asset's HOA:<select id="hoa_name" name="hoa_name">
                        <option value ="na">N/A</option>
                <%
                    hoa.getHOANameRecords();
                    for (int i = 0; i < hoa.hoaNameList.size(); i++){                                           
                %>               
                        <option value ="<%=hoa.hoaNameList.get(i)%>"><%=hoa.hoaNameList.get(i)%></option>
                <%
                    }
                %>
            </select><br>       
            Enclosing Asset:<select id="enclosing_asset" name="enclosing_asset">
                        <option value ="-1">None</option>                 
                <%
                    assets.getAssetIdRecords();
                    assets.getAssetNameRecords();
                    for (int i = 0; i < assets.assetID_List.size(); i++){                                           
                %>               
                        <option value ="<%=assets.assetID_List.get(i)%>"><%=assets.assetName_List.get(i)%></option>
                <%
                    }
                %>

            </select><br>                 
                  
            <input type="submit" value="Submit"><br>               
        </form>        
        
        <form action ="index.html">
            <input type="submit" value="Return to Main Menu"><br>              
    
        </form>        
        
        
    </body>
</html>
