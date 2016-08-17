<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body onload="getLogin()">

<!-- Start Page Banner -->
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - 로그인</h2>
			</div>
			<div class="col-md-6">
				<ul class="breadcrumbs">
					<li><a href="/">지니투어 홈</a></li>
					<li>로그인</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Page Banner -->

<!-- Start Content -->
<div id="content">
	<div class="container">
		<div class="row">
			<!-- Page Content -->
			<div class="col-md-4"></div>
			<div class="main col-md-4 page-content" align="center">
				<!-- Classic Heading -->
				<h4 class="classic-title"><span>로그인</span></h4>
				<!-- Forms start -->
				<form id="login-form"  name ="loginform" method="post">
					<div class="form-group">
						<div class="controls">
							<input type="text" id="memId" name="memId" class="email" placeholder="Name" required data-error="Please enter your name">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="controls">
							<input type="text" id="password" name="password" class="email" placeholder="Password" required data-error="Please enter your Password">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="checkbox">
						<div class="form-group">
							<button type="button" class="btn-system btn-large btn-block" id="login-btn">로그인</button>
						</div>
						<div align="right" style="height: 50px">
							<label><input type="checkbox" id="cb_saveId"> 아이디 저장</label>
							<br />
						</div>
						<a id="join" href="/member/join">회원가입</a> / <a href="/">아이디찾기</a> / <a href="/">비밀번호찾기</a>
					</div>
				</form>
				<!-- Form End -->
			</div>
			<div class="col-md-4"></div>
			<div class="space-bottom"></div>

		</div>
	</div>
</div>

</body>
<script type="text/javascript">
	$(function() {
		$('#login-btn').click(function(e) {
			$('#login-form').attr("method","POST").attr('action','/member/login').submit();
		});	
		
		var cookie_user_id = getLogin();
		
		if(cookie_user_id != "") {
			$("#memId").val(cookie_user_id);
			$("#cb_saveId").attr("checked", true);
		}
		
		$("#cb_saveId").on("click", function(){
			var ck = this;
			var isRemember;
				
			if($(ck).is(":checked")) {
			
			isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? ");
			
			$(ck).attr("checked", true);
			
			}
		});
		
		$("#login-btn").on("click", function(){
			
			if($("#cb_saveId").is(":checked")){
				
			saveLogin($("#memId").val());
			
			}else{ 
				
			saveLogin("");
			
			}
		});
		
	});
	
	function saveLogin(id) {
		if(id != "") {
		
			setSave("memId", id, 7);
		
		} else {
		
			setSave("memId", id, -1);
		}
	}
	
	function setSave(name, value, expiredays) {
		var today = new Date();
		today.setDate( today.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
	}
	
	function getLogin() {
		
		var cook = document.cookie + ";";
		var idx = cook.indexOf("memId", 0);
		var val = "";

		if(idx != -1) {
		cook = cook.substring(idx, cook.length);
		begin = cook.indexOf("=", 0) + 1;
		end = cook.indexOf(";", begin);
		val = unescape(cook.substring(begin, end));
		}
		
		return val;
		
	}

</script>
