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
        <title>Dispose Asset</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>    
        <jsp:useBean id = "assets" class = "dbapp_package.Assets" scope = "session"/>    
        <h2>Asset Disposal</h2>
        <form action="dispose_asset_processing.jsp">
            Asset ID and Name: <select id="asset_id" name="asset_id">
                <%
                    assets.storeDisposableAssets();
                    
                    
                    for (int i = 0; i < assets.assetID_DisposeList.size(); i++){                                           
                %>               
                <option value ="<%=assets.assetID_DisposeList.get(i)%>"><%="Asset ID:   " + assets.assetID_DisposeList.get(i) + " Asset Name:   " + assets.assetName_DisposeList.get(i)%></option>
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

