<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/apiTest.js' />"></script>

</head>
<script type="text/javascript">
//api authURL : URL을 상수로 선언. 보통은 properies에 선언하여 사용함
let apiURL = 'https://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA62/HRDPOA62_1.jsp?returnType=XML&authKey=';

//api authKey : 인증키를 상수로 선언. 보통은 properies에 선언하여 사용함
let apiKey = 'IKsg493a3iE54exUj1DDsvd2P6Y8Qgod';

$(document).ready(function(){      
	var api = new Vue ({
		el : "#api",
		data : {
			apiList : [], // api를 통해 가져온 json 데이터를 담아서 화면에 뿌려주도록 함
			pageNo : '', // api의 필수 파라메터 값 1
			numOfRows : '', //api의 필수 파라메터 값 2
			nrsryType : '' // 어린이집 유형 파라메터
		},
		mounted(){
			this.pageNo = '3', // mounted되었을 때 페이지번호 초기값 설정 
			this.numOfRows = '5', // mounted되었을 때 한페이지에 표시할 행 초기값 설정
			this.nrsryType = '20220929',
			this.search(); // mounted되었을 때 search 함수를 호출해 api를 호출함
		},
		methods : {
			search : function(){
				var self = this;
				var config = {headers: {"Accept": "*/*",}}; // header를 변수로 선언
				/*
				 * url를 선언함. 여기서는 그냥 대충 짰지만, 실제 사용할 때는 URL작성이 조금 더 동적이면서 유연하게 작성 할 필요가 있음
				 * */
				var url = 'https://cors-anywhere.herokuapp.com/'+ apiURL +apiKey + '&pageNum=' + this.pageNo + '&pageSize=' + this.numOfRows
				+ '&srchTraStDt=' + this.nrsryType + '&srchTraEndDt=20220929&outType=1&sort=ASC&sortCol=TR_STT_DT';
				axios.get(url,'',config).then(function(reult) { // url호출 -> 공공데이터포털로 데이터 요청을 보낸다. (request)
					self.apiList = result.data.items; // 서버통신 성공시 apiList 배열에 해당 값을 담음 ( response )
				})
			},
		}
	});
 })
</script>
<body>
<h1>경기도 용인시 어린이집 현황</h1>
<table id="api">
	<thead>
		<tr>
			<td>페이지번호 : <input type="text" value="pageNo" v-model="pageNo"></td>
			<td>한 페이지 결과 수 : <input type="text" value="numOfRows" v-model="numOfRows"></td>
			<td>어린이집 유형 : 
				<select v-model="nrsryType">
					<option value="">전체</option>
					<option value="민간">민간</option>
					<option value="가정">가정</option>
					<option value="직장">직장</option>
					<option value="법인">법인</option>
				</select> 
			</td>
			<td>
				<input type="button" value="검색" @click="search()">
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>읍면동</th>
			<th>분류</th>
			<th>어린이집 이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
		<tr v-for="data in apiList">
			<td>{{data.no}}</td>
			<td>{{data.dong_nm}}</td>
			<td>{{data.nrsry_type}}</td>
			<td>{{data.inst_nm}}</td>
			<td>{{data.telno}}</td>
			<td>{{data.addr}}</td>
		</tr>
	</tbody>
</table>
</body>
</html>