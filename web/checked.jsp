<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List, java.util.ArrayList, Kek1.Point"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="UTF-8"/>
    <title> Lab2 PIP </title>
    <script src="jquery-3.2.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#back').click(function () {
                window.location= 'http://localhost:8080/Kek1_war_exploded/';
            })
        });
    </script>
    <style>
        .button {
            color: #fff; /* цвет текста */
            text-decoration: none; /* убирать подчёркивание у ссылок */
            user-select: none; /* убирать выделение текста */
            background: #95c3ff; /* фон кнопки */
            padding: .7em 1.5em; /* отступ от текста */
            outline: none; /* убирать контур в Mozilla */
        }
    </style>
</head>

<body>

    <p align="center"><img src="images/graf.png"/></p>
    <%if(getServletConfig().getServletContext().getAttribute(("exception"))!=null)out.println(getServletConfig().getServletContext().getAttribute(("exception")));%>
    <%
        List<Point> list=(ArrayList<Point>)getServletConfig().getServletContext().getAttribute("tempList");

            if(list!=null){

                out.println("<table align=\"center\" border=\"1\" bordercolor=\"blue\" id=\"resultTable\" >");
                out.println("<tr>");
                out.println("<td>");
                out.println("X coordinate");
                out.println("</td>");
                out.println("<td>");
                out.println("Y coordinate");
                out.println("</td>");
                out.println("<td>");
                out.println("Radius");
                out.println("</td>");
                out.println("<td>");
                out.println("Bullet");
                out.println("</td>");
                out.println("</tr>");

                for(int i=0;i<list.size();i++){
                    out.println("<tr>");
                    out.println("<td>");
                    out.println(list.get(i).getX());
                    out.println("</td>");
                    out.println("<td>");
                    out.println(list.get(i).getY());
                    out.println("</td>");
                    out.println("<td>");
                    out.println(list.get(i).getR());
                    out.println("</td>");
                    out.println("<td>");

                    if(list.get(i).isInArea()){
                        out.println("Hit");
                    }
                    else{
                        out.println("Didn't hit");
                    }

                    out.println("</td>");
                    out.println("</tr>");
                }
                out.println("</table><br>");
            }
        %>
    <p align="center"><input type="button" class="button" value="back" id="back"/></p>
</body>

</html>