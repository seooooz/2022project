<%@page import="utils.ReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String brdcode = request.getParameter("brdcode");
String bnum = request.getParameter("brdnum");

ReportDAO dao = new ReportDAO();


if(brdcode.equals("1")){
	response.sendRedirect("../../view/board/skill_view.jsp?num=" + bnum);
}
if(brdcode.equals("2")){
	response.sendRedirect("../../view/board/career_view.jsp?num=" + bnum);
}
if(brdcode.equals("3")){
	response.sendRedirect("../../view/board/offer_view.jsp?onum=" + bnum);
}
%>
