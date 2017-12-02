package Kek1;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import java.io.PrintWriter;

public class AreaCheckServlet extends HttpServlet {
    private List<Point> list=null;
    private List<Point> temporaryList = null;

    /*protected  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setHeader("Content-Type", "text/html; charset=UTF-8");
        String xString=request.getParameter("X");
        String yString=request.getParameter("Y");
        String RString=request.getParameter("R");

        PrintWriter out = response.getWriter();
        out.print("<html><head><title>test</title><body>");
        out.print(" X = " + xString);
        out.print(" Y = " + yString);
        out.print(" R = " + RString);
        out.print("</body></html>");
    }*/

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(list==null){
            list=new ArrayList<>();
            getServletContext().setAttribute("list", list);
        }
        String check = "";
        List<Point> temp= new ArrayList<>();
        try {
            double x, y, r, pageX, pageY;
            x = Double.parseDouble(request.getParameter("X"));
            r = Double.parseDouble(request.getParameter("R"));
            y = Double.parseDouble(request.getParameter("Y"));
            pageX = Double.parseDouble(request.getParameter("pageX"));
            pageY = Double.parseDouble(request.getParameter("pageY"));

            if (x < -4 || x > 4)
                check += "Неправильное значение x ";
            if (!( r == 1 || r == 2 || r == 3 || r ==  4 || r == 5))
                check += "Неправильное значение r ";
                if (y >= 5 || y <= -3)
                    check += "Неправильное значение y";
                if (check.equals("")) {
                    list.add(new Point(x, y, r, pageX, pageY));
                    temp.add(new Point(x, y, r, pageX, pageY));
                }
        }catch (Exception e){
        }
            getServletContext().setAttribute("exception",check);
            if(temp.size()!=0) {
                temporaryList = temp;
                getServletContext().setAttribute("tempList", temporaryList);
            }

            request.getServletContext().getRequestDispatcher("/checked.jsp").forward(request,response);
    }
}
