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
        <title>Asset Disposal Processing</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id = "A" class = "dbapp_package.Assets" scope = "session"/>        
            <%
               // Receive the values from disposeasset.jsp
               int v_asset_id               = Integer.parseInt(request.getParameter("asset_id"));
                         
               A.asset_id = v_asset_id;            

            
               int check = A.disposeAsset();

               if(check == 1){ 
            %>    
            <h1>Asset Disposal Successful</h1>
            <%
                } else{
            %>    
            <h1>Asset Disposal Failed</h1>
            <%
            } 
            %>
            <input type="submit" value="Return to Main Menu">
        </form>

    </body>
</html>
