<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- Start Page Banner -->
<form id="mem-update-form" method="post">
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - 개인정보 변경 페이지</h2>
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
		<h4 class="classic-title"><span>${user.memName }님 상세정보</span></h4>
		<div class="col-md-2"></div>
		<div class="col-md-8">
				
				<div>
					<div style="width: 30%">아이디</div>
					<input type="text" class="form-condivol" id="memId" name="memId" value="${userDetail.memId }" " />
				</div>
				<div>
					<div style="width: 30%">이름</div>
					<input type="text" class="form-condivol" id="memName" name="memName" value="${userDetail.memName}"readonly="readonly" />
				</div>
				<div>
					<div style="width: 30%">핸드폰번호</div>
					<input type="text" class="form-condivol" id="phone" name="phone" value="${userDetail.phone} "/>
				</div>
				<div>
					<div style="width: 30%">비밀번호</div>
					<input type="password" class="form-condivol" id="password" name="password" value="${userDetail.password}" />
				</div>
				<div>
					<div style="width: 30%">회원유형</div>
					<input type="text" class="form-condivol" id="role" name="role" value="${userDetail.role}" readonly="readonly"/>
				</div>
				<div class="input_button text-center">
					<button id="updateBtn" > 변경 하기</button>
					<button id="cancleBtn" >취소</button>
				</div>
		</div>
	</div>
	
    
</form>
<script type="text/javascript">
	$('#updateBtn').click(function(e) {
		alert("변경성공");
		e.preventDefault();
		$('#mem-update-form').attr('action', '/member/update/${user.memId}.user').submit();
	});
	
		
	$('#cancleBtn').click(function(e) {
		alert("취소");
		$form.reset();
		});
</script>
