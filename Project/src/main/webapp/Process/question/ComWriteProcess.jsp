<%@page import="board3.offerBoardDAO"%>
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
		
		offerBoardDAO dao = new offerBoardDAO();
		int result = dao.offerinsertCom(dto);
		dao.comgroupUpdate();
		int countcom = dao.countCom(Integer.valueOf(request.getParameter("pnum")));
		System.out.println(countcom);
		dao.close();
		
		if(result == 1) {
			System.out.println("career 댓글 성공");
			response.sendRedirect("../../view/board/offer_view.jsp?onum=" + request.getParameter("pnum"));
		}
		else {
			System.out.println("career 댓글 실패");
			JSFunction.alertBack("댓글 실패", out);
		}
%>