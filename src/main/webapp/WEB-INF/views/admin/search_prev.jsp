<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
		input:focus { background:skyblue; }
</style>

<!-- Start Page Banner -->
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - Admin</h2>
			</div>
			<div class="col-md-6">
				<ul class="breadcrumbs">
					<li><a href="/">지니투어 홈</a></li>
					<li><a href="#">유저</a></li>
					<li><a href="#">호텔</a></li>
					<li><a href="#">항공</a></li>
					<li><a href="#">통계</a></li>
				</ul>
			</div>
		</div>
		<!-- row end -->
	</div>
	<!-- container end -->
</div>
<!-- End Page Banner -->

<!-- Start Content - 항공 상세 검색 -->
<div id="content">
	<div class="container">
		<div class="row" style="margin: auto;width: 100%;">
			<button id="testBtn">임시</button>
			<div class="col-ms-8" >
				<!-- Start Tabs -->
				<div class="tabs-section">
					<!-- Nav Tabs -->
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#flight1" data-toggle="tab">Flight</a></li>
						<li class=""><a href="#hotel1" data-toggle="tab">Hotel</a></li>
						<li class=""><a href="#member" data-toggle="tab">Member</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="flight1">
							<form id="flightSearchForm" role="form">
								<div id="flightListContainer">
									<div class="container">
										<div class="accordion-group">
    										<div class="accordion-heading">
      											<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne">항공리스트</a>
      											<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">항공예약리스트</a>
   											</div>
   					 							<div id="collapseOne" class="accordion-body collapse in">
      												<div class="accordion-inner">
      													<div class="table-responsive">
      													  <h4>항공리스트</h4>
  															<table class="table" align="center" border="1" style="font-size:90%">
        														<tr>
        															<th>삭제체크버튼</th>
                  													<th>코드</th>
                  													<th>라인</th>
                  													<th>이름</th>
                  													<th>출발도시</th>
                  													<th>도착도시</th>
                  													<th>출발날짜</th>
                  													<th>도착날짜</th>
                  													<th>출발시간</th>
                  													<th>도착시간</th>
                  													<th>좌석코드</th>
                  													<th>좌석타입</th>
                  													<th>가격</th>
                  													<th>좌석</th>
                  													<th>수정버튼</th>
                												</tr>
                												<c:forEach var="flightSeat" items="${requestScope['flightService']}">
																		<tr align="center">
																			<td><input type="checkbox" name="flight-delete" value="${flightSeat.fliCode}"></td>
																			<td class="fliCode">${flightSeat.fliCode}</td>
																			<td class="airline">${flightSeat.airline}</td>
																			<td class="fliName">${flightSeat.fliName}</td>
																			<td class="depCity">${flightSeat.depCity}</td>
																			<td class="arrCity">${flightSeat.arrCity}</td>
																			<td class="depDate">${flightSeat.depDate}</td>
																			<td class="arrDate">${flightSeat.arrDate}</td>
																			<td class="depTime">${flightSeat.depTime}</td>
																			<td class="arrTime">${flightSeat.arrTime}</td>
																			<td class="seatCode">${flightSeat.seatCode}</td>
																			<td class="seatType">${flightSeat.seatType}</td>
																			<td class="price">${flightSeat.price}</td>
																			<td class="vacancy">${flightSeat.vacancy}</td>
																			<td><input type="radio" id ="flight-update-radio" name="flight-update" ></td>
																		</tr>
																	</c:forEach>											
															</table>
														</div>
     												</div>
   												</div>
   												<div id="collapseTwo" class="accordion-body collapse in">
      												<div class="accordion-inner">
      													<div class="table-responsive">
      													  <h4>항공예약리스트</h4>
  															<table class="table" align="center" border="1" style="font-size:90%">
        														<tr>
                  													<th>예약코드</th>
                  													<th>여권</th>
                  													<th>한국이름</th>
                  													<th>영어이름</th>
                  													<th>생일</th>
                  													<th>성별</th>
                  													<th>폰번호</th>
                  													<th>예약날짜</th>
                  													<th>요구사항</th>
                  													<th>멤버아이디</th>
                  													<th>좌석코드</th>
                												</tr>
                												<c:forEach var="flightReservation" items="${requestScope['flightReservationService']}">
																		<tr>
																			<td>${flightReservation.fliResCode}</td>
																			<td>${flightReservation.passport}</td>
																			<td>${flightReservation.korName}</td>
																			<td>${flightReservation.engName}</td>
																			<td>${flightReservation.birth}</td>
																			<td>${flightReservation.gender}</td>
																			<td>${flightReservation.phone}</td>
																			<td>${flightReservation.resDate}</td>
																			<td>${flightReservation.comments}</td>
																			<td>${flightReservation.memId}</td>
																			<td>${flightReservation.seatCode}</td>
																		</tr>
																	</c:forEach>	
															</table>
														</div>
     												</div>
   												</div>
  											</div>
										</div>
									</div>
								<!-- 항공part -->
								<div class="column">
									<div class="col-md-6">
										<input type="hidden" id="fli-code" name="fli-code"/>
										
										<h4 class="classic-title">
											<span>항공번호추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" for="airline">항공라인번호</span>
											<input type="text" class="form-control" id= "airline" name="airline" placeholder="항공라인번호 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>항공이름추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" for="fli-name">항공이름</span>
											<input type="text" class="form-control" id= "fli-name" name="fli-name" placeholder="항공이름 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>항공출발도시추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" for="dep-city">항공출발도시</span>
											<input type="text" class="form-control" name="dep-city" id= "dep-city"
												placeholder="항공출발도시 입력" aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>항공도착도시추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" for="arr-city">항공도착도시</span>
											<input type="text" class="form-control" name="arr-city" id= "arr-city"
												placeholder="항공도착도시 입력" aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>항공출발날짜추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" for="dep-date">항공출발날짜</span>
											<input type="text" class="form-control" name="dep-date" id= "dep-date"
												placeholder="항공출발시간 입력" aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>항공도착날짜추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" for="arr-date">항공도착날짜</span>
											<input type="text" class="form-control" name="arr-date" id="arr-date"
												placeholder="항공도착시간 입력" aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>항공출발시간추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" for="dep-time">항공출발시간</span>
											<input type="text" class="form-control" name="dep-time" id= "dep-time"
												placeholder="항공출발시간 입력" aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>항공도착시간추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" for="arr-time">항공도착시간</span>
											<input type="text" class="form-control" name="arr-time" id="arr-time"
												placeholder="항공도착시간 입력" aria-describedby="sizing-addon1">
										</div>
									</div>
								</div>
								<!-- end column -->
								<!--  part -->
								<div class="column">
									<div class="col-md-6">
																				
										<h4 class="classic-title">
											<span>좌석타입추가</span>
										</h4>
										<!-- 좌석테이블 -->
										<input type="hidden" id="seat-code" name="seat-code"/>
										<table class="table table-striped">
											<thead>
												<tr>
													<th></th>
													<th>좌석 수</th>
													<th>가격 수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row"><input type="checkbox" id="first" name="seat-type" value="퍼스트">퍼스트</th>
													<td><input type="text" size="10" id= "vacancy1" name="vacancy" disabled="true"></td>
													<td><input type="text" size="10" id = "price1" name="price" disabled="true"></td>
												</tr>
												<tr>
													<th scope="row"><input type="checkbox" id="economy" name="seat-type" value="이코노미">이코노미</th>
													<td><input type="text" size="10" id = "vacancy2" name="vacancy" disabled="true"></td>
													<td><input type="text" size="10" id = "price2" name="price" disabled="true"></td>
												</tr>
												<tr>
													<th scope="row"><input type="checkbox" id="business" name="seat-type" value="비즈니스">비즈니스</th>
													<td><input type="text" size="10" id = "vacancy3" name="vacancy" disabled="true"></td>
													<td><input type="text" size="10" id = "price3" name="price" disabled="true"></td>
												</tr>
											</tbody>
										</table>
																				
									</div>
									<!-- col-min end -->
									
								</div>
								<!-- column end -->
								<!-- end column -->
								<div class="col-md-2">
									<br />
									<button id="flightInsertBtn" type="button"
									class="btn-system btn-large"
									style="float: right; margin-right: 50px">추가하기</button>
								</div>	
								
								<div class="col-md-2">
									<br />
									<button id="flightUpdateBtn" type="submit"
									class="btn-system btn-large"
									style="float: right; margin-right: 50px">수정하기</button>
								</div>
								
								<div class="col-md-2">
									<br />
									<button id="flightDeleteBtn" type="submit"
									class="btn-system btn-large"
									style="float: right; margin-right: 50px">삭제하기</button>
								</div>
							</form>
						
						</div>
						
						<!--                     Hotel                     -->
						<div class="tab-pane fade" id="hotel1">
							<div id="hotelListContainer">
									<div class="container">
										<div class="accordion-group">
    										<div class="accordion-heading">
      											<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapseThree">호텔리스트</a>
      											<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#collapseFour">호텔예약리스트</a>
   											</div>
   					 							<div id="collapseThree" class="accordion-body collapse in">
      												<div class="accordion-inner">
      													<div class="table-responsive">
  															<table class="table" align="center" border="1" style="font-size:90%">
        														<tr>
                  													<th>코드</th>
                  													<th>호텔이름</th>
                  													<th>나라</th>
                  													<th>도시</th>
                  													<th>주소</th>
                  													<th>전화번호</th>
                  													<th>홈페이지</th>
                  													<th>옵션</th>
                  													<th>룸 코드</th>
                  													<th>룸 타입</th>
                  													<th>가격</th>
                  													<th>최대룸수</th>
                  													<th>머무는시간</th>
                  													<th>예약수</th>
                  													<th>남은 룸수</th>
                												</tr>
                												<c:forEach var="hotRoomRes" items="${requestScope['hotelRoomResService']}">
																		<tr>
																			<td>${hotRoomRes.hotCode}</td>
																			<td>${hotRoomRes.hotName}</td>
																			<td>${hotRoomRes.country}</td>
																			<td>${hotRoomRes.city}</td>
																			<td>${hotRoomRes.address}</td>
																			<td>${hotRoomRes.tel}</td>
																			<td>${hotRoomRes.homepage}</td>
																			<td>${hotRoomRes.options}</td>
																			<td>${hotRoomRes.roomCode}</td>
																			<td>${hotRoomRes.roomType}</td>
																			<td>${hotRoomRes.price}</td>
																			<td>${hotRoomRes.maxRoom}</td>
																			<td>${hotRoomRes.stayDate}</td>
																			<td>${hotRoomRes.resCount}</td>
																			<td>${hotRoomRes.vacancy}</td>
																		</tr>
																	</c:forEach>
															</table>
														</div>
     												</div>
   												</div>
   												
   												<div id="collapseFour" class="accordion-body collapse in">
      												<div class="accordion-inner">
      													<div class="table-responsive">
  															<table class="table" align="center" border="1" style="font-size:90%">
        														<tr>
                  													<th>예약코드</th>
                  													<th>예약자</th>
                  													<th>E-Mali</th>
                  													<th>전화번호</th>
                  													<th>국적</th>
                  													<th>성별</th>
                  													<th>도착시간</th>
                  													<th>머무는날</th>
                  													<th>예약일</th>
                  													<th>비용</th>
                  													<th>댓글</th>
                  													<th>예약자ID</th>
                  													<th>방 코드</th>
                												</tr>
                												<c:forEach var="hotReservaion" items="${requestScope['hotelReservationService']}">
																		<tr>
																			<td>${hotReservaion.hotResCode}</td>
																			<td>${hotReservaion.hotResName}</td>
																			<td>${hotReservaion.email}</td>
																			<td>${hotReservaion.phone}</td>
																			<td>${hotReservaion.nationality}</td>
																			<td>${hotReservaion.gender}</td>
																			<td>${hotReservaion.arrTime}</td>
																			<td>${hotReservaion.stayDate}</td>
																			<td>${hotReservaion.resDate}</td>
																			<td>${hotReservaion.payment}</td>
																			<td>${hotReservaion.comments}</td>
																			<td>${hotReservaion.memId}</td>
																			<td>${hotReservaion.roomCode}</td>	
																		</tr>
																	</c:forEach>
															</table>
														</div>
     												</div>
   												</div>
   											</div>
     									</div>
   									</div>
							<form id="hotelSearchForm" role="form">
								<!-- 호텔part -->
								<div class="column">
									<div class="col-md-6">
										<div>
											<h4 class="classic-title">
												<span>호텔</span>
											</h4>
										</div>
										<h4 class="classic-title">
											<span>호텔코드추가</span>
										</h4>
										<div class="form-group">
											<div class="controls" >
												<div class="col-md-2" align="right"><label for="hotCode" style="margin-top:8px"><b>호텔코드11</b></label></div>
												<div class="col-md-10">
												<input type="text" id="hotCode" name="hotCode" class="email" placeholder="호텔코드 입력" required data-error="호텔코드를 확인해 주시기 바랍니다">
												<div class="help-block with-errors"></div>
												</div>
											</div>
										</div>
										
										<h4 class="classic-title">
											<span>호텔이름추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">호텔이름</span>
											<input type="text" class="form-control" placeholder="호텔이름 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>국가추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">국가</span>
											<input type="text" class="form-control" placeholder="국가 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>도시추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">도시</span>
											<input type="text" class="form-control" placeholder="도시 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>주소추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">주소</span>
											<input type="text" class="form-control" placeholder="주소 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>전화번호</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">전화번호</span>
											<input type="text" class="form-control" placeholder="전화번호 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>홈페이지</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">홈페이지</span>
											<input type="text" class="form-control" placeholder="홈페이지 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>옵션</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">옵션</span>
											<input type="text" class="form-control" placeholder="옵션 입력"
												aria-describedby="sizing-addon1">
										</div>
									</div>
									<!-- col-min end -->
								</div>
								<!-- end column -->
								<!-- room part -->
								<div class="column">
									<div class="col-md-6">
										<div>
											<h4 class="classic-title">
												<span>Room</span>
											</h4>
										</div>
										<h4 class="classic-title">
											<span>Room코드추가</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">Room코드</span>
											<input type="text" class="form-control"
												placeholder="Room코드 입력" aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>Room타입추가</span>
										</h4>
										<!-- Room테이블 -->
										<table>
											<table class="table table-striped">
											<thead>
												<tr>
													<th></th>
													<th>호텔 Room 수</th>
													<th>가격 수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row"><input type="checkbox" name="Checkbox">싱글룸</th>
													<td><input type="text" size="10" name="vacancy" disabled="true"></td>
													<td><input type="text" size="10" name="price" disabled="true"></td>
												</tr>
												<tr>
													<th scope="row"><input type="checkbox" name="Checkbox">트윈룸</th>
													<td><input type="text" size="10" name="vacancy" disabled="true"></td>
													<td><input type="text" size="10" name="vacancy" disabled="true"></td>
												</tr>
												<tr>
													<th scope="row"><input type="checkbox" name="Checkbox">트리플룸</th>
													<td><input type="text" size="10" name="vacancy" disabled="true"></td>
													<td><input type="text" size="10" name="vacancy" disabled="true"></td>
												</tr>
											</tbody>
										</table>
											<!-- /.row -->
										</table>
										<!-- 좌석테이블end -->
										<h4 class="classic-title">
											<span>호텔가격</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">호텔가격</span>
											<input type="text" class="form-control" placeholder="가격 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>호텔룸 수</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">호텔룸
												수</span> <input type="text" class="form-control"
												placeholder="좌석 수 입력" aria-describedby="sizing-addon1">
										</div>
									</div>
									<!-- col-min end -->
								</div>
								<!-- column end -->
								<!-- end column -->
							</form>

						</div>
						<!-- Member -->
						<div class="tab-pane fade" id="member">
							<form id="memberSearchForm" role="form">
								<div id="memberListContainer">
									<div class="container">
										<div class="accordion-group">
    										<div class="accordion-heading">
      											<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapseFive">멤버리스트</a>
   											</div>
   					 							<div id="collapseFive" class="accordion-body collapse in">
      												<div class="accordion-inner">
      													<div class="table-responsive">
      													  <h4>멤버리스트</h4>
  															<table class="table" align="center" border="1" style="font-size:90%">
        														<tr>
                  													<th>아이디</th>
                  													<th>패스워드</th>
                  													<th>이름</th>
                  													<th>폰</th>
                  													<th>역활</th>
                												</tr>
                												<c:forEach var="member" items="${requestScope['service']}">
																		<tr>
																			<td>${member.memId}</td>
																			<td>${member.password}</td>
																			<td>${member.memName}</td>
																			<td>${member.phone}</td>
																			<td>${member.role}</td>
																		</tr>
																	</c:forEach>
															</table>
														</div>
     												</div>
   												</div>
   											</div>
     									</div>
   									</div>
								<!-- Member part -->
								<div class="column">
									<div class="col-md-6">
										<div>
											<h4 class="classic-title">
												<span>멤버</span>
											</h4>
										</div>
										<h4 class="classic-title">
											<span>멤버아이디</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">멤버아이디</span>
											<input type="text" class="form-control"
												placeholder="멤버아이디 입력" aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>패스워드</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">패스워드</span>
											<input type="text" class="form-control" placeholder="패스워드 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>멤버이름</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">멤버이름</span>
											<input type="text" class="form-control" placeholder="멤버이름 입력"
												aria-describedby="sizing-addon1">
										</div>
										<h4 class="classic-title">
											<span>폰번호</span>
										</h4>
										<div class="input-group input-group-lg">
											<span class="input-group-addon" id="sizing-addon1">폰번호</span>
											<input type="text" class="form-control" placeholder="폰번호 입력"
												aria-describedby="sizing-addon1">
										</div>
									</div>
								</div>
								<!-- end column -->
							</form>
						</div>
					</div>
					<!-- Tab panels -->
				</div>
				<!-- End Tabs -->

			</div>
			<!-- end col -->
			<div class="col-ms-2"></div>
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</div>
<!-- End Content - 항공 상세 검색 -->


