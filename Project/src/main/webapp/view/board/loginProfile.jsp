<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board1.skillBoardDTO"%>
<%@page import="board1.skillBoardDAO"%>
<%@page import="board2.careerBoardDTO"%>
<%@page import="board2.careerBoardDAO"%>
<%@page import="board3.offerBoardDTO"%>
<%@page import="board3.offerBoardDAO"%>
<%@page import="board4.QuestionBoardDTO"%>
<%@page import="board4.QuestionBoardDAO"%>
<%@ page import="board5.MypageDAO"%>
<%@ page import="board5.MypageDTO"%>
<%@ page import="board6.htagDTO"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="utils.Paging"%>

<%
MypageDAO mdao = new MypageDAO();
ArrayList<htagDTO> list = mdao.selectMypageDTO2(UserId);
%>

<script type="text/javascript">
	var bDisplay = true;
	document.getElementById("cssTest").style.display = 'none';
	function doDisplay() {
		var pj1 = document.getElementById("cssTest");
		if (pj1.style.display == "none") {
			pj1.style.display = "block";
		} else {
			pj1.style.display = "none";
		}
	}
</script>
<script type="text/javascript">
	var bDisplay = true;
	document.getElementById("cssTest2").style.display = 'none';
	function doDisplay2() {
		var pj2 = document.getElementById("cssTest2");
		if (pj2.style.display == "none") {
			pj2.style.display = "block";
		} else {
			pj2.style.display = "none";
		}
	}
</script>
<script type="text/javascript">
	var bDisplay = true;
	document.getElementById("cssTest3").style.display = 'none';
	function doDisplay3() {
		var pj2 = document.getElementById("cssTest3");
		if (pj2.style.display == "none") {
			pj2.style.display = "block";
		} else {
			pj2.style.display = "none";
		}
	}
</script>
<script type="text/javascript">
	var bDisplay = true;
	document.getElementById("cssTest4").style.display = 'none';
	function doDisplay4() {
		var pj2 = document.getElementById("cssTest4");
		if (pj2.style.display == "none") {
			pj2.style.display = "block";
		} else {
			pj2.style.display = "none";
		}
	}

	function deleditPost(str) {
		var confirmed = confirm("삭제하겠습니까?");
		if (str == '삭제') {
			if (confirmed) {
				var writeFrm = document.writeFrm;
				writeFrm.method = "post";
				writeFrm.action = "../../Process/Mypage/MypageDeleteProcess.jsp";
				writeFrm.submit();
			}
		}
	}
