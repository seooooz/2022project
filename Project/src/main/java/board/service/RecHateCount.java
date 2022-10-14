package board.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Like.likeBoardDAO;
import member.service.Action;
import member.service.ActionForward;

public class RecHateCount implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("UserId");
		int no = Integer.parseInt(request.getParameter("no"));
		int code = Integer.parseInt(request.getParameter("code"));
		likeBoardDAO dao = new likeBoardDAO();
		
		// 게시글 총 추천수를 구함
		int count2 = dao.likecount(no,code,2);
		dao.close();
		// 뷰페이지(boardContent.jsp)에 추천수를 출력하도록 하는 역할
		out.println(count2);
		out.close();
		
		return null;
	}
}
