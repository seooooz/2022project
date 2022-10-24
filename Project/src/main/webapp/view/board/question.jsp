<%@page import="board4.QuestionBoardDTO"%>
<%@page import="board4.QuestionBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="utils.Paging"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

<%
String User_Id = (String)session.getAttribute("UserId");
	System.out.println(User_Id);
	// DAO를 생성해 DB에 연결
	QuestionBoardDAO dao = new QuestionBoardDAO();
	
	// 사용자가 입력한 검색 조건을 Map에 저장
	Map<String, Object> param = new HashMap<String, Object>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
		
	}
	
	int totalCount = dao.selectCount(param); // 게시물 수 확인
	List<QuestionBoardDTO> questionList = dao.selectList(param); // 게시물 목록 받기
	dao.close();
%>
<script>


	function validateForm(form) {
		alert("로그인 후 이용할 수 있습니다.");
	}
	
	function validateForm2() {
		alert("본인이 작성한 글이 아닙니다.");
	}
	
	function pwdCheckForm(args1,args2) {
		var qnum = args1;
		var qid = args2;
		alert(args1);
		window.open("<c:url value='/view/board/questionPwdCheck.jsp?qnum="
				+ qnum + "&qid="+qid+"'/>", "PassWordCheck", "width=500, height=500");

	}
	function popup(idc) {
		var qid = idc;
		var url = "<c:url value='/view/board/qother.jsp?qid=" + qid + "'/>";
		window.open(url, "test", "width=600,height=600");
	}
</script>


<!-- content body start -->
<div class="content-body" align="center" style="color:black;">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 id="teqh" class="card-title">문의사항</h4>
				<!-- 로그인 x => 글쓰기 안됨 -->
				<%
				if (User_Id == null) {
				%>
				<input type="button" class="btn btn-primary" value="글쓰기"
					onclick="return validateForm(this);">
				<%
				} else {
				%>
				<input type="button" class="btn btn-primary" value="글쓰기"
					onclick="location.href='/view/board/question_write.jsp'">
				<%
				}
				%>
			</div>

			<!-- 검색창 시작 -->
			<form method="get">
				<div class="search_flex search_bar search_icon  navbar-collapse ">
					<select name="searchField">
						<option value="qtitle">제목</option>
						<option value="qid">아이디</option>
					</select> <input class="search_item form-control" name="searchWord"
						type="text" placeholder="Search Input"> &nbsp;
					<button type="submit" class="mdi mdi-magnify btn btn-primary"></button>
				</div>
			</form>
			<!-- 검색창 끝 -->

			<div id="top-content" class="card-body">
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
										<table class="table mb-0">
											<thead>
												<tr class="f" align="center">
													<th class="f" width="10%">NO</th>
													<th class="f" width="40%">제목</th>
													<th class="f" width="15%">작성자</th>
													<th class="f" width="20%">처리 상태</th>
													<th class="f" width="15%">작성일</th>

												</tr>
											</thead>
											<tbody>
												<!-- 기술 게시판 목록 start  -->
												<%
												// 게시물이 없을떄
												if (questionList.isEmpty()){
												%>
												<tr>
													<td colspan="5" align="center">등록된 게시물이 없습니다.^^*</td>
												</tr>
												<%
												// 게시물이 있을때
												} else {
												int virtualNum = 0;
												for (QuestionBoardDTO dto : questionList){
												virtualNum= totalCount--;
												String qid = dto.getQid();
												%>
												<tr class="f">
													<td class="f" align="center"><%= virtualNum %></td>
													<td  class="f" >
														<%
															if(User_Id == null || User_Id.equals("null")){
														%> 
															
															<a class="f" href="#" onclick="return validateForm(this);" ><%=dto.getQtitle() %></a>
														
														<%
															}else if(User_Id.equals("admin")){
														%>	
															
															<a class="f" href="question_view.jsp?qnum=<%=dto.getQnum()%>"><%=dto.getQtitle()%></a>
														<%
															}else if(!(User_Id.equals(qid))){
														%>
															<a class="f" href="#" onclick="return validateForm2();"><%=dto.getQtitle() %></a>
														<%
															}else{
														%> 
															<a class="f" href="javascript:pwdCheckForm(<%=dto.getQnum()%>,'<%=dto.getQid()%>')"><%=dto.getQtitle() %></a>
														
														<%
														}
														%>
													</td>
													<td class="f" align="center"><a class="f" href="javascript:popup('<%=dto.getQid()%>')"><%=dto.getQid()%></a></td>
													<%
													QuestionBoardDAO dao1 = new QuestionBoardDAO();
													int countcom = dao1.countCom(dto.getQnum());
													dao1.close();
													if(countcom > 0){
													%>
													<td align="center" style="color:blue;">답변 완료</td>
													<%}else { %>
													<td align="center" style="color:red;">등록</td>
													<%} %>
													<td class="f" align="center"><%=dto.getQpostdate()%></td>
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