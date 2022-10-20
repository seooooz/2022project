<%@ page import="usermember.MemberDTO" %>
<%@ page import="usermember.MemberDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 비밀번호 변경 폼으로 받은 id(session에 값 저장) pw
String userId = session.getAttribute("UserId").toString();
String userPass = request.getParameter("user_pwck");

System.out.println(userId);
System.out.println(userPass);



// usermember테이블 DAO생성
MemberDAO dao = new MemberDAO();

// dao 회원 비밀번호 변경
int result = dao.updatePassword(userId, userPass);
dao.close();
System.out.println("회원 비밀번호 업데이트 : "+result);

// 회원 비밀번호 변경 성공 여부에 따른 처리
if(result == 1){
	// 회원정보 일치 성공
	session.invalidate();
	PrintWriter script = response.getWriter();
	script.println("<script> ");
	script.println("alert('비밀번호가 변경이 완료되었습니다.')");
	script.println("location.href='../view/board/login.jsp' ");
	script.println("</script> ");

}else{
	// 회원 비밀번호 변경 실패
	PrintWriter script = response.getWriter();
	script.println("<script> ");
	script.println("alert('비밀번호 변경에 실패하였습니다.')");
	script.println("history.back()");
	script.println("</script> ");
}
%> 