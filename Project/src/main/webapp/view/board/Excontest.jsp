<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url(http://font.googleapis.com/earlyaccess/nanumgothic.css);

html, body {
	width: 100%;
	height: 100%;
}

body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td,
	form, fieldset, legend, input, textarea, button, select {
	margin: 0;
	padding: 0
}

body, input, textarea, select, button, table {
	font-family: "돋움", Dotum, AppleGothic, sans-serif;
	font-size: 12px;
}

img, fieldset {
	border: 0;
}

ul, ol {
	list-style: none;
}

em, address {
	font-style: normal;
}

a {
	text-decoration: none;
}

a:hover, a:actvie, a:focus {
	text-decoration: underline;
}

.wrap {
	width: 600px;
	margin: 0 auto;
	font-family: "NaumGothic", sans-serif;
}

.wrap h1 {
	padding: 10px 0 4px;
	border-bottom: 1px
	solid
	#aaa;
}

#nope{
max-width:300px;
max-height:300px;
}

.fixed_img_col li {
	height: 180px;
	padding: 20px;
	margin-bottom: -1px;
	border-bottom: 1px solid #aaa;
}

.fixed_img_col li a{
display: block;
}

.thumb{
background-color: #ccc;
max-width: 300px;
max-height: 300px;

}
.fixed_img_col li a {
position: relative;
color: #666;
text-align: center;

}

.fixed_img_col li a em{
display:none;
position: absolute;
left:0;
top:0;
width: 100%;
height: 100%;
background-color: rgba(0,0,0,.5);
color: #eee;
font-weight:bold;
text-align: center;
line-height:120px;
}

.fixed_img_col li a:hover  em{
display:block;
}

.fixed_img_col li a strong{
display: block;
padding: 8px 0 4px;
color: #333;
font-weight: bold;
line-height: 1.4;
}

.fixed_img_col li a:hover{
text-decoration: none;
}

.fixed_img_col li p{
color:#767676;
font-size:.9em;
}
</style>
</head>
<body>
	<div class="wrap">
		<h1>프로젝트 - 공모전</h1>
		<div class=fixed_img_col>
			<ul>
			<li><a href="#"> <span class="thumb"> <img id="nope"
							src="/view/img/hani.jpg" alt=""> <br> <em>HypeBoy</em>
					</span><strong>이미지 제목</strong>
				</a>
					<p>2022-09-21</p></li>
				<li><a href="#"><span class="thumb"> <img id="nope"
							src="/view/img/hani.jpg" alt=""> <br> <em>HypeBoy</em></span> <strong>이미지
							제목</strong></a>
					<p>2022-09-21</p></li>

			</ul>
		</div>
	</div>
</body>
</html>