<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<style>
#teqh {
	font-size: 22px;
}

a {
	font-size: 17px;
	color: blue;
}

p {
	font-size: 14px;
	color: black;
	margin-bottom: -1px;
}

</style>

<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 id="teqh" class="card-title">시험 일정(필기)</h4>
			</div>
			<div class="card-body">
				<!-- 테이블 버튼 시작 (전체, 코드, 기타) -->
				<div class="profile-tab">
					<!-- 카테고리 수정 -->
					<div class="custom-tab-1">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a href="#my-posts" data-toggle="tab"
								class="nav-link active show">정보 처리 기능사</a></li>
							<li class="nav-item"><a href="#about-me" data-toggle="tab"
								class="nav-link">정보 처리 기사</a></li>
							<li class="nav-item"><a href="#me" data-toggle="tab"
								class="nav-link">정보 처리 산업 기사</a></li>
						</ul>
						<!-- 카테고리 안에 내용물 수정-->
						<div class="tab-content">
							<div id="my-posts" class="tab-pane fade active show">

								<div class="my-post-content pt-3">
									<div class="table-responsive">
										<table class="table mb-0">
											<thead>
												<tr id="t-font">
													<th>구분</th>
													<th>필기 원서 접수(인터넷)(휴일제외)</th>
													<th>필기시험</th>
													<th>필기 합격(예정자)발표</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>2022년 정기 기능사 1회</td>
													<td>2022.01.07~2022.01.07</td>
													<td>2022.01.23~2022.01.29</td>
													<td>2022.02.09</td>
												</tr>
												<tr>
													<td>2022년 정기 기능사 2회</td>
													<td>2022.03.07~2022.03.11</td>
													<td>2022.03.27~2022.04.02</td>
													<td>2022.04.13</td>
												</tr>
												<tr>
													<td>2022년 정기 기능사 3회</td>
													<td>2022.05.24~2022.05.27<br> [빈자리
														접수:2022.06.06~2022.06.07]
													</td>
													<td>2022.06.12~2022.06.18</td>
													<td>2022.06.29</td>
												</tr>
												<tr>
													<td>2022년 정기 기능사 4회</td>
													<td>2022.08.02~2022.08.05 <br>[빈자리접수 :
														2022.08.22~2022.08.23]
													</td>
													<td>2022.08.28~2022.09.03</td>
													<td>2022.09.21</td>
												</tr>
											</tbody>
										</table>
										<p>
											정확한 정보는 반드시 <a
												href="http://www.q-net.or.kr/totalSearch.do?gSite=Q&totalQuery=%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%B4%C9%BB%E7&searchSort=&resFlag=&pageNum=1&sang=0&qryStr=%40where+%7B+SRCH_TITLE%28HASALL%7C%27%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%BB%E7%27%7C1000%7C0%29+or+SRCH_TITLE_BI%28HASALL%7C%27%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%BB%E7%27%7C1000%7C0%29+%7D&searchMenu=total&searchQuery=%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%B4%C9%BB%E7">한국산업인력공단</a>사이트에서
											확인하시기 바랍니다
										</p>
									</div>

								</div>
							</div>
							<!-- 전체 -->
							<div id="about-me" class="tab-pane fade">
								<div class="profile-about-me">
									<div class="my-post-content pt-3">
										<div class="table-responsive">
											<table class="table mb-0">
												<thead>
													<tr>
														<th>구분</th>
														<th>필기 원서 접수(인터넷)(휴일제외)</th>
														<th>필기시험</th>
														<th>필기 합격(예정자)발표</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2022년 정기 기사 1회</td>
														<td>2022.01.24~2022.01.27</td>
														<td>2022.03.05</td>
														<td>2022.03.23</td>
													</tr>
													<tr>
														<td>2022년 정기 기사 2회</td>
														<td>2022.03.28~2022.03.31</td>
														<td>2022.04.24</td>
														<td>2022.05.18</td>
													</tr>
													<tr>
														<td>2022년 정기 기사 3회</td>
														<td>2022.06.07~2022.06.10<br> [빈자리접수 :
															2022.06.26~2022.06.27]
														</td>
														<td>2022.07.02~2022.07.22</td>
														<td>2022.08.10</td>
													</tr>
												</tbody>
											</table>
											<p>
												정확한 정보는 반드시 <a
													href="http://www.q-net.or.kr/totalSearch.do?gSite=Q&totalQuery=%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%BB%E7&searchSort=&resFlag=&pageNum=1&sang=0&qryStr=%40where+%7B+SRCH_TITLE%28HASALL%7C%27%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%B4%C9%BB%E7%27%7C1000%7C0%29+or+SRCH_TITLE_BI%28HASALL%7C%27%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%B4%C9%BB%E7%27%7C1000%7C0%29+%7D&searchMenu=total&searchQuery=%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%BB%E7">한국산업인력공단</a>사이트에서
												확인하시기 바랍니다
											</p>
										</div>
									</div>
								</div>
							</div>
							<div id="me" class="tab-pane fade">
								<div class="profile-about-me">
									<div class="my-post-content pt-3">
										<div class="table-responsive">
											<table class="table mb-0">
												<thead>
													<tr>
														<th>구분</th>
														<th>필기 원서 접수(인터넷)(휴일제외)</th>
														<th>필기시험</th>
														<th>필기 합격(예정자)발표</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2022년 정기 산업기사 1회</td>
														<td>2022.01.25~2022.01.28</td>
														<td>2022.03.02~2022.03.17</td>
														<td>2022.03.23</td>
													</tr>
													<tr>
														<td>2022년 정기 산업기사 2회</td>
														<td>2022.03.29~2022.04.01 <br>[빈자리접수 :
															2022.04.11~2022.04.12]
														</td>
														<td>2022.04.17~2022.04.30</td>
														<td>2022.05.18</td>
													</tr>
													<tr>
														<td>2022년 정기 산업기사 3회</td>
														<td>2022.06.07~2022.06.10<br> [빈자리접수 :
															2022.06.26~2022.06.27]
														</td>
														<td>2022.07.02~2022.07.22</td>
														<td>2022.08.10</td>
													</tr>
												</tbody>
											</table>
											<p>
												정확한 정보는 반드시 <a
													href="http://www.q-net.or.kr/totalSearch.do?gSite=Q&totalQuery=%C1%A4%BA%B8%C3%B3%B8%AE%BB%EA%BE%F7%B1%E2%BB%E7&searchSort=&resFlag=&pageNum=1&sang=0&qryStr=%40where+%7B+SRCH_TITLE%28HASALL%7C%27%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%BB%E7%27%7C1000%7C0%29+or+SRCH_TITLE_BI%28HASALL%7C%27%C1%A4%BA%B8%C3%B3%B8%AE%B1%E2%BB%E7%27%7C1000%7C0%29+%7D&searchMenu=total&searchQuery=%C1%A4%BA%B8%C3%B3%B8%AE%BB%EA%BE%F7%B1%E2%BB%E7">한국산업인력공단</a>사이트에서
												확인하시기 바랍니다
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 테이블 버튼 시작 (전체, 코드, 기타) -->
			</div>
		</div>
		<!-- card end -->
	</div>
</div>
<!-- content body end -->

<%@include file="../includes/footer.jsp"%>