<%@page import="board2.careerBoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="utils.JSFunction"%>
<%@page import="utils.ReportDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//폼값 DTO에 저장
ReportDTO dto = new ReportDTO();

dto.setTarget_id(Integer.valueOf(request.getParameter("num")));
dto.setId((String)session.getAttribute("UserId"));
dto.setTuid(request.getParameter("tuid"));
dto.setText(request.getParameter("chk_info"));

careerBoardDAO dao = new careerBoardDAO();
int result = dao.reportinsert(dto);
dao.close();

if(result == 1){
	System.out.println("신고하기 성공");
	
	PrintWriter script = response.getWriter();
	script.println("<script>");		
	script.println("alert('신고가 되었습니다.')");
	script.println("opener.parent.location='../../view/board/career_view.jsp?cnum="+Integer.valueOf(request.getParameter("num"))+"'");
	script.println("window.close()");
	script.println("</script>");
	
}
else{
	System.out.println("신고하기 실패");
	
}
%>