package board.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.Action;
import member.service.ActionForward;
import utils.CommentDAO;
import utils.CommentDTO;

public class Comment implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		System.out.print(id);
		String no = request.getParameter("no");
		int code = Integer.parseInt(request.getParameter("code"));
		String content = request.getParameter("content");
		
		CommentDAO dao = new CommentDAO();
		CommentDTO dto = new CommentDTO();
		
		dto.setCode(code);
		dto.setComment(content);
		dto.setId(id);
		dto.setPostNum(no);
		
		int result = dao.skillinsertCom(dto);
		dao.comgroupUpdate(code);
		
		response.getWriter().print(result);
		
//		List<CommentDTO> commentList = dao.comselectView(no);
//		
//		response.getWriter().print(commentList);
		
		return null;
	}

}
