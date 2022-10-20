<%@page import="board2.careerBoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = (String)session.getAttribute("UserId");
String pnum = request.getParameter("pnum");
String reply = request.getParameter("reply");
String comidx = request.getParameter("comidx");

System.out.println(comidx);
System.out.println(pnum);

careerBoardDAO dao = new careerBoardDAO();


int result = dao.careerinsertreply(id, pnum, reply,comidx);
dao.close();

if(result == 1) {
	System.out.println("career 대댓글 성공");
	response.sendRedirect("../../view/board/career_view.jsp?num=" + request.getParameter("pnum"));
}
else {
	System.out.println("career 대댓글 실패");
	JSFunction.alertBack("대댓글 실패", out);
}
%>    