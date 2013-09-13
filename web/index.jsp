<%-- 
    Document   : index
    Created on : Aug 17, 2013, 11:02:51 AM
    Author     : mtrejo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript">
            var path="<%=request.getContextPath()%>";
            function _onload(){
                $.ajax({
                  type: "GET",
                  url: path+"/ServiceDispatch",
                  //data: { serviceName: "clientes_listar",p_page:1,p_limit:4 }
                  //data: { serviceName: "sp_autenticar",p_clave:"system",p_password:"sysnot" }   
                  data: { serviceName: "menu_listar",p_usuario:1 }
                }).done(function(data ) {
                  alert( "Data Saved: " + data);
                })
            }
        </script>
    </head>
    <body onload="_onload()">
    </body>
</html>
