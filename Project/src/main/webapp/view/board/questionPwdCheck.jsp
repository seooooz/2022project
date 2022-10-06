<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	System.out.println("========비밀 번호 입력 페이지=========");
	System.out.println(session.getAttribute("UserId"));
	System.out.println(request.getParameter("qnum"));
	System.out.println("========비밀 번호 입력 페이지=========");

%>
<html lang="en" class="h-100">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>PassWord Check</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">
<link href="../../resources/css/style.css" rel="stylesheet">

</head>
<body class="h-100">
	<span> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>

	<script>
		function validateForm(form) {
			
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
		
		function getqnum(){
			document.getElementById("Qnum").value=opener.document.getElementById("qnum").value;
		}
		
	</script>
	<div class="authincation h-100">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									<h4 class="text-center mb-4">비밀번호 확인</h4>
									<form method="post"
										action="../../Process/question/QuestionPwdCheckProcess.jsp">
										<div class="form-group">
											<!-- pw입력  -->
											<label><strong>Password</strong></label> <input
												type="password" name="user_pw" class="form-control" value=""
												placeholder="*******">
										</div>
										<div class="form-group">
											<input type="hidden" name="qnum" id="qnum" value="<%=request.getParameter("qnum")%>" />
										</div>
										<div class="form-group">
											<input type="hidden" name="qid" id="qid" value="<%=request.getParameter("qid")%>" />
										</div>
										<div class="text-center mt-4">
											<button type="submit" class="btn btn-primary btn-block">확인</button>
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

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="../../resources/vendor/global/global.min.js"></script>
	<script src="../../resources/js/quixnav-init.js"></script>
	<!--endRemoveIf(production)-->
</body>

</html>