<%@page import="utils.JSFunction"%>
<%@page import="board1.skillBoardDAO"%>
<%@page import="board1.skillBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("pnum");
skillBoardDTO dto = new skillBoardDTO();
skillBoardDAO dao = new skillBoardDAO();
dto = dao.selectView(num);

// 로그인된 사용자 ID 얻기
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;

// if(sessionId.equals(dto.getId())){
	// 작성자 본인
	dto.setNum(num);
	System.out.println(num);
	delResult = dao.deletePost(dto);
	dao.close();
	
	if(delResult == 1){
		//성공 ) 목록 페이지로 이동
		JSFunction.alertLocation("삭제되었습니다", "skill.jsp", out);
	}// 실패 ) 이전 페이지로 이동
	else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
// }
// else{
// 	//작성자 본인이 아니면 이전 페이지
// 	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
// 	return;
// }
%>  