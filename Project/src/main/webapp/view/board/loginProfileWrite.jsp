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
<title>mypage</title>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<link href="../../resources/css/style.css" rel="stylesheet">
<%
String UserId = null;
if (session.getAttribute("UserId") != null) {
	UserId = (String) session.getAttribute("UserId");
}

String id = request.getParameter("id");
HtagDAO mdao = new HtagDAO();
ArrayList<HtagDTO> list = mdao.selectMypageDTO2(id);
int result = 0;
int cresult = 0;
result = mdao.selectboardcount(id);
cresult = mdao.selectcommentount(id);
mdao.close();
%>
<script>
	$(document).ready(function() {
		var tag = {};
		var counter = 0;
		//     var counter2 =0;

		// 입력한 값을 태그로 생성한다.
		function addTag(value) {
			tag[counter] = value;
			counter++; // del-btn 의 고유 id 가 된다.
		}

		// tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
		function marginTag() {
			return Object.values(tag).filter(function(word) {
				return word !== "";
			});
		}

		// 서버에 제공
		$("#tag-form").on("submit", function(e) {
			var value = marginTag(); // return array
			$("#rdTag").val(value);
			$(this).submit();
		});
		$("#tag").on("keypress", function(e) {
			var self = $(this);

			//엔터나 스페이스바 눌렀을때 실행
			if (e.keyCode == 32) {

				var tagValue = self.val(); // 값 가져오기

				// 해시태그 값 없으면 실행X
				if (tagValue !== "") {

					// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
					var result = Object.values(tag).filter(function(word) {
						return word === tagValue;
					})

					// 해시태그가 중복되었는지 확인
					if (result.length == 0) {
						$("#tag-list").append("#" + tagValue + " ");
						addTag(tagValue);
						self.val("");
					} else {
						alert("태그값이 중복됩니다.");
					}
				}
				e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지

			}
		});
	})
</script>

<body class="h-100">
	<div class="authincation h-100">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
				<form name="qwriteFrm" method="post"
												action="../../Process/Mypage/MypageWriteProcess.jsp">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<br>

								<button type="submit"
									class="btn btn-primary pl-5 pr-5 mr-3 mb-4"
									style="float: right; width: 170px">수정 완료</button>
								<br>
								<div class="auth-form">
									<h4 class="text-center mb-4"><%=id%>
										프로필
									</h4>
								</div>
							</div>
						</div>
						<%
						HtagDAO mdao3 = new HtagDAO();
						MemberDTO dto = mdao3.selectMember(id);
						%>
						<div class="profile-statistics">
							<div class="text-center mt-4 border-bottom-1 pb-3">
								<div class="row">
									<div class="col">
										<h4 class="text-primary"><%=dto.getId()%></h4>

									</div>
									<div class="col">
										<h4 class="text-muted"><%=dto.getEmail()%></h4>
									</div>
								</div>
								<%
								mdao3.close();
								%>
								<br> <br>
								<div class="row">
									<div class="col">
										<div class="profile-skills pt-2 border-bottom-1 pb-2">
											<p>
												* Enterkey를 누르면 자동 수정 완료 됩니다.<br> 스페이스를 눌러주세요*
											</p>
												<h4 class="text-primary mb-4">Skills</h4>
												<div class="tr_hashTag_area text-center ">
													<input type="hidden" value="" name="tag" id="rdTag" /> <input
														type="text" class="input-text" id="tag" size="6"
														placeholder="스페이스 키로 해시태그를 등록해주세요." style="width: 300px;">
													<br>
													<br>
													<textarea id="tag-list" name="htag"></textarea>
												</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
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
