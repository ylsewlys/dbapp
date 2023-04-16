<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete asset processing</title>
    </head>
    <body>
        <jsp:useBean id="A" class="dbapp_package.Assets" scope="session" />
        
        <% // Receive the values from delete_asset.jsp
            int asset_id_query = Integer.parseInt(request.getParameter("assets"));
            
            int status = A.delete_asset(asset_id_query);
            
            if(status == 1) {
        %>
            <h1>Delete Asset Successful!</h1>
        <%
            }
            else {
        %>
            <h1>Delete Asset Failed</h1>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>
