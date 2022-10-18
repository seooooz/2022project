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
<%@page import="board5.MypageDAO"%>
<%@page import="board6.htagDTO"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="utils.Paging"%>

<%
MypageDAO mdao = new MypageDAO();
ArrayList<htagDTO> list = mdao.selectMypageDTO2(UserId);
%>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		var tag = {};
		var counter = 0;
		//     var counter2 =0;

		// 입력한 값을 태그로 생성한다.
		function addTag(value) {
			tag[counter] = value;
			counter++; // del-btn 의 고유 id 가 된다.
		}

		// tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
		function marginTag() {
			return Object.values(tag).filter(function(word) {
				return word !== "";
			});
		}

		// 서버에 제공
		$("#tag-form").on("submit", function(e) {
			var value = marginTag(); // return array
			$("#rdTag").val(value);
			$(this).submit();
		});
		$("#tag").on("keypress", function(e) {
			var self = $(this);

			//엔터나 스페이스바 눌렀을때 실행
			if (e.keyCode == 32) {

				var tagValue = self.val(); // 값 가져오기

				// 해시태그 값 없으면 실행X
				if (tagValue !== "") {

					// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
					var result = Object.values(tag).filter(function(word) {
						return word === tagValue;
					})

					// 해시태그가 중복되었는지 확인
					if (result.length == 0) {
						$("#tag-list").append("#" + tagValue +" ");
						addTag(tagValue);
						self.val("");
					} else {
						alert("태그값이 중복됩니다.");
					}
				}
				e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지

			}
		});
	})
</script>
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
</script>


<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">
	<div class="container-fluid">
		<div class="row page-titles mx-0">
			<div class="col-sm-6 p-md-0">
				<div class="welcome-text">
					<input type="text" style="border: none;" name="user" size=30
						value="<%=session.getAttribute("UserName")%> 회원님, 로그인하셨습니다.">
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
						<form name="qwriteFrm" method="post"
							action="../../Process/Mypage/MypageWriteProcess.jsp">
							<p>
								*Enterkey를 누르면 자동 수정 완료
								<button type="submit" style="float: right;">수정 완료</button>
							<div class="col-lg-9 row page-titles mx-0">
								<div class="row">
									<div class="col">
										<h3 class="text-primary"><%=session.getAttribute("UserId")%></h3>
									</div>
										<div class="row">
											<div class="col">
												<h3 class="text-muted">Email</h3>

											</div>
										</div>
								</div>
								<div\
									class="profile-skills pt-2 border-bottom-1 pb-2 text-center">
									<br>
									<h4 class="text-primary mb-4">Skills</h4>
									<div class="tr_hashTag_area text-center ">
										<input type="hidden" value="" name="tag" id="rdTag" /> <input
											type="text" class="input-text" id="tag" size="7"
											placeholder="스페이스 키로 해시태그를 등록해주세요." style="width: 300px;">
										<p>
											*최대 5개만 가능 <br>

											<textarea id="tag-list" name="htag"></textarea>
									</div>
								</div>
							</div>
						</form>
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
