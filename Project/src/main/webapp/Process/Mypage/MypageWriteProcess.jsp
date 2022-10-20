<%@ page import="board5.HtagDAO"%>
<%@ page import="board5.HtagDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String htag = request.getParameter("htag");
HtagDTO hdto = new HtagDTO();
hdto.setHid(session.getAttribute("UserId").toString());
hdto.setHtag(htag);


HtagDAO dao = new HtagDAO();
int iResult2 = dao.insertMypageDTO2(hdto);
dao.close();

if (iResult2 ==1) {
	response.sendRedirect("../../view/board/loginProfile.jsp");
} else {
	response.sendRedirect("../../view/board/loginProfilewrite.jsp");
}
%>
