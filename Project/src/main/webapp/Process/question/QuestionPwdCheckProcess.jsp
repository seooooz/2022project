<%@ page import="usermember.MemberDTO" %>
<%@ page import="usermember.MemberDAO" %>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../IsLoggedIn.jsp" %>
<%

	String login_id = session.getAttribute("UserId").toString();
	String q_id = request.getParameter("qid");
	String user_pw = request.getParameter("user_pw");
	String qnum = request.getParameter("qnum");
	
	System.out.println("=========문의사항 비밀 번호 체크 프로세스============");
	System.out.println("문의사항 게시물 번호 : "+ request.getParameter("qnum"));
	System.out.println("작성자 아이디 : " + q_id);
	System.out.println("게시물 비밀번호 확인 : " + user_pw);
	System.out.println(qnum);
	System.out.println("=========문의사항 비밀 번호 체크 프로세스============");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.selectMemberDTO(q_id, user_pw);
	dao.close();
	
	
	
	if(dto.getId() != null){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");		
		script.println("opener.parent.location='../../view/board/question_view.jsp?qnum="+qnum+"'");
		script.println("window.close()");
		script.println("</script>");
//		request.setAttribute("qnum", qnum);
		
		
//		session.setAttribute("qnum", qnum);
//		response.sendRedirect("../view/board/question_View.jsp");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 다릅니다.')");
		script.println("window.close()");
		script.println("</script>");
	}

	
	
%>