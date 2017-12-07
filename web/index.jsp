<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List, java.util.ArrayList, Kek1.Point"%>
<%@ page import="Kek1.Cloud" %>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <title> LAB №2 </title>
  <style>
    #fort  td{
      font: 250% Impact;
      color: black;
      text-align: center;
    }
    body {
       color: black;
     }
    .group {
      margin-left: 10px;
      color: navy;
      font-family: serif;
      font-size: 30px;
      font-variant: small-caps;
      font-style: italic;
    }
    .group:after {
      margin-left: 50px;
      content: "Вар №755"
    }
    .name {
      margin-left: 10px;
      font-family: serif;
      font-size: 20px;
      font-variant: small-caps;
      font-style: italic;
    }
    input.b {
      width: 100px;
      display: inline-block;
      font-family: arial,sans-serif;
      font-size: 11px;
      font-weight: bold;
      color: rgb(68,68,68);
      text-decoration: none;
      user-select: none;
      padding: .2em 1.2em;
      outline: none;
      border: 1px solid rgba(0,0,0,.1);
      border-radius: 2px;
      background: rgb(245,245,245) linear-gradient(#f4f4f4, #f1f1f1);
      transition: all .218s ease 0s;
    }
    input.b:hover {
      color: rgb(24,24,24);
      border: 1px solid blue;
      background: #f7f7f7 linear-gradient(#f7f7f7, #f1f1f1);
      box-shadow: 0 1px 2px rgba(0,0,0,.1);
    }
    input.b:active {
      color: rgb(51,51,51);
      border: 1px solid navy;
      background: rgb(238,238,238) linear-gradient(rgb(238,238,238), rgb(224,224,224));
      box-shadow: 0 1px 2px rgba(0,0,0,.1) inset;
    }
    .checkbox {
      margin-left: 50%;
    }

  </style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script>
      $(function() {
          var a = $(":checkbox");
          a.on("change", function(b) {
              this.checked = true;
              a.not(this).prop("checked", false)
          })
      })
  </script>
  <script src="jquery-3.2.1.js"></script>
  <script type="text/javascript" src="script.js"></script>
</head>

<body>
<table width="100%" border="0">
  <tr height="100px" id="fort">
    <td colspan="3">
      Колищук В.Ю., Журбова А.Е. P3200 Вариант 20!8
    </td>
  </tr>

  <form action = "controller" name="values" method="post" onsubmit="return validateForm(values)" id = "form">
    <tr height="300px">
      <td width="50%" align="center">
        <p class="name">Введите X</p>
        <p><input type="hidden" name = "X" id = "X" value = "0"/></p>
        <%--<input type="text" name="X" id = "X" readonly="readonly"/>--%>
        <input type="checkbox" value="-3" align="center"  onchange="values.X.value = this.value"/>-4
        <input type="checkbox" value="-2" align="center"  onchange="values.X.value = this.value"/>-3
        <input type="checkbox" value="-1" align="center"  onchange="values.X.value = this.value"/>-2<br>
        <input type="checkbox" value="0" align="center"  onchange="values.X.value = this.value"/>-1
        <input type="checkbox" value="1" align="center"  onchange="values.X.value = this.value"/> 0
        <input type="checkbox" value="2" align="center"  onchange="values.X.value = this.value"/> 1<br>
        <input type="checkbox" value="3" align="center"  onchange="values.X.value = this.value"/> 2
        <input type="checkbox" value="4" align="center"  onchange="values.X.value = this.value"/> 3
        <input type="checkbox" value="5" align="center"  onchange="values.X.value = this.value"/> 4<br>
        <p class="name" name="Radius" align = "center">Введите R</p>
        <p align="center"><input type="text" readonly="readonly" name = "R" value = "0" id = "field_r"/></p>
        <p align="center">
          <input type="button" value = "1" class="b" onclick=" values.R.value = this.value"/>
          <input type="button" value = "2" class="b" onclick=" values.R.value = this.value"/>
          <input type="button" value = "3" class="b" onclick=" values.R.value = this.value"/></p>
        <p align="center">
          <input type="button" value = "4" class="b" onclick=" values.R.value = this.value"/>
          <input type="button" value = "5" class="b" onclick=" values.R.value = this.value"/></p>
        <input type="hidden" name="pageX" id ="pageX" value = "0"/>
        <input type="hidden" name="pageY" id ="pageY" value = "0"/>
        <p class="name">Введите Y</p>
        <input type="text" name="Y" id = "Y" placeholder="(-3..5)" onkeypress="return isNumberKey(event)"/>
      </td>
      <td align="center">
        <img src="images/graf.png" id="find" onload=<%

          List<Point> list=(ArrayList<Point>)getServletConfig().getServletContext().getAttribute("list");

          if(list!=null){

            String x = "["+list.get(0).getX();
            String y = "["+list.get(0).getY();
            String r = "["+list.get(0).getR();
            String pageX = "["+list.get(0).getpageX();
            String pageY = "["+list.get(0).getpageY();

            for(int i=1;i<list.size();i++){
              x+=", "+list.get(i).getX();
              y+=", "+list.get(i).getY();
              r+=", "+list.get(i).getR();
              pageX+=", "+list.get(i).getpageX();
              pageY+=", "+list.get(i).getpageY();
            }
            x+="]";
            y+="]";
            r+="]";
            pageX+="]";
            pageY+="]";
            out.print("\"onloadcheck("+x+"," + y+"," + r+ "," + pageX + "," + pageY+ ")\"");
          }
        %>/><br>
        <input type="submit" value="Подтвердить" class="b"/>
        <input type="text" id = "error" value = "" name="errors" readonly="readonly"/>
      </td>
    </tr>
  </form>
    <tr>
        <td>
            <input type="text" name="filt" list="dl_continents" id="filt">
            <datalist id="dl_continents">
                <option data-value = "Saint Petersburg" value="Санкт-Петербург"></option>
                <option data-value = "Moscow" value="Москва"></option>
                <option data-value = "Florida" value="Флорида"></option>
                <option data-value = "New York" value="Нью-Йорк"></option>
                <option data-value = "London" value="Лондон"></option>
                <option data-value = "Paris" value="Париж"></option>
                <option data-value = "Berlin" value="Берлин"></option>
            </datalist>


            <input type="button" onclick = "getValue()" value = "Погода">
            <div id = "infText" style="visibility: hidden"></div>
            <script>
                /*document.getElementById("filt").oninput = function(){
                    var inp = this.value;
                    var opt = document.querySelector("#dl_continents option[value='" + inp + "']");
                    //if (opt) this.value = opt.dataset.value;
                };*/

                function getValue(){
                    var elem = document.getElementById("filt");
                    var opt = document.querySelector("#dl_continents option[value='" + elem.value+"']");
                    if (opt){
                        document.getElementById("infText").style.visibility = "hidden";
                    }else{
                        document.getElementById("infText").style.visibility = "visible";
                        document.getElementById("infText").innerText = "Не верно введено значение города, выберите из списка";
                    }
                    var url = 'http://api.openweathermap.org/data/2.5/weather?q=' + opt.dataset.value +
                        '&APPID=c7dd37ffc633622e0a910e2ed7519a41';
                    ajax_get(url, function(data) {
                        var weather = data['weather']['0']['main'];
                        if (weather == "Snow" || weather == "Clouds" || weather == "Rain") {
                            document.getElementById('find').src = 'images/cloud.png?' + Math.random();
                            <% Cloud.setIsCloudArea(true);%>
                        }<%-- else {--%>
                            <%--document.getElementById('find').src = 'images/graf.png?' + Math.random();--%>
                            <%--<% Cloud.setIsCloudArea(false);%>--%>
                        <%--}--%>

//                        switch (weather) {
//                            case 'Snow':
//                            case 'Clouds':
//                            case 'Rain':
//                                //поменять график
//                                 document.getElementById('find').src='images/cloud.png?' + Math.random();
//                                //isCloudArea
//                            default :
                        document.getElementById("infText").style.visibility = "visible";
                        document.getElementById("infText").innerText = weather;
                    //}
                    });
                }

                function ajax_get(url, callback) {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function() {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            console.log('responseText:' + xmlhttp.responseText);
                            try {
                                var data = JSON.parse(xmlhttp.responseText);
                            } catch(err) {
                                console.log(err.message + " in " + xmlhttp.responseText);
                                return;
                            }
                            callback(data);
                        }
                    };
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
                }
            </script>
        </td>
    </tr>
