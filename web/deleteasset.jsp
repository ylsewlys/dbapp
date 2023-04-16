<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete an Asset</title>
    </head>
    <body>
        <jsp:useBean id="A" class="dbapp_package.Assets" scope="session" />
        <h1>Delete Asset</h1>
        <form action="delete_asset_processing.jsp">
            <% A.get_deletable_assets(); %>
            <label for="assets">Select an asset to delete</label><br>

            <select name="assets" id="assets">
                <% for(int i = 0; i < A.assetID_List.size(); i++) {%>
                <option value="<%= A.assetID_List.get(i)%>"><%= A.assetName_List.get(i)%></option>
                <% } %>
                
            </select> <br><br>
          
            <input type="submit" value="Delete">
        </form>
</html>
