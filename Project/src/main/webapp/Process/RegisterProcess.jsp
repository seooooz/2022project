<%@ page import="userMember.MemberDTO" %>
<%@ page import="userMember.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 회원가입 폼으로 받은 name id pw
String userName = request.getParameter("user_name");
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");


System.out.println(userName);
System.out.println(userId);
System.out.println(userPwd);

// usermember테이블 DAO를 통해 회원정보 DTO 얻기
MemberDAO dao = new MemberDAO();
MemberDTO dto = new MemberDTO(userName,userId,userPwd);

int result = dao.insertMemberDTO(dto);
dao.close();

//회원가입 성공 여부에 따른 처리
if(result == 1){
	// 회원가입 성공
	response.sendRedirect("../view/board/login.jsp");
}
else{
	// 회원가입 실패
	request.setAttribute("LoginErrMsg", "회원가입 오류입니다.");
	request.getRequestDispatcher("../view/board/register.jsp").forward(request, response);
}
%> 