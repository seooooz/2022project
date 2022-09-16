<%@ page import="board1.QDAO"%>
<%@ page import="board1.QDTO"%>
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

	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);

	String id = mr.getParameter("UserId");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	for(String s :cateArray){
		cateBuf.append(s+",");
	}

	QDTO dto = new QDTO();
	dto.setId(session.getAttribute("UserId").toString());
	dto.setTitle(title);
	dto.setContent(content);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	
	QDAO dao = new QDAO();
	dao.insertWrite(dto);
	dao.close();
	
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