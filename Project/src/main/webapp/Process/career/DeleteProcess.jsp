<%@page import="like.likeBoardDAO"%>
<%@page import="board2.careerBoardDTO"%>
<%@page import="board2.careerBoardDAO"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUtils"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("pnum");
careerBoardDAO dao = new careerBoardDAO();
careerBoardDTO dto = dao.selectView(num);
likeBoardDAO ldao = new likeBoardDAO();
// 로그인된 사용자 ID 얻기
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;
int likeResult = 0;

	dto.setNum(num);
	dao.posetdeleteCom(num);
	dao.reportdelete(num);
	
	delResult = dao.deletePost(dto);
	likeResult = ldao.deleteLike(Integer.parseInt(num), 2);
	
	dao.close();
	ldao.close();
	
	if(delResult == 1 && likeResult >= 0){
		//성공 ) 목록 페이지로 이동
		String FileName = dto.getFilename();
		dao.deleteFile(request, "/Uploads", FileName);
		JSFunction.alertLocation("삭제되었습니다", "../../view/board/career.jsp", out);
	}// 실패 ) 이전 페이지로 이동
	else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
%>  