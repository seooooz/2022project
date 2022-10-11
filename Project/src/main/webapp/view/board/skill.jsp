<%@page import="admin.adminBoardDTO"%>
<%@page import="admin.adminBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="board1.skillBoardDAO"%>
<%@ page import="board1.skillBoardDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="utils.Paging"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
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

<%@include file="./skill/paging.jsp" %>
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
							<li class="nav-item"><a href="#skill-code" data-toggle="tab"
								class="nav-link">코드</a></li>
							<li class="nav-item"><a href="#skill-etc"
								data-toggle="tab" class="nav-link">기타</a></li>
						</ul>
						<!-- 카테고리 안에 내용물 수정-->
						<div class="tab-content">
							<div id="my-posts" class="tab-pane fade active show">

								<div class="my-post-content pt-3">
									<div class="table-responsive">
										<table class="table mb-0">
											<thead>
												<tr align="center">
													<th width="10%">NO</th>
													<th width="40%">제목</th>
													<th width="15%">작성자</th>
													<th>작성일</th>
													<th>조회수</th>
													<th>파일</th>
												</tr>
											</thead>
											<tbody>
												<!-- 기술 게시판 목록 start  -->
												<%
												for(adminBoardDTO admdto : adminLists){
												%>
													<tr>
														<td align="center"><i class="bi bi-megaphone-fill"></i></td>
														<!-- 게시물 클릭시 이동할 페이지 --> 
														<td>
														<a href="admin_view.jsp?num=<%=admdto.getNum()%>"><%=admdto.getTitle()%></a>
														</td>
														<td align="center">관리자</td>
														<td align="center"><%=admdto.getPostdate() %></td>
														<td align="center"><%=admdto.getVisitcount() %></td>
													</tr>
														<%
														}
														%>
											
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

														for (skillBoardDTO dto : boardLists) {
														virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
												%>
												<tr>
													<td align="center"><%=virtualNum%></td>
													<td>
														<!-- 게시물 클릭시 이동할 페이지 --> 
														<a href="skill_view.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a>
													</td>
													<td align="center"><%=dto.getId()%></td>
													<td align="center"><%=dto.getPostdate()%></td>
													<td align="center"><%=dto.getVisitcount()%></td>
													<td align="center"><%=dto.getFilename()%></td>
													<td>
<%-- 			<c:if test="${ not empty row.ofile }"> --%>
<%-- 				<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a> --%>
<%-- 			</c:if> --%>
			</td>
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
							<!-- 코드 -->
							<div id="skill-code" class="tab-pane fade">
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
												<tbody>
												<!-- 기술 게시판 목록 start  -->
											
												<%
													if (cdLists.isEmpty()) {
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

														for (skillBoardDTO dto : cdLists) {
														virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
												%>
												<tr>
													<td align="center"><%=virtualNum%></td>
													<td>
														<!-- 게시물 클릭시 이동할 페이지 --> 
														<a href="skill_view.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a>
													</td>
													<td align="center"><%=dto.getId()%></td>
													<td align="center"><%=dto.getPostdate()%></td>
													<td align="center"><%=dto.getVisitcount()%></td>
													<td align="center"><%=dto.getFilename()%></td>
													<td>
<%-- 			<c:if test="${ not empty row.ofile }"> --%>
<%-- 				<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a> --%>
<%-- 			</c:if> --%>
			</td>
												</tr>
												<%
												}
												}
												%>
												<!-- 기술 게시판 목록 end  -->
											</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- 기타 -->
							<div id="skill-etc" class="tab-pane fade">
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
													if (etcLists.isEmpty()) {
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

														for (skillBoardDTO dto : etcLists) {
														virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
												%>
												<tr>
													<td align="center"><%=virtualNum%></td>
													<td>
														<!-- 게시물 클릭시 이동할 페이지 --> 
														<a href="skill_view.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a>
													</td>
													<td align="center"><%=dto.getId()%></td>
													<td align="center"><%=dto.getPostdate()%></td>
													<td align="center"><%=dto.getVisitcount()%></td>
													<td align="center"><%=dto.getFilename()%></td>
													<td>
<%-- 			<c:if test="${ not empty row.ofile }"> --%>
<%-- 				<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a> --%>
<%-- 			</c:if> --%>
			</td>
												</tr>
												<%
												}
												}
												%>
												<!-- 기술 게시판 목록 end  -->
											</tbody>
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