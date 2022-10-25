<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<link href="../../resources/css/style.css" rel="stylesheet">
<title>idCheckForm.jsp</title>
</head>
<body>
	<div class="authincation h-100">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									<div style="text-align: center">
										<h4>
											<strong>ID 중복확인</strong>
										</h4>
										<br>
										<form method="post" action="../../Process/idCheckProcess.jsp"
											onsubmit="return blankCheck(this)">
											<Strong>아이디 : </Strong>
											<input type="text" name="id" maxlength="10" autofocus value="<%=request.getParameter("id")%>"> 
											<br>
											<button type="submit" class="btn btn-primary" style="height:30px; margin-top: 1rem;">중복확인</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function blankCheck(f) {
			var id = f.id.value;
			id = id.trim();
			if (id.length < 5) {
				alert("아이디는 5자 이상 입력해주십시오.");
				return false;
			}//if end
			return true;
		}//blankCheck() end
	</script>
</body>
</html>
