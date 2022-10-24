<%@page import="board3.offerBoardDTO"%>
<%@page import="board3.offerBoardDAO"%>
<%@page import="board2.careerBoardDTO"%>
<%@page import="board2.careerBoardDAO"%>
<%@page import="board1.skillBoardDTO"%>
<%@page import="board1.skillBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@ page import="java.util.*"%>
<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body" align="center">
	<%@ include file="test.jsp"%>
	<br> <br>
	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-12 col-xxl-6 col-lg-6 col-md-12">
				<div class="row">
					<div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6 col-md-6" s>
						<div class="card">
							<div class="card-header">
								<h4>기술</h4>
							</div>
							<div class="card-body">
								<!-- QnA table start -->
								<div class="table-responsive">
									<table class="table mb-0">
										<thead class="f">
											<tr>
												<th>NO</th>
												<th>제목</th>
												<th>작성자</th>
											</tr>
										</thead>
										<tbody>
											<%
											skillBoardDAO sdao = new skillBoardDAO();
											ArrayList<skillBoardDTO> slist = sdao.selectBoards();
											sdao.close();
											for (int i = 0; i < slist.size(); i++) {
											%>
											<tr class="f">
												<td><%=slist.get(i).getNum()%></td>
												<td>
												<a class="f" href="skill_view.jsp?num=<%=slist.get(i).getNum()%>"><%=slist.get(i).getTitle()%>
												</a>
												</td>
												<td><%=slist.get(i).getId()%></td>
											</tr>
											<%
											}
											%>
										</tbody>

									</table>
								</div>
								<!-- table end -->
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6 col-md-6" s>
						<div class="card">
							<div class="card-header">
								<h4>커리어</h4>
							</div>
							<div class="card-body">
								<!-- QnA table start -->
								<div class="table-responsive">
									<table class="table mb-0">
										<thead class="f">
											<tr>
												<th>NO</th>
												<th>제목</th>
												<th>작성자</th>
											</tr>
										</thead>
										<tbody class="f">
											<%
											careerBoardDAO cdao = new careerBoardDAO();
											ArrayList<careerBoardDTO> clist = cdao.selectBoards();
											cdao.close();
											for (int i = 0; i < clist.size(); i++) {
											%>
											<tr>
												<td><%=clist.get(i).getNum()%></td>
												<td>
												<a class="f" href="career_view.jsp?num=<%=clist.get(i).getNum()%>">
												<%=clist.get(i).getTitle()%>
												</a>
												</td>
												<td><%=clist.get(i).getId()%></td>
											</tr>
											<%
											}
											%>
										</tbody>

									</table>
								</div>
								<!-- table end -->
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6 col-md-6">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">오퍼</h4>
							</div>
							<div class="card-body">
								<!-- QnA table start -->
								<div class="table-responsive">
									<table class="table mb-0">
										<thead class="f">
											<tr>
												<th>NO</th>
												<th>제목</th>
												<th>작성자</th>
											</tr>
										</thead>
										<tbody>
											<%
											offerBoardDAO odao = new offerBoardDAO();
											ArrayList<offerBoardDTO> olist = odao.selectBoards();
											odao.close();
											for (int i = 0; i < olist.size(); i++) {
											%>
											<tr class="f">
												<td><%=olist.get(i).getNum()%></td>
												<td>
												<a class="f" href = "offer_view.jsp?onum=<%=olist.get(i).getNum()%>">
												<%=olist.get(i).getTitle()%>
												</a>
												</td>
												<td><%=olist.get(i).getId()%></td>
											</tr>
											<%
											}
											%>
										</tbody>
										

									</table>
								</div>
								<!-- table end -->
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6 col-md-6">
						<div class="card">
							<div class="card-header">
								<h4>시험 일정</h4>
							</div>
							<div class="card-body">
								<!-- QnA table start -->
								<div class="table-responsive">
									<table class="table mb-0">
										<tbody>
											<tr class="f">
												<td><a class="f" href="../board/writingtest.jsp">필기 시험</a></td>
											</tr>
											<tr class="f">
												<td><a class="f" href="../board/practicaltest.jsp">실기 시험</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="card-header">
								<h4>NOTICE</h4>
							</div>
							<div class="card-body">
								<!-- QnA table start -->
								<div class="table-responsive">
									<table class="table mb-0">
										<tbody>
											<tr class="f">
												<td><a class="f" href="../board/setNotice.jsp">셋팅 방법</a></td>
											</tr>
											<tr class="f">
												<td><a class="f" href="../board/useNotice.jsp">이용 방법</a></td>
											</tr>
										</tbody>
									</table>
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