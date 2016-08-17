<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>




<!-- Start Page Banner -->
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - Admin</h2>
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
				<ul id="myTab" class="nav nav-tabs">
 					 <li class="active"><a href="#flight" data-toggle="tab">Flight</a></li>
  					 <li class=""><a href="#hotel" data-toggle="tab">Hotel</a></li>
  					 <li class=""><a href="#member" data-toggle="tab">Member</a></li>
				</ul>
			<div id="myTabContent" class="tab-content">
  				<div class="tab-pane fade active in" id="flight">
   					
   					<form id="flightSearchForm" role="form">
							<!-- 출국part -->
							
							
							<div class="column">
								<div class="col-md-6">
									<div>
										<h4 class="classic-title"><span>항공</span></h4>
									</div>
										<h4 class="classic-title"><span>항공코드추가</span></h4>
											<div class="input-group input-group-lg">
 											 	<span class="input-group-addon" id="sizing-addon1">항공코드</span>
 											 	<input type="text" class="form-control" placeholder="항공코드 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공번호추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공번호</span>
 										 		<input type="text" class="form-control" placeholder="항공번호 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공이름추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공이름</span>
 										 		<input type="text" class="form-control" placeholder="항공이름 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공출발도시추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공출발도시</span>
 										 		<input type="text" class="form-control" placeholder="항공출발도시 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공도착도시추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공도착도시</span>
 										 		<input type="text" class="form-control" placeholder="항공도착도시 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공출발시간추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공출발시간</span>
 										 		<input type="text" class="form-control" placeholder="항공출발시간 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공도착시간추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공도착도시</span>
 										 		<input type="text" class="form-control" placeholder="항공도착시간 입력" aria-describedby="sizing-addon1">
											</div>
								</div>
							</div><!-- end column -->
							<!-- 귀국 part -->
							<div class="column">
								<div class="col-md-6">
									<div>
										<h4 class="classic-title"><span>좌석</span></h4>
									</div>
									<h4 class="classic-title"><span>좌석코드추가</span></h4>
									<div class="input-group input-group-lg">
 										 <span class="input-group-addon" id="sizing-addon1">좌석코드</span>
 										 <input type="text" class="form-control" placeholder="좌석코드 입력" aria-describedby="sizing-addon1">
									</div>
									
									<h4 class="classic-title"><span>좌석타입추가</span></h4>
									<div class="row">
  										<div class="col-lg-4">
    										<div class="input-group">
      											<span class="input-group-addon">
        											<input type="checkbox" aria-label="...">
      											</span>
      												<input type="text" class="form-control"  value="이코노미"  readonly aria-label="...">
    										</div><!-- /input-group -->
  										</div><!-- /.col-lg-4 -->
  										<div class="col-lg-4">
    										<div class="input-group">
      											<span class="input-group-addon">
        											<input type="checkbox" aria-label="...">
      											</span>
      											<input type="text" class="form-control"  value="이코노미" readonly aria-label="...">			
    										</div><!-- /input-group -->
  										</div><!-- /.col-lg-4 -->
 										<div class="col-lg-4">
    										<div class="input-group">
      											<span class="input-group-addon">
        											<input type="checkbox" aria-label="...">
      											</span>
      												<input type="text" class="form-control"  value="이코노미" readonly aria-label="...">
    										</div><!-- /input-group -->
  										</div><!-- /.col-lg-4 -->
									</div><!-- /.row -->
									
									<h4 class="classic-title"><span>항공가격</span></h4>
									<div class="input-group input-group-lg">
 										 <span class="input-group-addon" id="sizing-addon1">항공가격</span>
 										 <input type="text" class="form-control" placeholder="가격 입력" aria-describedby="sizing-addon1">
									</div>
									
									<h4 class="classic-title"><span>좌석 수</span></h4>
									<div class="input-group input-group-lg">
 										 <span class="input-group-addon" id="sizing-addon1">좌석 수</span>
 										 <input type="text" class="form-control" placeholder="좌석 수 입력" aria-describedby="sizing-addon1">
									</div>
								</div>
							</div>
							<!-- end column -->
						</form>
   				 
   				 
  				</div>
  				
  				<!--                     Hotel                     -->
  				
  				
  				<div class="tab-pane fade" id="hotel">
   				 	<form id="flightSearchForm" role="form">
							<!-- 출국part -->
							
							
							<div class="column">
								<div class="col-md-6">
									<div>
										<h4 class="classic-title"><span>호텔</span></h4>
									</div>
										<h4 class="classic-title"><span>호텔코드추가</span></h4>
											<div class="input-group input-group-lg">
 											 	<span class="input-group-addon" id="sizing-addon1">호텔코드</span>
 											 	<input type="text" class="form-control" placeholder="호텔코드 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>호텔이름추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">호텔이름</span>
 										 		<input type="text" class="form-control" placeholder="호텔이름 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>국가추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">국가</span>
 										 		<input type="text" class="form-control" placeholder="국가 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>도시추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">도시</span>
 										 		<input type="text" class="form-control" placeholder="도시 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>주소추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">주소</span>
 										 		<input type="text" class="form-control" placeholder="주소 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>전화번호</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">전화번호</span>
 										 		<input type="text" class="form-control" placeholder="전화번호 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>홈페이지</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">홈페이지</span>
 										 		<input type="text" class="form-control" placeholder="홈페이지 입력" aria-describedby="sizing-addon1">
											</div>
											
										<h4 class="classic-title"><span>옵션</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">옵션</span>
 										 		<input type="text" class="form-control" placeholder="옵션 입력" aria-describedby="sizing-addon1">
											</div>
								</div>
							</div><!-- end column -->
							<!-- 귀국 part -->
							<div class="column">
								<div class="col-md-6">
									<div>
										<h4 class="classic-title"><span>좌석</span></h4>
									</div>
									<h4 class="classic-title"><span>좌석코드추가</span></h4>
									<div class="input-group input-group-lg">
 										 <span class="input-group-addon" id="sizing-addon1">좌석코드</span>
 										 <input type="text" class="form-control" placeholder="좌석코드 입력" aria-describedby="sizing-addon1">
									</div>
									
									<h4 class="classic-title"><span>좌석타입추가</span></h4>
									<div class="row">
  										<div class="col-lg-4">
    										<div class="input-group">
      											<span class="input-group-addon">
        											<input type="checkbox" aria-label="...">
      											</span>
      												<input type="text" class="form-control"  value="이코노미" aria-label="...">
    										</div><!-- /input-group -->
  										</div><!-- /.col-lg-4 -->
  										<div class="col-lg-4">
    										<div class="input-group">
      											<span class="input-group-addon">
        											<input type="checkbox" aria-label="...">
      											</span>
      											<input type="text" class="form-control"  value="이코노미" aria-label="...">			
    										</div><!-- /input-group -->
  										</div><!-- /.col-lg-4 -->
 										<div class="col-lg-4">
    										<div class="input-group">
      											<span class="input-group-addon">
        											<input type="checkbox" aria-label="...">
      											</span>
      												<input type="text" class="form-control"  value="이코노미" aria-label="...">
    										</div><!-- /input-group -->
  										</div><!-- /.col-lg-4 -->
									</div><!-- /.row -->
									
									<h4 class="classic-title"><span>항공가격</span></h4>
									<div class="input-group input-group-lg">
 										 <span class="input-group-addon" id="sizing-addon1">항공가격</span>
 										 <input type="text" class="form-control" placeholder="가격 입력" aria-describedby="sizing-addon1">
									</div>
									
									<h4 class="classic-title"><span>좌석 수</span></h4>
									<div class="input-group input-group-lg">
 										 <span class="input-group-addon" id="sizing-addon1">좌석 수</span>
 										 <input type="text" class="form-control" placeholder="좌석 수 입력" aria-describedby="sizing-addon1">
									</div>
								</div>
							</div>
							<!-- end column -->
						</form>
   				 
 				 </div>
 		<!-- Member -->		 
 				  <div class="tab-pane fade" id="member">
    				
					<form id="flightSearchForm" role="form">
							<!-- 출국part -->
							
							
							<div class="column">
								<div class="col-md-6">
									<div>
										<h4 class="classic-title"><span>항공</span></h4>
									</div>
										<h4 class="classic-title"><span>항공코드추가</span></h4>
											<div class="input-group input-group-lg">
 											 	<span class="input-group-addon" id="sizing-addon1">항공코드</span>
 											 	<input type="text" class="form-control" placeholder="항공코드 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공번호추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공번호</span>
 										 		<input type="text" class="form-control" placeholder="항공번호 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공이름추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공이름</span>
 										 		<input type="text" class="form-control" placeholder="항공이름 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공출발도시추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공출발도시</span>
 										 		<input type="text" class="form-control" placeholder="항공출발도시 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공도착도시추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공도착도시</span>
 										 		<input type="text" class="form-control" placeholder="항공도착도시 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공출발시간추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공출발시간</span>
 										 		<input type="text" class="form-control" placeholder="항공출발시간 입력" aria-describedby="sizing-addon1">
											</div>
									
										<h4 class="classic-title"><span>항공도착시간추가</span></h4>
											<div class="input-group input-group-lg">
 										 		<span class="input-group-addon" id="sizing-addon1">항공도착도시</span>
 										 		<input type="text" class="form-control" placeholder="항공도착시간 입력" aria-describedby="sizing-addon1">
											</div>
								</div>
							</div><!-- end column -->
							<!-- 귀국 part -->
							<div class="column">
								<div class="col-md-6">
									<div>
										<h4 class="classic-title"><span>좌석</span></h4>
									</div>
									<h4 class="classic-title"><span>좌석코드추가</span></h4>
									<div class="input-group input-group-lg">
 										 <span class="input-group-addon" id="sizing-addon1">좌석코드</span>
 										 <input type="text" class="form-control" placeholder="좌석코드 입력" aria-describedby="sizing-addon1">
									</div>
									
									<h4 class="classic-title"><span>좌석타입추가</span></h4>
									<div class="row">
  										<tr>
											<td><input type="checkbox" name="Checkbox" value=""></td>
											<td><input type="text" size="10" name="pris" disabled="true"></td>
											<td><input type="text" size="10" name="toppfart" disabled="true"></td>
											<td><input type="text" size="10" name="motorinstallasjon" disabled="true"></td>
										</tr>
									</div><!-- /.row -->
									<div class="row">
										<tr>
											<td><input type="checkbox" name="Checkbox" value="">
											<td><input type="text" size="10" name="pris" disabled="true"></td>
											<td><input type="text" size="10" name="toppfart" disabled="true"></td>
											<td><input type="text" size="10" name="motorinstallasjon" disabled="true"></td>
										</tr>
									</div>
									<div class="row">
										<tr>
											<td><input type="checkbox" name="Checkbox" value="">
											<td><input type="text" size="10" name="pris" disabled="true"></td>
											<td><input type="text" size="10" name="toppfart" disabled="true"></td>
											<td><input type="text" size="10" name="motorinstallasjon" disabled="true"></td>
										</tr>
									</div>
									<h4 class="classic-title"><span>항공가격</span></h4>
									<div class="input-group input-group-lg">
 										 <span class="input-group-addon" id="sizing-addon1">항공가격</span>
 										 <input type="text" class="form-control" placeholder="가격 입력" aria-describedby="sizing-addon1">
									</div>
									
									<h4 class="classic-title"><span>좌석 수</span></h4>
									<div class="input-group input-group-lg">
 										 <span class="input-group-addon" id="sizing-addon1">좌석 수</span>
 										 <input type="text" class="form-control" placeholder="좌석 수 입력" aria-describedby="sizing-addon1">
									</div>
								</div>
							</div>
							<!-- end column -->
						</form>
  				  </div>
 				 
				</div>
				<!-- Tab panels -->

				</div>
				<!-- End Tabs -->
				
			</div><!-- end col -->
			<div class="col-ms-2"></div>
		</div><!-- end row -->	
			<div class="col-md-2">
				<br />
				<button id="flightSearchBtn" type="submit" class="btn-system btn-large" style="float: right; margin-right: 50px">추가하기</button>
			</div>
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
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  var target = $(e.target).attr("href") // activated tab
		  alert(target);
		});
	
	if (typeof window.onload == 'function') {motorCheckbox_OL = window.onload;}
	window.onload = function()
	{
	  if (window.motorCheckbox_OL) motorCheckbox_OL();
	  var i, ca;
	  ca = document.getElementsByName('motorCheckbox');
	  for (i = 0; i < ca.length; ++i) {
	    ca[i].onclick = motorCheckbox_click;
	  }
	}
	function motorCheckbox_click()
	{
	  // find parent TR
	  var tr = this.parentNode;
	  while (tr && tr.nodeName.toLowerCase() != 'tr') {
	    tr = tr.parentNode;
	  }
	  if (tr) {
	    // get all inputs contained by TR
	    var i, ia = tr.getElementsByTagName('input');
	    for (i = 0; i < ia.length; ++i) {
	      if (ia[i].type.toLowerCase() == 'text') { // filter out 'text' inputs
	        ia[i].disabled = !this.checked;
	      }
	    }
	  }
	}
</script>
