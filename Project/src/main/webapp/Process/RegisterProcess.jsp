<%@page import="java.io.PrintWriter"%>
<%@ page import="usermember.MemberDTO" %>
<%@ page import="usermember.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 회원가입 폼으로 받은 name id pw
String userName = request.getParameter("user_name");
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
String userEmail = request.getParameter("user_email");

System.out.println(userName);
System.out.println(userId);
System.out.println(userPwd);
System.out.println(userEmail);


// usermember테이블 DAO를 통해 회원정보 DTO 얻기
MemberDAO dao = new MemberDAO();
MemberDTO dto = new MemberDTO(userName,userId,userPwd,userEmail);

int result = dao.insertMemberDTO(dto);
dao.close();

// 회원가입 성공 여부에 따른 처리
if(result == 1){
	// 회원가입 성공
	PrintWriter script = response.getWriter();
	script.println("<script> ");
	script.println("alert('회원가입이 완료되었습니다.')");
	script.println("location.href='../view/board/login.jsp' ");
	script.println("</script> ");
}
else{
	// 회원가입 실패
	request.setAttribute("LoginErrMsg", "회원가입 오류입니다.");
	request.getRequestDispatcher("../view/board/register.jsp").forward(request, response);
}
%> 