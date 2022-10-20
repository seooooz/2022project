<%@ page import="board4.SetBoardDTO" %>
<%@ page import="board4.SetBoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");
String code = request.getParameter("code");
String num = request.getParameter("num");
System.out.println("==========세팅글삭제start=========");
System.out.println("게시글 : " + title);
System.out.println("게시판 코드 : " + code);
System.out.println("게시판 번호 : " + num);
System.out.println("==========세팅글삭제end=========");

SetBoardDAO dao = new SetBoardDAO();
int result = dao.SetboardDelete(num, code, title);
System.out.println("resulte = " + result);
// 회원 비밀번호 변경 성공 여부에 따른 처리

if(result == 1){
	
	PrintWriter script = response.getWriter();
	script.println(" <script> ");
	script.println(" alert('게시글 삭제가 완료되었습니다.')");
	
	if(code.equals("1")||code.equals("2")){
		script.println(" location.href='/view/board/setNotice_list.jsp' ");
	}else{
		script.println(" location.href='/view/board/userNotice_list.jsp' ");		
	}
	script.println(" </script> ");
	
}else{
	// 게시글 삭제  실패
	PrintWriter script = response.getWriter();
	script.println("<script> ");
	script.println("alert('글 삭제에 실패하였습니다.')");
	script.println("history.back()");
	script.println("</script> ");
}
dao.close();
%> 