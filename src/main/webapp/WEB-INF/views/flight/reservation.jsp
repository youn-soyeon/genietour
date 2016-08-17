<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	table th {
		text-align: center
	}
</style>

<!-- Start Page Banner -->
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - Flight</h2>
			</div>
			<div class="col-md-6">
				<ul class="breadcrumbs">
					<li><a href="/">지니투어 홈</a></li>
					<li>항공권</li>
					<li>예약 정보 입력</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Page Banner -->


<div id="content">
	<form>
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div align="center">
						<h4 class="classic-title"><span>예약자 정보</span></h4>
					</div>
					<div class="form-group">
						<div class="controls" >
							<div class="col-md-6">
								<div class="col-md-4" align="right"><label for="email" style="margin-top:8px"><b>예약자 명</b></label></div>
								<div class="col-md-8">
									<input type="text" id="res_name" name="res_name" class="email" value="강은지">
								</div>
							</div>
							<div class="col-md-6">
								<div class="col-md-3" align="right"><label for="email" style="margin-top:8px"><b>생년월일</b></label></div>
								<div class="col-md-8">
									<input type="text" id="birth" name="birth" class="email" placeholder="First-Name" required data-error="성을 확인해 주시기 바랍니다">
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="col-md-4" align="right"><label for="email" style="margin-top:8px"><b>연락처</b></label></div>
								<div class="col-md-8">
									<input type="text" id="phone" name="phone" class="email" placeholder="연락처" required data-error="연락처를 확인해 주시기 바랍니다">
								</div>
							</div>
							<div class="col-md-6">
								<div class="col-md-3" align="right"><label for="email" style="margin-top:8px"><b>이메일</b></label></div>
								<div class="col-md-8">
									<input type="text" id="email" name="email" class="email" placeholder="E-mail" required data-error="이메일을 확인해 주시기 바랍니다">
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
					</div>
					
					<div align="center">
						<h4 class="classic-title"><span>탑승객 정보</span></h4>
					</div>
					<div align="right">
						<h6>1번 탑승자가 위의 예약자와 동일합니까? <input type="radio">예 <input type="radio" aria-label="">아니오</h6>
						<br />
					</div>
					
					<div>
						<table class="table table-striped" style="font-size: 13px;" >
							<thead align="center">
								<tr>
									<th>NO</th>
									<th>구분</th>
									<th>총 요금</th>
									<th>한글이름</th>
									<th>영문 이름</th>
									<th>영문 성</th>
									<th>법정생년월일</th>
									<th>성별</th>
									<th>연락처</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td style="width: 10%">
										<select class="form-control">
											<option>성인</option><option>아동</option><option>유아</option>
										</select>
									</td>
									<td><input type="text" id="totalPrice" name="totalPrice" class="email" placeholder="총 요금" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="korName" name="korName" class="email" placeholder="한글이름" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="lastName" name="lastName" class="email" placeholder="영문이름" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="firstName" name="firstName" class="email" placeholder="영문 성" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="birth" name="birth" class="email" placeholder="법정생년월일" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td style="width: 10%">
										<select class="form-control">
											<option>여자</option><option>남자</option>
										</select>
									</td>
									<td><input type="text" id="phone" name="phone" class="email" placeholder="연락처" required data-error="연락처를 확인해 주시기 바랍니다"></td>
								</tr>
								<tr>
									<td>2</td>
									<td style="width: 10%">
										<select class="form-control">
											<option>성인</option><option>아동</option><option>유아</option>
										</select>
									</td>
									<td><input type="text" id="totalPrice" name="totalPrice" class="email" placeholder="총 요금" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="korName" name="korName" class="email" placeholder="한글이름" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="lastName" name="lastName" class="email" placeholder="영문이름" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="firstName" name="firstName" class="email" placeholder="영문 성" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="birth" name="birth" class="email" placeholder="법정생년월일" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td style="width: 10%">
										<select class="form-control">
											<option>여자</option><option>남자</option>
										</select>
									</td>
									<td><input type="text" id="phone" name="phone" class="email" placeholder="연락처" required data-error="연락처를 확인해 주시기 바랍니다"></td>
								</tr>
								<tr>
									<td>3</td>
									<td style="width: 10%">
										<select class="form-control">
											<option>성인</option><option>아동</option><option>유아</option>
										</select>
									</td>
									<td><input type="text" id="totalPrice" name="totalPrice" class="email" placeholder="총 요금" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="korName" name="korName" class="email" placeholder="한글이름" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="lastName" name="lastName" class="email" placeholder="영문이름" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="firstName" name="firstName" class="email" placeholder="영문 성" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td><input type="text" id="birth" name="birth" class="email" placeholder="법정생년월일" required data-error="연락처를 확인해 주시기 바랍니다"></td>
									<td style="width: 10%">
										<select class="form-control">
											<option>여자</option><option>남자</option>
										</select>
									</td>
									<td><input type="text" id="phone" name="phone" class="email" placeholder="연락처" required data-error="연락처를 확인해 주시기 바랍니다"></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div align="center">
						<h4 class="classic-title"><span>항공 스케쥴 확인</span></h4>
					</div>
					<div style="border: 1px black;">
						<div><br /><label for="name" style="margin-top:8px"><b>출국)</b></label> 일반석 인천(5/9) → 청도(칭다오)(5/9)</div>
						<table class="table table-striped" style="font-size: 13px;" >
							<thead align="center">
								<tr>
									<th></th>
									<th>항공사</th>
									<th>편명</th>
									<th>출발시간</th>
									<th>도시</th>
									<th>도착시간</th>
									<th>도시</th>
									<th>비행시간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><img src="" alt="" /></td>
									<td>아시아나항공</td>
									<td>7C8401</td>
									<td>2016년 05월 09일(월) 08:20</td>
									<td>인천</td>
									<td>2016년 05월 09일(월) 09:50</td>
									<td>청도(칭다오)</td>
									<td>1:30</td>
								</tr>
							</tbody>
						</table>
						
						<div><br /><label for="name" style="margin-top:8px"><b>귀국)</b></label> 일반석 청도(칭다오)(5/11) → 인천(5/11)</div>
						<table class="table table-striped" style="font-size: 13px;" >
							<thead align="center">
								<tr>
									<th></th>
									<th>항공사</th>
									<th>편명</th>
									<th>출발시간</th>
									<th>도시</th>
									<th>도착시간</th>
									<th>도시</th>
									<th>비행시간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><img src="" alt="" /></td>
									<td>아시아나항공</td>
									<td>7C8401</td>
									<td>2016년 05월 11일(수) 08:20</td>
									<td>청도(칭다오)</td>
									<td>2016년 05월 11일(수) 09:50</td>
									<td>인천</td>
									<td>1:30</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div align="center">
						<button type="submit" id="submit" class="btn-system btn-large" >예약</button>
						<button type="reset" id="reset" class="btn-system btn-large" >취소</button>
					</div>
				</div>
				<div class="col-md-1"></div>
				
			</div>
		</div>
	</form>
</div>