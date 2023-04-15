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
        <jsp:useBean id = "hoa" class = "dbapp_package.HOA" scope = "session"/>         
        <jsp:useBean id = "assets" class = "dbapp_package.Assets" scope = "session"/>    
        <h2>Asset Registration</h2>
        <form action="register_processing.jsp">
            Asset Name:<input type="text" id="asset_name" name="asset_name"><br>
            Asset Description:<input type="text" id="asset_description" name="asset_description"><br>     
            Asset For Rent Status:<select id="forrent" name="forrent">
                <option value="1">True</option>
                <option value="0">False</option>                           
            </select><br>             
            Asset Value:<input type="text" id="asset_value" name="asset_value"><br>               
            Asset Type:<select id="type_asset" name="type_asset">
                <option value="P">Property</option>
                <option value="F">Furniture</option>
                <option value="E">Equipment</option>
                <option value="O">Others</option>                                 
            </select><br>                   
            Asset Status:<select id="status" name="status">
                <option value="W">Working Condition</option>
                <option value="D">Deteriorated</option>
                <option value="P">For Repair</option>
                <option value="S">For Disposal</option>      
                <option value="X">Disposed</option>                 
            </select><br>       
            Latitude Location:<input type="text" id="loc_lattitude" name="loc_lattitude"><br>             
            Longitude Location:<input type="text" id="loc_longiture" name="loc_longiture"><br>        
            Asset's HOA:<select id="hoa_name" name="hoa_name">
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
            <input type="submit" value="Submit">
          
        </form>
        <form action ="index.html">
            <input type="submit" value="Return to Main Menu"><br>              
    
        </form>                
                
    </body>
</html>

