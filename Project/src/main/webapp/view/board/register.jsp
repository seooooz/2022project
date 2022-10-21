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
			
			var regExpId = /^[a-z|A-Z|0-9|\s]*$/;
			var regExpName = /^[가-힣\s]*$/; //한글 범위에 있는지 체크
			var regExpEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			
			var name = form.user_name.value;
			var id = form.user_id.value;
			var pw = form.user_pw.value;
			var pwck = form.user_pwck.value;
			var email = form.user_email.value;
			
			// 이름 유효성 검사
			if(!name){
				alert("이름을 입력하세요!");
				return false;	
			}else if(name.length>10 || name.length<2){
				alert("이름은 2~10자 사이로 입력해주세요!");
				return false;
			}else if(!regExpName.test(name)){
				alert("이름은 한글만 입력 가능합니다!");
				return false;
			}
			
			// 아이디 유효성 검사
			if(!id){
				alert("아이디를 입력하세요!");
				return false;
			}else if(id.length<4 ||id.length>10){
				alert("아이디는 4~10자 사이로 입력해주세요!");
				return false;
			}else if(!regExpId.test(id)){
				alert("아이디는 문자와 숫자만 입력가능합니다!")
				return false;
			}
			
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
			
			
			// 이메일 유효성 검사
			if(!email){
				alert("이메일을 입력하세요!");
				return false;	
			}else if(!regExpEmail.test(email)){
				alert("올바른 이메일 형식으로 입력해주세요!");
				return false;
			}
			
			 if(form.checkid.value != "idCheck"){
		            alert("ID 중복체크를 해주세요.");
		            return false;
		         }

			
		}
		
//      아이디　중복체크창
        function checkID(){
           var checkID = document.getElementById('id').value;
           if(checkID==""){
              alert("아이디를 입력하세요.");
            form.user_id.focus();
           }else{
           window.open("check.jsp?id=" + checkID, "checkid", "width=400, height=350");
           }
        }
        
        function chkForm(){
            document.regForm.checkid.value = "idUncheck";
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
                                    <h4 class="text-center mb-4">회원 가입</h4>
                                    <form name="regForm" method="post" action="../../Process/RegisterProcess.jsp" onsubmit="return validateForm(this)">
                                        <div class="form-group">
                                            <label><strong>Name</strong></label>
   <!-- name입력  -->	                        <input type="text" name="user_name" class="form-control" value="" placeholder="2~10자 사이로 입력해주세요">
                                        </div>
                                        <div class="form-group">
   <!-- id입력  -->                           <label><strong>ID</strong></label>
                                            <input type="text" name="user_id" id="id" class="form-control" value="" placeholder="4~10자 사이로 입력해주세요">
                                            <input type="hidden" name="checkid" value="idUncheck"/>
                                            <input type="button" class="btn btn-primary btn-block" value="중복확인" onClick="checkID()"/>
                                        </div>
                                        <div class="form-group">
   <!-- pw입력  -->                          <label><strong>Password</strong></label>
                                            <input type="password" name="user_pw" class="form-control" value="" placeholder="8~16자 사이로 입력해주세요">
                                        </div>
                                         <div class="form-group">
   <!-- pw입력  -->                          <label><strong>Password Check</strong></label>
                                            <input type="password" name="user_pwck" class="form-control" value="" placeholder="8~16자 사이로 입력해주세요">
                                        </div>
                                         <div class="form-group">
   <!-- pw입력  -->                          <label><strong>Email</strong></label>
                                            <input type="text" name="user_email" class="form-control" value="" placeholder="example@example.com">
                                        </div>
                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-block">Sign me up</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Already have an account? <a class="text-primary" href="login.jsp">Sign in</a></p>
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