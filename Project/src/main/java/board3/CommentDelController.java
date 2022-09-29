package board3;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/board/comdelete.do")
public class CommentDelController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////		req.getRequestDispatcher("/board/view.do?onum=" + req.getParameter("pnum")).forward(req, resp);
//		req.getRequestDispatcher("/board/view.do?onum=" + req.getParameter("pnum")).forward(req, resp);
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션을 통해 아이디 가져오기
				HttpSession session = req.getSession();
				
				// 매개변수 저장
				String idx = req.getParameter("comidx");
				String sessionId = (String)session.getAttribute("UserId");
				String id = req.getParameter("id");
				
				
				System.out.println(idx);
				System.out.println(sessionId);
				System.out.println(id);
				
				CommentDTO dto = new CommentDTO();
				offerBoardDAO dao = new offerBoardDAO();
				
				// session id랑 댓글 작성자 id랑 일치한지 확인
					
				int delResult = 0;
				
				if(sessionId.equals(id)){
					// 작성자 본인
					delResult = dao.deleteCom(idx);
					dao.close();
					
					if(delResult == 1){
						//성공 ) 목록 페이지로 이동
						JSFunction.alertLocation("삭제되었습니다", "List.jsp", null);
					}// 실패 ) 이전 페이지로 이동
					else{
						JSFunction.alertBack("삭제에 실패하였습니다.", null);
					}
				}
				else{
					//작성자 본인이 아니면 이전 페이지
					JSFunction.alertBack("본인만 삭제할 수 있습니다.", null);
					return;
				}
				
			
			
	
	}
	
	
	
}
