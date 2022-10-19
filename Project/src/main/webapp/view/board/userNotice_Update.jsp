<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@include file="/Process/IsLoggedIn.jsp"%>
<%@ page import="board4.SetBoardDAO"%>
<%@ page import="board4.SetBoardDTO"%>
<%@ page import="java.util.* "%>

<%
System.out.println(request.getParameter("code"));
System.out.println(request.getParameter("title"));
System.out.println(request.getParameter("num"));
String code = request.getParameter("code");
String title = request.getParameter("title");
String num = request.getParameter("num");

SetBoardDAO dao = new SetBoardDAO();
ArrayList<SetBoardDTO> list = new ArrayList<SetBoardDTO>();
list = dao.SetboardSelect(title, code);
dao.close();

%>
<script type="text/javascript">
	function validateForm(form) {
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}

		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.title.focus();
			return false;
		}
	}
	
	function setboardDelete(num , title, code){
		var num = num;
		var title = title;
		var code = code;
		
		if(confirm("삭제하시겠습니까?")==true){
			location.href="/Process/notice/NoticeDeleteProcess.jsp?num="
					+num+"&title="+title+"&code="+code;
		}else{
			return;
		}
	}
</script>
<style>
#set-table {
	color:black;
	
}


</style>

<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 class="card-title">이용 방법</h4>
			</div>
			<div class="card-body">
				<!-- table start -->
				<div class="table-responsive">
					<form name="setriteFrm" method="post"
						action="../../Process/notice/NoticeWriteProcess.jsp"
						onsubmit="return validateForm(this)">
						<table id="set-table">
							<tr>
								<th>게시판</th>
								<%if(code.equals("3")){ %>
								<td>&nbsp; <input type="radio" name="searchField" value="set-text"
									checked /> 글 작성 방법 <input type="radio" name="searchField" value="set-offer" />
									OFFER
								</td>
								<%}else{ %>
								<td>&nbsp; <input type="radio" name="searchField" value="set-text"
									 /> 글 작성 방법 <input type="radio" name="searchField" value="set-offer" checked/>
									OFFER
								</td>
								<%} %>
								
							</tr>
							<%for(SetBoardDTO dto2 : list){ %>
							<tr>
								<th>제목</th>
								<td><input type="text" name="set-title" value="<%=dto2.getSet_title() %>"
									class="form-control input-default" size="70"></td>
							</tr>
							
							<tr>
								<th>내용</th>
								<td><textarea class="form-control input-default"  rows="15"
										cols="70" name="set-content"><%=dto2.getSet_content() %></textarea></td>
							</tr>
								<input type="hidden" name="num" value="<%=dto2.getSet_num()%>"/>
							
						</table>
						<br>
						<button type="button" class="btn btn-primary"
							onclick="setboardDelete('<%=dto2.getSet_num()%>','<%=dto2.getSet_title()%>','<%=dto2.getSet_code()%>')">삭제</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='setNotice_list.jsp'">목록 보기</button>
						<button type="submit" class="btn btn-primary">작성 완료</button>
						<%} %>
					</form>
				</div>
				<!-- table end -->

			</div>
		</div>
		<!-- card end -->
	</div>
</div>
<!-- content body end -->

<%@include file="../includes/footer.jsp"%>