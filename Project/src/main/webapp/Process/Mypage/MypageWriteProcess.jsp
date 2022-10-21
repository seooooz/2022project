<%@ page import="board5.HtagDAO"%>
<%@ page import="board5.HtagDTO"%>
<%@ page import= "utils.JSFunction"%>
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

if(iResult2 ==1 ){
	JSFunction.alertBack2("수정 되었습니다.", out);
}
else{
	JSFunction.alertLocation("수정을 실패하였습니다.","../../view/board/loginProfilewrite.jsp", out);
}
%>
