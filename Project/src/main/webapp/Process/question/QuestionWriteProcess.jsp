<%@page import="board4.QuestionBoardDAO"%>
<%@page import="board4.QuestionBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../IsLoggedIn.jsp" %>

<%
//폼 값 받기
	String q_title = request.getParameter("q_title");
	String q_content = request.getParameter("q_content");
	System.out.println(q_title);
	System.out.println(q_content);
	System.out.println(session.getAttribute("UserId").toString());
	
	//폼값을 DTO 객체에 저장
	QuestionBoardDTO dto = new QuestionBoardDTO();
	dto.setQid(session.getAttribute("UserId").toString());
	dto.setQtitle(q_title);
	dto.setQcontent(q_content);
	
	//DAO 객체를 통해 DB에 DTO 저장
	QuestionBoardDAO dao = new QuestionBoardDAO();
	int iResult = dao.insertWrite(dto);
	dao.close();
	
	//성공 or 실패
	if(iResult == 1){
		response.sendRedirect("../../view/board/question.jsp");
	}else{
		JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
	}
%>