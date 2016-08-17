<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- Start Page Banner -->
 '<div class="page-banner no-subtitle"><div class="container"><div class="row">\
	+ <div class="col-md-6"><h2>지니투어 - 회원가입</h2></div>'
	<div class="col-md-6">
		<ul class="breadcrumbs">
			<li><a href="/">지니투어 홈</a></li>
			<li>회원가입</li>
		</ul>
	</div>
</div></div></div>
<!-- End Page Banner -->


<!-- Start Content -->
<div id="content"><div class="container"><div class="row">
	<!-- Page Content -->
	<div class="col-md-2"></div>
	<div class="main col-md-8 page-content" align="center">
		<!-- Classic Heading -->
		<h4 class="classic-title"><span>회원 정보 입력</span></h4>
		<!-- Forms start -->
	
		<form role="form" id="contactForm" data-toggle="validator" class="shake">
			<div class="form-group">
				<div class="controls" >
					<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>지니투어 계정</b></label></div>
					<div class="col-md-10">
					<input type="text" id="memId" name="memId" class="email" placeholder="지니투어 계정" required data-error="계정을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="password" style="margin-top:8px"><b>비밀번호</b></label></div>
					<div class="col-md-10">
					<input type="text" id="password" name="password" class="email" placeholder="비밀번호" required data-error="비밀번호를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="passwordCheck" style="margin-top:8px"><b>비밀번호 확인</b></label></div>
					<div class="col-md-10">
					<input type="text" id="passwordCheck" name="passwordCheck" class="email" placeholder="비밀번호 확인" required data-error="비밀번호 확인을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>이름</b></label></div>
					<div class="col-md-10">
					<input type="text" id="memName" name="memName" class="email" placeholder="이름" required data-error="이름을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>핸드폰번호</b></label></div>
					<div class="col-md-10">
					<input type="text" id="phone" name="phone" class="email" placeholder="핸드폰번호" required data-error="핸드폰번호를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right">
						<label for="name" style="margin-top:8px"><b>회원유형</b></label>
					</div>
					<div class="col-md-10" style="vertical-align: middle;">
						<input type="radio" name="role" id="role" value="회원" checked /> 회원
					<div class="help-block with-errors"></div>
					<br/><br/><br/>
					<button type="submit" id="submit" class="btn-system btn-large" >회원가입</button>
					<button type="reset" id="reset" class="btn-system btn-large" >다시입력</button>
					</div>
				</div>
			
			</div>
			
			
		</form>
		<!-- Form End -->
	</div>
	<div class="col-md-2"></div>
	<br />
	<br />
	<br />

</div></div></div>