<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="board1.skillBoardDAO"%>
<%@ page import="board1.skillBoardVO"%>
<%@ page import="java.util.*"%>
<%@ page import="utils.Paging"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%-- <%@include file="../../Process/PageProcess.jsp"%> --%>
<script>
	function validateForm(form) {
		alert("로그인 후 이용할 수 있습니다.");
	}
</script>

<style>
#teqh {
	font-size: 22px;
}

.search_flex {
	display: flex;
	padding: 1.25rem 1.25rem 5px;
}

.search_item {
	flex: 1;
}
</style>

<%
//DAO를 생성해 DB에 연결
skillBoardDAO dao1 = new skillBoardDAO();

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
List<skillBoardVO> boardLists = dao1.selectListPage(param);
dao1.close();
%>
<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 id="teqh" class="card-title">기술</h4>
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
					onclick="location.href='/view/board/skill_write.jsp'">
				<%
				}
				%>
			</div>

			<!-- 검색창 시작 -->
			<form method="get">
				<div class="search_flex search_bar search_icon  navbar-collapse ">
					<select name="searchField">
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
							<li class="nav-item"><a href="#about-me" data-toggle="tab"
								class="nav-link">코드</a></li>
							<li class="nav-item"><a href="#profile-settings"
								data-toggle="tab" class="nav-link">기타</a></li>
						</ul>
						<!-- 카테고리 안에 내용물 수정-->
						<div class="tab-content">
							<div id="my-posts" class="tab-pane fade active show">

								<div class="my-post-content pt-3">
									<div class="table-responsive">
										<table class="table mb-0">
											<thead>
												<tr>
													<th>NO</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성일</th>
													<th>조회수</th>
												</tr>
											</thead>
											<tbody>
												<!-- 기술 게시판 목록 start  -->
											
												<%
												if (boardLists.isEmpty()) {
													// 게시물이 하나도 없을때 -->
												%>
												<tr>
													<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
												</tr>

												<%
												} else {
												// 게시물이 있을 때 -->
												int virtualNum = 0; // 화면상에서의 게시물 번호 
												int countNum = 0;

												for (skillBoardVO vo : boardLists) {
													virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
													
												%>
												<tr>
													<td><%=virtualNum%></td>
													<td>
														<!-- 게시물 클릭시 이동할 페이지 --> 
														<a href="view.jsp?num=<%=vo.getNum()%>"><%=vo.getTitle()%></a>
													</td>
													<td><%=vo.getId()%></td>
													<td><%=vo.getPostdate()%></td>
													<td><%=vo.getVisitcount()%></td>
												</tr>
												<%
												}
												}
												%>
												<!-- 기술 게시판 목록 end  -->
											</tbody>
										</table>
										<BR>
										<BR>
									</div>
									 <div>
										<%= Paging.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
									</div>
									<!--                      기술 게시판 페이징 기능 start  -->
										<!--                      기술 게시판 페이징 기능 end  -->
								</div>
							</div>
							<!-- 전체 -->
							<div id="about-me" class="tab-pane fade">
								<div class="profile-about-me">
									<div class="my-post-content pt-3">
										<div class="table-responsive">
											<table class="table mb-0">
												<thead>
													<tr>
														<th>NO</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일</th>
														<th>조회수</th>
													</tr>
												</thead>

											</table>
										</div>
									</div>
								</div>
							</div>
							<div id="profile-settings" class="tab-pane fade">
								<div class="my-post-content pt-3">
									<div class="table-responsive">
										<table class="table mb-0">
											<thead>
												<tr>
													<th>NO</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성일</th>
													<th>조회수</th>
												</tr>
											</thead>

										</table>
									</div>
								</div>
							</div>
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