</script>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">
	<div class="container-fluid">
		<div class="row page-titles mx-0">
			<div class="col-sm-6 p-md-0">
				<div class="welcome-text">
					<%=session.getAttribute("UserName")%>
					회원님, 로그인하셨습니다.
				</div>
			</div>
			<div
				class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/view/board/index.jsp">Home</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">Profile</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->
		<div class="row">
			<div class="col-lg-12 ">
				<div class="profile">
					<div class="profile-head">
						<div class="photo-content">
							<div class="cover-photo"></div>
						</div>
						<br>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 ">
				<div class="card">
					<div class="card-body">
						<button type="button" style="float: right;"
							onclick="location.href='/view/board/loginProfilewrite.jsp'">수정
							하기</button>
						<div class="col-lg-9 row page-titles mx-0">
							<div class="row">
								<div class="col">
									<h3 class="text-primary"><%=UserId%></h3>
								</div>
								<div class="col">
									<h3 class="text-muted">Email</h3>
									<p>Email</p>
								</div>
								<%
								if (list.isEmpty()) {
								%>
								<%
								} else {
								%>
								<div
									class="profile-skills pt-2 border-bottom-1 pb-2 text-center">
									<h4>Skills</h4>
									<%
									for (htagDTO hdto : list) {
									%>
									<form name="writeFrm">
										<input type="text" class="btn btn-outline-dark btn-rounded"
											name="htag" value="<%=hdto.getHtag()%>"><a
											href="javascript:deleditPost('삭제');"><i class="bi bi-x"></i></a>
									</form>
								</div>
								<%
								}
								}
								%>
								<%
								mdao.close();
								%>
							</div>
						</div>
						<div class="profile-statistics">
							<div class="text-center mt-4 border-bottom-1 pb-3">
								<div class="row">
									<div class="col">
										<h3 class="m-b-0">150</h3>
										<span>Follower</span>
									</div>
									<div class="col">
										<h3 class="m-b-0">140</h3>
										<span>Place Stay</span>
									</div>
									<div class="col">
										<h3 class="m-b-0">45</h3>
										<span>Reviews</span>
									</div>
								</div>
								<div class="mt-4">
									<a href="javascript:void()"
										class="btn btn-primary pl-5 pr-5 mr-3 mb-4">Follow</a> <a
										href="javascript:void()" class="btn btn-dark pl-5 pr-5 mb-4">Send
										Message</a>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card">
					<div class="card-body">
						<div class="profile-tab">
							<div class="custom-tab-1">
								<ul class="nav nav-tabs">
									<li class="nav-item"><a href="#my-posts" data-toggle="tab"
										class="nav-link active show">게시글</a></li>
									<li class="nav-item"><a href="#about-me" data-toggle="tab"
										class="nav-link">댓글</a></li>
									<li class="nav-item"><a href="#profile-settings"
										data-toggle="tab" class="nav-link">좋아요 누른 글</a></li>
								</ul>
								<div class="tab-content">
									<div id="my-posts" class="tab-pane fade active show">


										<div class="card-header">
											<h4>기술</h4>
											<button style="width: 65px;" class="btn btn-primary"
												onclick="javascript:doDisplay();">보기</button>
										</div>
										<div id="cssTest" style="display: none;">
											<div class="table-responsive">
												<table class="table mb-0">
													<thead>
														<tr>
															<th>NO</th>
															<!-- 														<th>작성자</th> -->
															<th>제목</th>
															<th>작성일</th>
															<th>조회수</th>
															<th>파일</th>
														</tr>
													</thead>
													<tbody>
														<%
														skillBoardDAO sdao = new skillBoardDAO();
														ArrayList<skillBoardDTO> boardlist = sdao.selectskillView(UserId);
														sdao.close();
														for (int i = 0; i < boardlist.size(); i++) {
														%>
														<tr>
															<td><%=boardlist.get(i).getNum()%></td>
															<td><a
																href="skill_view.jsp?num=<%=boardlist.get(i).getNum()%>"><%=boardlist.get(i).getTitle()%></a></td>
															<%-- 														<td><%=boardlist.get(i).getId()%></td> --%>
															<td><%=boardlist.get(i).getPostdate()%></td>
															<td><%=boardlist.get(i).getVisitcount()%></td>
															<td><%=boardlist.get(i).getFilename()%></td>
															<%-- 												<td><%=slist.get(i).getPostdate()%></td> --%>
															<%-- 												<td><%=slist.get(i).getVisitcount()%></td> --%>
														</tr>
														<%
														}
														%>
													</tbody>
												</table>
												<!--                      기술 게시판 페이징 기능 start  -->
												<!--                      기술 게시판 페이징 기능 end  -->
											</div>
										</div>
										<div class="card-header">
											<h4>커리어</h4>
											<button style="width: 65px;" class="btn btn-primary"
												onclick="javascript:doDisplay2();">보기</button>
										</div>
										<div id="cssTest2" style="display: none;">
											<div class="table-responsive">
												<table class="table mb-0">
													<thead>
														<tr>
															<th>NO</th>
															<!-- 														<th>작성자</th> -->
															<th>제목</th>
															<th>작성일</th>
															<th>조회수</th>
															<th>파일</th>
														</tr>
													</thead>
													<tbody>
														<%
														careerBoardDAO cdao = new careerBoardDAO();
														ArrayList<careerBoardDTO> boardlist2 = cdao.selectcareerView(UserId);
														cdao.close();
														for (int i = 0; i < boardlist2.size(); i++) {
														%>
														<tr>
															<td><%=boardlist2.get(i).getNum()%></td>
															<td><a
																href="career_view.jsp?num=<%=boardlist2.get(i).getNum()%>"><%=boardlist2.get(i).getTitle()%></a></td>
															<%-- 														<td><%=boardlist.get(i).getId()%></td> --%>
															<td><%=boardlist2.get(i).getPostdate()%></td>
															<td><%=boardlist2.get(i).getVisitcount()%></td>
															<td><%=boardlist2.get(i).getFilename()%></td>
															<%-- 												<td><%=slist.get(i).getPostdate()%></td> --%>
															<%-- 												<td><%=slist.get(i).getVisitcount()%></td> --%>
														</tr>
														<%
														}
														%>
													</tbody>
												</table>
												<!--                      기술 게시판 페이징 기능 start  -->
												<!--                      기술 게시판 페이징 기능 end  -->
											</div>
										</div>
										<div class="card-header">
											<h4>프로젝트</h4>
											<button style="width: 65px;" class="btn btn-primary"
												onclick="javascript:doDisplay3();">보기</button>
										</div>
										<div id="cssTest3" style="display: none;">
											<div class="table-responsive">
												<table class="table mb-0">
													<thead>
														<tr>
															<th>NO</th>
															<!-- 														<th>작성자</th> -->
															<th>제목</th>
															<th>작성일</th>
															<th>조회수</th>

														</tr>
													</thead>
													<tbody>
														<%
														offerBoardDAO odao = new offerBoardDAO();
														ArrayList<offerBoardDTO> boardlist3 = odao.selectofferView(UserId);
														odao.close();
														for (int i = 0; i < boardlist3.size(); i++) {
														%>
														<tr>
															<td><%=boardlist2.get(i).getNum()%></td>
															<td><a
																href="offer_view.jsp?onum=<%=boardlist3.get(i).getNum()%>"><%=boardlist3.get(i).getTitle()%></a></td>
															<%-- 														<td><%=boardlist.get(i).getId()%></td> --%>
															<td><%=boardlist3.get(i).getPostdate()%></td>
															<td><%=boardlist3.get(i).getVisitcount()%></td>

															<%-- 												<td><%=slist.get(i).getPostdate()%></td> --%>
															<%-- 												<td><%=slist.get(i).getVisitcount()%></td> --%>
														</tr>
														<%
														}
														%>
													</tbody>
												</table>
												<!--                      기술 게시판 페이징 기능 start  -->
												<!--                      기술 게시판 페이징 기능 end  -->
											</div>
										</div>
										<div class="card-header">
											<h4>문의사항</h4>
											<button style="width: 65px;" class="btn btn-primary"
												onclick="javascript:doDisplay4();">보기</button>
										</div>
										<div id="cssTest4" style="display: none;">
											<div class="table-responsive">
												<table class="table mb-0">
													<thead>
														<tr>
															<th>NO</th>
															<!-- 														<th>작성자</th> -->
															<th>제목</th>
															<th>작성일</th>
															<th>조회수</th>

														</tr>
													</thead>
													<tbody>
														<%
														QuestionBoardDAO qdao = new QuestionBoardDAO();
														ArrayList<QuestionBoardDTO> boardlist4 = qdao.selectquestionView(UserId);
														qdao.close();
														for (int i = 0; i < boardlist4.size(); i++) {
														%>
														<tr>
															<td><%=boardlist4.get(i).getQnum()%></td>
															<td><a
																href="question_view.jsp?qnum=<%=boardlist4.get(i).getQnum()%>"><%=boardlist4.get(i).getQtitle()%></a></td>
															<%-- 														<td><%=boardlist.get(i).getId()%></td> --%>
															<td><%=boardlist4.get(i).getQpostdate()%></td>
															<td><%=boardlist4.get(i).getQvisitcount()%></td>

															<%-- 												<td><%=slist.get(i).getPostdate()%></td> --%>
															<%-- 												<td><%=slist.get(i).getVisitcount()%></td> --%>
														</tr>
														<%
														}
														%>
													</tbody>
												</table>
												<!--                      기술 게시판 페이징 기능 start  -->
												<!--                      기술 게시판 페이징 기능 end  -->
											</div>
										</div>


									</div>
									<div id="about-me" class="tab-pane fade"></div>
									<div id="profile-settings" class="tab-pane fade"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--**********************************
            Content body end
        ***********************************-->
<%@include file="../includes/footer.jsp"%>s
