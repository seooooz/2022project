<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="board.BoardDAO"%> --%>
<%-- <%@ page import="board.BoardVO"%> --%>
<%@ page import="board1.QDAO"%>
<%@ page import="board1.QDTO"%>
<%-- <%@ page import="board.BoardVO"%> --%>
<%@ page import="java.util.*"%>
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
<body>
	<%
	// 메인 페이지로 이동 했을때 세션에 값이 담겨있는지 체크
			String UserId2 = null;
			if (session.getAttribute("UserId") != null) {
		UserId = (String) session.getAttribute("UserId");
			}
	%>
	<!-- content body start -->
	<div class="content-body" align="center">
		<div class="col-lg-8">
			<!-- card start -->
			<div class="card">
				<div class="card-header">
					<h4 id="teqh" class="card-title">기술</h4>
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
					<div class="search_flex search_bar search_icon  navbar-collapse">
						<form class="search_item">
							<input class="form-control" type="search" placeholder="Search"
								aria-label="Search">
						</form>
						&nbsp;
						<button class="mdi mdi-magnify btn btn-primary" onclick="#"></button>
					</div>
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
													<%
													QDAO fDao = new QDAO();
																																			ArrayList<QDTO> list = fDao.selectAllBoard();
																																			for (int i = 0; i < list.size(); i++) {
													%>
													<tr>
														<td><%=list.get(i).getNum()%></td>
														<td><%=list.get(i).getTitle()%></td>
														<td><%=list.get(i).getId()%></td>
														<td><%=list.get(i).getPostdate()%></td>
														<td><%=list.get(i).getVisitcount()%></td>
													</tr>
													<%
													}
													%>
												</tbody>
											</table>
										</div>

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
</body>
<%@include file="../includes/footer.jsp"%>