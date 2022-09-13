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

					<table>
						<tr>
							<th>작성자</th>
							<td><input type="text" class="form-control input-default"
								name="name"></td>
						</tr>

						<tr>
							<th>제목</th>
							<td><input type="text" class="form-control input-default"
								size="70" name="title"></td>
						</tr>

						<tr>
							<th>첨부파일</th>
							<td>
								<div class="custom-file">
									<input type="file" class="custom-file-input"> <label
										class="custom-file-label"></label>
								</div>
								</td>
						</tr>


						<tr>
							<th>내용</th>
							<td><textarea class="form-control input-default" rows="15"
									cols="70" name="content"></textarea></td>
						</tr>
					</table>
				</div>
				<!-- table end -->

			</div>
		</div>
		<!-- card end -->
	</div>
</div>
<!-- content body end -->

<%@include file="../includes/footer.jsp"%>
