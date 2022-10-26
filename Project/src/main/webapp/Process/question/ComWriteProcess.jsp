<%@page import="board4.QuestionBoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@page import="utils.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//폼값을 DTO에 저장
		CommentDTO dto = new CommentDTO();
		
		dto.setId((String)session.getAttribute("UserId"));
		dto.setComment(request.getParameter("comment"));
		dto.setPostNum(request.getParameter("qnum"));
		
		QuestionBoardDAO dao = new QuestionBoardDAO();
		int result = dao.offerinsertCom(dto);
		dao.comgroupUpdate();
		int countcom = dao.countCom(request.getParameter("qnum"));
		System.out.println(countcom);
		dao.close();
		
		if(result == 1) {
			System.out.println("faq 댓글 성공");
			response.sendRedirect("../../view/board/question_view.jsp?qnum=" + request.getParameter("qnum"));
		}
		else {
			System.out.println("faq 댓글 실패");
			JSFunction.alertBack("댓글 실패", out);
		}
%>