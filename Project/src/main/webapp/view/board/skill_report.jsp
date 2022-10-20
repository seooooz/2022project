<%@page import="board1.skillBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
skillBoardDAO dao = new skillBoardDAO();
int count = dao.selectReport(Integer.valueOf(request.getParameter("num")), (String)session.getAttribute("UserId"));
dao.close();
if(count > 0){
%>
<script>
alert("이미 신고한 게시물 입니다.");
window.close();
</script>   
<%
   } 
%>
			
	<div class="authincation h-100">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									<h4 class="text-center mb-4">신고 하기</h4>
									<form method="post" action="../../Process/skill/ReportProcess.jsp">
										<div class="form-group">
										</div>
										<div class="form-group">
											<input type="hidden" name="num" id="num" value="<%=request.getParameter("num")%>" />
											<input type="hidden" name="tuid" id="tuid" value="<%=request.getParameter("tuid")%>" />
										</div>
										<div class="form-group">
											<input type="radio" name="chk_info" value=0>광고/스팸
											<input type="radio" name="chk_info" value=1>과도한 욕설
											<input type="radio" name="chk_info" value=2>음란물
											<input type="radio" name="chk_info" value=3>성격상이
										</div>
										<div class="text-center mt-4">
											<button type="submit" class="btn btn-primary btn-block" onclick="close()">확인</button>
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Required vendors -->
	<script src="../../resources/vendor/global/global.min.js"></script>
	<script src="../../resources/js/quixnav-init.js"></script>
	<!--endRemoveIf(production)-->
</body>
</html>