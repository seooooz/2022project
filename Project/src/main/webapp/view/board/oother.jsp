<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="usermember.MemberDTO"%>
<%@ page import="board5.HtagDAO"%>
<%@ page import="board5.HtagDTO"%>
<%@page import="java.util.*"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="../../resources/css/style.css" rel="stylesheet">
<title>mypage</title>

<%
String UserId = null;
if (session.getAttribute("UserId") != null) {
	UserId = (String) session.getAttribute("UserId");
}

String id = request.getParameter("oid");
HtagDAO mdao = new HtagDAO();
ArrayList<HtagDTO> list = mdao.selectMypageDTO2(UserId);
int result = 0;
int cresult = 0;
result = mdao.selectboardcount(id);
cresult = mdao.selectcommentount(id);
mdao.close();
%>

<body class="h-100">
	<div class="authincation h-100">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content">
								<div class="auth-form">
									<h4 class="text-center mb-4"><%=id%>
										프로필
									</h4>
								</div>
						<%
						HtagDAO mdao3 = new HtagDAO();
						MemberDTO dto = mdao3.selectMember(id);
						mdao3.close();
						%>
						<div class="profile-statistics">
							<div class="text-center mt-4 border-bottom-1 pb-3">
								<div class="row">
									<div class="col">
										<h4 class="text-primary"><%=dto.getId()%></h4>
										<h4 class="text-muted"><%=dto.getEmail()%></h4>

									</div>
								</div>
								<br> <br>
								<div class="row">
									<div class="col">
										<div class="profile-skills pt-2 border-bottom-1 pb-2">
											<%
											if (list.isEmpty()) {
											%>
											<%
											} else {
											%>
											<h4>Skills</h4>
											<%
											for (HtagDTO hdto : list) {
											%>
											<form name="writeFrm">
												<input type="text" class="btn btn-outline-dark btn-rounded"
													name="htag" value="<%=hdto.getHtag()%>">
											</form>
											<%
											}
											}
											%>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<h3 class="m-b-0"><%=result%></h3>
										<span>Post</span>
									</div>
									<div class="col">
										<h3 class="m-b-0"><%=cresult%></h3>
										<span>Comment</span>
									</div>
								</div>
								<br>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
<!--**********************************
        Scripts
    ***********************************-->
<!-- Required vendors -->
<script src="../../resources/vendor/global/global.min.js"></script>
<script src="../../resources/js/quixnav-init.js"></script>
<!--endRemoveIf(production)-->
