<%@ page import="board5.MypageDAO"%>
<%@ page import="board5.MypageDTO"%>
<%@ page import="board6.htagDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String htag = request.getParameter("htag");
htagDTO hdto = new htagDTO();
hdto.setHid(session.getAttribute("UserId").toString());
hdto.setHtag(htag);


MypageDAO dao = new MypageDAO();
int iResult2 = dao.insertMypageDTO2(hdto);
dao.close();

if (iResult2 ==1) {
	response.sendRedirect("../../view/board/loginProfile.jsp");
} else {
	response.sendRedirect("../../view/board/loginProfilewrite.jsp");
}
%>
