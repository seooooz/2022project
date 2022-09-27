package board3;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/board/reply.do")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/view/board/reply.jsp").forward(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

				// 세션을 통해 아이디 가져오기
				HttpSession session = req.getSession();
				
				
				String id = (String)session.getAttribute("UserId");
				String pnum = req.getParameter("pnum");
				String reply = req.getParameter("reply");
				String comidx = req.getParameter("comidx");
				
				
//				// 폼값을 DTO에 저장
//				dto.setId((String)session.getAttribute("UserId"));
//				dto.setComment(req.getParameter("reply"));
//				dto.setPostNum(req.getParameter(pnum));
//				dto.setGroupNum(req.getParameter("comidx"));
//				dto.setOrder(req.getParameter("order"));
				
				System.out.println(comidx);
				System.out.println(pnum);
				
				offerBoardDAO dao = new offerBoardDAO();
				
				
				
				
//				int result = dao.offerinsertreply(dto);
				int result = dao.offerinsertreply(id, pnum, reply,comidx);
				dao.close();
				
				if(result == 1) {
					System.out.println("offer 대댓글 성공");
					resp.sendRedirect("../board/view.do?onum=" + req.getParameter("pnum"));
				}
				else {
					System.out.println("offer 대댓글 실패");
					resp.sendRedirect("../board/list.do");
				}
				
//				if(result == 1) {
//					
//					if(mode.equals("offreply")) { // 대댓글 모드
//						session.setAttribute("comidx", comidx);
//						System.out.println("offer 대댓글 성공");
//						resp.sendRedirect("../board/view.do?onum=" + req.getParameter("pnum"));
//					}
//				}
//				else {
//					System.out.println("offer 대댓글 실패");
//					resp.sendRedirect("../board/list.do");
//				}
	}

}
