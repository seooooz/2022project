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

#contest {
	font-size: 22px !important;
}
#cimg {
	vertical-align: top !important;
}
.banner_img, .banner_bg {
	display: inline-block !important;
	position: relative !important;
}
.banner_img:hover:after, .banner_img:hover>.hover_text, .banner_bg:hover:after,
	.banner_bg:hover>.hover_text {
	display: block !important;
}
.banner_img:after, .banner_bg:after, .hover_text {
	display: none !important;
}
.banner_img:after, .banner_bg:after {
	content: '';
	position: absolute !important;
	top: 0 !important;
	right: 0 !important;
	bottom: 0 !important;
	left: 0 !important;
	background: rgba(0, 0, 0, 0.3) !important;
	z-index: 10 !important;
}
.banner_img {
	overflow: hidden !important;
}
.banner_img #cimg {
	width: 280px !important;
	height: 290px !important;
}
.banner_img:hover #cimg {
	transform: scale(1.2) !important;
	transition: 1s !important;
}
.hover_text {
	position: absolute !important;
	top: 120px !important;
	left: 100px !important;
	color: #fff !important;
	z-index: 20 !important;
	font-weight: 300 !important;
	font-size: 15px !important;
	left: 100px !important;
}

.fixed_img_col li {
	float: left !important;
	padding: 15px 5px 5px 30px !important;
	margin-bottom: -1px !important;
}

.addImp {
	font-size: 15px !important;
	color: black !important;
	font-weight: 600 !important;
}
.cp {
	font-size: 14px !important;
	color: black !important;
	margin-bottom: -1px !important;
}

.cropped1 {
	width: 250px !important;
	height: 350px !important;
	overflow: hidden !important;
}

.bsize {
	width: 230px !important;
	padding: 15px 32px !important;
	text-align: center !important;
	margin: 4px 2px !important;
}
.ca {
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
				<h4 id="contest" class="card-title">?????????</h4>
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
									<button class="hover_text btn btn-primary">?????????</button>
								</a>
							</div>
							<p class="cp">(???)???????????????/(???)?????????????????????????????????</p>
							<p class="cp">
								<b>???5??? TEXTOM ???????????? ?????? ?????????</b>
							</p>
							<p class="cp">
								<b>??????:2022??? 12??? 1???</b>
							</p>
						</li>

						<li>
							<div class="cropped">
								<a href="https://datacontest2022.assembly.go.kr/"
									target="_blank" class="banner_img"> <img id="cimg"
									src="https://datacontest2022.assembly.go.kr/board/file/download?file_number=11&width=800">
									<button class="hover_text btn btn-primary">?????????</button>
								</a>
							</div>
							<p class="cp">(???)???????????? ??????</p>
							<p class="cp">
								<b>2022 ?????? ????????? ?????? ????????????</b>
							</p>
							<p class="cp">
								<b>??????:2022??? 11??? 11???</b>
							</p>
						</li>
						<li>
							<div class="cropped">
								<a
									href="https://bigdata.seoul.go.kr/noti/selectNoti.do?r_id=P710&bbs_seq=570&sch_type=&sch_text=%C2%A4tPage=1"
									target="_blank" class="banner_img"> <img id="cimg"
									src="https://bigdata.seoul.go.kr/upload/editor/bbs/20220919/16635570597737CCYKVXK4H3E189O80370N232.jpg">
									<button class="hover_text btn btn-primary">?????????</button>
								</a>
							</div>
							<p class="cp">(???)?????????/????????? ?????????????????????</p>
							<p class="cp">
								<b>2022 ??????????????? ????????????????????? ?????????</b>
							</p>
							<p class="cp">
								<b>??????:2022??? 11??? 3???</b>
							</p>
					</ul>
					<ul>
						<li>
							<div class="cropped">
								<a
									href="https://itsaeil.or.kr/Notice/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=12545245&t=board"
									target="_blank" class="banner_img"> <img id="cimg"
									src="/view/img/project-woman-p.jpg">
									<button class="hover_text btn btn-primary">?????????</button>
								</a>
							</div>
							<p class="cp">(???)????????????????????????</p>
							<p class="cp">
								<b>2022??? IT?????? <br>?????? ??????????? ??????????????? ?????????
								</b>
							</p>
							<p class="cp">
								<b>??????:2022??? 10??? 31???</b>
							</p>
						</li>
						<li>
							<div class="cropped">
								<a
									href="https://itsaeil.or.kr/Notice/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=12545245&t=board"
									target="_blank" class="banner_img"> <img id="cimg"
									src="/view/img/project-kium.jpg">
									<button class="hover_text btn btn-primary">?????????</button>
								</a>
							</div>
							<p class="cp">(???)???????????????????????????????????????????????????????</p>
							<p class="cp">
								<b>2022??? ???1??? k-ium <br>?????? ???????????? ????????????
								</b>
							</p>
							<p class="cp">
								<b>??????:2022??? 10??? 30???</b>
							</p>
						</li>
						<li>
							<div class="cropped">
								<a
									href="https://dept.sjcu.ac.kr/ee/news/notice.do?mode=view&articleNo=71855"
									target="_blank" class="banner_img"> <img id="cimg"
									src="https://dept.sjcu.ac.kr/_attach/sjcu/editor-image/2022/09/uWhUapKzgvGXqJgPsBykJEtOql.jpeg">
									<button class="hover_text btn btn-primary">?????????</button>
								</a>

							</div>
							<p class="cp">(???)???????????????????????? ?????????????????????</p>
							<p class="cp">
								<b>2022 ??????????????????<br>????????? ?????? ?????? ??? ?????? ?????????
								</b>
							</p>
							<p class="cp">
								<b>??????: 2022??? 11??? 13???</b>
							</p>
						</li>
					</ul>
				</div>

			</div>
			<button style="width: 250px; margin: auto;" class="btn btn-primary"
				onclick="javascript:doDisplay();">??? ?????? ????????? ??????</button>
			<div id="cssTest" style="display: none;">
				<p class="cp">
					<br> <a class="ca" href="https://allforyoung.com/" target="_blank">????????????</a>&nbsp;
					&nbsp; <a class="ca" href="https://linkareer.com/" target="_blank">????????????</a>&nbsp;
					&nbsp; <a class="ca" href="https://thinkyou.co.kr/" target="_blank">??????</a>
				</p>
			</div>
			<br>
		</div>

	</div>
	<!-- card end -->
</div>
<!-- content body end -->

<%@include file="../includes/footer.jsp"%>