<%@page import="board2.careerBoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@page import="utils.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//폼값을 DTO에 저장
		if(session.getAttribute("UserId") != null){
			
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
		}else{
			JSFunction.alertBack("로그인 후 이용해주세요.", out);
		}
%>