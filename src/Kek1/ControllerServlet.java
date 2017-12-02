package Kek1;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
public class ControllerServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String xString=request.getParameter("X");
        String yString=request.getParameter("Y");
        String RString=request.getParameter("R");
        response.setHeader("Content-Type", "text/html; charset=UTF-8");
        if(xString == null || yString == null || RString == null){
            request.getServletContext().getRequestDispatcher("/checked.jsp").forward(request, response);
        } else {
            request.getServletContext().getRequestDispatcher("/WEB-INF/AreaCheckServlet").forward(request, response);
        }
    }
}