</table>
<%

  if(list!=null){
    out.println("<table border=\"1\" id=\"resultTable\" align=\"center\">");
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
    out.println("</table>");
  }
%>

<script type = "text/javascript">
    function validateForm(form){

        var y = form.Y.value;
        var r = form.R.value;
        var x = form.X.value;
        var four = "4";
        var dought = ".";
        var mintwo= "-2";

        var strike = y.toString();

        if(strike.charAt(0) == four.charAt(0)){
            if (strike.charAt(1) === dought.charAt(0)) {
                return true;
            };
        }
        if(strike.charAt(0) == mintwo.charAt(0) && strike.charAt(1) == mintwo.charAt(1) ){
            if (strike.charAt(2) === dought.charAt(0)) {
                return true;
            };
        }

        if (Number(x) < -4 || Number(x) > 4){
            form.errors.value = "Error in X";
            return false;
        }

        if (!(parseFloat(y) == y)){
            form.errors.value = "Y not a number";
            return false;
        }
        else if (Number(y) > 5 || Number(y) < -3) {
            form.errors.value = "Error in Y";
            return false;
        }

        if (!(r == "1" || r == "2" || r == "3" || r ==  "4" || r == "5")) {
            form.errors.value = "Error in R";
            return false;
        }
        return true;
    }
    function isNumberKey(evt){
        var charCode = (evt.which) ? evt.which : event.keyCode
        if(charCode == 44){
            form.Y.value = form.Y.value + ".";
            return false;
        }
        if (charCode != 45 && charCode != 46 && (charCode < 48 || charCode > 57))
            return false;
    }
</script>
</body>
</html>