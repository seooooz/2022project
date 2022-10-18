<%@ page import="board5.MypageDAO"%>
<%@ page import="board5.MypageDTO"%>
<%@ page import="board6.htagDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = session.getAttribute("UserId").toString();
String htag = request.getParameter("htag");

System.out.println(id);
System.out.println(htag);

MypageDAO dao = new MypageDAO();

int delResult = 0;

delResult = dao.deletePost(id);
dao.close();

if(delResult ==1 ){
	JSFunction.alertLocation("삭제되었습니다", "../../view/board/index.jsp", out);
}// 실패 ) 이전 페이지로 이동
else{
	JSFunction.alertBack("삭제에 실패하였습니다.", out);
}

%>
