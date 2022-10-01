<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="utils.JSFunction"%>
<%@ page import="java.io.File"%>
<%@page import="board1.skillBoardDAO"%>
<%@page import="board1.skillBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/Uploads");
int maxPostSize = 2000 * 1024;
String encoding = "UTF-8";
try {
	// 	객체 생성
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	String num = mr.getParameter("num");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	
	skillBoardDAO dao = new skillBoardDAO();
	skillBoardDTO dto = dao.selectView(num);
	
	String FileName = dto.getFilename();
	dao.deleteFile(request, "/Uploads", FileName);
	
	// dto에 폼값 받기
	dto.setTitle(title);
	dto.setContent(content);
	dto.setNum(num);
	
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
		
	int upResult = dao.updateEdit(dto);
	dao.close();
	
	if(upResult == 1){
		response.sendRedirect("../../view/board/skill_view.jsp?num=" + num);
	}
	else{
		JSFunction.alertBack("수정에 실패하였습니다.", out);
	}
	
} catch (Exception e) {
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일게시물 업데이트 오류");
}
%>