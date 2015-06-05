<%-- 
    Document   : ActualizaInspeccion
    Created on : 24-oct-2014, 11:05:49
    Author     : Gandhy
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualiza Inspección</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/s3Slider.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('#slider1').s3Slider({
        timeOut: 5000
    });
});
</script>
<script type="text/javascript">
$(document).ready(function () {
    $(".pane-list li").click(function () {
        window.location = $(this).find("a").attr("href");
        return false;
    });
});
</script>
<script type="text/javascript">
$(document).ready(function () {
    $('.rss').append('<span class="hover"></span>').each(function () {
        var $span = $('> span.hover', this).css('opacity', 0);
        $(this).hover(function () {
            $span.stop().fadeTo(500, 1);
        }, function () {
            $span.stop().fadeTo(500, 0);
        });
    });
    $('.facebook').append('<span class="hover"></span>').each(function () {
        var $span = $('> span.hover', this).css('opacity', 0);
        $(this).hover(function () {
            $span.stop().fadeTo(500, 1);
        }, function () {
            $span.stop().fadeTo(500, 0);
        });
    });
    $('.twitter').append('<span class="hover"></span>').each(function () {
        var $span = $('> span.hover', this).css('opacity', 0);
        $(this).hover(function () {
            $span.stop().fadeTo(500, 1);
        }, function () {
            $span.stop().fadeTo(500, 0);
        });
    });
});
</script>
        
        
        
    </head>
    <body>




        <h1 style="color: #FFFFFF">Nuevo Registro Creado!</h1>
        <p></p>
        <p></p>
        <p></p>
         <!-- Imprimimos el parametro que se paso-->
            <%
      String Rnombre = request.getParameter("name");          
                
   String Rsnombre = request.getParameter("Snombre");
   String RPapellido = request.getParameter("Papellido");
   String RSapellido = request.getParameter("Sapellido");
   String Rdni= request.getParameter("dni");
   String Rztrabajo= "ztrabajo";
   String RPaltura= request.getParameter("Paltura");
   String RPpeso= request.getParameter("Ppeso");
   String RFnacimiento = request.getParameter("Fnacimiento");
   String Rmessage = request.getParameter("message");
   
   
///capturo la fecha y la hora con la que se registra el evento o la actualizacion de datos

               Calendar fecha = new GregorianCalendar();
                //Obtenemos el valor del año, mes, día,
                //hora, minuto y segundo del sistema
                //usando el método get y el parámetro correspondiente
                int año = fecha.get(Calendar.YEAR);
                int mes = fecha.get(Calendar.MONTH);
                int dia = fecha.get(Calendar.DAY_OF_MONTH);
                int hora = fecha.get(Calendar.HOUR_OF_DAY);
                int minuto = fecha.get(Calendar.MINUTE);
                int segundo = fecha.get(Calendar.SECOND);
                System.out.println("Fecha Actual: "
                        + dia + "/" + (mes + 1) + "/" + año);
                System.out.printf("Hora Actual: %02d:%02d:%02d %n",
                        hora, minuto, segundo);
               
     
   
  out.println("<div align='center'>" ) ;
  out.println("El empleado a crear  es: "+ Rnombre+  "<br />") ;
    
            %>
        
         <%@page import="java.sql.*" %>
<%

                
            
Class.forName("com.mysql.jdbc.Driver");
Connection  conexion = DriverManager.getConnection("jdbc:mysql://localhost/gestionshw", "root", "");

Statement Estamento = conexion.createStatement();




String sql=("INSERT INTO empleados(pNombre, sNombre, pApellido, sApellido, dni, zonaTrabajo, altura, peso, fNacimiento, comentarios"
        + ") VALUES (?,?,?,?,?,?,?,?,?,?)");

        


try {
            PreparedStatement pst = conexion.prepareStatement(sql);

            //estas pst.setString envia el valor que hay en la variable al campo 1 que es igual a la primera ? en values y asi
                  

            
            pst.setString(1, Rnombre);
            pst.setString(2, Rsnombre);
            pst.setString(3, RPapellido);
            pst.setString(4, RSapellido );
            pst.setObject(5, Rdni);
            pst.setObject(6, Rztrabajo);
            pst.setObject(7, RPaltura);
            pst.setObject(8, RPpeso);
            pst.setObject(9, RFnacimiento);
            pst.setObject(10, Rmessage);
           

            
          
            
           

            int n = pst.executeUpdate();
            if (n > 0) {

                out.println("EMPLEADO CREADO CON EXITO");

                //cerramos la conexion a la bd
                
               

            }

        } catch (SQLException ex) {
            out.println(ex);
            out.println(ex);
        }

//////actualiza el numero de casos nuevos par aque suene







out.println("</div>" ) ;
%>



    </body>
</html>
