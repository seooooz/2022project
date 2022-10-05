<%@page import="board1.skillBoardDAO"%>
<%@page import="board1.skillBoardDTO"%>
<%@page import="board3.offerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%
String pnum = request.getParameter("pnum");

skillBoardDAO dao = new skillBoardDAO();
skillBoardDTO dto = dao.selectView(pnum);
// String sessionId = session.getAttribute("UserId").toString();
%>
<script type="text/javascript">
function validateForm(form){				//폼 내용 검증
	if(form.title.value == ""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if(form.content.value == ""){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>
<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 class="card-title">기술</h4>
			</div>
			<div class="card-body">
				<!-- table start -->
				<div class="table-responsive">
					<form name="editeFrm" method="post" action="../../Process/skill/EditProcess.jsp"
						enctype="multipart/form-data" onsubmit="return validateForm(this)">
						<input type = "hidden" name="num" value="<%= dto.getNum() %>"/>
						<table>
							<tr>
								<th>작성자</th>
								<td><input type="text" class="form-control input-default"
									name="name" value=<%=session.getAttribute("UserId")%> disabled></td>
							</tr>

						<tr>
							<th>제목</th>
							<td><input type="text" class="form-control input-default"
								size="70" name="title" value="<%=dto.getTitle()%>"></td>
						</tr>
							<tr>
								<th>카데고리</th>

								<td>&nbsp; <input type="checkbox" name="cate" value="코드"
									checked /> 코드 <input type="checkbox" name="cate" value="기타" />
									기타
								</td>
							</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<div class="custom-file">
<!-- 										<label class="custom-file-label"></label> -->
										<input type="file" name="attachedFile" >
								</div>
								</td>
						</tr>


						<tr>
							<th>내용</th>
							<td>
								<textarea name="content" class="form-control input-default" rows="15" cols="70" name="content"><%=dto.getContent()%></textarea>
							</td>
						</tr>
<!-- 						<tr> -->
<!-- <!-- 					        <th>첨부파일</th> --> -->
<!-- 					        <td colspan="3" height="100"><img alt="" -->
<!-- 					         style="height: auto; width: 100%" -->
<%-- 					         src="../../Uploads/<%=dto.getFilename()%>"> <a></a></td> --%>
<!-- 					   </tr> -->
					</table>
<br>
						<button type="submit" class="btn btn-primary">작성 완료</button>
						<button type="reset" class="btn btn-primary">다시 입력</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='skill.jsp'">목록 보기</button>
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