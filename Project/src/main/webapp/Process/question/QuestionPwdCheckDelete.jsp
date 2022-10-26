<%@ page import="board4.QuestionBoardDAO" %>
<%@ page import="board4.QuestionBoardDTO" %>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../IsLoggedIn.jsp" %>
<%

	

	String qnum = request.getParameter("qnum");
	String num = request.getParameter("num");

	System.out.println("=========문의사항 비밀 번호 체크 프로세스============");
	System.out.println("문의사항 게시물 번호 : "+ request.getParameter("qnum"));
	System.out.println(qnum);
	System.out.println(num);
	System.out.println("=========문의사항 비밀 번호 체크 프로세스============");
	
	QuestionBoardDAO dao = new QuestionBoardDAO();
	int num1 = Integer.parseInt(qnum);
	dao.posetdeleteCom(num);
	int result = dao.deleteList(num1);
	
	
	System.out.println("resutl : " + result);
	
	if(result == 1){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제되었습니다')");
		script.println("location.href ='../../view/board/question.jsp'");
		script.println("window.close()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 다릅니다.')");
		script.println("window.close()");
		script.println("</script>");
	}

	
	
%>