<%@page import="board2.careerBoardDAO"%>
<%@page import="board2.careerBoardDTO"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("Uploads");
int maxPostSize = 1024 * 1000;
String encoding = "UTF-8";

try {
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	String id = mr.getParameter("UserId"); // 업로드시에만 사용
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	for(String s :cateArray){
		cateBuf.append(s);
	}
	
	// dto에 폼값 받아오기
	careerBoardDTO dto = new careerBoardDTO();
	dto.setId(session.getAttribute("UserId").toString());
	dto.setTitle(title);
	dto.setContent(content);
	dto.setCate(cateBuf.toString());
	
	// filename, filesize => 없는 경우 (파일을 올리지 않을 경우, 파일 올릴경우)
	String filename = mr.getFilesystemName("attachedFile");
	// 사용자가 보낸 파일명을 읽어 온다

	if(filename == null) // 파일을 올리지 않을 경우
	{
		dto.setFilename("첨부파일 없음");
		dto.setFilesize(0);
	}
	else {	// 파일 올릴 경우
		File file = new File(saveDirectory + File.separator + filename);
		dto.setFilename(filename);
		dto.setFilesize((int)file.length());
	}
	// db에 삽입
	careerBoardDAO dao = new careerBoardDAO();
	dao.insertWrite(dto);
	dao.close();
	// skill.jsp에 저장
	response.sendRedirect("../../view/board/career.jsp");
} catch (Exception e) {
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일 업로드 오류");
// 	request.getRequestDispatcher("/view/board/skill.jsp").forward(request,response);
}
%>
