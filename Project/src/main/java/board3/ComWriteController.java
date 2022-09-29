package board3;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("/board/comwrite.do")
public class ComWriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/view/board/offer_view.jsp").forward(req, res);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 세션을 통해 아이디 가져오기
		HttpSession session = req.getSession();
		
		// 폼값을 DTO에 저장
		CommentDTO dto = new CommentDTO();
		
		dto.setId((String)session.getAttribute("UserId"));
		dto.setComment(req.getParameter("comment"));
		dto.setPostNum(req.getParameter("pnum"));
		
		offerBoardDAO dao = new offerBoardDAO();
		int result = dao.offerinsertCom(dto);
		dao.comgroupUpdate();
		dao.close();
		
		if(result == 1) {
			System.out.println("offer 댓글 성공");
			resp.sendRedirect("../board/view.do?onum=" + req.getParameter("pnum"));
		}
		else {
			System.out.println("offer 댓글 실패");
			resp.sendRedirect("../board/list.do");
		}
}
}