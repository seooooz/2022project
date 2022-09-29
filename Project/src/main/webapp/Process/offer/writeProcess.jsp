<%@page import="board3.offerBoardDAO"%>
<%@page import="board3.offerBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//폼값을 DTO에 저장
		offerBoardDTO dto = new offerBoardDTO();
		
		dto.setId((String)session.getAttribute("UserId"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setCate(request.getParameter("cate"));
		dto.setMemNum(request.getParameter("memNum"));
		dto.setDday(request.getParameter("datepicker"));
		
		offerBoardDAO dao = new offerBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		if(result == 1) {
			System.out.println("offer 글작성 성공");
			response.sendRedirect("../../view/board/offer.jsp");
		}
		else {
			System.out.println("offer 글작성 실패");
			request.getRequestDispatcher("../../view/board/offer_write.jsp").forward(request, response);
		}
%>
