<%@ page import="userMember.MemberDTO" %>
<%@ page import="userMember.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 폼으로 받은 name id pw
String signName = request.getParameter("sign_name");
String signId = request.getParameter("sign_id");
String signPwd = request.getParameter("sign_pw");

// usermember테이블 DAO를 통해 회원정보 DTO 얻기
MemberDAO dao = new MemberDAO();
dao.insertMemberDTO(signName, signId, signPwd);
dao.close();

// 회원가입 성공 여부에 따른 처리
/* if(dto.getName() != null){
	// 회원가입 성공
	session.setAttribute("SignId", dto.getId());
	session.setAttribute("SignName", dto.getName());
	response.sendRedirect("../view/board/login.jsp");
}
else{
	// 회원가입 실패
	request.setAttribute("SignUpErrMsg", "회원가입 오류입니다.");
	request.getRequestDispatcher("../view/board/register.jsp").forward(request, response);
} */
%> 