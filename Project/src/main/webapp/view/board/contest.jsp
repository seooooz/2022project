<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

<script type="text/javascript">
	var bDisplay = true;
	document.getElementById("cssTest").style.display = 'none';
	function doDisplay() {
		var pj1 = document.getElementById("cssTest");
		if (pj1.style.display == "none") {
			pj1.style.display = "block";
		} else {
			pj1.style.display = "none";
		}
	}
</script>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

p, strong, ul, li {
	font-family: 'Pretendard-Regular';
}

#contest {
	font-size: 22px;
}

#cimg {
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

.banner_img #cimg {
	width: 280px;
	height: 290px;
}

.banner_img:hover #cimg {
	transform: scale(1.2);
	transition: 1s;
}

.hover_text {
	position: absolute;
	top: 120px;
	left: 100px;
	color: #fff;
	z-index: 20;
	font-weight: 300;
	font-size: 15px;
	left: 100px;
}

.fixed_img_col li {
	float: left;
	padding: 15px 5px 5px 30px;
	margin-bottom: -1px;
}

.addImp {
	font-size: 15px;
	color: black;
	font-weight: 600;
}

p {
	font-size: 14px;
	color: black;
	margin-bottom: -1px;
}

.cropped1 {
	width: 250px;
	height: 350px;
	overflow: hidden;
}

.bsize {
	width: 230px;
	padding: 15px 32px;
	text-align: center;
	margin: 4px 2px;
}

a {
	font-size: 17px;
	color: black;
}
</style>
<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 id="contest" class="card-title">공모전</h4>
			</div>
			<div class="card-body">
				<div class="fixed_img_col">
					<ul>
						<li>
							<div class="cropped">
								<a
									href="https://www.textom.co.kr/home/bbs/view.php?id=notice&page_num=15&page=1&select_arrange=headnum&desc=desc&no=136"
									target="_blank" class="banner_img"> <img id="cimg"
									src="https://allforyoung.com/_next/image?url=https%3A%2F%2Fallforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com%2Fuploads%2Fpost_photos%2F2022%2F08%2F15%2F65d0c77f9ad84cc683e41aa6ea8169f1.jpg&w=1920&q=75">
									<button class="hover_text btn btn-primary">자세히</button>
								</a>
							</div>
							<p id="pt">(주)더아이엠씨/(사)한국데이터사이언스학회</p>
							<p>
								<b>제5회 TEXTOM 빅데이터 분석 공모전</b>
							</p>
							<p>
								<b>마감:2022년 12월 1일</b>
							</p>
						</li>

						<li>
							<div class="cropped">
								<a href="https://datacontest2022.assembly.go.kr/"
									target="_blank" class="banner_img"> <img id="cimg"
									src="https://datacontest2022.assembly.go.kr/board/file/download?file_number=11&width=800">
									<button class="hover_text btn btn-primary">자세히</button>
								</a>
							</div>
							<p id="pt">(주)대한민국 국회</p>
							<p>
								<b>2022 국회 데이터 활용 경진대회</b>
							</p>
							<p>
								<b>마감:2022년 11월 11일</b>
							</p>
						</li>
						<li>
							<div class="cropped">
								<a
									href="https://bigdata.seoul.go.kr/noti/selectNoti.do?r_id=P710&bbs_seq=570&sch_type=&sch_text=%C2%A4tPage=1"
									target="_blank" class="banner_img"> <img id="cimg"
									src="https://bigdata.seoul.go.kr/upload/editor/bbs/20220919/16635570597737CCYKVXK4H3E189O80370N232.jpg">
									<button class="hover_text btn btn-primary">자세히</button>
								</a>
							</div>
							<p id="pt">(주)서울시/서울시 빅데이터캠퍼스</p>
							<p>
								<b>2022 서울특별시 빅데이터캠퍼스 공모전</b>
							</p>
							<p>
								<b>마감:2022년 11월 3일</b>
							</p>
					</ul>
					<ul>
						<li>
							<div class="cropped">
								<a
									href="https://itsaeil.or.kr/Notice/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=12545245&t=board"
									target="_blank" class="banner_img"> <img id="cimg"
									src="/view/img/project-woman-p.jpg">
									<button class="hover_text btn btn-primary">자세히</button>
								</a>
							</div>
							<p id="pt">(주)경기도일자리재단</p>
							<p>
								<b>2022년 IT분야 <br>여성 취·창업 포트폴리오 공모전
								</b>
							</p>
							<p>
								<b>마감:2022년 10월 31일</b>
							</p>
						</li>
						<li>
							<div class="cropped">
								<a
									href="https://itsaeil.or.kr/Notice/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=12545245&t=board"
									target="_blank" class="banner_img"> <img id="cimg"
									src="/view/img/project-kium.jpg">
									<button class="hover_text btn btn-primary">자세히</button>
								</a>
							</div>
							<p id="pt">(주)부산대학교·전남대학교·경북대학교병원</p>
							<p>
								<b>2022년 제1회 k-ium <br>의료 인공지능 경진대회
								</b>
							</p>
							<p>
								<b>마감:2022년 10월 30일</b>
							</p>
						</li>
						<li>
							<div class="cropped">
								<a
									href="https://dept.sjcu.ac.kr/ee/news/notice.do?mode=view&articleNo=71855"
									target="_blank" class="banner_img"> <img id="cimg"
									src="https://dept.sjcu.ac.kr/_attach/sjcu/editor-image/2022/09/uWhUapKzgvGXqJgPsBykJEtOql.jpeg">
									<button class="hover_text btn btn-primary">자세히</button>
								</a>

							</div>
							<p id="pt">(주)세종사이버대학교 전기전자공학과</p>
							<p>
								<b>2022 전기전자분야<br>에너지 절약 체험 및 방안 공모전
								</b>
							</p>
							<p>
								<b>마감: 2022년 11월 13일</b>
							</p>
						</li>
					</ul>
				</div>

			</div>
			<button style="width: 250px; margin: auto;" class="btn btn-primary"
				onclick="javascript:doDisplay();">더 많은 공모전 정보</button>
			<div id="cssTest" style="display: none;">
				<p>
					<br> <a href="https://allforyoung.com/" target="_blank">요즘것들</a>&nbsp;
					&nbsp; <a href="https://linkareer.com/" target="_blank">링커리어</a>&nbsp;
					&nbsp; <a href="https://thinkyou.co.kr/" target="_blank">씽유</a>
				</p>
			</div>
			<br>
		</div>

	</div>
	<!-- card end -->
</div>
<!-- content body end -->

<%@include file="../includes/footer.jsp"%>