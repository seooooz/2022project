package board.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.Action;
import member.service.ActionForward;
import utils.CommentDAO;
import utils.CommentDTO;

public class MyLike implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String no = request.getParameter("no");
		int code = Integer.parseInt(request.getParameter("code"));
		
		CommentDAO dao = new CommentDAO();
		
		
		int mylike = dao.melikecount(id, no, code);
		
		if(mylike > 0) {
			out.println(mylike);
			out.close();
		}else {
				out.print(mylike);
				out.close();
		}
		
		
		
		
		
		return null;
	}

}