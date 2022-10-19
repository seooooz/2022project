<%@page import="like.likeBoardDAO"%>
<%@page import="board3.offerBoardDAO"%>
<%@page import="board3.offerBoardDTO"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUtils"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("pnum");
offerBoardDTO dto = new offerBoardDTO();
offerBoardDAO dao = new offerBoardDAO();
likeBoardDAO ldao = new likeBoardDAO();
dto = dao.selectView(num);

// 로그인된 사용자 ID 얻기
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;
int likeResult = 0;

// if(sessionId.equals(dto.getId())){
	// 작성자 본인
	dto.setNum(num);
	dao.posetdeleteCom(num);
	dao.reportdelete(num);
	
	delResult = dao.deletePost(dto);
	likeResult = ldao.deleteLike(Integer.parseInt(num), 3);
	
	dao.close();
	ldao.close();
	
	if(delResult == 1 && likeResult > 0){
		JSFunction.alertLocation("삭제되었습니다", "../../view/board/offer.jsp", out);
	}// 실패 ) 이전 페이지로 이동
	else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
%>  