$(document).ready(function () {
    $('#back').click(function () {
        window.location= 'http://localhost:8080/Kek1_war_exploded/';
    });

    $('#find').click(function (eventObject) {

        var x = eventObject.offsetX;
        var y = eventObject.offsetY;

        var r = parseFloat($('#field_r').val());
        if (r === 0) {
            var z = document.getElementById("error");
            z.setAttribute("value", "Error in R");
            return;
        }

        var realX = (x-305)*r/223;
        var realY = (304-y)*r/223;

        var order = {
            x: realX,
            y: realY,
            r: r
        };

        var check = false;
        if(realX<=0&&realY>=0&&realY<=r&&realX>=-r/2){
            check = true;
        }
        if(realX>=0&&realY>=0&&realY<=r-2*realX){
            check = true;
        }
        if(realX<=0&&realY<=0&&realY*realY+realX*realX<=r*r/4){
            check = true;
        }

        if(check)
        $("body").append(
            $('<div id="point"></div>')
                .css('position', 'absolute')
                .css('top', (eventObject.pageY-4) + 'px')
                .css('left', (eventObject.pageX-4) + 'px')
                .css('width', '8px')
                .css('height', '8px')
                .css('background-color', 'green')
                .css('border-radius', '3px')
        );
        else
            $("body").append(
                $('<div id="point"></div>')
                    .css('position', 'absolute')
                    .css('top', (eventObject.pageY-4) + 'px')
                    .css('left', (eventObject.pageX-4) + 'px')
                    .css('width', '8px')
                    .css('height', '8px')
                    .css('background-color', 'red')
                    .css('border-radius', '3px')
            );

        var X = document.getElementById("X");
        var Y = document.getElementById("Y");
        X.setAttribute("value", String(realX));
        Y.setAttribute("value", String(realY));

        var pageX = document.getElementById("pageX");
        var pageY = document.getElementById("pageY");
        pageX.setAttribute("value", String(eventObject.pageX));
        pageY.setAttribute("value", String(eventObject.pageY));
        $('#form').submit();
    });
    $(window).resize(function() {
        if ($("#point").length) {
            $("#point").remove();
        }
    });
});

function onloadcheck(realX, realY, r, pageX, pageY) {

    var img = document.getElementById("find");

    for (var i = 0; i < realX.length; i++) {
        if (pageX[i] != 0){
            var check = false;
            if (realX[i] <= 0 && realY[i] >= 0 && realY[i] <= r[i] && realX[i] >= -r[i]/2) {
                check = true;
            }
            if (realX[i] >= 0 && realY[i] >= 0 && realY[i] <= r[i] - 2*realX[i]) {
                check = true;
            }
            if (realX[i] <= 0 && realY[i] <= 0 && realY[i] * realY[i] + realX[i] * realX[i] <= r[i] * r[i] / 4) {
                check = true;
            }

            if (check)
                $("body").append(
                    $('<div id="point' + i + '"></div>')
                        .css('position', 'absolute')
                        .css('top',  pageY[i] + 'px')
                        .css('left', pageX[i] + 'px')
                        .css('width', '8px')
                        .css('height', '8px')
                        .css('background-color', 'green')
                        .css('border-radius', '3px')
                );
            else
                $("body").append(
                    $('<div id="point' + i + '"></div>')
                        .css('position', 'absolute')
                        .css('top',  pageY[i] + 'px')
                        .css('left', pageX[i] + 'px')
                        .css('width', '8px')
                        .css('height', '8px')
                        .css('background-color', 'red')
                        .css('border-radius', '3px')
                );
        }
    }
}