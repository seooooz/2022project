<style>
]
/* .carousel-inner>.item { */
/* 	top: 0; */
/* 	left: 0; */
/* 	min-width: 80px; */
/* 	min-height: 20px; */
/* } */
#simg {
	width: 400px;
	height: 600px;
}
</style>
<script>
	$('.carousel').carousel({
		interval : 100
	})
</script>
<div class="container"></div>
<div id="demo" class="carousel slide" data-ride="carousel">

	<div class="carousel-inner">
		<!-- 슬라이드 쇼 -->
		<div class="carousel-item active">
			<!--가로-->
			<img id="simg" onclick="location='setNotice.jsp'" class="d-block w-100" src="/view/img/setting.png"
				alt="First slide" >
			<div class="carousel-caption d-none d-md-block"></div>
		</div>
		<div class="carousel-item">
			<img id="simg" onclick="location='career.jsp'" class="d-block w-100" src="/view/img/career.jpg"
				alt="Second slide">
		</div>
		<div class="carousel-item">
			<img id="simg" class="d-block w-100" src="/view/img/contest.jpg"
				alt="Third slide">
		</div>
		<div class="carousel-item">
			<img id="simg" class="d-block w-100" src="/view/img/project.jpg"
				alt="Forth slide">
		</div>

		<!-- / 슬라이드 쇼 끝 -->

		<!-- 왼쪽 오른쪽 화살표 버튼 -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <!-- <span>Previous</span> -->
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <!-- <span>Next</span> -->
		</a>
		<!-- / 화살표 버튼 끝 -->

		<!-- 인디케이터 -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<!--0번부터시작-->
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
			<li data-target="#demo" data-slide-to="3"></li>
		</ul>
		<!-- 인디케이터 끝 -->
	</div>
</div>