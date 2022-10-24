<%@page import="board3.offerBoardDTO"%>
<%@page import="board3.offerBoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");
content = content.replace("\r\n","<br>");

System.out.print(num);
System.out.print(title);
System.out.print(content);
offerBoardDAO dao = new offerBoardDAO();

	
int upResult = dao.updateEdit(title, content, num);
dao.close();

if(upResult == 1){
	response.sendRedirect("../../view/board/offer_view.jsp?onum=" + num);
}
else{
	JSFunction.alertBack("수정에 실패하였습니다.", out);
}

%>