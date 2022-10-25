<%@page import="usermember.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="../../resources/css/main.css">
<link href="../../resources/css/style.css" rel="stylesheet">
<title>IDCheck</title>
</head>
<body>
	<div class="authincation h-100">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content" style="margin-top: 20px;">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									<div style="text-align: center"></div>
									<h4><Strong>ID 중복 확인 결과</Strong></h4>
									<br>
									<%
										MemberDAO dao = new MemberDAO();
									
									    //1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
									    String id=request.getParameter("id");
									    boolean cnt = dao.checkId(id);
									    out.println("입력 ID : <strong class='f'>" + id + "</stong>");
									    if(cnt){
									    	out.println("<p class='f'>사용 가능한 아이디입니다.</p>");
										out.println("<button class='btn btn-primary' style='height:30px;' onclick='apply(\"" + id + "\")'>적용</button>");
									%>
									
										<script>
									    	function apply(id){
									            //2) 중복확인 id를 부모창에 적용
									            //부모창 opener
									            opener.document.regForm.checkid.value = "idCheck";
									            opener.document.regForm.id.value=id;
									            window.close(); //창닫기
									        }//apply () end
									    </script>
									 <%
									 	}else{
									    	out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
									    }//if end
									 %>
									 <hr>
									 <a href="javascript:history.back()">[다시시도]</a>
									 &nbsp; &nbsp;
									 <a href="javascript:window.close()">[창닫기]</a>
 								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 </body>
 </html>
