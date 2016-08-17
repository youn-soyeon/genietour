<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Start Page Banner -->
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - 관리자</h2>
			</div>
			<div class="col-md-6">
				<ul class="breadcrumbs">
					<li><a href="/">지니투어 홈</a></li>
					<li><a href="#">회원관리</a></li>
					<li><a href="#">항공권</a></li>
					<li><a href="#">호텔</a></li>
					<li><a href="#">통계</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- End Page Banner -->
<div id="content"><div class="container"><div class="row">
	<div class="col-md-12">
		<div class="col-md-3"></div>
		<div class="col-md-3">
			<button type="button" class="btn-system" id="memberBtn"><img src="${context}/resources/images/user.png" alt="" style=""/></button>
		</div>
		<div class="col-md-3">
			<button type="button" class="btn-system" id="statisticsBtn"><img src="${context}/resources/images/statistics.png" alt="" style=""/></button>
		</div>
		<div class="col-md-3"></div>
	</div>
	<div class="col-md-12">
		<br />
		<div class="col-md-3"></div>
		<div class="col-md-3">
			<button type="button" class="btn-system" id="flightBtn"><img src="${context}/resources/images/flight.png" alt="" /></button>
		</div>
		<div class="col-md-3">
			<button type="button" class="btn-system" id="hotelBtn"><img src="${context}/resources/images/hotel.png" alt="" /></button>
		</div>
		<div class="col-md-3"></div>
	</div>
</div></div></div>

<script type="text/javascript">
	$(function() {
		$('#memberBtn').click(function() {
			admin.ajax.member();
			//$('#content').load('/admin/memlist/1');
		});
		$('#statisticsBtn').click(function() {
			alert('statisticsBtn 클릭');
		});
		$('#flightBtn').click(function() {
			alert('flightBtn 클릭');
			$('#content').load('/admin/flilist/1');
		});
		$('#hotelBtn').click(function() {
			alert('hotelBtn 클릭');
			$('#content').load('/admin/hotlist/1');
		});
	});
</script>