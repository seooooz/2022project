<%@ page import="userMember.MemberDTO" %>
<%@ page import="userMember.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 폼으로 받은 name id pw
String userName = request.getParameter("user_name");
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

// usermember테이블 DAO를 통해 회원정보 DTO 얻기
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.insertMemberDTO(userName, userId, userPwd);
dao.close();

// 로그인 성공 여부에 따른 처리
if(dto.getName() != null){
	// 로그인 성공
	session.setAttribute("UserId", dto.getId());
	session.setAttribute("UserName", dto.getName());
	response.sendRedirect("../view/board/index.jsp");
}
else{
	// 로그인 실패
	request.setAttribute("LoginErrMsg", "회원가입 오류입니다.");
	request.getRequestDispatcher("../view/board/register.jsp").forward(request, response);
}
%> 