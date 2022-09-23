<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<style>
#teqh {
	font-size: 22px;
}
</style>

<!-- content body start -->
<div class="content-body" align="center">
	<div class="col-lg-8">
		<!-- card start -->
		<div class="card">
			<div class="card-header">
				<h4 id="teqh" class="card-title">시험 일정(실기)</h4>
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
												<tr>
													<th>구분</th>
													<th>실기 원서 접수(인터넷)(휴일제외)</th>
													<th>실기 시험</th>
													<th>실기 합격(예정자)발표</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>2022년 정기 기능사 1회</td>
													<td>2022.02.15~2022.02.18</td>
													<td>2022.03.20~2022.04.08</td>
													<td>2022.04.22</td>
												</tr>
												<tr>
													<td>2022년 정기 기능사 2회</td>
													<td>2022.04.26~2022.04.29</td>
													<td>2022.05.29~2022.06.17</td>
													<td>2022.07.01</td>
												</tr>
												<tr>
													<td>2022년 정기 기능사 3회</td>
													<td>2022.07.11~2022.07.14<br>
													[빈자리 접수:2022.08.08~2022.08.09]</td>
													<td>2022.08.14~2022.09.02</td>
													<td>2022.09.16</td>
												</tr>
												<tr>
													<td>2022년 정기 기능사 4회</td>
													<td>2022.09.26~2022.09.29
													<br>[빈자리접수 : 2022.10.27~2022.10.28]</td>
													<td>2022.11.06~2022.11.25</td>
													<td>2022.12.09</td>
												</tr>
											</tbody>
										</table>
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
													<th>실기 원서 접수(인터넷)(휴일제외)</th>
													<th>실기 시험</th>
													<th>실기 합격(예정자)발표</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>2022년 정기 기사 1회</td>
													<td>2022.04.04~2022.04.07</td>
													<td>2022.05.07~2022.05.25</td>
													<td>2022.06.17</td>
												</tr>
												<tr>
													<td>2022년 정기 기사 2회</td>
													<td>2022.06.20~2022.06.23
													<br>[빈자리 접수: 2022.07.18~2022.07.19]</td>
													<td>2022.07.24~2022.08.07
													</td>
													<td>2022.09.02</td>
												</tr>
												<tr>
													<td>2022년 정기 기사 3회</td>
													<td>2022.09.05~2022.09.08<br>
													[빈자리접수 : 2022.10.10~2022.10.11]</td>
													<td>2022.10.16~2022.10.28</td>
													<td>2022.11.25</td>
												</tr>
											</tbody>

											</table>
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
													<th>실기 원서 접수(인터넷)(휴일제외)</th>
													<th>실기 시험</th>
													<th>실기 합격(예정자)발표</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>2022년 정기 산업기사 1회</td>
													<td>2022.04.05~2022.04.08</td>
													<td>2022.05.07~2022.05.25</td>
													<td>2022.06.17</td>
												</tr>
												<tr>
													<td>2022년 정기 산업기사 2회</td>
													<td>2022.06.21~2022.06.24
													<br>[빈자리접수 : 2022.07.18~2022.07.19]</td>
													<td>2022.07.24~2022.08.07</td>
													<td>2022.09.02</td>
												</tr>
												<tr>
													<td>2022년 정기 산업기사 3회</td>
													<td>2022.09.05~2022.09.08<br>
													[빈자리접수 : 2022.10.10~2022.10.11]</td>
													<td>2022.10.16~2022.10.28</td>
													<td>2022.11.25</td>
												</tr>
											</tbody>

											</table>
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