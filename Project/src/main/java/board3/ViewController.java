package board3;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/board/view.do")
public class ViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// offerboard 게시물 불러오기
		offerBoardDAO dao = new offerBoardDAO();
		String onum = req.getParameter("onum");
		dao.updateVisitCount(onum);
		offerBoardDTO dto = dao.selectView(onum);
		List<CommentDTO> comLists = dao.comselectView(onum);
		
	
		
//		// 뷰에 전달할 매개변수 저장용 맵 생성
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		int totalCount = dao.selectCount(map); // 게시물 개수
//		
//		/* 페이지 처리 start*/
//		ServletContext application = getServletContext();
//		
//		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
//		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
//		
//		// 현재 페이지 확인
//		int pageNum = 1; // 기본값
//		String pageTemp = req.getParameter("pageNum");
//		if(pageTemp != null && !pageTemp.equals(""))
//			pageNum = Integer.parseInt(pageTemp);	// 요청받은 페이지로 수정
//		
//		// 목록에 출력할 게시물 범위 계산
//		int start = (pageNum -1) * pageSize + 1; // 첫 게시물 번호
//		int end = pageNum * pageSize;	// 마지막 게시물 번호
//		map.put("start", start);
//		map.put("end", end);
//		/* 페이지 처리 end*/
		
//		List<CommentDTO> comLists = dao.selectListCom(map, onum);
		
		
		dao.close();
		
		
		// 뷰에 전달할 매개변수 추가
//		String pagingImg = Paging.pagingStr(totalCount, pageSize, blockPage, pageNum, "../view/board/List.do");
//		
		// 바로가기 영역 HTML 문자열
//		map.put("pagingImg", pagingImg);
//		map.put("totalCount", totalCount);
//		map.put("pageSize", pageSize);
//		map.put("pageNum", pageNum);
		
		
		// 게시물(dto) 저장 후 뷰로 포워드
		req.setAttribute("odto", dto);
		req.setAttribute("comLists", comLists);
		req.getRequestDispatcher("../view/board/offer_view.jsp").forward(req, resp);
	}
	
	
}
