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
<script>
	function validateForm(form) {
		alert("로그인 후 이용할 수 있습니다.");
	}
	
</script>

<style>

.title_a {
	color: black;
    font-size: 17px;
}

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

.my-2 {
	margin-bottom: 2rem !important;
	margin-top: 2rem !important;
}

.items-center {
	align-items: center;
}

.flex-col { 
	flex-direction: column; 
 } 

.flex {  
      display: flex; 
 }  
 
.flex-1 {
     flex: 1 1 0%; 
} 

.gap-x-3 {
    -moz-column-gap: .75rem;
    column-gap: 0.75rem;
}
.gap-x-4 {
    column-gap: 0.5rem;
}

.paper_list li{
    border-bottom: 1px solid #dee2e6;
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
						</ul>
						<!-- 카테고리 안에 내용물 수정-->
						<div class="tab-content">
							<div id="my-posts" class="tab-pane fade active show">

								<div class="my-post-content pt-3">
									<div class="table-responsive">
										<ul class="table mb-0">
					<!-- OFFER 게시판 목록 start  -->
						<c:choose>
							<c:when test="${ empty boardLists }"> <!-- 게시물이 없을 때 -->
								<li>
									<div align="center">
										등록된 게시물이 없습니다^^*
									</div>
								</li>
							</c:when>
							<c:otherwise> <!-- 게시물이 있을 때 -->
							<c:forEach items = "${ boardLists }" var="row" varStatus="loop">
						<ul class="paper_list">
							<li class="py-4">
							<div class="flex flex-col ">
								<div class="flex items-center gap-x-3">
									<div class="flex flex-1 items-center gap-x-3"> <!-- id -->
										${ row.id }
									</div>
									<div class="flex items-center gap-x-4">
										<div><i class="bi bi-eye pull-right"></i></div>
										<div>${ row.visitcount }</div>
									</div>
								</div>	
								<div class="my-2" align="left"> <!-- 제목(링크) -->
									<a class="title_a" href = "../board/view.do?onum=${ row.num }">${ row.title }</a>
								</div>
								<div class="flex flex-1">
									<div class="flex flex-1 items-center gap-x-3">
										<div class="flex items-center gap-x-3">${ row.cate }</div>
										<div class="flex items-center gap-x-3">총 ${ row.memNum }명</div>
									</div>	
									<div class="flex items-center gap-x-3">
										<div>마감일 : ${ row.dday }</div>
									</div>
								</div>
							</div>
							</li>
						</ul>
							</c:forEach>
							</c:otherwise>
						</c:choose>		
					<!-- OFFER 게시판 목록 end  -->
										</ul>
										<BR>
										<BR>
									</div>
									<!--                      기술 게시판 페이징 기능 start  -->
									<div>
										${ map.pagingImg }
									</div>
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