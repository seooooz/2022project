<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="usermember.MemberDTO"%>
<%@page import="board1.skillBoardDTO"%>
<%@page import="board1.skillBoardDAO"%>
<%@page import="board2.careerBoardDTO"%>
<%@page import="board2.careerBoardDAO"%>
<%@page import="board3.offerBoardDTO"%>
<%@page import="board3.offerBoardDAO"%>
<%@page import="board4.QuestionBoardDTO"%>
<%@page import="board4.QuestionBoardDAO"%>
<%@ page import="board5.HtagDAO"%>
<%@ page import="board5.HtagDTO"%>
<%@ page import="utils.CommentDTO"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="utils.Paging"%>

<%
HtagDAO mdao = new HtagDAO();
ArrayList<HtagDTO> list = mdao.selectMypageDTO2(UserId);
int result = 0;
int cresult = 0;
result = mdao.selectboardcount(UserId);
cresult = mdao.selectcommentount(UserId);
HtagDAO mdao3 = new HtagDAO();
MemberDTO dto = mdao3.selectMember(UserId);
mdao3.close();
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
		var confirmed = confirm("??????????????????????");
		if (str == '??????') {
			if (confirmed) {
				var writeFrm = document.writeFrm;
				writeFrm.method = "post";
				writeFrm.action = "../../Process/Mypage/MypageDeleteProcess.jsp";
				writeFrm.submit();
			}
		}
		
	}
	
	
	function view(args1, args2) {
		var brdcode = args1;
		var brdnum = args2;
		var form = document.viewfrm;

		form.method = "post";
		form.action = "../../Process/Mypage/MviewProcess.jsp?brdcode="
				+ brdcode + "&brdnum=" + brdnum;
		form.submit();
	}
	
	function popup(idc) {
		var id = idc;
		var url = "<c:url value='/view/board/loginProfileWrite.jsp?id=" + id
				+ "'/>";
		window.open(url, "test", "width=600,height=600");
	}
	
	   function userdelete(){
		      
		      if(confirm("?????? ?????? ???????????????????") == true ){
		         location.href="/view/board/userDelete.jsp";
		      }else{
		         
		         return false ;
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
					<%=(session.getAttribute("UserName"))%>
					?????????, ????????????????????????.
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
					<div class="card-body ">
						<a href="javascript:popup('<%=dto.getId()%>')"
							class="btn btn-primary pl-5 pr-5 mr-3 mb-4" style="float: right;">??????</a>
						<br> <br>
						<div class="row">
							<div class="col">
								<h3 class="text-primary"><%=dto.getId()%></h3>
							</div>
							<div class="col">
								<h3 class="text-muted"><%=dto.getEmail()%></h3>
							</div>
						</div>

						<!--???????????? -->
						<%
						if (list.isEmpty()) {
						%>
						<div class="row">
							<%
							} else {
							%>
							<div class="profile-skills pt-2 border-bottom-1 pb-2 text-center">
								<h4 class="text-primary mb-4">Skills</h4>
								<%
								for (HtagDTO hdto : list) {
								%>
								<form name="writeFrm">
									<input type="text" class="btn btn-outline-dark btn-rounded "
										name="htag" value="<%=hdto.getHtag()%>"><a
										href="javascript:deleditPost('??????');"><i class="bi bi-x"></i></a>
								</form>
								<%
								}
								}
								%>
								<%
								mdao.close();
								%>
							</div>
							<!--???????????? -->
							<div class="profile-statistics">
								<div class="text-center mt-4 border-bottom-1 pb-3">
									<div class="row">
										<!--???????????? ??? ??? ?????? -->
										<div class="col">
											<h3 class="m-b-0"><%=result%></h3>
											<span>Post</span>
										</div>
										<!--???????????? ??? ?????? ?????? -->
										<div class="col">
											<h3 class="m-b-0"><%=cresult%></h3>
											<span>Comment</span>
										</div>
										<div class="mt-4">
										<br><br><br>
											<a href="#" class="dropdown-item" style="float:center;"onclick="userdelete()">
												<i class="icon-key"></i> <span class="ml-2">????????????</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="card">
						<div class="card-body">
							<div class="profile-tab">
								<div class="custom-tab-1">
									<ul class="nav nav-tabs">
										<li class="nav-item"><a href="#my-posts"
											data-toggle="tab" class="nav-link active show">?????????</a></li>
										<li class="nav-item"><a href="#about-me"
											data-toggle="tab" class="nav-link">??????</a></li>
									</ul>
									<div class="tab-content">
										<div id="my-posts" class="tab-pane fade active show">
											<!-- ?????? ??? ??? ?????? (??????)-->
											<div class="card-header">
												<h4>??????</h4>
												<button style="width: 65px;" class="btn btn-primary"
													onclick="javascript:doDisplay();">??????</button>
											</div>
											<div id="cssTest" style="display: none;">
												<div class="table-responsive">
													<table class="table mb-0">
														<thead>
															<tr>
																<th>NO</th>
																<th>??????</th>
																<th>?????????</th>
																<th>?????????</th>
																<th>??????</th>
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
																<td>
																<a href="skill_view.jsp?num=<%=boardlist.get(i).getNum()%>"><%=boardlist.get(i).getTitle()%></a>
																</td>
																<td><%=boardlist.get(i).getPostdate()%></td>
																<td><%=boardlist.get(i).getVisitcount()%></td>
																<td><%=boardlist.get(i).getFilename()%></td>
															</tr>
															<%
															}
															%>
														</tbody>
													</table>
												</div>
											</div>
											<!-- ?????? ??? ??? ?????? (?????????)-->
											<div class="card-header">
												<h4>?????????</h4>
												<button style="width: 65px;" class="btn btn-primary"
													onclick="javascript:doDisplay2();">??????</button>
											</div>
											<div id="cssTest2" style="display: none;">
												<div class="table-responsive">
													<table class="table mb-0">
														<thead>
															<tr>
																<th>NO</th>
																<th>??????</th>
																<th>?????????</th>
																<th>?????????</th>
																<th>??????</th>
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
																<td><%=boardlist2.get(i).getPostdate()%></td>
																<td><%=boardlist2.get(i).getVisitcount()%></td>
																<td><%=boardlist2.get(i).getFilename()%></td>
															</tr>
															<%
															}
															%>
														</tbody>
													</table>
												</div>
											</div>
											<!-- ?????? ??? ??? ?????? (????????????)-->
											<div class="card-header">
												<h4>????????????</h4>
												<button style="width: 65px;" class="btn btn-primary"
													onclick="javascript:doDisplay3();">??????</button>
											</div>
											<div id="cssTest3" style="display: none;">
												<div class="table-responsive">
													<table class="table mb-0">
														<thead>
															<tr>
																<th>NO</th>
																<th>??????</th>
																<th>?????????</th>
																<th>?????????</th>
																<th></th>

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
																<td><%=boardlist3.get(i).getNum()%></td>
																<td><a
																	href="offer_view.jsp?onum=<%=boardlist3.get(i).getNum()%>"><%=boardlist3.get(i).getTitle()%></a></td>
																<td><%=boardlist3.get(i).getPostdate()%></td>
																<td><%=boardlist3.get(i).getVisitcount()%></td>
															</tr>
															<%
															}
															%>
														</tbody>
													</table>
												</div>
											</div>
											<!-- ?????? ??? ??? ?????? (????????????)-->
											<div class="card-header">
												<h4>????????????</h4>
												<button style="width: 65px;" class="btn btn-primary"
													onclick="javascript:doDisplay4();">??????</button>
											</div>
											<div id="cssTest4" style="display: none;">
												<div class="table-responsive">
													<table class="table mb-0">
														<thead>
															<tr>
																<th>NO</th>
																<th>??????</th>
																<th>?????????</th>
																<th>?????????</th>

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
																<td><%=boardlist4.get(i).getQpostdate()%></td>
																<td><%=boardlist4.get(i).getQvisitcount()%></td>
															</tr>
															<%
															}
															%>
														</tbody>
													</table>
												</div>
											</div>


										</div>
										<!-- ?????? ??? ?????? ?????? -->
										<div id="about-me" class="tab-pane fade">
											<div class="table-responsive">
												<form name="viewfrm">
													<table class="table mb-0">
														<thead>
															<tr>
																<th>????????? ??????</th>
																<th>?????? ??????</th>
																<th>??????</th>
																<th>????????? ??????</th>
															</tr>
														</thead>
														<tbody>
															<%
															HtagDAO mdao2 = new HtagDAO();
															ArrayList<CommentDTO> clist = mdao2.selectMypagecomment(UserId);
															mdao.close();
															for (int i = 0; i < clist.size(); i++) {
															%>
															<tr>
																<td><%=clist.get(i).getPostNum()%></td>
																<td><%=clist.get(i).getIdx()%></td>
																<td><a
																	href="javascript:view(<%=clist.get(i).getCode()%>,<%=clist.get(i).getPostNum()%>)"><%=clist.get(i).getComment()%></a></td>
																<td><%=clist.get(i).getBrdcode()%></td>
															</tr>
															<%
															}
															%>
														</tbody>
													</table>
												</form>
												<!--                      ?????? ????????? ????????? ?????? start  -->
												<!--                      ?????? ????????? ????????? ?????? end  -->
											</div>

										</div>


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
<%@include file="../includes/footer.jsp"%>        