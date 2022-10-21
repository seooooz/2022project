<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<script type="text/javascript">
function validateForm(form){				//폼 내용 검증
	if(form.title.value == ""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if(form.memNum.value == ""){
		alert("인원수를 입력하세요.");
		form.memNum.focus();
		return false;
	}
	if(form.datepicker.value == ""){
		alert("마감일을 입력하세요.");
		form.datepicker.focus();
		return false;
	}
	if(form.content.value == ""){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}

</script>


<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
		<div class="col-xl-3 col-xxl-12">
                    </div>
			<div class="card-header">
				<h4 class="card-title">기술</h4>
			</div>
			<div class="card-body">
				<!-- table start -->
				<div class="table-responsive">
					<form name="offerwriteFrm" method="post" action="../../Process/offer/writeProcess.jsp"			
						 onsubmit="return validateForm(this)">			
						<table>
							<tr>
								<th>작성자</th>
								<td>
								<input type="text" class="form-control input-default"
									name="id" value=<%=session.getAttribute("UserId")%> disabled></td>
							</tr>

							<tr>
								<th>제목</th>
								<td>
									<input type="text" class="form-control input-default" size="70" name="title">
								</td>
							</tr>
							<tr>
								<th>카데고리</th>
					
<!-- 1-개인, 2-공모전  -->				<td>&nbsp; <input type="checkbox" name="cate" value="개인"
									checked /> 개인 
									<input type="checkbox" name="cate" value="공모전" /> 공모전
								</td>
							</tr>
							<tr>
								<th>인원수</th>
								<td>
									 <select name="memNum" class="form-control">
									    <option value="2">2명</option>
									    <option value="3">3명</option>
									    <option value="4">4명</option>
									    <option value="5">5명</option>
									  </select>
								</td>
							</tr>
							<tr>
								<th>마감일</th>
								<td>
									<input name="datepicker" type="date" class="form-control" >
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea class="form-control input-default" rows="15" cols="70" name="content"></textarea>
								</td>
							</tr>
					</table>
						<br>
						<button type="reset" class="btn btn-primary">다시 입력</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='offer.jsp'">목록 보기</button>
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
<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/bootstrap-slider.js"></script>
<%@include file="../includes/footer.jsp"%>