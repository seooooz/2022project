<%@page import="admin.adminBoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String anum = request.getParameter("anum");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	content = content.replace("\r\n","<br>");
	adminBoardDAO dao = new adminBoardDAO();
	
		
	int upResult = dao.updateEdit(title, content, anum);
	dao.close();
	
	if(upResult == 1){
		response.sendRedirect("../../view/board/admin_view.jsp?anum=" + anum);
	}
	else{
		JSFunction.alertBack("수정에 실패하였습니다.", out);
	}
	
%>