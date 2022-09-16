<%@ page import="board1.skillBoardDAO"%>
<%@ page import="board1.skillBoardVO"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String saveDirectory = application.getRealPath("Uploads");
int maxPostSize = 1024 * 1000;
String encoding = "UTF-8";

try {
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	String fileName = mr.getFilesystemName("attachedFile");
	String ext = fileName.substring(fileName.lastIndexOf("."));
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String newFileName = now + ext;

	// 기본 파일이름
	File oldFile = new File(saveDirectory + File.separator + fileName);
	// 기본 파일이름 변경
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);
	// session값 받아오기
	String id = mr.getParameter("UserId");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	for(String s :cateArray){
		cateBuf.append(s+",");
	}
	// dto에 폼값 받아오기
	skillBoardVO dto = new skillBoardVO();
	dto.setId(session.getAttribute("UserId").toString());
	dto.setTitle(title);
	dto.setContent(content);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	// db에 삽입
	skillBoardDAO dao = new skillBoardDAO();
	dao.insertWrite(dto);
	dao.close();
	// skill.jsp에 저장
	response.sendRedirect("/view/board/skill.jsp");
} catch (Exception e) {
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일 업로드 오류");
	request.getRequestDispatcher("/view/board/skill.jsp").forward(request,response);
}
%>
<title>ExWriteProcess</title>
</head>
<body>

</body>
</html>