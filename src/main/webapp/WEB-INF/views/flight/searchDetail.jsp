<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Start Page Banner -->
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - Flight</h2>
			</div>
			<div class="col-md-6">
				<ul class="breadcrumbs">
					<li><a href="/">지니투어 홈</a></li>
					<li>항공권</li>
					<li>스케쥴 및 운임 조회</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Page Banner -->


<div id="content">
	<div class="container">
		<form>
			<div class="col-xs-12 col-md-12">
				
				<div class="tabs-section">
				<div>
					<ul class="nav nav-tabs">
						<li class="active" id="tab1"><a>항공요금+스케쥴 보기</a></li>
					</ul>
				</div>
				<div class="tab-content">
				<div class="col-xs-12" id="result" style="height: 500px; ">
					<!-- 왼쪽 -->
					<div class="col-xs-6" style="">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>1. 요금조회</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<!-- 요금조회 내부 리스트 -->
										<table class="table"style="width: 100%; text-align: center" >
											<tr>
												<td><span class="label label-info glyphicon glyphicon-triangle-bottom" aria-hidden="true" style="font-size:13px;"> 항공번호</span></td>
												<td><span class="label label-info glyphicon glyphicon-triangle-bottom" aria-hidden="true" style="font-size:13px;"> 항공사</span></td>
												<td><span class="label label-info glyphicon glyphicon-triangle-bottom" aria-hidden="true" style="font-size:13px;"> 성인1인가격</span></td>
											</tr>
											<tr>
												<td>00001</td>
												<td>제주항공</td>
												<td>100,000</td>
											</tr>
											<tr>
												<td>00001</td>
												<td>제주항공</td>
												<td>100,000</td>
											</tr>
											<tr>
												<td>00001</td>
												<td>제주항공</td>
												<td>100,000</td>
											</tr>
											<tr>
												<td>00001</td>
												<td>제주항공</td>
												<td>100,000</td>
											</tr>
											<tr>
												<td>00001</td>
												<td>제주항공</td>
												<td>100,000</td>
											</tr>
										</table>
									</td>
								</tr>
							</tbody>
						</table> 
					</div>
					<!-- 왼쪽 끝 -->
					
					
					<!-- 오른쪽 -->
					<div class="col-xs-6">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>2. 스케줄별 조회</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<!-- 스케줄별 조회 내부 리스트 -->
										<table class="table" style="width: 100%; text-align: center" >
											<thead>
											<tr>
												<td><span class="label label-info glyphicon glyphicon-triangle-bottom" aria-hidden="true" style="font-size:13px;"> 항공편</span></td>
												<td><span class="label label-info glyphicon glyphicon-triangle-bottom" aria-hidden="true" style="font-size:13px;"> 출발시간</span></td>
												<td><span class="label label-info glyphicon glyphicon-triangle-bottom" aria-hidden="true" style="font-size:13px;"> 도착시간</span></td>
												<td><span class="label label-info glyphicon glyphicon-triangle-bottom" aria-hidden="true" style="font-size:13px;"> 좌석수</span></td>
											</tr>
											</thead>
											<tbody id="g-flight-schedule">
											<tr>
												<td>00001</td>
												<td>16.04.01 PM3:45</td>
												<td>16.04.02 PM3:45</td>
												<td>25</td>
											</tr>
											<tr>
												<td>00001</td>
												<td>16.04.01 PM3:45</td>
												<td>16.04.02 PM3:45</td>
												<td>25</td>
											</tr>
											<tr>
												<td>00001</td>
												<td>16.04.01 PM3:45</td>
												<td>16.04.02 PM3:45</td>
												<td>25</td>
											</tr>
											<tr>
												<td>00001</td>
												<td>16.04.01 PM3:45</td>
												<td>16.04.02 PM3:45</td>
												<td>25</td>
											</tr>
											<tr>
												<td>00001</td>
												<td>16.04.01 PM3:45</td>
												<td>16.04.02 PM3:45</td>
												<td>25</td>
											</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table> 
					</div>
	   				<!-- 오른쪽 끝 -->
	   				
	   				<!-- 3.나의 선택(하단) -->
	   				<div class="col-xs-12">
	   					<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>3. 나의 선택</th>
								</tr>
							</thead>
							<tbody>
							<tr>
								<td>
				   					<table class="table" style="width: 100%; text-align: center" >
										<tr>
											<td>항공번호</td>
											<td>항공편</td>
											<td>항공사</td>
											<td>출발시간</td>
											<td>도착시간</td>
											<td>기본 운임</td>
											<td>총 운임</td>
										</tr>
										<tr>
											<td>00001</td>
											<td>a12345</td>
											<td>제주항공</td>
											<td>16.04.01 PM3:45</td>
											<td>16.04.02 PM3:45</td>
											<td>100,000</td>
											<td>100,000</td>
										</tr>
									</table>
								</td>
							</tr>
							</tbody>
	   					</table>
	   				</div>
	   				<!-- 3.나의 선택 끝 -->
	   			</div>
	   			<div align="right" style="margin-right: 50px">
	   				<button type="submit" id="selectBtn" class="btn-system btn-large" >선택 완료</button>
					<button type="reset" id="reset" class="btn-system btn-large" >재선택</button>
					<br />
					<br />
				</div>	
				</div>
				</div>	
			</div>
				
		</form>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		$('#selectBtn').click(function(e) {
			e.preventDefault();
			alert('클릭');
			$('form').attr('action','/flight/reservation').submit();	
		});	
	});
</script>