<%-- 
    Document   : clientes
    Created on : 22/06/2013, 01:25:00 PM
    Author     : sderan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="clientes" id="clientes" action="Catalogos/Clientes.do?dispatch=registrar" method="post">
            <fieldset>
            <label for="idcliente">ID Cliente</label>
            <input type="text" name="idcliente" id="idcliente"/> 
            <br>
            <label for="regimenfiscal">R&eacute;gimen Fiscal</label>
            <input type="text" name="regimenfiscal" id="regimenfiscal"/>
            <br>            
            <label for="razonsocial">Raz&oacute;n Social</label>
            <input type="text" name="razonsocial" id="razonsocial"/>
            <br>            
            <label for="siglas">Siglas</label>
            <input type="text" name="siglas" id="siglas"/>
            <br>
            <label for="tratamiento">Tratamiento</label>
            <input type="text" name="tratamiento" id="tratamiento"/>
            <br>            
            <label for="nombres">Nombres</label>
            <input type="text" name="nombres" id="nombres"/>
            <br>            
            <label for="apaterno">Apellido Paterno</label>
            <input type="text" name="apaterno" id="apaterno"/>
            <br>            
            <label for="amaterno">Apellido Materno</label>
            <input type="text" name="amaterno" id="amaterno"/>
            <br>            
            <label for="otronombre">Otro Nombre</label>
            <input type="text" name="otronombre" id="otronombre"/>
            <br>            
            <label for="">Nombre en Acta de Nacimiento</label>
            <input type="text" name="nombreactamat" id="nombreactamat"/>
            <br>            
            <label for="nombreotrosdocs">Nombre en otros documentos</label>
            <input type="text" name="nombreotrosdocs" id="otrosdocs"/>
            <br>            
            <label for="sexo">Sexo</label>
            <input type="text" name="sexo" id="sexo"/>            
            <br>            
            <label for="rfc">RFC</label>
            <input type="text" name="rfc" id="rfc"/>
            <br>            
            <label for="curp">CURP</label>
            <input type="text" name="curp" id="curp"/>
            <br>
            <label for="nss">N&uacute;mero de Seguridad Social</label>
            <input type="text" name="nss" id="nss"/>
            <br>            
            <label for="edocivil">Estado civil</label>
            <input type="text" name="edocivil" id="edocivil"/>
            <br>            
            <label for="regimenmat">R&eacute;gimen fiscal</label>
            <input type="text" name="regimenmat" id="regimenmat"/>
            <br>            
            <label for="folioactamat">Folio acta matrimonial</label>
            <input type="text" name="folioactamat" id="folioactamat"/>
            <br>            
            <label for="actamat">Acta de Matrimonio</label>
            <input type="text" name="actamat" id="actamat"/>
            <br>            
            <label for="libroactamat">Libro en acta de matrimonio</label>
            <input type="text" name="libroactamat" id="libroactamat"/>
            <br>            
            <label for="fechaactamat">Fecha en acta de matrimonio</label>
            <input type="text" name="fechaactamat" id="fechaactamat"/>
            <br>            
            <label for="lugaractamat">Lugar en acta de matrimonio</label>
            <input type="text" name="lugaractamat" id="lugaractamat"/>
            <br>            
            <label for="ciudadnac">Ciudad lugar de nacimiento</label>
            <input type="text" name="ciudadnac" id="ciudadnac"/>
            <br>            
            <label for="estadonac">Estado lugar de nacimiento</label>
            <input type="text" name="estadonac" id="estadonac"/>
            <br>            
            <label for="paisnac">Pa&iacute;s lugar de nacimiento</label>
            <input type="text" name="paisnac" id="paisnac"/>
            <br>            
            <label for="fechanac">Fecha de nacimiento</label>
            <input type="text" name="fechanac" id="fechanac"/>
            <br>            
            <input type="submit" value="Guardar"/>
            </fieldset>
        </form>
    </body>
</html>
