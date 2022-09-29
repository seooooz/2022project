<%@page import="utils.JSFunction"%>
<%@page import="board3.offerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = (String)session.getAttribute("UserId");
String pnum = request.getParameter("pnum");
String reply = request.getParameter("reply");
String comidx = request.getParameter("comidx");

System.out.println(comidx);
System.out.println(pnum);

offerBoardDAO dao = new offerBoardDAO();


int result = dao.offerinsertreply(id, pnum, reply,comidx);
dao.close();

if(result == 1) {
	System.out.println("offer 대댓글 성공");
	response.sendRedirect("../../view/board/offer_view.jsp?onum=" + request.getParameter("pnum"));
}
else {
	System.out.println("offer 대댓글 실패");
	JSFunction.alertBack("대댓글 실패", out);
}
%>    