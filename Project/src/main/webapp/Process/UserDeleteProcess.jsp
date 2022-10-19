<%@ page import="usermember.MemberDTO" %>
<%@ page import="usermember.MemberDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 회원탈퇴 비밀번호 확인 폼으로 받은 name id email
String userId = (String)session.getAttribute("UserId");
String userPw = request.getParameter("user_pw");


System.out.println(userId);
System.out.println(userPw);



// usermember테이블 DAO 생성
MemberDAO dao = new MemberDAO();

//dao 회원탈퇴 확인 처리 
int result = dao.userDelete(userId, userPw);
dao.close();

//회원탈퇴 성공 여부에 따른 처리
if(result == 1){
	// 회원탈퇴 성공
	
	session.invalidate();	//세션 클리어
	PrintWriter script = response.getWriter();
	script.println("<script> ");
	script.println("alert('회원탈퇴가 완료되었습니다.')");
	script.println("location.href='../view/board/index.jsp' ");
	script.println("</script> ");
	
}
else{
	// 회원탈퇴 실패
	PrintWriter script = response.getWriter();
	script.println("<script> ");
	script.println("alert('비밀번호가 틀렸습니다.')");
	script.println("history.back()");
	script.println("</script> ");
	
}
%> 