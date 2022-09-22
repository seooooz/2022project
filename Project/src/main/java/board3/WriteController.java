package board3;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;


public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/view/board/offer_write.jsp").forward(request, response);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 세션을 통해 아이디 가져오기
		HttpSession session = req.getSession();
		
		// 폼값을 DTO에 저장
		offerBoardDTO dto = new offerBoardDTO();
		
		dto.setId((String)session.getAttribute("UserId"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setCate(req.getParameter("cate"));
		dto.setMemNum(req.getParameter("memNum"));
		dto.setDday(req.getParameter("datepicker"));
		
		offerBoardDAO dao = new offerBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		if(result == 1) {
			System.out.println("offer 글작성 성공");
			resp.sendRedirect("../board/list.do");
		}
		else {
			System.out.println("offer 글작성 실패");
			resp.sendRedirect("../board/write.do");
		}
}
}