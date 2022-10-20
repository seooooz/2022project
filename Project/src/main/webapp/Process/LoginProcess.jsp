<%-- <%@page import="java.io.PrintWriter"%> --%>
<%@page import="utils.JSFunction"%>
<%@ page import="usermember.MemberDTO" %>
<%@ page import="usermember.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 폼으로 받은 id pw
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

// usermember테이블 DAO를 통해 회원정보 DTO 얻기
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.selectMemberDTO(userId, userPwd);

dao.close();

// 로그인 성공 여부에 따른 처리
if(dto.getId() != null){
	// 로그인 성공
	session.setAttribute("UserId", dto.getId()); 		// 세션 생성
	session.setAttribute("UserName", dto.getName());
	JSFunction.alertLocation(response, dto.getName()+"님 로그인 하셨습니다.", "../view/board/index.jsp");
// 	response.sendRedirect("../view/board/index.jsp");
}
else{
	// 로그인 실패
	JSFunction.alertBack("로그인 정보가 틀립니다.", out);
}
%> 