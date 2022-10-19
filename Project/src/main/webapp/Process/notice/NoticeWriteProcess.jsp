<%@ page import="board4.SetBoardDTO" %>
<%@ page import="board4.SetBoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// post 값 받기
String title = request.getParameter("set-title");
String searchfield = request.getParameter("searchField");
String content = request.getParameter("set-content");
content = content.replace("\r\n","<br>");
String num = request.getParameter("num");

System.out.println("==========세팅글생성start=========");
System.out.println("게시글 : " + title);
System.out.println("게시판 내용 : " + content);
System.out.println("게시판 코드 : " + searchfield);
System.out.println("게시판 번호 : " + num);
System.out.println("==========세팅글생성end=========");

int code = 0;
// 관리자게시판(세팅방법,이용방법)번호 1,2,3,4
if(searchfield.equals("set-java")){
	code = 1;
}else if(searchfield.equals("set-oracle")){
	code = 2;
}else if(searchfield.equals("set-text")){
	code = 3;
}else if(searchfield.equals("set-offer")){
	code = 4;
}

// 관리자게시판(세팅방법,이용방법) 게시글 여부 확인
SetBoardDAO dao = new SetBoardDAO();
int result = dao.SetboardSelect1(code, title);
System.out.println("resulte = " + result);


// 게시글 여부에 따른 처리
if(result == 1){
	dao.SetboardUpdate(num, title, content, code);		
	
	PrintWriter script = response.getWriter();
	script.println(" <script> ");
	script.println(" alert('게시글 수정이 완료되었습니다.')");
	if(code==1 || code==2){
		script.println(" location.href='/view/board/setNotice_list.jsp' ");
	}else{
		script.println(" location.href='/view/board/userNotice_list.jsp' ");		
	}
	script.println(" </script> ");
	
}else if(result == 0){
	PrintWriter script = response.getWriter();
	dao.SetboardInsert(title, content, code);
	
	script.println(" <script> ");
	script.println(" alert('게시글 등록이 완료되었습니다.')");
	if(code==1||code==2){
		script.println(" location.href='/view/board/setNotice_list.jsp' ");
	}else{
		script.println(" location.href='/view/board/userNotice_list.jsp' ");		
	}
	script.println(" </script> ");
	
}
else{
	//게시글 작성 및 업데이트 실패
	PrintWriter script = response.getWriter();
	script.println("<script> ");
	script.println("alert('게시글 등록에 실패하였습니다.')");
	script.println("history.back()");
	script.println("</script> ");
}

dao.close();
%> 