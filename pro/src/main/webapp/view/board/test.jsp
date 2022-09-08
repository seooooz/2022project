<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
      <!-- Bootstrap cdn 설정 -->	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	  
      	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	  
      	  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	  
      	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <!-- carousel를 구성할 영역 설정 --> -->
<!-- <div align ="center" style="width: 300px; margin: 100px;"> -->
<!-- 	<!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. --> -->
<!-- 	<!-- carousel는 특이하게 id를 설정해야 한다.--> -->
<!-- 	<div id="carousel-example-generic" class="carousel slide"> -->
<!-- 		<!-- carousel의 지시자 --> -->
<!-- 		<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. --> -->
<!-- 		<ol class="carousel-indicators"> -->
<!-- 			<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. --> -->
<!-- 			<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. --> -->
<!-- 			<!-- 딱히 이 부분은 옵션별로 설정하게 없다. --> -->
<!-- 			<li data-target="#carousel-example-generic" data-slide-to="0" -->
<!-- 				class="active"></li> -->
<!-- 			<li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
<!-- 		</ol> -->
<!-- 		<!-- 실제 이미지 아이템 --> -->
<!-- 		<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. --> -->
<!-- 		<div class="carousel-inner" role="listbox"> -->
<!-- 			<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. --> -->
<!-- 			<div class="item active"> -->
<!-- 				아미지 설정- -->
<!-- 				<img -->
<!-- 					src="https://tistory2.daumcdn.net/tistory/1041549/skin/images/nowonbuntistory.png" -->
<!-- 					style="width: 100%"> -->
<!-- 				캡션 설정 (생략 가능) -->
<!-- 				글자 색은 검은색 -->
<!-- 				<div class="carousel-caption" style="color: black;">명월 일지입니다. -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="item"> -->
<!-- 				<img src="https://www.nowonbun.com/img/nowonbuntistory1.png" -->
<!-- 					style="width: 100%"> -->
<!-- 				<div class="carousel-caption" style="color: black;">明月開発ストーリ</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<!-- 왼쪽 화살표 버튼 --> -->
<!-- 		<!-- href는 carousel의 id를 가르킨다. --> -->
<!-- 		<a class="left carousel-control" href="#carousel-example-generic" -->
<!-- 			role="button" data-slide="prev"> 왼쪽 화살표 <span -->
<!-- 			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
<!-- 		</a> -->
<!-- 		<!-- 오른쪽 화살표 버튼 --> -->
<!-- 		<!-- href는 carousel의 id를 가르킨다. --> -->
<!-- 		<a class="right carousel-control" href="#carousel-example-generic" -->
<!-- 			role="button" data-slide="next"> 오른쪽 화살표 <span -->
<!-- 			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
<!-- 		</a> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- <img src="/blog/resource/img/m1.jpg" id=mainImage alt="slide"/> -->

<script>
	var myImage = document.getElementById("mainImage");
	var imageArray = [ "/blog/resource/img/m1.jpg",
			"/blog/resource/img/m2.jpg", "/blog/resource/img/m3.jpg" ];
	var imageIndex = 0;

	function changeImage() {
		myImage.setAttribute("src", imageArray[imageIndex]);
		imageIndex++;
		if (imageIndex >= imageArray.length) {
			imageIndex = 0;
		}
	}
	setInterval(changeImage, 3000);
</script>
</body>
</html>