package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OpperServlet")
public class OfferServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
    
    public OfferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "Hi....!!");
		req.getRequestDispatcher("/view/board/offer.jsp").forward(req, resp);
	}

}
