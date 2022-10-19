<%@ page import="usermember.MemberDTO" %>
<%@ page import="usermember.MemberDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 비밀번호 찾기 폼으로 받은 name id email
String userName = request.getParameter("user_name");
String userId = request.getParameter("user_id");
String userEmail = request.getParameter("user_email");

System.out.println(userName);
System.out.println(userId);
System.out.println(userEmail);


// usermember테이블 DAO 생성
MemberDAO dao = new MemberDAO();

//dao 회원정보 일치 확인 처리 
int result = dao.findPassword(userName, userId, userEmail);
dao.close();

//회원정보 일치 성공 여부에 따른 처리
if(result == 1){
	
	// 회원정보 일치 성공
	session.setAttribute("UserId", userId);
	response.sendRedirect("../view/board/passUpdate_view.jsp");

}else{
	
	// 회원정보 일치 실패
	PrintWriter script = response.getWriter();
	script.println("<script> ");
	script.println("alert('회원정보가 맞지 않습니다.')");
	script.println("history.back()");
	script.println("</script> ");

}
%> 