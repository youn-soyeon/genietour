<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- Start Page Banner -->
<form method="post" id="mypage-form">
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - 마이페이지</h2>
			</div>
			<div class="col-md-6">
				<ul class="breadcrumbs">
					<li><a href="/">지니투어 홈</a></li>
					<li><a href="/member/update.user">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Page Banner -->
 
<!-- Start Content -->
<div id="content"><div class="container"><div class="page-content"><div class="row">
	<div class="col-md-7" align="center">
		<h4 class="classic-title"><span>${user.memId }님의  예약확인</span></h4>
		<div class="col-md-2"></div>
		<div class="col-md-8">
			
		</div>
	</div>
	<div class="col-md-5">
	      <div><img alt="" src="${context }/resources/images/about-01.jpg"></div>
	</div>


          <!-- Divider -->
          <div class="hr1" style="margin-bottom:50px;"></div>

          <!-- Classic Heading -->
			<div align="center">
          <h4 class="classic-title"><span>호텔 예약 리스트</span></h4>
	</div>
          <!-- Start Team Members -->
				 <div class="clients-carousel custom-carousel touch-carousel" data-appeared-items="5">
				<table class="table table-striped" style="font-size: 1em;">
				<thead>
					<tr>
						<th>NO</th>
						<th>호텔명</th>
						<th>도시명</th>
						<th>가격</th>
						<th>예약일</th>
						<th>체크인</th>
						<th>체크아웃</th>
					</tr>					
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>	
			</div>
          <!-- End Team Members -->

          <!-- Divider -->
          <div class="hr1" style="margin-bottom:50px;"></div>

          <!-- Start Clients Carousel -->
          <div class="our-clients">

            <!-- Classic Heading -->
            <div align="center">
            <h4 class="classic-title"><span>항공권 예약 리스트</span></h4>
			</div>
            <div class="clients-carousel custom-carousel touch-carousel" data-appeared-items="5">
				<table class="table table-striped" style="font-size: 1em;">
				<thead>
					<tr>
						<th>NO</th>
						<th>항공사</th>
						<th>편명</th>
						<th>출발지</th>
						<th>도착지</th>
						<th>출발일</th>
						<th>도착일</th>
						<th>가격</th>
						<th>예약일</th>
					</tr>					
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>	
            </div>
          </div>
          <!-- End Clients Carousel -->


        </div>
      </div>
    </div>
	<div class="input_button text-center">
				<button id="changeBtn" >개인정보 변경</button>
				<button id="delBtn" >회원 탈퇴</button>
	</div>
    </div>
    <!-- End content -->
    
</form>
<script type="text/javascript">
	$('#changeBtn').click(function() {
		$('#mypage-form').attr('action', '/member/update/${user.memId}.user').submit();
	});
	
		
	$('#delBtn').click(function() {
		alert("정말로 회원을 탈퇴 하시겠습니까??");
		$('#mypage-form').attr('action', '/member/delete.user').submit();
		});
</script>