<script type="text/javascript">
	$(function() {
		$('#flightInsertBtn').click(function(e) {
			e.preventDefault();			
			$('#flightSearchForm').attr('action', '/admin/flightInsert').attr('method', 'post').submit();
			alert('완료');
		});
		$('#testBtn').click(function(e) {
			e.preventDefault();
			$('#content').load('/admin/firstpage');
		});
	});
	
	$(function() {
		$('#flightDeleteBtn').click(function(e) {
			e.preventDefault();			
			$('#flightSearchForm').attr('action', '/admin/flightDelete').attr('method', 'post').submit();
			alert('완료');
		});
	});
	
	$(function() {
		$('#flightUpdateBtn').click(function(e) {
			e.preventDefault();			
			$('#flightSearchForm').attr('action', '/admin/flightUpdate').attr('method', 'post').submit();
			alert('완료');
		});
	});
	
	function emptySeats() {
		$('#vacancy1').val("");
		$('#vacancy2').val("");
		$('#vacancy3').val("");
		$('#price1').val("");
		$('#price2').val("");
		$('#price3').val("");
	}
	
	
	$("input[name=flight-update]").click(function() {
		var fliCode = $(this).parent().siblings('td.fliCode').text();
		$('#fli-code').val(fliCode);
		
		var airline = $(this).parent().siblings('td.airline').text();
		$('#airline').val(airline);

		var fliName = $(this).parent().siblings('td.fliName').text();
		$('#fli-name').val(fliName);

		var depCity = $(this).parent().siblings('td.depCity').text();
		$('#dep-city').val(depCity);

		var arrCity = $(this).parent().siblings('td.arrCity').text();
		$('#arr-city').val(arrCity);

		var depDate = $(this).parent().siblings('td.depDate').text();
		$('#dep-date').val(depDate);

		var arrDate = $(this).parent().siblings('td.arrDate').text();
		$('#arr-date').val(arrDate);

		var depTime = $(this).parent().siblings('td.depTime').text();
		$('#dep-time').val(depTime);

		var arrTime = $(this).parent().siblings('td.arrTime').text();
		$('#arr-time').val(arrTime);

		var seatCode = $(this).parent().siblings('td.seatCode').text();
		$('#seat-code').val(seatCode);
		
		var seatType = $(this).parent().siblings('td.seatType').text();
		var price = $(this).parent().siblings('td.price').text();
		var vacancy = $(this).parent().siblings('td.vacancy').text();
		alert(seatType);

		if (seatType == "퍼스트") {
			emptySeats();
			$('#price1').val(price);
			$('#vacancy1').val(vacancy);
		} else if (seatType == "비즈니스") {
			emptySeats();
			$('#price3').val(price);
			$('#vacancy3').val(vacancy);
		} else {
			emptySeats();
			$('#price2').val(price);
			$('#vacancy2').val(vacancy);
		}
	});

	window.onload = function() {
		if (window.motorCheckbox_OL)
			motorCheckbox_OL();
		var i, ca;
		ca = document.getElementsByName('seat-type');
		for (i = 0; i < ca.length; ++i) {
			ca[i].onclick = motorCheckbox_click;
		}
	}

	function motorCheckbox_click() {
		// find parent TR
		var tr = this.parentNode;
		while (tr && tr.nodeName.toLowerCase() != 'tr') {
			tr = tr.parentNode;
		}
		if (tr) {
			// get all inputs contained by TR
			var i, ia = tr.getElementsByTagName('input');
			for (i = 0; i < ia.length; ++i) {
				if (ia[i].type.toLowerCase() == 'text') { // filter out 'text' inputs
					ia[i].disabled = !this.checked;
				}
			}
		}
	}
</script>
