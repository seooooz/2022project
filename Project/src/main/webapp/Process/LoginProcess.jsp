<%@ page import="java.io.PrintWriter"%>
<%@ page import="usermember.MemberDTO"%>
<%@ page import="usermember.MemberDAO"%>
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

// 현재 세션 상태 체크
String UserId = null;
if (session.getAttribute("UserId") != null) {
	UserId = (String) session.getAttribute("UserId");
}
// // 이미 로그인했으면 회원가입 불가
// if(UserId != null) {
// 	PrintWriter script = response.getWriter();
// 	script.println("<script>");
// 	script.println("alert('이미 로그인 되어 있습니다.')");
// 	script.println("location.herf='/view/board/index.jsp'");
// 	script.println("</script>");
// }
// 로그인 성공 여부에 따른 처리
if (dto.getId() != null) {
	// 로그인 성공
	session.setAttribute("UserId", dto.getId()); // 세션 생성
	session.setAttribute("UserName", dto.getName());
	response.sendRedirect("../view/board/index.jsp");
} else {
	// 로그인 실패
	request.setAttribute("LoginErrMsg", "로그인 오류입니다."); // 세션 생성
	request.getRequestDispatcher("../view/board/login.jsp").forward(request, response);
}
%>
