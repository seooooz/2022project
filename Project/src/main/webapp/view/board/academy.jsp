<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<style>
#teqh {
	font-size: 22px;
}
</style>
<script>
	$(document).ready(
			function() {

				$("#search").on(
						"keyup",
						function() { // 검색창 입력 이벤트 발생 시

							var value = $(this).val().toLowerCase(); // 입력 내용을 소문자로 전환해 value 변수에 담아

							$("#srchtable tr").filter(
									function() { // 일치하는 tr 요소만 보여 줘.

										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1) // 일치하는 글자 있으면

									});

						});

			});
</script>
<script type="text/javascript">
	function srch2(){
		window.location.reload();
	}
	function srch() {
		
		var s1 = document.getElementById("s1Test")
		var s2 = document.getElementById("s2Test");
		if (s2.style.display == "none") {
			s2.style.display = "block";
			s1.style.display = "none";
		} else {
			s2.style.display = "none";
			s1.style.display="black";
		}

		var srchTraProcessNm = document.getElementById("srchTraProcessNm").value;
		var srchTraStDt = document.getElementById("srchTraStDt").value;
		var srchTraEndDt = document.getElementById("srchTraEndDt").value;
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				jsonFunction(this);
			}
		}

		var url = "https://cors-anywhere.herokuapp.com/https://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML&authKey=IKsg493a3iE54exUj1DDsvd2P6Y8Qgod&pageNum=1&pageSize=10&srchTraProcessNm="
				+ srchTraProcessNm
				+ "&srchTraStDt="
				+ srchTraStDt
				+ "&srchTraEndDt="
				+ srchTraEndDt
				+ "&outType=1&sort=ASC&sortCol=TR_STT_DT&srchKeco1=20";
		xmlhttp.open("GET", url, true);
		xmlhttp.send();

		function jsonFunction(xml) {
			var xmlDoc = xml.responseXML;
			// var arr = JSON.parse(resp);
			// var txt = "";
			var titleTag = xmlDoc.getElementsByTagName("scn_list");


			for (i = 0; i < titleTag.length; i++) {

				var address = xmlDoc.getElementsByTagName("address")[i].innerHTML;
				var subTitle = xmlDoc.getElementsByTagName("subTitle")[i].innerHTML;
				var title = xmlDoc.getElementsByTagName("title")[i].innerHTML;
				var titleLink = xmlDoc.getElementsByTagName("titleLink")[i].innerHTML;
				var traStartDate = xmlDoc.getElementsByTagName("traStartDate")[i].innerHTML;
				var traEndDate = xmlDoc.getElementsByTagName("traEndDate")[i].innerHTML;
				var courseMan = xmlDoc.getElementsByTagName("courseMan")[i].innerHTML;
				var realMan = xmlDoc.getElementsByTagName("realMan")[i].innerHTML;

				var thaddress = document.createTextNode(address);
				var tdsubTitle = document.createTextNode(subTitle);
				var tdtitle = document.createTextNode(title);
				var tdtraStartDate = document.createTextNode(traStartDate);
				var tdtraEndDate = document.createTextNode(traEndDate);
				var tdcourseMan = document.createTextNode(courseMan.replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
						+ " 원");
				var tdrealMan = document.createTextNode(realMan.replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
						+ " 원");

				var tr = document.createElement("tr");
				var th = document.createElement("th");
				var td1 = document.createElement("td");
				var td2 = document.createElement("td");
				var td3 = document.createElement("td");
				var td4 = document.createElement("td");
				var td5 = document.createElement("td");
				var td6 = document.createElement("td");

				th.appendChild(thaddress);
				td1.appendChild(tdsubTitle);
				td2.appendChild(tdtitle);
				td3.appendChild(tdtraStartDate);
				td4.appendChild(tdtraEndDate);
				td5.appendChild(tdcourseMan);
				td6.appendChild(tdrealMan);

				tr.appendChild(th);
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td4);
				tr.appendChild(td5);
				tr.appendChild(td6);
				
				var tbody = document.getElementsByTagName("tbody")[0];

				tbody.appendChild(tr);
				
				
			}

		};
	}
</script>
<script type="text/javascript" language="JavaScript">
	function hideDiv() {
		document.getElementById("l01").style.display = "none";
	}
	self.setTimeout("hideDiv()", 1400); // 초 지정
</script>


<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-11">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 id="teqh" class="card-title">학원 정보</h4>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<!-- 테이블 시작-->
					<div id="s1Test">
					과정 이름: <input type="text" id="srchTraProcessNm"><br>
					훈련 일정: <input type="text" id="srchTraStDt"> ~ <input
						type="text" id="srchTraEndDt">
						
					<button onclick="srch()" class="btn btn-primary">검색</button>
					</div>
					<div id="s2Test" style="display: none;" align="left">
						<br> <input id="search" type="text" placeholder="여기에 검색어 입력">
						
						<button style="float: right" onclick="srch2()" class="btn btn-primary">검색</button>
						
						<br> <br>
						<div id="l01" style="width: 300px; height: 300px;">
							<img src="/view/img/Spinner.gif" />
						</div>
						<table class="table mb-0">
							<thead>
								<th>주소</th>
								<th>학원명</th>
								<th>과정명</th>
								<th>시작 날짜</th>
								<th>종료 날짜</th>
								<th>수강비</th>
								<th>실제 훈련비</th>
								

							</thead>
							<tbody id="srchtable">
								
							</tbody>
						</table>
					</div>
					<!-- 테이블 끝 -->
				</div>
				<br>
				<p>
				정확한 정보는 반드시 <a href="https://www.hrd.go.kr/hrdp/ti/ptiao/PTIAO0100L.do" target="_blank">HRD-Net</a>사이트에서	확인하시기 바랍니다</p>
			</div>
			<!-- card end -->
		</div>
	</div>
</div>
<!-- content body end -->

<%@include file="../includes/footer.jsp"%>