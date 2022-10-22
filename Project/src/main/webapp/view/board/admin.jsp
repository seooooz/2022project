<%@page import="java.util.LinkedList"%>
<%@page import="admin.AreportDTO"%>
<%@page import="utils.ReportDTO"%>
<%@page import="utils.ReportDAO"%>
<%@page import="admin.adminBoardDTO"%>
<%@page import="admin.adminBoardDAO"%>
<%@page import="board3.offerBoardDTO"%>
<%@page import="board3.offerBoardDAO"%>
<%@page import="board2.careerBoardDTO"%>
<%@page import="board2.careerBoardDAO"%>
<%@page import="board1.skillBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board1.skillBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
   <!-- Datatable -->
<link href="../../resources/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
<style>
.main_body {
	margin-top: 7rem;
	margin-left: 1.5rem;
	margin-right: 1.5rem;
}
</style>
<script>
function view(args1,args2){
	var brdcode = args1;
	var brdnum = args2;
	var form = document.viewfrm;
	
	form.method = "post";
	form.action = "../../Process/admin/ViewProcess.jsp?brdcode=" + brdcode + "&brdnum=" + brdnum;
	form.submit();
}

</script>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body" align="center">
<div class="col-lg-8">
	<input type="button" class="btn btn-primary" value="셋팅 게시물 관리"
	onclick="location.href='/view/board/setNotice_list.jsp'">
<div class="main_body">
	<div class="container-fluid">
		<div class="card">
			<div class="card-header">
				<h4 class="card-title">신고</h4>
			</div>
			<div class="card-body">
			<form name="viewfrm">
				<div class ="dataTables_scroll">
						<table class="table mb-0">
							<thead>
								<tr class="f">
									<th>Num</th>
									<th>게시판 고유번호</th>
									<th>신고당한 게시물번호</th>
									<th>게시물 쓴사람 id</th>
									<th>신고자 id</th>
									<th>신고 이유</th>
								</tr>
							</thead>
							<tbody class="dataTables_scrollBody">
								<%
								ReportDAO dao = new ReportDAO();
								ArrayList<ReportDTO> list = dao.selectboard();
								dao.close();
								for (int i = 0; i < list.size(); i++) {
								%>
								<tr class="f">
									<td><%=list.get(i).getNum()%></td>
									<td><%=list.get(i).getBrd_code1()%></td>
									<td>
									<a class="f" href="javascript:view(<%=list.get(i).getBrd_code()%>,<%=list.get(i).getTarget_id()%>)"><%=list.get(i).getTarget_id()%></a>
									</td>
									<td><%=list.get(i).getTuid()%></td>
									<td><%=list.get(i).getId()%></td>
									<td><%=list.get(i).getText()%></td>
								</tr>
								<%
								}
								%>

							</tbody>
						</table>
					</div>
					</form>	
					</div>
				</div>
			</div>
		</div>
		<!-- 공지 확인 -->
		<div class="main_body">
			<div class="container-fluid">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">공지</h4>
					<input type="button" class="btn btn-primary" value="공지 작성"
						onclick="location.href='/view/board/admin_write.jsp'">
				</div>
				<div class="card-body">
					<!-- QnA table start -->
					<div class="table-responsive">
						<table class="table mb-0">
							<thead>
								<tr class="f">
									<th>NO</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>조회수</th>
									<!--	<th>작성일</th>
												<th>조회수</th>	-->
								</tr>
							</thead>
							<tbody>
								<%
								adminBoardDAO adao = new adminBoardDAO();
								ArrayList<adminBoardDTO> slist = adao.selectBoards();
								adao.close();
								for (int i = 0; i < slist.size(); i++) {
								%>
								<tr class="f">
									<td><%=slist.get(i).getAnum()%></td>
									<td><%=slist.get(i).getBrd_name()%></td>
									<td>
									<a class="f" href="admin_view.jsp?anum=<%=slist.get(i).getAnum()%>">
									<%=slist.get(i).getTitle()%>
									</a>
									</td>
									<td><%=slist.get(i).getVisitcount() %></td>
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
</div>	
<!--**********************************
            Content body end
        ***********************************-->

<%@include file="../includes/footer.jsp"%>