<%@page import="board3.offerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/main.css">
<link href="../../resources/css/style.css" rel="stylesheet">
<title>Report</title>
</head>
<body>
<%
offerBoardDAO odao = new offerBoardDAO();
int count = odao.selectReport(Integer.valueOf(request.getParameter("onum")), (String)session.getAttribute("UserId"));
odao.close();
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
									<h3 class="text-center mb-4">게시물을 신고하는 이유를<br> 알려주세요!</h3>
									<p class="f" style="font-size: 14px;">타당한 그거 없이 신고된 내용은 관리자 확인 후 반영되지 않을 수 있습니다.</p>
									<br>
									<form method="post" action="../../Process/offer/ReportProcess.jsp">
										<input type="hidden" name="onum" id="onum" value="<%=request.getParameter("onum")%>" />
										<input type="hidden" name="tuid" id="tuid" value="<%=request.getParameter("tuid")%>" />
										<div class="form-group f">
											<input type="radio" name="chk_info" value=0>광고/스팸
											<br><br>
											<input type="radio" name="chk_info" value=1>과도한 욕설
											<br><br>
											<input type="radio" name="chk_info" value=2>음란물
											<br><br>
											<input type="radio" name="chk_info" value=3>관련없는 내용
										</div>
										<br>
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