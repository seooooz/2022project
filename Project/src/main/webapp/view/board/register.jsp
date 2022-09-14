<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Focus - Bootstrap Admin Dashboard </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    <link href="../../resources/css/style.css" rel="stylesheet">

</head>
<body class="h-100">
<span>
	<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
</span>

	<script>
		function validateForm(form) {
			if(!form.user_name.value){
				alert("이름을 입력하세요.")
				return false;
			}
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
                                    <h4 class="text-center mb-4">Sign up your account</h4>
                                    <form method="post" action="../../Process/RegisterProcess.jsp">
                                        <div class="form-group">
                                            <label><strong>Name</strong></label>
   <!-- name입력  -->	                        <input type="text" name="user_name" class="form-control" placeholder="username">
                                        </div>
                                        <div class="form-group">
   <!-- id입력  -->                           <label><strong>ID</strong></label>
                                            <input type="text" name="user_id" class="form-control" placeholder="abc123">
                                        </div>
                                        <div class="form-group">
   <!-- pw입력  -->                          <label><strong>Password</strong></label>
                                            <input type="password" name="user_pw" class="form-control" value="" placeholder="*******">
                                        </div>
                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-block">Sign me up</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Already have an account? <a class="text-primary" href="page-login.html">Sign in</a></p>
                                    </div>
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