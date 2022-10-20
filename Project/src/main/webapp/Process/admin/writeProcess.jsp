<%@page import="admin.adminBoardDAO"%>
<%@page import="admin.adminBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//폼값을 DTO에 저장
		adminBoardDTO dto = new adminBoardDTO();
		
		dto.setTitle(request.getParameter("title"));
		dto.setBrd_code(Integer.valueOf(request.getParameter("cate")));
		dto.setContent(request.getParameter("content"));
		
		adminBoardDAO dao = new adminBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		if(result == 1) {
			System.out.println("admin 글작성 성공");
			response.sendRedirect("../../view/board/admin.jsp");
		}
		else {
			System.out.println("admin 글작성 실패");
			request.getRequestDispatcher("../../view/board/admin_write.jsp").forward(request, response);
		}
%>
