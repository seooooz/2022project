<%@page import="like.likeBoardDAO"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUtils"%>
<%@page import="utils.JSFunction"%>
<%@page import="board1.skillBoardDAO"%>
<%@page import="board1.skillBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("pnum");
skillBoardDAO dao = new skillBoardDAO();

skillBoardDTO dto = dao.selectView(num);

// 로그인된 사용자 ID 얻기
String sessionId = session.getAttribute("UserId").toString();

	int delResult = 0;

	dto.setNum(num);
	dao.reportdelete(num);
	
	
	dao.close();
	
	if(delResult == 0){
		//성공 ) 목록 페이지로 이동
		JSFunction.alertLocation("반려되었습니다", "../../view/board/admin.jsp", out);
	}
	// 실패 ) 이전 페이지로 이동
	else{
		JSFunction.alertBack("반려에 실패하였습니다.", out);
	}
%>  