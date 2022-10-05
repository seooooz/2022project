<%@page import="board.careerBoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@page import="utils.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//폼값을 DTO에 저장
		CommentDTO dto = new CommentDTO();
		
		dto.setId((String)session.getAttribute("UserId"));
		dto.setComment(request.getParameter("comment"));
		dto.setPostNum(request.getParameter("pnum"));
		
		careerBoardDAO dao = new careerBoardDAO();
		int result = dao.careerinsertCom(dto);
		dao.comgroupUpdate();
		dao.close();
		
		if(result == 1) {
			System.out.println("offer 댓글 성공");
			response.sendRedirect("../../view/board/career_view.jsp?num=" + request.getParameter("pnum"));
		}
		else {
			System.out.println("offer 댓글 실패");
			JSFunction.alertBack("댓글 실패", out);
		}
%>