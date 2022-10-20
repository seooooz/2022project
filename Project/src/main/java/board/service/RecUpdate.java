package board.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import like.likeBoardDAO;
import like.likeBoardDTO;
import member.service.Action;
import member.service.ActionForward;

public class RecUpdate implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		// no와 id 값을 map에 저장
		Map<String, Object> m = new HashMap<>();
		m.put("no", (request.getParameter("no")));
		m.put("id", request.getParameter("UserId"));
		
		String no = request.getParameter("no");
		String code = request.getParameter("code");
		String id = request.getParameter("id");
		String like = request.getParameter("like");
		int clike = Integer.parseInt(like);
		likeBoardDTO dto = new likeBoardDTO();
		likeBoardDAO dao = new likeBoardDAO();
		dto.setLid(id);
		dto.setPage_id(no);
		dto.setLboard_code(code);
		dto.setIs_like(like);
		
		
		// 동일 게시글에 대한 이전 추천  여부 검색
		int result = dao.likeCheck(no, code, id);
		System.out.println("RESEULT = "+result);
		
		int mycount = dao.melikecount(id, no, code, like);
		System.out.println("mycount = "+mycount);
			
			if(result == 0){ // 좋아요 없을 시 
				dao.likeInsert(dto);
				dao.close();
				out.println(mycount);
				out.close();
			}else if(result != clike){ // 좋아요 값 있을 시 삭제
				dao.likeUpdate(like, id, no ,code);
				dao.close();
				out.println(mycount);
				out.close();
			
			}else{ // 좋아요 값 있을 시 삭제
			dao.likeDelete(id,no,code);
			dao.close();
			out.println(mycount);
			out.close();
		}
		return null;
	}
}