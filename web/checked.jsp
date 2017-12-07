<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List, java.util.ArrayList, Kek1.Point"%>
<%@ page import="Kek1.Cloud" %>
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
        html{height:120%; width: 100%;}
        body {
            /*background:#0D343A;*/
            /*background:-webkit-gradient(linear,0% 0%,0% 100%, from(rgba(13,52,58,1) ), to(#000000)  );*/
            /*background: -moz-linear-gradient(top, rgba(13,52,58,1) 0%, rgba(0,0,0,1) 100%);*/

            overflow:hidden;
            height: 120%;
            width: 100%;
        }


        .drop {
            background:-webkit-gradient(linear,0% 0%,0% 100%, from(rgba(13,52,58,1) ), to(rgba(255,255,255,0.6))  );
            background: -moz-linear-gradient(top, rgba(13,52,58,1) 0%, rgba(255,255,255,.6) 100%);
            width:1px;
            height:89px;
            position: absolute;
            bottom:200px;
            -webkit-animation: fall .63s linear infinite;
            -moz-animation: fall .63s linear infinite;

        }

        /* animate the drops*/
        @-webkit-keyframes fall {
            to {margin-top:900px;}
        }
        @-moz-keyframes fall {
            to {margin-top:900px;}
        }


    </style>
</head>

<body>
<section class="rain">
    <% if(
            Cloud.isIsCloudArea()){
        out.print("<p align=\"center\"><img src=\"images/minCloud.png\"/></p>");
    }else{
        out.print("<p align=\"center\"><img src=\"images/minGraf.png\"/></p>");
    } %>

</section>
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
    <script>
    // number of drops created.
    var nbDrop = 858;

    // function to generate a random number range.
    function randRange( minNum, maxNum) {
    return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
    }

    // function to generate drops
    function createRain() {

    for( i=1;i<nbDrop;i++) {
    var dropLeft = randRange(0,1600);
    var dropTop = randRange(-1000,1400);

    $('.rain').append('<div class="drop" id="drop'+i+'"></div>');
    $('#drop'+i).css('left',dropLeft);
    $('#drop'+i).css('top',dropTop);
    }

    }
    <% if(Cloud.isIsCloudArea()){
        out.print("createRain();");
    }%>

</script>

</body>

</html>