<%@page import="like.likeBoardDAO"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUtils"%>
<%@page import="utils.JSFunction"%>
<%@page import="board1.skillBoardDAO"%>
<%@page import="board1.skillBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("pnum");
skillBoardDAO dao = new skillBoardDAO();
likeBoardDAO ldao = new likeBoardDAO();

skillBoardDTO dto = dao.selectView(num);

// 로그인된 사용자 ID 얻기
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;
int likeResult = 0;

	dto.setNum(num);
	dao.posetdeleteCom(num);
	dao.reportdelete(num);
	
	delResult = dao.deletePost(dto);
	likeResult = ldao.deleteLike(Integer.parseInt(num), 1);
	
	dao.close();
	ldao.close();
	
	if(delResult == 1 && likeResult > 0){
		//성공 ) 목록 페이지로 이동
		String FileName = dto.getFilename();
		dao.deleteFile(request, "/Uploads", FileName);
		JSFunction.alertLocation("삭제되었습니다", "../../view/board/skill.jsp", out);
	}// 실패 ) 이전 페이지로 이동
	else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
%>  