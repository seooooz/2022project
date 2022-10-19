<%@page import="utils.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="board3.offerBoardDAO"%>
<%@ page import="board3.offerBoardDTO"%>
<%@ page import="board4.SetBoardDAO"%>
<%@ page import="board4.SetBoardDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="utils.Paging"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%
offerBoardDAO dao = new offerBoardDAO();

//뷰에 전달할 매개변수 저장용 맵 생성
Map<String, Object> map = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	// 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
	map.put("searchField", searchField);
	map.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(map); // 게시물 개수

/* 페이지 처리 start*/

int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize); 
// 현재 페이지 확인
int pageNum = 1; // 기본값
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

// 목록에 출력할 게시물 범위 계산
int start = (pageNum - 1) * pageSize + 1; // 첫 게시물 번호
int end = pageNum * pageSize; // 마지막 게시물 번호
map.put("start", start);
map.put("end", end);
/* 페이지 처리 end*/

// 게시물 목록 받기
List<offerBoardDTO> boardLists = dao.selectListPage(map);

ArrayList<SetBoardDTO> list1 = new ArrayList<SetBoardDTO>();
ArrayList<SetBoardDTO> list2 = new ArrayList<SetBoardDTO>();
SetBoardDAO dao2 = new SetBoardDAO();

list1 = dao2.SetboardList(3);
list2 = dao2.SetboardList(4);
dao.close();
dao2.close();
%>
<script>
function validateForm(form) {
	alert("로그인 후 이용할 수 있습니다.");
	return false;
}
	
	
	function setUpdate(title, code, num){
		var title = title;
		var code = code;
		var num = num;
		location.href="/view/board/userNotice_Update.jsp?title="+title+"&code="+code+"&num="+num;
	}
	
</script>

<style>
#content{
	color: black;
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
</style>


<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 id="teqh" class="card-title">이용방법</h4>
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
					onclick="location.href='/view/board/userNotice_write.jsp'">
				<%
				}
				%>
			</div>

			<div class="card-body">
				<!-- 테이블 버튼 시작 (전체, 코드, 기타) -->
				<div class="profile-tab">
					<!-- 카테고리 수정 -->
					<div class="custom-tab-1">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a href="#text-code" data-toggle="tab"
								class="nav-link active show">글 작성방법</a></li>
							<li class="nav-item"><a href="#offer-code" data-toggle="tab"
								class="nav-link">OFFER</a></li>
						</ul>
						<!-- 카테고리 안에 내용물 수정-->
						<div class="tab-content">
							<div id="text-code" class="tab-pane fade active show">

								<div class="my-post-content pt-3">
									<div class="table-responsive">
										<table class="table mb-0">
										<!-- 게시물이 없을 때 -->
										
											<%
											if (list1.isEmpty()) {
											%>
											<li>
												<div align="center">등록된 게시물이 없습니다^^*</div>
											</li>
											<%
											} else {
											int virtualNum = 0;
											int countNum = 0;

											for (SetBoardDTO dto : list1) {
												virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
											%>
											<!-- 게시물이 있을 때 -->
											<tbody>
												<ul class="paper_list">
													<li class="py-4">
														<div class="flex flex-col ">
															<div class="my-2 flex" align="left">
																<!-- 제목(링크) -->
																<div class="flex flex-1 items-center gap-x-3">
																	<div id="content">
																	<%=dto.getSet_title()%>
																		<div class="pull-right">
																		<input type="button" class="btn btn-primary" 
																			value="글수정"		
																			onclick="setUpdate('<%=dto.getSet_title()%>','<%=dto.getSet_code()%>','<%=dto.getSet_num()%>')">
																		</div>
																	</div>
																	<hr>
																</div>
															</div>

														</div>
													</li>
												</ul>
											
										<%
											}
										}
										%>  
										</tbody>
										
										</table>
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
							<!-- 코드 -->
							<div id="offer-code" class="tab-pane fade">
									<div class="my-post-content pt-3">
										<div class="table-responsive">
											<table class="table mb-0">
												<div>
													<%
													if (list2.isEmpty()) {
													%>
													<span>
														<div align="center">등록된 게시물이 없습니다^^*</div>
													</span>
													<%
													} else {
													int virtualNum = 0;
													int countNum = 0;

													for (SetBoardDTO dto2 : list2) {
														virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
													%>
													<div>
														<ul class="paper_list">
															<li class="py-4">
																<div class="flex flex-col ">
																	<div class="my-2 flex" align="left">
																		<!-- 제목(링크) -->
																		<div class="flex flex-1 items-center gap-x-3">
																			<div id="content">
																				<%=dto2.getSet_title()%>
																				<div class="pull-right">
																					<input type="button" class="btn btn-primary"
																						value="글수정"
																						onclick="setUpdate('<%=dto2.getSet_title()%>','<%=dto2.getSet_code()%>')">
																				</div>
																			</div>
																			<hr>
																		</div>
																	</div>
																</div>
															</li>
														</ul>
													</div>
													
													<%
														}
													}
													%>
												</div>
											</table>
											<BR>
										<BR>
										</div>
										<div>
										<%= Paging.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
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