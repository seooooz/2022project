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
<%
String UserId = null;
UserId = (String)session.getAttribute("UserId");
System.out.println("세션 아이디값 : " +UserId);
%>
	<script>
		function validateForm(form) {
			
			var pw = form.user_pw.value;
			var pwck = form.user_pwck.value;
			
			// 비밀번호 유효성 검사
			if(pw == ""){
				alert("패스워드를 입력하세요!");
				return false;
			}else if(pw.length<8 || pw.length>16){
				alert("비밀번호는 8~16자 사이로 입력해주세요!")
				return false;
			}
			//비밀번호 체크 유효성 검사
			if(pwck == ""){
				alert("패스워드를 입력하세요!");
				return false;
			}else if(pwck.length<8 || pwck.length>16){
				alert("비밀번호는 8~16자 사이로 입력해주세요!")
				return false;
			}else if(!(pw == pwck)){
				alert("비밀번호를 다시 확인해주세요.");
				return false;
			}
			
			if(confirm("정말로 회원탈퇴 하시겠습니까?")==true){
				location.href="../../Process/UserDeleteProcess.jsp";
			}else{
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
                                    <h4 class="text-center mb-4">회원 탈퇴</h4>
                                    <form method="post" action="../../Process/UserDeleteProcess.jsp" onsubmit="return validateForm(this)">
                                      <div class="form-group">
   <!-- pw입력  -->                          <label><strong>Password</strong></label>
                                            <input type="password" name="user_pw" class="form-control" value="" placeholder="*******">
                                        </div>
                                         <div class="form-group">
   <!-- pwck입력  -->                          <label><strong>Password Check</strong></label>
                                            <input type="password" name="user_pwck" class="form-control" value="" placeholder="*******">
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