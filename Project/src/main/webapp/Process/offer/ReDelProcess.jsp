<%@page import="board3.offerBoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CommentDTO" %>  

<%
		//로그인된 사용자 ID 얻기
		String sessionId = (String)session.getAttribute("UserId");
		
		// 매개변수 저장
		String pnum = request.getParameter("pnum");
		String idx = request.getParameter("comidx");
		String id = request.getParameter("id");
		
		
		System.out.println(pnum);
		System.out.println(idx);			
		System.out.println(sessionId);		
		System.out.println(id);

		offerBoardDAO dao = new offerBoardDAO();
		
				
		// session id랑 댓글 작성자 id랑 일치한지 확인
			
		int delResult = 0;
		
		if(sessionId != null){
			// 작성자 본인
		if(sessionId.equals(id)){
			
			delResult = dao.deleteRe(idx);
			dao.close();
			
			if(delResult == 1){
				//성공 ) 목록 페이지로 이동
				JSFunction.alertLocation("삭제되었습니다", "../../view/board/offer_view.jsp?onum=" + pnum, out);
			}// 실패 ) 이전 페이지로 이동
			else{
				JSFunction.alertBack("삭제에 실패하였습니다.", out);
			}
		}
		else{
			//작성자 본인이 아니면 이전 페이지
			JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
			return;
			}
		}
		else{
			//작성자 본인이 아니면 이전 페이지
			JSFunction.alertBack("로그인 후 이용해주세요.", out);
			return;
		}
	
%>