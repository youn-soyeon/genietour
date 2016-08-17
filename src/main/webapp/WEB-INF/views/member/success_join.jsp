<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<P>
		<p>
		<p>
		<div class="container-fluid" style="margin: auto">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-xs-12 col-md-6" style="align:center">
					<ul class="nav nav-pills nav-justified" >
						
						
					</ul>
					<br />
					<br />
					<form class="form-horizontal">
						<fieldset>
							<legend color="black"><b>가입 완료</b></legend>
							<br />
							<div align="center">`
								<h4>Genie Tour의 회원이 되신 것을 축하드립니다!</h4>
								<br />
								<h5>아이디 : ${member.memId }</h5>
								<br />
								<h6>지금 로그인 하시면 Genie Tour의 많은 서비스를 이용하실 수 있습니다.</h6>
								<br />
							</div>
							<legend></legend>
						</fieldset>
					</form>
					<!-- <div align="center">
						<button id="okButton">확인</button> -->
						<br />
						<br />
						<br />
						<br />
						<br />
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
		</div>
	</body>
	<script>
		$(function() {
			/*  $('form').addClass('form-horizontal');
			$('#okButton').addClass('btn btn-info').click(function() {
				$('form').attr('method', 'post').attr('action','${context }/member/login.do').submit();
			}); 
		
			}); */
	</script>
</html>