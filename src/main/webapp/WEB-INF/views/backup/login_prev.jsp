<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container" style="margin-top:40px">
<input type="text" id="name" placeholder="Name" required="" data-error="Please enter your name">
		<div class="center-block">
			<div class="center-block">
				<div class="panel panel-default">
					<div class="panel-heading ">
						<strong > Genie Tour - 로그인</strong>
					</div>
					<div class="panel-body">
						<form role="form" action="#" method="POST">
							<fieldset>
								<div class="loginTop text-center">
									<div class="center-block">
										<img src="${context}/resources/img/memberImg/login.png" id="ginie">
									</div>
								</div>
								<br>
								<br>
								<div class="row">
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-user"></i>
												</span> 
												<input class="form-control" placeholder="아이디" name="loginname" type="text" autofocus>
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-lock"></i>
												</span>
												<input class="form-control" placeholder="비밀번호" name="password" type="password" value="">
											</div>
										</div>
										<div class="form-group">
											<input type="submit" class="btn btn-lg btn-primary btn-block" value="로그인" id="loginButton">
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
					<div class="panel-footer ">
						아이디가 없으세요? <a href="${context}/member/join" onClick=""> 회원가입 페이지 이동 </a>
					</div>
                </div>
			</div>
		</div>
	</div>

