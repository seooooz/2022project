<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="admin.adminBoardDAO"%>
<%@page import="board2.careerBoardDAO"%>
<%@page import="admin.adminBoardDTO"%>
<%@page import="board2.careerBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//DAO를 생성해 DB에 연결
careerBoardDAO dao1 = new careerBoardDAO();
adminBoardDAO adao = new adminBoardDAO();

//사용자가 입력한 검색 조건 Map에 저장
Map<String, Object> param = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
// 게시물 수 확인
int totalCount = dao1.selectCount(param);

/*** 페이지 처리 START ***/
//전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize); 

//현재 페이지 확인
int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정
	
//목록에 출력할 게시물 범위 계산
int start = (pageNum -1) * pageSize + 1;
int end = pageNum * pageSize;
param.put("start", start);
param.put("end", end);
/*** 페이지 처리 END ***/

// 게시물 목록 받기
List<careerBoardDTO> boardLists = dao1.selectListPage(param);
List<careerBoardDTO> cvLists = dao1.selectListCV(param);
List<careerBoardDTO> inLists = dao1.selectListIN(param);
List<careerBoardDTO> etcLists = dao1.selectListETC(param);

List<adminBoardDTO> adminLists = adao.selectView(2);
dao1.close();
%>