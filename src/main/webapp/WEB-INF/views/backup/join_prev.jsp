<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="content">
<div class="container-fluid" style="margin: auto">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-xs-12 col-md-6" style="align:center">
			<ul class="nav nav-pills nav-justified" >
				<li class="panel panel-default">
					<div class="panel-body" >
						<span class="input-group-addon" id="sizing-addon1" style=" font-weight: bold">
							<span class="glyphicon glyphicon-check" aria-hidden="true" style="color:black"></span>
							<font color="black">약관 동의</font>
						</span>
					</div>
				</li>
				<li class="panel panel-default" style="background-color: #ff9800">
					<div class="panel-body" style="color: white">
						<span class="input-group-addon" id="sizing-addon1" style="font-weight: bold">
							<span class="glyphicon glyphicon-info-sign" aria-hidden="true" style="color:white"></span>
							<font color="white">정보 입력</font>
						</span>
					</div>
				</li>
				<li class="panel panel-default" >
					<div class="panel-body" style="margin: auto">
						<span class="input-group-addon" id="sizing-addon1" style=" font-weight: bold" style="color: white; font-weight: bold">
							<span class="glyphicon glyphicon-plane" aria-hidden="true" style="color:black"></span>
							<font color="black">가입 완료</font>
						</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="col-md-3"></div>
		
		<form>
			<div class="col-md-4"></div>
			<div class="col-xs-12 col-md-4">
				<br />
				<br />
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">
						<span class="glyphicon glyphicon-envelope" aria-hidden="true" style="color:black"></span>
					</span>
					<div>
						<input type="text" id="id" name="id" class="form-control" placeholder="Enter E-mail" aria-describedby="sizing-addon1" style="width: 47%">
						<input type="text" class="form-control" value=" @ " aria-describedby="sizing-addon1" style="width: 5%; font-size: 100%; " readonly="readonly">
					</div>
					<div class="form-group " >
						<select class="form-control" id="sel-email" name="sel-email" style="width: 45%; color:black">
							<option value="daum.net">daum.net</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
						</select>
					</div>
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">
						<span class="glyphicon glyphicon-lock" aria-hidden="true" style="color:black"></span>
					</span>
					<input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" aria-describedby="sizing-addon1" >
				</div>
				<br />
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">
						<span class="glyphicon glyphicon-lock" aria-hidden="true" style="color:black"></span>
					</span>
					<input type="password" id="pwck" name="pwck" class="form-control" placeholder="Check for Password" aria-describedby="sizing-addon1">
				</div>
				<br />
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">
						<span class="glyphicon glyphicon-user" aria-hidden="true" style="color:black"></span>
					</span>
					<input type="text" id="mem-name" name="mem-name" class="form-control" placeholder="Enter your name" aria-describedby="sizing-addon1">
				</div>
				<br />
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">
						<span class="glyphicon glyphicon-phone" aria-hidden="true" style="color:black"></span>
						</span>
						<input type="text" id="phone" name="phone" class="form-control" placeholder="Enter your phone number" aria-describedby="sizing-addon1">
					</div>
					<br />
					<div align="center">
						<button id="joinButton">→ 회원 가입</button>
						<button id="cancelButton">다시 작성</button>
						<button id="test">test</button>
						<br />
						<br />
						<br />
						<br />
						<br />
					</div>
				</div>
				<div class="col-md-4"></div>
			</form>
		</div>
	</div>
</div>
<script>
$(function() {
	$('form').addClass('form-horizontal');
	$('#joinButton').addClass('btn btn-warning').click(function() {
		$('form').attr('method', 'post').attr('action','${context }/member/join.do').submit();
	});
	$('#cancelButton').addClass('btn btn-default').click(function() {
		$('form').reset();		
	});
	
	$('#test').addClass('btn btn-danger').click(function() {
		$('form').attr('method', 'post').attr('action','${context }/member/success_join.do').submit();
	});
});
</script>	
