<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%@ page import="java.util.*"%>

<!-- <style> -->
/* #fbox{ */ /* display:flex; */ /* flex-flow:row; */ /*
justify-content:center; */ /* align-items: center; */ /* } */
<!-- </style> -->
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
								<h4 class="card-title"><a href="../../view/board/skill.jsp">기술</a></h4>
							</div>
							<div class="card-body">
								<!-- QnA table start -->
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th>NO</th>
												<th>제목</th>
												<th>작성자</th>
										<!--	<th>작성일</th>
												<th>조회수</th>	-->
											</tr>
										</thead>
										<tbody>
											<%
											BoardDAO bDao = new BoardDAO();
											ArrayList<BoardVO> list = bDao.selectBoards();
											for (int i = 0; i < list.size(); i++) {
											%>
											<tr>
												<td><%=list.get(i).getNum()%></td>
												<td><%=list.get(i).getTitle()%></td>
												<td><%=list.get(i).getName()%></td>
										<!--	<td><%=list.get(i).getWritedate() %></td>
												<td><%=list.get(i).getReadcount() %></td>	-->
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
								<h4 class="card-title"><a href="../../view/board/career.jsp">커리어</a></h4>
							</div>
							<div class="card-body">
								<!-- QnA table start -->
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th>NO</th>
												<th>제목</th>
												<th>작성자</th>
										<!--	<th>작성일</th>
												<th>조회수</th>	-->
											</tr>
										</thead>
										<tbody>
											<%
											for (int i = 0; i < list.size(); i++) {
											%>
											<tr>
												<td><%=list.get(i).getNum()%></td>
												<td><%=list.get(i).getTitle()%></td>
												<td><%=list.get(i).getName()%></td>
										<!--	<td><%=list.get(i).getWritedate() %></td>
												<td><%=list.get(i).getReadcount() %></td>	-->
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
								<h4 class="card-title">KNOWLEDGE</h4>
							</div>
							<div class="card-body">
								<!-- QnA table start -->
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th>NO</th>
												<th>제목</th>
												<th>작성자</th>
										<!--	<th>작성일</th>
												<th>조회수</th>	-->
											</tr>
										</thead>
										<tbody>
											<%
											for (int i = 0; i < list.size(); i++) {
											%>
											<tr>
												<td><%=list.get(i).getNum()%></td>
												<td><%=list.get(i).getTitle()%></td>
												<td><%=list.get(i).getName()%></td>
										<!--	<td><%=list.get(i).getWritedate() %></td>
												<td><%=list.get(i).getReadcount() %></td>	-->
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
								<h4 class="card-title">PROJECT</h4>
							</div>
							<div class="card-body">
								<!-- QnA table start -->
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th>NO</th>
												<th>제목</th>
												<th>작성자</th>
										<!--	<th>작성일</th>
												<th>조회수</th>	-->
											</tr>
										</thead>
										<tbody>
											<%
											for (int i = 0; i < list.size(); i++) {
											%>
											<tr>
												<td><%=list.get(i).getNum()%></td>
												<td><%=list.get(i).getTitle()%></td>
												<td><%=list.get(i).getName()%></td>
										<!--	<td><%=list.get(i).getWritedate() %></td>
												<td><%=list.get(i).getReadcount() %></td>	-->
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
				</div>
			</div>
			<div class="col-xl-12 col-xxl-6 col-lg-6 col-md-12">
				<div class="row">
					<div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6 col-md-6">
						<div class="card">
							<div class="social-graph-wrapper widget-facebook">
								<span class="s-icon"><i class="fa fa-facebook"></i></span>
							</div>
							<div class="row">
								<div class="pt-3 pb-3 pl-0 pr-0 text-center"></div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6 col-md-6">
						<div class="card">
							<div class="social-graph-wrapper widget-linkedin">
								<span class="s-icon"><i class="fa fa-linkedin"></i></span>
							</div>
							<div class="row">
								<div class="pt-3 pb-3 pl-0 pr-0 text-center"></div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6 col-md-6">
						<div class="card">
							<div class="social-graph-wrapper widget-googleplus">
								<span class="s-icon"><i class="fa fa-google-plus"></i></span>
							</div>
							<div class="row">
								<div class="pt-3 pb-3 pl-0 pr-0 text-center"></div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6 col-md-6">
						<div class="card">
							<div class="social-graph-wrapper widget-twitter">
								<span class="s-icon"><i class="fa fa-twitter"></i></span>
							</div>
							<div class="row">
								<div class="pt-3 pb-3 pl-0 pr-0 text-center"></div>
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