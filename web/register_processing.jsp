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
        <title>Register Asset Processing</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id = "A" class = "dbapp_package.Assets" scope = "session"/>        
            <%
               // Receive the values from register.jsp
               String v_asset_name          = request.getParameter("asset_name");
               String v_asset_description   = request.getParameter("asset_description");
               //String v_acquisition_date    = request.getParameter("acquisition_date");
               int v_forrent                = Integer.parseInt(request.getParameter("forrent"));
               Double v_asset_value         = Double.parseDouble(request.getParameter("asset_value"));
               String v_type_asset          = request.getParameter("type_asset");
               String v_status              = request.getParameter("status");
               Double v_loc_lattitude       = Double.parseDouble(request.getParameter("loc_lattitude"));;               
               Double v_loc_longiture       = Double.parseDouble(request.getParameter("loc_longiture"));;
               String v_hoa_name            = request.getParameter("hoa_name");;
               Integer v_enclosing_asset        = Integer.parseInt(request.getParameter("enclosing_asset"));;               
               
               
               A.asset_name = v_asset_name; 
               A.asset_description = v_asset_description;
               //A.acquisition_date = v_acquisition_date;
               A.forrent = v_forrent;
               A.asset_value = v_asset_value;
               A.type_asset = v_type_asset;
               A.status = v_status;
               A.loc_lattitude = v_loc_lattitude;
               A.loc_longiture = v_loc_longiture;
               A.hoa_name = v_hoa_name;
               A.enclosing_asset = v_enclosing_asset;
               
               
               int check = A.registerAsset();

               if(check == 1){ 
            %>    
            <h1>Asset Registration Successful</h1>
            <%
                } else{
            %>    
            <h1>Asset Registration Failed</h1>
            <%
            } 
            %>
            <input type="submit" value="Return to Main Menu">
        </form>

    </body>
</html>
