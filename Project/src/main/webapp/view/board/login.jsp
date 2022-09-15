<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Focus - Bootstrap Admin Dashboard </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../resources/images/favicon.png">
    <link href="../../resources/css/style.css" rel="stylesheet">

</head>

<body class="h-100">
<span>
	<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
</span>
<%
	if(session.getAttribute("UserId") == null){
%>
	<script>
		function validateForm(form) {
			if(!form.user_id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(form.user_pw.value == ""){
				alert("패스워드를 입력하세요.");
				return false;
			}
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
                                    <h4 class="text-center mb-4">Sign in your account</h4>
										<form action="../../Process/LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this)" class="authincation h-100">
                                        <div class="form-group">
                   <!-- id입력  -->
                                            <label><strong>Id</strong></label>
                                            <input type="text" name="user_id" class="form-control" value="" placeholder="abc123">
                                        </div>
                                        <div class="form-group">
                    <!-- pw입력  -->
                                            <label><strong>Password</strong></label>
                                            <input type="password" name="user_pw" class="form-control" value="" placeholder="********">
                                        </div>
                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                                            <div class="form-group">
                                                <div class="form-check ml-2">
                                                    <input class="form-check-input" type="checkbox" id="basic_checkbox_1">
                                                    <label class="form-check-label" for="basic_checkbox_1">Remember me</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <a href="page-forgot-password.html">Forgot Password?</a>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary btn-block">Sign me in</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Don't have an account? <a class="text-primary" href="../../resources/page-register.html">Sign up</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%
	}
	/* else { // 로그인된 상태 */
%>

<%-- 	<%=session.getAttribute("UserName") %> 회원님, 로그인 하셨습니다.<br>
	<a href="register.jsp">[로그아웃]</a>
<%
	}
%> --%>

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="../../resources/vendor/global/global.min.js"></script>
    <script src="../../resources/js/quixnav-init.js"></script>
    <script src="../../resources/js/custom.min.js"></script>

</body>
</html>