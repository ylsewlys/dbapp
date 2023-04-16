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
               // Receive the values from updateasset.jsp
               int v_asset_id               = Integer.parseInt(request.getParameter("asset_id"));
                         
               A.asset_id = v_asset_id;            
               A.storeOriginalAssetInfo();
               
               String v_asset_name;
               if (!(request.getParameter("asset_name").compareTo("") == 0)){
                   v_asset_name = request.getParameter("asset_name");               
               } else{
                   v_asset_name = A.original_asset_name;
               }
  
               String v_asset_description;
               if(!(request.getParameter("asset_description").compareTo("") == 0)){
                   v_asset_description = request.getParameter("asset_description");
               } else{
                   v_asset_description = A.original_asset_description;
               }   
               
               String v_acquisition_date_str;
               if(!(request.getParameter("acquisition_date").compareTo("") == 0)){
                   java.sql.Date v_acquisition_date = java.sql.Date.valueOf(request.getParameter("acquisition_date")); 
                   v_acquisition_date_str = v_acquisition_date.toString();
               } else{
                   v_acquisition_date_str = A.original_acquisition_date;
               }
               
               int v_forrent;
               if (Integer.parseInt(request.getParameter("forrent")) != -1){
                   v_forrent = Integer.parseInt(request.getParameter("forrent"));
               } else{
                   v_forrent = A.original_forrent;
               }
               
               Double v_asset_value;
               if (!(request.getParameter("asset_value").compareTo("") == 0)){
                   v_asset_value = Double.parseDouble(request.getParameter("asset_value"));
               } else{
                   v_asset_value = A.original_asset_value;
               }
               
               
               String v_type_asset;
               if (!(request.getParameter("type_asset").compareTo("x") == 0)){
                   v_type_asset = request.getParameter("type_asset");
               } else{
                   v_type_asset = A.original_type_asset;
               }
               
               String v_status;
               if (!(request.getParameter("status").compareTo("NA") == 0)){
                   v_status = request.getParameter("status");
               } else{
                   v_status = A.original_status;
               }
                              
               Double v_loc_lattitude;
               if (!(request.getParameter("loc_lattitude").compareTo("") == 0)){
                   v_loc_lattitude = Double.parseDouble(request.getParameter("loc_lattitude"));
               } else{
                   v_loc_lattitude = A.original_loc_lattitude;
               }
                              
               Double v_loc_longiture;
               if (!(request.getParameter("loc_lattitude").compareTo("") == 0)){
                   v_loc_longiture = Double.parseDouble(request.getParameter("loc_longiture"));
               } else{
                   v_loc_longiture = A.original_loc_longiture;
               }               
               
               String v_hoa_name;
               if (!(request.getParameter("hoa_name").compareTo("na") == 0)){
                   v_hoa_name = request.getParameter("hoa_name");
               } else{
                   v_hoa_name = A.original_hoa_name;
               }

               
               Integer v_enclosing_asset;                  
               if(!(request.getParameter("enclosing_asset").compareTo("-1") == 0)){
                   v_enclosing_asset = Integer.parseInt(request.getParameter("enclosing_asset"));                   
               } else{
                   v_enclosing_asset = A.original_enclosing_asset;
               }
               
               

               A.asset_name = v_asset_name;
               A.asset_description = v_asset_description;
               A.acquisition_date = v_acquisition_date_str;
               A.forrent = v_forrent;
               A.asset_value = v_asset_value;
               A.type_asset = v_type_asset;
               A.status = v_status;
               A.loc_lattitude = v_loc_lattitude;
               A.loc_longiture = v_loc_longiture;
               A.hoa_name = v_hoa_name;
               A.enclosing_asset = v_enclosing_asset;
               
               
               int check = A.updateAssetInfo();

               if(check == 1){ 
            %>    
            <h1>Asset Update Successful</h1>
            <%
                } else{
            %>    
            <h1>Asset Update Failed</h1>
            <%
            } 
            %>
            <input type="submit" value="Return to Main Menu">
        </form>

    </body>
</html>
