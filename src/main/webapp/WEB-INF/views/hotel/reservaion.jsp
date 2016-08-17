<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Start Page Banner -->
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - Hotel</h2>
			</div>
			<div class="col-md-6">
				<ul class="breadcrumbs">
					<li><a href="/">지니투어 홈</a></li>
					<li>호텔</li>
					<li>예약 정보 입력</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Page Banner -->
<div id="content">
	<div class="container">
		<div class="row">
			<!-- Page Content -->
			<div class="col-md-2"></div>
			<div class="main col-md-8 page-content" align="center">
				<!-- Classic Heading -->
				<h4 class="classic-title"><span>예약자 세부 정보 입력</span></h4>
				<!-- Forms start -->
			
				<form role="form" id="hot_res_detail" data-toggle="validator" class="shake">
					<div class="form-group">
						<div class="controls" >
							<div class="col-md-6">
								<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>이름</b></label></div>
								<div class="col-md-10">
									<input type="text" id="lastName" name="lastName" class="email" placeholder="Last-Name" required data-error="이름을 확인해 주시기 바랍니다">
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>성</b></label></div>
								<div class="col-md-10">
									<input type="text" id="firstName" name="firstName" class="email" placeholder="First-Name" required data-error="성을 확인해 주시기 바랍니다">
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="controls" >
							<div class="col-md-6">
								<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>이메일</b></label></div>
								<div class="col-md-10">
									<input type="text" id="lastName" name="lastName" class="email" placeholder="Last-Name" required data-error="이름을 확인해 주시기 바랍니다">
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>이메일 확인</b></label></div>
								<div class="col-md-10">
									<input type="text" id="firstName" name="firstName" class="email" placeholder="First-Name" required data-error="성을 확인해 주시기 바랍니다">
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="controls" >
							<div class="col-md-6">
								<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>국적</b></label></div>
								<div class="col-md-10">
									<select class="form-control">
										<option>대한민국</option>
										<option>중국</option>
										<option>일본</option>
									</select>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>성별</b></label></div>
								<div class="col-md-10">
									<select class="form-control">
										<option>여자</option><option>남자</option>
									</select>
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="controls">
							<div class="col-md-2" align="right"><label for="email" style="margin-top:8px;"><b>국적</b></label></div>
							<div class="col-md-10">
								<input type="text" id="email" name="email" class="email" placeholder="E-mail" required data-error="이메일을 확인해 주시기 바랍니다" >
								<div class="help-block with-errors"></div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="controls">
							<div class="col-md-2" align="right"><label for="email" style="margin-top:8px;"><b>도착시간</b></label></div>
							<div class="col-md-10">
								<select class="form-control">
									<option>1:00</option>
									<option>2:00</option>
									<option>3:00</option>
								</select>
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
							<div class="help-block with-errors"></div>
							<br/><br/><br/>
							
							<button type="submit" id="submit" class="btn-system btn-large" >예약 완료</button>
							<button type="reset" id="reset" class="btn-system btn-large" >다시 입력</button>
							</div>
						</div>
				</form>
				<!-- Form End -->
			</div>
			<div class="col-md-2"></div>
			<br />
			<br />
			<br />

		</div>
	</div>
</div>