<%@page import="board1.skillBoardDAO"%>
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
		
		skillBoardDAO dao = new skillBoardDAO();
		int result = dao.skillinsertCom(dto);
		dao.comgroupUpdate();
		dao.close();
		
		if(result == 1) {
			System.out.println("skill 댓글 성공");
			response.sendRedirect("../../view/board/skill_view.jsp?num=" + request.getParameter("pnum"));
		}
		else {
			System.out.println("skill 댓글 실패");
			JSFunction.alertBack("댓글 실패", out);
		}
%>