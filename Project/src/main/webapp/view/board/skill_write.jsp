<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 class="card-title">기술</h4>
<!-- 				<input type="button" class="btn btn-primary" value="글쓰기" -->
<!-- 					onclick="location.href='/view/board/register.jsp'"> -->
			</div>
			<div class="card-body">
				<!-- table start -->
				<div class="table-responsive">
					<form name="writeFrm" method="post" action="../../Process/writeProcess.jsp"
						enctype="multipart/form-data" onsubmit="return validateForm(this)">
						<table>
							<tr>
								<th>작성자</th>
								<td><input type="text" class="form-control input-default"
									name="name" value=<%=session.getAttribute("UserId")%> disabled></td>
							</tr>

						<tr>
							<th>제목</th>
							<td><input type="text" class="form-control input-default"
								size="70" name="title"></td>
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
										<input type="file" name="attachedFile">
<!-- 										<label class="custom-file-label"></label> -->
								</div>
								</td>
						</tr>


						<tr>
							<th>내용</th>
							<td><textarea class="form-control input-default" rows="15"
									cols="70" name="content"></textarea></td>
						</tr>
					</table>
<br>
						<button type="reset" class="btn btn-primary">다시 입력</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='skill.jsp'">목록 보기</button>
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