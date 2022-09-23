<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<script>
//Set the date we're counting down to
var countDownDate = new Date("Oct 9, 2022").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  var distance = countDownDate - now;
    
  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    
  // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML =  "D - "+ days
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
});
</script>
<style>

#contest {
	font-size: 22px;
}

img {
	vertical-align: top;
}

.banner_img, .banner_bg {
	display: inline-block;
	position: relative;
}

.banner_img:hover:after, .banner_img:hover>.hover_text, .banner_bg:hover:after,
	.banner_bg:hover>.hover_text {
	display: block;
}

.banner_img:after, .banner_bg:after, .hover_text {
	display: none;
}

.banner_img:after, .banner_bg:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.3);
	z-index: 10;
}

.banner_img {
	overflow: hidden;
}

.banner_img img {
	max-width: 320px;
	max-height: 200px;
}

.banner_img:hover img {
	transform: scale(1.2);
	transition: 1s;
}

.hover_text {
	position: absolute;
	top: 50px;
	left: 10px;
	color: #fff;
	z-index: 20;
	font-weight: 300;
	font-size: 15px;
}

.fixed_img_col li{
float:left;
width: 320px;
height: 320px;
padding: 20px 20px;
margin-bottom:-1px;

}

.pfo {
  text-align: center;
  color: black;
  font-size: 15px;
  margin-top: 0px;
}

</style>
<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
		<div class="card-header">
		<h4 id="contest" class= "card-title">공모전</h4>
		</div>
			<div class="card-body">
			<div class="wrap">
			<div class="fixed_img_col">
				<ul>
					<li><a href="https://www.wevity.com/?c=find&s=1&sp=contents&sw=%EA%B0%9C%EB%B0%9C%EC%9E%90&gbn=viewok&gp=1&ix=69031"
						target="_blank" class="banner_img"> <img
							src="https://www.wevity.com/upload/contest/20220921202041_a3cf59c9.jpg"> 
							<em class="hover_text">
							2022년도 <br> 자율주행 인공지능 <br>알고리즘 <br>개발 챌린지 공모전</em>
					</a>
						<p>2022-09-13 ~ 2022-10-09</p>
						<em id="demo" class="pfo"></em></li>
					<li><a href="https://www.wevity.com/?c=find&s=1&sp=contents&sw=%EA%B0%9C%EB%B0%9C%EC%9E%90&gbn=viewok&gp=1&ix=68880"
						target="_blank" class="banner_img"> <img
							src="https://www.wevity.com/upload/contest/20220918010017_48069bc6.jpg"> 
							<em class="hover_text">
								한국 축산 데이터톤<br> 2022
								</em>
					</a>
						<p>2022-09-26</p></li>
						<li><a href="https://www.wevity.com/?c=find&s=1&sp=contents&sw=%EA%B0%9C%EB%B0%9C%EC%9E%90&gbn=viewok&gp=1&ix=69031"
						target="_blank" class="banner_img"> <img
							src="https://www.wevity.com/upload/contest/20220921202041_a3cf59c9.jpg"> 
							<em class="hover_text">
							2022년도 <br> 자율주행 인공지능 <br>알고리즘 <br>개발 챌린지 공모전</em>
					</a>
						<p>2022-09-26</p></li>
				</ul>
				<ul>
					<li><a href="https://www.wevity.com/?c=find&s=1&sp=contents&sw=%EA%B0%9C%EB%B0%9C%EC%9E%90&gbn=viewok&gp=1&ix=69031"
						target="_blank" class="banner_img"> <img
							src="https://www.wevity.com/upload/contest/20220921202041_a3cf59c9.jpg"> 
							<em class="hover_text">
							2022년도 <br> 자율주행 인공지능 <br>알고리즘 <br>개발 챌린지 공모전</em>
					</a>
						<p>2022-09-26</p></li>
					<li><a href="https://www.wevity.com/?c=find&s=1&sp=contents&sw=%EA%B0%9C%EB%B0%9C%EC%9E%90&gbn=viewok&gp=1&ix=68880"
						target="_blank" class="banner_img"> <img
							src="https://www.wevity.com/upload/contest/20220918010017_48069bc6.jpg"> 
							<em class="hover_text">
								한국 축산 데이터톤<br> 2022
								</em>
					</a>
						<p>2022-09-26</p></li>
						<li><a href="https://www.wevity.com/?c=find&s=1&sp=contents&sw=%EA%B0%9C%EB%B0%9C%EC%9E%90&gbn=viewok&gp=1&ix=69031"
						target="_blank" class="banner_img"> <img
							src="https://www.wevity.com/upload/contest/20220921202041_a3cf59c9.jpg"> 
							<em class="hover_text">
							2022년도 <br> 자율주행 인공지능 <br>알고리즘 <br>개발 챌린지 공모전</em>
					</a>
						<p>2022-09-26</p></li>
				</ul>
			</div>
			</div>
			</div>
		</div>

	</div>
	<!-- card end -->
</div>
<!-- content body end -->

<%@include file="../includes/footer.jsp"%>