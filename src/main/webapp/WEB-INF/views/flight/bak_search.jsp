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
					<li>검색</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Page Banner -->

<!-- Start Content - 항공 상세 검색 -->
<div id="content">
	<div class="container">
		<div class="row">
			<div class="col-ms-2"></div>
			<div class="col-ms-8">
			
			<!-- Start Tabs -->
			<div class="tabs-section">
				
				<!-- Nav Tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab-1" data-toggle="tab">항공권 검색</a></li>
				</ul>
				
				<!-- Tab panels -->
				<div class="tab-content">
					<!-- Tab Content -->
					<div class="tab-pane fade in active" id="tab-1">
						<!-- Hotel Search Form Start -->
						<form id="flightSearchForm" role="form">
						
							<!-- small button -->
							<div>
								<a href="#" class="btn-system btn-mini border-btn">왕복</a>
								<a href="#" class="btn-system btn-mini border-btn">편도</a>
								<br /><br />
							</div>
							
							<!-- 출국part -->
							<div>
								<h4 class="classic-title"><span>출국</span></h4>
							</div>
							
							<div class="row">
								<div class="col-md-4">
									<div><label for="depart_city">출발지 선택</label></div>
									<div class="form-group">
										<div class="controls">
											<select multiple class="form-control" style="width:200px">
												<option>김포</option>
												<option>인천</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div><label for="depart_city">도착지 선택</label></div>
									<div class="form-group">
										<div class="controls">
											<select multiple class="form-control" style="width:200px">
												<option>파리</option>
												<option>런던</option>
												<option>강은지네</option>
												<option>서대문</option>
												<option>자연사박물관</option>
												<option>신촌</option>
											</select>
										</div>
									</div>	
								</div>
								<div class="col-md-4">
									<div><label for="depart_city">도착지 선택</label></div>
									<div class="form-group">
										<div class="controls">
											<select multiple class="form-control" style="width:200px">
												<option>파리</option>
												<option>런던</option>
												<option>강은지네</option>
												<option>서대문</option>
												<option>자연사박물관</option>
												<option>신촌</option>
											</select>
										</div>
									</div>		
								</div>
							</div><!-- end row -->
							
							<!-- 귀국 part -->
							<div>
								<br />
								<h4 class="classic-title"><span>귀국</span></h4>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div><label for="depart_city">출발지 선택</label></div>
									<div class="form-group">
										<div class="controls">
											<select multiple class="form-control" style="width:200px">
												<option>파리</option>
												<option>런던</option>
												<option>강은지네</option>
												<option>서대문</option>
												<option>자연사박물관</option>
												<option>신촌</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div><label for="depart_city">도착지 선택</label></div>
									<div class="form-group">
										<div class="controls">
											<select multiple class="form-control" style="width:200px">
												<option>김포</option>
												<option>인천</option>
											</select>
										</div>
									</div>	
								</div>
								<div class="col-md-4">
									<div><label for="depart_city">도착지 선택</label></div>
									<div class="form-group">
										<div class="controls">
											<select multiple class="form-control" style="width:200px">
												<option>파리</option>
												<option>런던</option>
												<option>강은지네</option>
												<option>서대문</option>
												<option>자연사박물관</option>
												<option>신촌</option>
											</select>
										</div>
									</div>		
								</div>
								<div class="col-md-10">
									<div class="row">
										<div class="col-xs-2">
											<label for="">성인</label>
											<select class="form-control">
												<option>1</option><option>2</option><option>3</option>
											</select>
										</div>
										<div class="col-xs-2">
											<label for="">아동</label>
											<select class="form-control">
												<option>1</option><option>2</option><option>3</option>
											</select>
										</div>
										<div class="col-xs-2">
											<label for="">유아</label>
											<select class="form-control">
												<option>1</option><option>2</option><option>3</option>
											</select>
										</div>
										<div class="col-xs-1"></div>
										<div class="col-xs-2">
											<label for="">좌석선택</label>
											<select class="form-control">
												<option>1</option><option>2</option><option>3</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-2">
									<br />
									<button id="flightSearchBtn" type="submit" class="btn-system btn-large" style="float: right; margin-right: 50px">검색하기</button>
								</div>
							</div><!-- end row -->
							
						</form>
						<!-- End Hotel Search Form -->
					</div><!-- /Tab Content -->
				</div><!-- /Tab panels -->
				</div>
				<!-- End Tabs -->
				
			</div><!-- end col -->
			<div class="col-ms-2"></div>
		</div><!-- end row -->	
	</div><!-- end container -->
</div>
<!-- End Content - 항공 상세 검색 -->


<script type="text/javascript">
	$(function() {
		$('#flightSearchBtn').click(function(e) {
			e.preventDefault();
			alert('클릭');
			$('form').attr('action','/flight/searchDetail').submit();	
		});	
	});
</script>
