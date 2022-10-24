<%@page import="admin.adminBoardDTO"%>
<%@page import="admin.adminBoardDAO"%>
<%@page import="utils.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="board3.offerBoardDAO"%>
<%@ page import="board3.offerBoardDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="utils.Paging"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%
	offerBoardDAO dao = new offerBoardDAO();
	adminBoardDAO adao = new adminBoardDAO();

	//뷰에 전달할 매개변수 저장용 맵 생성
	Map<String, Object> map = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null) {
		// 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
		map.put("searchField", searchField);
		map.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(map); // 게시물 개수
	
	/* 페이지 처리 start*/
	
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	
	// 현재 페이지 확인
	int pageNum = 1; // 기본값
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp != null && !pageTemp.equals(""))
		pageNum = Integer.parseInt(pageTemp);	// 요청받은 페이지로 수정
	
	// 목록에 출력할 게시물 범위 계산
	int start = (pageNum -1) * pageSize + 1; // 첫 게시물 번호
	int end = pageNum * pageSize;	// 마지막 게시물 번호
	map.put("start", start);
	map.put("end", end);
	/* 페이지 처리 end*/
	
	// 게시물 목록 받기
	List<offerBoardDTO> boardLists = dao.selectListPage(map);
	List<adminBoardDTO> adminLists = adao.selectView(3);
	dao.close();
%>
<script>
	function validateForm(form) {
		alert("로그인 후 이용할 수 있습니다.");
	}
	function popup(idc) {
		var oid = idc;
		var url = "<c:url value='/view/board/oother.jsp?oid=" + oid + "'/>";
		window.open(url, "test", "width=600,height=600");
	}
   
</script>
<style>
.form-control{
	background: #fff;
    border: 1px solid #eaeaea;
    color: #454545;
	width: 100px !important;
}
</style>
<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 id="teqh" class="card-title">팀 구하기</h4>
				<!-- 로그인 x => 글쓰기 안됨 -->
				<%
				if (UserId == null) {
				%>
				<input type="button" class="btn btn-primary" value="글쓰기"
					onclick="return validateForm(this);">
				<%
				} else {
				%>
				<input type="button" class="btn btn-primary" value="글쓰기"
					onclick="location.href='/view/board/offer_write.jsp'">
				<%
				}
				%>
			</div>

			<!-- 검색창 시작 -->
			<form method="get">
				<div class="search_flex search_bar search_icon  navbar-collapse ">
					<select name="searchField" class="form-control">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input class="search_item form-control" name="searchWord" type="text"
							placeholder="Search">
					&nbsp;
					<button type="submit" class="mdi mdi-magnify btn btn-primary"></button>
				</div>
			</form>
			<!-- 검색창 끝 -->

			<div class="card-body">
				<!-- 테이블 버튼 시작 (전체, 코드, 기타) -->
				<div class="profile-tab">
					<!-- 카테고리 수정 -->
					<div class="custom-tab-1">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a href="#my-posts" data-toggle="tab"
								class="nav-link active show">전체</a></li>
						</ul>
						<!-- 카테고리 안에 내용물 수정-->
						<div class="tab-content">
							<div id="my-posts" class="tab-pane fade active show">

								<div class="my-post-content pt-3">
									<div class="table-responsive">
										<ul class="table mb-0">
					<!-- OFFER 게시판 목록 start  -->
					<%
					for(adminBoardDTO admdto : adminLists){
							%>
							<div style="background-color: #f5f5ff;">
								<div class="flex flex-1 report">
									<div class="items-center gap-x-3">관리자</div>
									<div  class="items-center gap-x-3">
									<i class="bi bi-megaphone-fill"></i>
									<a class="report" href="admin_view.jsp?anum=<%=admdto.getAnum()%>"><%=admdto.getTitle()%></a>
									</div>
									<div class="items-center gap-x-3"><%=admdto.getPostdate() %></div>
								</div>
							</div>
							<br>	
									<%
									}
									%>
							<!-- 게시물이 없을 때 -->
						<div>
							<%
							if(boardLists.isEmpty()){   
							%>
								<li>
									<div align="center">
										등록된 게시물이 없습니다.
									</div>
								</li>
							<%
							} else {
								int virtualNum = 0;
								int countNum = 0;
								
								for (offerBoardDTO dto : boardLists) {
									virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
							%>
							<!-- 게시물이 있을 때 -->
						<div>
						<ul class="paper_list f">
							<li class="py-4">
							<div class="flex flex-col ">
								<div class="flex flex-1 items-center gap-x-3">
									<div class="flex items-center gap-x-3"> <!-- id -->
										<i class="bi bi-person-fill"></i>
                              							<a class="f" href="javascript:popup('<%=dto.getId()%>')"><%=dto.getId()%></a>
									</div>
									<div class="flex items-center gap-x-4">
										<div><i class="bi bi-eye pull-right"></i></div>
										<div><%= dto.getVisitcount() %></div>
									</div>
								</div>	
								<div class="my-2 flex" align="left"> <!-- 제목(링크) -->
									<div class="flex items-center gap-x-3 mt-5">
									
									<%
									offerBoardDAO dao1 = new offerBoardDAO();
									int comcount = dao1.countCom(Integer.valueOf(dto.getNum()));
									dao1.close();
									%>
									<a class="f flex items-center gap-x-3 title_a" href = "offer_view.jsp?onum=<%= dto.getNum()%>"><%= dto.getTitle() %></a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="bi bi-chat-left-dots">&nbsp;<%=comcount%></span>
									</div>
								</div>
								<div class="flex flex-1 mt-5">
									<div class="flex items-center gap-x-3">
										<div class="flex items-center gap-x-3"><%= dto.getCate() %></div>
										<div class="flex items-center gap-x-3">총 <%= dto.getMemNum() %>명</div>
									</div>	
									<div class="flex items-center gap-x-3">
										<div>마감일 : <%= dto.getDday() %></div>
									</div>
								</div>
							</div>
							</li>
						</ul>
						</div>
						</div>		
						<%}
							}
								%>
					<!-- OFFER 게시판 목록 end  -->
										</ul>
										<BR>
										<BR>
									</div>
									<!--                      기술 게시판 페이징 기능 start  -->
									<div>
										<%= Paging.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
									</div>
										<!--                      기술 게시판 페이징 기능 end  -->
								</div>
							</div>
							<!-- 전체 -->
							
						</div>
					</div>
				</div>
				<!-- 테이블 버튼 시작 (전체, 코드, 기타) -->
			</div>
		</div>
		<!-- card end -->
	</div>
</div>
<!-- content body end -->

<%@include file="../includes/footer.jsp"%>