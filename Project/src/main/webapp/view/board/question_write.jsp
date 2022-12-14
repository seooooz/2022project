<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@include file="/Process/IsLoggedIn.jsp"%>


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
</script>


<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 class="card-title">문의사항</h4>
				<!-- 				<input type="button" class="btn btn-primary" value="글쓰기" -->
				<!-- 					onclick="location.href='/view/board/register.jsp'"> -->
			</div>
			<div class="card-body">
				<!-- table start -->
				<div class="table-responsive">
					<form name="qwriteFrm" method="post"
						action="../../Process/question/QuestionWriteProcess.jsp"
						onsubmit="return validateForm(this)">
						<table>
							<tr>
								<th>작성자</th>
								<td><input type="text" name="q_id" class="form-control input-default"
									 value=<%=session.getAttribute("UserId")%> disabled></td>
							</tr>

							<tr>
								<th>제목</th>
								<td><input type="text" name="q_title" class="form-control input-default"
									size="70" ></td>
							</tr>

							<tr>
								<th>내용</th>
								<td><textarea class="form-control input-default" rows="15"
										cols="70" name="q_content"></textarea></td>
							</tr>
						</table>
						<br>
						<button type="reset" class="btn btn-primary">다시 입력</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='question.jsp'">목록 보기</button>
						<button type="submit" class="btn btn-primary">작성 완료</button>
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