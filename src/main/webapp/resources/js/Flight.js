/**
 * Flight
 */

var flight = {
		event : {
			comma : function(data) {
				str = String(data);
			    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			},
			
			filterList : function(data, airline, seatType, depTime){
				var list = '';
				
				if( ((airline==data.airline) || (airline==undefined) || (airline=='전체')) &&
					((seatType==data.seatType) || (airline==undefined) || (seatType=='전체')) &&
					((depTime==data.depTime) || (airline==undefined) || (depTime=='전체'))) {
					
				list += '<tr>\
							<td class="fli-name">'+data.fliName+'</td>\
							<td class="airline">'+data.airline+'</td>\
							<td class="seat-type">'+data.seatType+'</td>\
							<td class="price">'+flight.event.comma(data.price)+' 원</td>\
							<td class="dep-time">'+data.depTime+'</td>\
							<td class="arr-time">'+data.arrTime+'</td>\
							<td class="vacancy">'+data.vacancy+' 석</td>\
							<input type="hidden" value="'+data.seatCode+'" class="seat-code"/>\
							<input type="hidden" value="'+data.depCity+'" class="dep-city"/>\
							<input type="hidden" value="'+data.arrCity+'" class="arr-city"/>\
							<input type="hidden" value="'+data.depDate+'" class="dep-date"/>\
							<td><button type="button" class="search-flight btn-system btn-mini border-btn">선택</button></td>\
						</tr>';
				}
					
				return list;				
			},
			
			selectSeatType : function(e)
			{
				e.preventDefault();
				
				if ($(this).parent().siblings('.vacancy').text() == '0 석'){
					alert('남은 좌석이 없습니다.');
					history.go(-1);
				} else {
					var changeForm = '<tr>\
						<td><font color="#337ab7"><b>출발도시</b></font></td>\
						<td><font color="#337ab7"><b>도착도시</b></font></td>\
						<td><font color="#337ab7"><b>출발날짜</b></font></td>\
						<td><font color="#337ab7"><b>항공사</b></font></td>\
						<td><font color="#337ab7"><b>좌석등급</b></font></td>\
						<td><font color="#337ab7"><b>운임료</b></font></td>\
					</tr>\
					<tr>\
						<td>'+$(this).parent().siblings('.dep-city').val()+'</td>\
						<td>'+$(this).parent().siblings('.arr-city').val()+'</td>\
						<td>'+$(this).parent().siblings('.dep-date').val()+'</td>\
						<td>'+$(this).parent().siblings('.airline').text()+'</td>\
						<td>'+$(this).parent().siblings('.seat-type').text()+'</td>\
						<td>'+$(this).parent().siblings('.price').text()+'</td>\
						<input type="hidden" id="selected-seat-code" value="'+$(this).parent().siblings('.seat-code').val()+'" class="seat-code"/>\
					</tr>';
					
					$('#select-mine').html(changeForm);
				}
			}
		},
		
		ajax : {
			flightSearchBtn : function(e) {
				e.preventDefault();

				if ($('#sel_dep_city').val() == null || $('#sel_arr_city').val() == null || $('#dep_date').val() == 0){
					alert('조건을 모두 선택해주세요!');
					history.go(-1);
				} else {
					$.ajax({
						url : Global.context + '/flight/searchDetail/' 
							+ $('#sel_dep_city').val() 
							+ '/' + $('#sel_arr_city').val() 
							+ '/'+$('#dep_date').val(),
						data : {
							"depCity" : $('#sel_dep_city').val(),
							"arrCity" : $('#sel_arr_city').val(),
							"depDate" : $('#dep_date').val()
						},
						dataType : 'json',
						type : 'get',
						success : function(data) {
							flight.searchDetail(Global.context, flight.user);
						},
						error : function(xhr,status,msg) {
							alert('에러발생상태 :'+status+', 내용 : '+msg);
						}
					});
				}
			}, // ajax flightSearchBtn end
			
			sel_dep_city : function(e) {
				e.preventDefault();
				
				$.ajax({
					url : Global.context+'/flight/arrCity/'+$('#sel_dep_city').val(),
					dataType : 'json',
					type : 'get',
					success : function(data) {
						$('#sel_arr_city').empty();
						
						 $.each(data, function(index, value) {
							var a = '<option value="'+this.arrCity+'">'+this.arrCity+'</option>';
							$('#sel_arr_city').append(a);
						 });
					},
					error : function(xhr,status,msg) {
						alert('에러발생상태 :'+status+', 내용 : '+msg);
					}
				});
			}, // ajax sel_dep_city end
			
			okButton : function(e) {
				e.preventDefault();
				if (Global.user == undefined) {
					if(confirm('예약은 로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?') == true){
						member.init.login(Global.context);
					}
					
				} else if (($('#selected-seat-code').val() == undefined)){
					alert('조건을 모두 선택해주세요!');
					history.go(-1);
				} else {
					$.ajax({
						url : Global.context + '/flight/selectSeat/'+ parseInt($('#selected-seat-code').val()),
						data : {
							"seatCode" :  parseInt($('#selected-seat-code').val())
						},
						dataType : 'json',
						type : 'get',
						success : function(data) {
							flight.reservationForm(Global.context);
						},
						error : function(xhr,status,msg) {
							alert('에러발생상태 :'+status+', 내용 : '+msg);
						}
					});
				}
			}, // ajax okButton end
			
			resBtn : function(e) {
				e.preventDefault();
				
				if ($('input[type="text"]').val() == null || $('input[type="date"]').val() == '' || $("#gender option:selected").val() == null) {
					alert('정보를 모두 입력해주세요.');
					history.go(-1);
				} else {
					$.ajax({
						url : Global.context+'/flight/reservation',
						data :{
							passport : $('#passport').val(),	
							korName : $('#korName').val(),	
							engName : $('#firstName').val()+$('#lastName').val(),
							birth : $('#birth').val(),
							gender : $('#gender').val(),	
							phone : $('#phone').val(),
							comments : $('#comments').val(),
							seatCode : $('#seatCode').val(),
							memId : Global.user.memId
						},
						dataType : 'json',
						type : 'POST',
						async : true,
						success : function(data) {
							alert('예약이 완료되었습니다.');
							location.href= Global.context + '/';
						},
						error : function(request,status,error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
				
			}
		},
		
		search : function(context) {
			
			Global.ajax(context+'/flight/search')
			.done(function(data) {
				
				$('#content').html(flight.view.search(data));
				$('#dep_date').datepicker({dateFormat: 'yy-mm-dd', minDate:0});
				$('#sel_dep_city').click(flight.ajax.sel_dep_city);
				$('#flightSearchBtn').click(flight.ajax.flightSearchBtn);
			});

		},
	
		searchDetail : function(context) {
			var listData;
			var airlineOption;
			var seatTypeOption;
			var depTimeOption;
			
			$.getJSON(context+'/flight/searchDetail', function(data) {
				listData = data;
				
				$('#content').html(flight.view.detail(data,airlineOption, seatTypeOption, depTimeOption));
				$('.search-flight').click(flight.event.selectSeatType);
			
				$('#airlineName').click(function() {
					airlineOption = $("#airlineName option:selected").val();
					seatTypeOption = $("#seatTypeName option:selected").val();
					depTimeOption = $("#depTimeName option:selected").val();
					var detail = '';
					$.each(listData, function(index, value) {
						detail += flight.event.filterList(value, airlineOption, seatTypeOption, depTimeOption);
					});
					
					$('#flight-list').html(detail);
					
					$('.search-flight').click(flight.event.selectSeatType);
				});
			
				$('#seatTypeName').click(function() {
					airlineOption = $("#airlineName option:selected").val();
					seatTypeOption = $("#seatTypeName option:selected").val();
					depTimeOption = $("#depTimeName option:selected").val();
					var detail = '';
					$.each(listData, function(index, value) {
						detail += flight.event.filterList(value, airlineOption, seatTypeOption, depTimeOption);
					});
					
					$('#flight-list').html(detail);
					
					$('.search-flight').click(flight.event.selectSeatType);
				});
			
				$('#depTimeName').click(function() {
					airlineOption = $("#airlineName option:selected").val();
					seatTypeOption = $("#seatTypeName option:selected").val();
					depTimeOption = $("#depTimeName option:selected").val();
					var detail = '';
					$.each(listData, function(index, value) {
						detail += flight.event.filterList(value, airlineOption, seatTypeOption, depTimeOption);
					});
					
					$('#flight-list').html(detail);
					
					$('.search-flight').click(flight.event.selectSeatType);
				});
			
				$('#okButton').click(flight.ajax.okButton);
				
				$('#cancelButton').click(function(e) {
					e.preventDefault();
					
					$('#select-mine').html(flight.view.change.changeForm);
				});

			
			});
		},
	
		reservationForm : function(context) {
			$.getJSON(context+'/flight/selectSeat', function(data) {
				$('#content').html(flight.view.reservation(data));
				
				$('#same-res').click(function(e) {
					$('#res-info').html(flight.view.sameRes);
			});
			
			$('#dif-res').click(function(e) {
				$('#res-info').html(flight.view.difRes);
			});
			
			$('#res-btn').click(flight.ajax.resBtn);
				
			});
		},
	
	
	view : {
		search : function(cityList) {
			var searchForm = '';
			searchForm +=
				'<div class="page-banner no-subtitle">\
						<div class="container">\
						<div class="row">\
							<div class="col-md-6">\
								<h2>지니투어 - Flight</h2>\
							</div>\
							<div class="col-md-6">\
								<ul class="breadcrumbs">\
									<li><a href="/">지니투어 홈</a></li>\
									<li>항공권</li>\
									<li>검색</li>\
								</ul>\
							</div>\
						</div>\
					</div>\
				</div>\
				<!-- End Page Banner -->\
				<!-- Start Content - 항공 상세 검색 -->\
				<div id="content">\
					<div class="container">\
						<div class="row">\
							<div class="col-ms-2"></div>\
							<div class="col-ms-8">\
							<!-- Start Tabs -->\
							<div class="tabs-section">\
								<!-- Nav Tabs -->\
								<ul class="nav nav-tabs">\
									<li class="active"><a href="#tab-1" data-toggle="tab">항공권 검색</a></li>\
								</ul>\
								<!-- Tab panels -->\
								<div class="tab-content">\
									<!-- Tab Content -->\
									<div class="tab-pane fade in active" id="tab-1">\
										<!-- Hotel Search Form Start -->\
										<form id="flightSearchForm" role="form">\
											<!-- small button -->\
											<div>\
												<a href="#" class="btn-system btn-mini border-btn">편도</a>\
												<br /><br />\
											</div>\
											<!-- 출국part -->\
											<div>\
												<h4 class="classic-title"><span>출국</span></h4>\
											</div>\
											<div class="row">\
												<div class="col-md-4">\
													<div><label for="depart_city">출발지 선택</label></div>\
													<div class="form-group">\
														<div class="controls">\
															<select multiple class="form-control" style="width:200px" id="sel_dep_city">';
												for ( var index in cityList ) {
													searchForm += '<option value="'+cityList[index].depCity+'">'+cityList[index].depCity+'</option>';
												}

												searchForm += '</select>\
														</div>\
													</div>\
												</div>\
												<div class="col-md-4">\
													<div><label for="depart_city">도착지 선택</label></div>\
													<div class="form-group">\
														<div class="controls" id="arrCity">\
															<select multiple class="form-control" id="sel_arr_city" style="width:200px">';
											
											if(this.arrCity == null) {
												searchForm += '<option>도착지를 선택해주세요.</option>';
											}
											else{
												for ( var index in cityList) {
													searchForm += '<option value="'+cityList[index].arrCity+'">'+cityList[index].arrCity+'</option>';
												}
											}	
											searchForm += '</select>\
														</div>\
													</div>\
												</div>\
												<div class="col-md-4">\
													<div><label for="depart_city">날짜 선택</label></div>\
													<div class="form-group">\
														<div class="controls">\
															<input type="text" id="dep_date" class="email" style="width: 200px;" placeholder="날짜를 선택하세요"/>\
														</div>\
													</div>\
												</div>\
											</div><!-- end row -->\
											<div class="row">\
												<div class="col-md-10"></div>\
												<div class="col-md-2">\
													<br />\
													<input type="button" id="flightSearchBtn" class="btn-system btn-large" style="float: right; margin-right: 50px" value="검색">\
												</div>\
											</div><!-- end row -->\
										<!-- End Hotel Search Form -->\
									</div><!-- /Tab Content -->\
									</form>\
								</div><!-- /Tab panels -->\
								</div>\
								<!-- End Tabs -->\
							</div><!-- end col -->\
							<div class="col-ms-2"></div>\
						</div><!-- end row -->\
					</div><!-- end container -->\
				</div>';
											
			return searchForm;
		},
		
		detail : function(data,airlineOption, seatTypeOption, depTimeOption) {
			var airlineSet = {};
			var seatTypeSet = {};
			var depTimeSet = {};
			
			$.each(data, function(index, value) {
				airlineSet[value.airline] = value.airline;
				seatTypeSet[value.seatType] = value.seatType;
				depTimeSet[value.depTime] = value.depTime;
			});
			
			var searchDetail = '';
			searchDetail +=
				 '<div class="page-banner no-subtitle">\
				<div class="container">\
				<div class="row">\
					<div class="col-md-6">\
						<h2>지니투어 - Flight</h2>\
					</div>\
					<div class="col-md-6">\
						<ul class="breadcrumbs">\
							<li><a href="/">지니투어 홈</a></li>\
							<li>항공권</li>\
							<li>스케쥴 및 운임 조회</li>\
						</ul>\
					</div>\
				</div>\
			</div>\
		</div>\
		<!-- End Page Banner -->\
		<div id="content">\
			<div class="container">\
				<form>\
					<div class="col-xs-12 col-md-12">\
						<div class="tabs-section">\
						<div>\
							<ul class="nav nav-tabs">\
								<li id="tab1"><a href="">항공요금+스케쥴 보기</a></li>\
							</ul>\
						</div>\
						<div class="tab-content">\
						<div class="col-xs-12" id="result">\
				<!-- Single button -->\
				<div class="btn-group">\
				<div align="center"><label for="airline" style="margin-left:5px"><b>항공사</b></label></div>\
				  <select class="form-control" id="airlineName">\
					<option value="전체" selected>전체</option>';
				
				for ( var key in airlineSet) {
					searchDetail += '<option value="'+airlineSet[key]+'">'+ airlineSet[key] +'</option>';					
				}
							  
					searchDetail +='</select>\
				</div>\
				<!-- Single button -->\
				<div class="btn-group">\
				<div align="center"><label for="airline" style="margin-left:5px"><b>좌석등급</b></label></div>\
				<select class="form-control" id="seatTypeName">\
					<option value="전체" selected>전체</option>';
					
				for ( var key in seatTypeSet) {
					searchDetail += '<option value="'+seatTypeSet[key]+'">'+ seatTypeSet[key] +'</option>';				
				}
					
					searchDetail +='</select>\
				</div>\
				<!-- Single button -->\
				<div class="btn-group">\
				<div align="center"><label for="airline" style="margin-left:5px"><b>출발시간</b></label></div>\
				<select class="form-control" id="depTimeName">\
				<option value="전체" selected>전체</option>';
					
				for ( var key in depTimeSet) {
					searchDetail += '<option value="'+depTimeSet[key]+'">'+ depTimeSet[key] +'</option>';					
				}
				
				searchDetail +='</select>\
				</div>\
				<br><br>\
							<div>\
								<h4 class="classic-title">\
									<span>항공요금 및 스케쥴</span>\
								</h4>\
							</div>\
							<!-- 왼쪽 -->\
							<div class="col-xs-12" style="width:100%; overflow:auto">\
								<table class="table table-striped table-hover ">\
									<tbody>\
										<tr>\
											<td>\
												<!-- 요금조회 내부 리스트 -->\
												<table class="table table-hover" style="width: 100%; text-align: center; overflow-y:scroll;" >\
													<thead>\
													<tr>\
														<td><font color="#337ab7"><b>항공편</b></font></td>\
														<td><font color="#337ab7"><b>항공사</b></font></td>\
														<td><font color="#337ab7"><b>좌석등급</b></font></td>\
														<td><font color="#337ab7"><b>가격</b></font></td>\
														<td><font color="#337ab7"><b>출발시간</b></font></td>\
														<td><font color="#337ab7"><b>도착시간</b></font></td>\
														<td><font color="#337ab7"><b>좌석수</b></font></td>\
														<td></td>\
													</tr></thead><tbody id="flight-list">';
									$.each(data, function(index, value) {
										searchDetail += flight.event.filterList(value, airlineOption, seatTypeOption, depTimeOption);
									});
												
								searchDetail += '</tbody></table>\
											</td>\
										</tr>\
									</tbody>\
								</table>\
							</div>\
							<!-- 왼쪽 끝 -->\
			   				<!-- 3.나의 선택(하단) -->\
			   				<div class="col-xs-12">\
								<div>\
									<h4 class="classic-title"><span>나의 선택</span></h4>\
								</div>\
			   					<table class="table table-striped table-hover ">\
									<tbody>\
									<tr>\
										<td>\
						   					<table class="table" id="select-mine" style="width: 100%; text-align: center" >\
												<tr>\
													<td><font color="#337ab7"><b>출발도시</b></font></td>\
													<td><font color="#337ab7"><b>도착도시</b></font></td>\
													<td><font color="#337ab7"><b>출발날짜</b></font></td>\
													<td><font color="#337ab7"><b>항공사</b></font></td>\
													<td><font color="#337ab7"><b>좌석등급</b></font></td>\
													<td><font color="#337ab7"><b>운임료</b></font></td>\
												</tr>\
												<tr>\
													<td colspan="6">항공요금 및 스케쥴을 선택하세요.</td>\
												</tr>\
											</table>\
										</td>\
									</tr>\
									</tbody>\
			   					</table>\
			   				</div>\
			   				<!-- 3.나의 선택 끝 -->\
			   			</div>\
			   			<div align="right" style="margin-right: 50px">\
							<button id="okButton" class="btn-system btn-large">예약하기</button>\
							<button id="cancelButton" class="btn-system btn-large">다시선택</button>\
							<br />\
							<br />\
						</div>\
						</div>\
						</div>\
					</div>\
				</form>\
			</div>\
		</div>';
								
			return searchDetail;
		},
		

		change : function() {
			var changeForm = '';

			changeForm += '<tr>\
				<td><font color="#337ab7"><b>출발도시</b></font></td>\
				<td><font color="#337ab7"><b>도착도시</b></font></td>\
				<td><font color="#337ab7"><b>출발날짜</b></font></td>\
				<td><font color="#337ab7"><b>항공사</b></font></td>\
				<td><font color="#337ab7"><b>좌석등급</b></font></td>\
				<td><font color="#337ab7"><b>운임료</b></font></td>\
			</tr>\
			<tr>\
				<td colspan="6">항공요금 및 스케쥴을 선택하세요.</td>\
			</tr>';
			
			return changeForm;
		},
		
		reservation : function(data) {
			var reservationForm = '<style>\
				table th {\
				text-align: center\
			}\
		</style>\
		<!-- Start Page Banner -->\
		<div class="page-banner no-subtitle">\
			<div class="container">\
				<div class="row">\
					<div class="col-md-6">\
						<h2>지니투어 - Flight</h2>\
					</div>\
					<div class="col-md-6">\
						<ul class="breadcrumbs">\
							<li><a href="/">지니투어 홈</a></li>\
							<li>항공권</li>\
							<li>예약 정보 입력</li>\
						</ul>\
					</div>\
				</div>\
			</div>\
		</div>\
		<!-- End Page Banner -->\
	\
		<div id="content">\
			<form>\
				<div class="container">\
					<div class="row">\
						<div class="col-md-1"></div>\
						<div class="col-md-10">\
							<div align="center">\
								<h4 class="classic-title"><span>예약자 정보</span></h4>\
							</div>\
							<div class="form-group">\
								<div class="controls" >\
									<div class="col-md-6">\
										<div class="col-md-4" align="right"><label for="email" style="margin-top:8px"><b>예약자 명</b></label></div>\
										<div class="col-md-8 rname">\
											<input type="text" id="res_name" name="res-name" class="email" placeholder="성함">\
										</div>\
									</div>\
									<div class="col-md-6">\
										<div class="col-md-3" align="right"><label for="email" style="margin-top:8px"><b>생년월일</b></label></div>\
										<div class="col-md-8 rbirth">\
											<input type="date" id="birth" name="birth" class="email" placeholder="생년월일" required data-error="생년월일을 확인해 주시기 바랍니다">\
											<div class="help-block with-errors"></div>\
										</div>\
									</div>\
									<div class="col-md-6">\
										<div class="col-md-4" align="right"><label for="email" style="margin-top:8px"><b>연락처</b></label></div>\
										<div class="col-md-8 rphone">\
											<input type="text" id="phone" name="phone" class="email" placeholder="연락처" required data-error="연락처를 확인해 주시기 바랍니다">\
										</div>\
									</div>\
									<div class="col-md-6">\
										<div class="col-md-3" align="right"><label for="email" style="margin-top:8px"><b>이메일</b></label></div>\
										<div class="col-md-8">\
											<input type="text" id="email" name="email" class="email" placeholder="E-mail" required data-error="이메일을 확인해 주시기 바랍니다">\
											<div class="help-block with-errors"></div>\
										</div>\
									</div>\
								</div>\
							</div>\
							<input type="hidden" id="seatCode" value="'+data.seatCode+'">\
							<div align="right" id="same-check">\
								<h6>탑승자가 위의 예약자와 동일합니까? <input type="radio" id="same-res" name="res-same-info">예  <input type="radio" id="dif-res" name="res-same-info">아니오\
								<br />\
							</div>\
							<div align="center">\
								<h4 class="classic-title"><span>탑승객 정보</span></h4>\
							</div>\
							\
							<div id="res-info">\
								<table class="table table-striped" style="font-size: 13px;" >\
									<thead align="center">\
										<tr>\
											<th>여권번호</th>\
											<th>한글이름</th>\
											<th>영문 이름</th>\
											<th>영문 성</th>\
											<th>법정생년월일</th>\
											<th>성별</th>\
											<th>연락처</th>\
										</tr>\
									</thead>\
									<tbody>\
										<tr>\
											<td>\
												<input type="text" id="passport" name="passport" class="email" placeholder="여권번호" required data-error="여권번호를 확인해 주시기 바랍니다">\
											</td>\
											<td><input type="text" id="korName" name="korName" class="email" placeholder="한글 이름" required data-error="한글 이름을 확인해 주시기 바랍니다"></td>\
											<td><input type="text" id="lastName" name="lastName" class="email" placeholder="영문 이름" required data-error="영문 이름을 확인해 주시기 바랍니다"></td>\
											<td><input type="text" id="firstName" name="firstName" class="email" placeholder="영문 성" required data-error="영문 성을 확인해 주시기 바랍니다"></td>\
											<td><input type="text" id="realbirth" nameL="realbirth" class="email" placeholder="법정생년월일" required data-error="법정생년월일을 확인해 주시기 바랍니다"></td>\
											<td style="width: 10%">\
												<select class="form-control" id="gender">\
													<option value="여자">여자</option>\
													<option value="남자">남자</option>\
												</select>\
											</td>\
											<td><input type="text" id="realphone" name="realphone" class="email" placeholder="연락처" required data-error="연락처를 확인해 주시기 바랍니다"></td>\
										</tr>\
									<tr><th>기타 의견</th></tr>\
									<tr><td colspan="7"><textarea class="email" id="comments" name="comments" width="100%"></textarea><td></tr>\
									</tbody>\
								</table>\
							</div>\
							<br><br>\
							<div align="center">\
								<h4 class="classic-title"><span>항공 스케쥴 확인</span></h4>\
							</div>\
							<div style="border: 1px black;">\
								<div><br /><label for="name" style="margin-top:-12px; font-size: 14px;"><b>출국)</b>  <label for="name" style="color: red;"><b>'+data.depCity+' → '+data.arrCity+' '+data.depDate+'</label></b></label> </div>\
								<table class="table table-striped" style="font-size: 13px;" >\
									<thead align="center">\
										<tr>\
											<th></th>\
											<th>항공사</th>\
											<th>편명</th>\
											<th>출발도시</th>\
											<th>출발시간</th>\
											<th>도착도시</th>\
											<th>도착시간</th>\
											<th>비행시간</th>\
											<th>좌석등급</th>\
										</tr>\
									</thead>\
									<tbody align="center">\
										<tr>\
											<td></td>\
											<td>'+data.airline+'</td>\
											<td>'+data.fliName+'</td>\
											<td>'+data.depCity+'</td>\
											<td>'+data.depDate+' , '+data.depTime+'</td>\
											<td>'+data.arrCity+'</td>\
											<td>'+data.arrDate+' , '+data.arrTime+'</td>\
											<td>'+data.duration+'</td>\
											<td>'+data.seatType+'</td>\
										</tr>\
									</tbody>\
								</table>\
								\
							</div><br\><br\><hr>\
							<div align="center">\
								<label for="price"><h2><b>총 예약요금 :&nbsp;&nbsp;\
								<font color="blue">'+flight.event.comma(data.price)+' 원</b></h2></font></label>\
							</div><hr><br\><br\>\
							<div align="center">\
								<button type="button" id="res-btn" class="btn-system btn-large" >예약</button>\
								<button type="reset" id="reset" class="btn-system btn-large" >취소</button>\
							</div>\
						</div>\
						<div class="col-md-1"></div>\
						\
					</div>\
				</div>\
			</form>\
		</div>';
			
			return reservationForm;
		},
		
		sameRes : function() {

			var sameRes = '<table class="table table-striped" style="font-size: 13px;" >\
					<thead align="center">\
					<tr>\
						<th>여권번호</th>\
						<th>한글이름</th>\
						<th>영문 이름</th>\
						<th>영문 성</th>\
						<th>법정생년월일</th>\
						<th>성별</th>\
						<th>연락처</th>\
					</tr>\
				</thead>\
				<tbody>\
					<tr>\
						<td>\
							<input type="text" id="passport" name="passport" class="email" placeholder="여권번호" required data-error="여권번호를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
						</td>\
						<td><input type="text" id="korName" name="korName" class="email" value="'+$('input[name="res-name"]').val()+'" required data-error="한글 이름을 확인해 주시기 바랍니다"><div class="help-block with-errors"></div></td>\
						<td><input type="text" id="lastName" name="lastName" class="email" required data-error="영문 이름을 확인해 주시기 바랍니다"><div class="help-block with-errors"></div></td>\
						<td><input type="text" id="firstName" name="firstName" class="email" required data-error="영문 성을 확인해 주시기 바랍니다"><div class="help-block with-errors"></div></td>\
						<td><input type="text" id="realbirth" name="realbirth" class="email" value="'+$('input[name="birth"]').val()+'" required data-error="법정생년월일을 확인해 주시기 바랍니다"><div class="help-block with-errors"></div></td>\
						<td style="width: 10%">\
						<select class="form-control" id="gender">\
							<option value="여자">여자</option>\
							<option value="남자">남자</option>\
						</select>\
						</td>\
						<td><input type="text" id="realphone" name="realphone" class="email" value="'+$('input[name="phone"]').val()+'" required data-error="연락처를 확인해 주시기 바랍니다"><div class="help-block with-errors"></div></td>\
					</tr>\
					<tr><th>기타 의견</th></tr>\
					<tr><td colspan="7"><textarea class="email" id="comments" name="comments" width="100%"></textarea><div class="help-block with-errors"></div><td></tr>\
				</tbody>\
			</table>';
			
			return sameRes;
		},
		
		difRes : function() {

			var difRes = '<table class="table table-striped" style="font-size: 13px;" >\
					<thead align="center">\
					<tr>\
						<th>여권번호</th>\
						<th>한글이름</th>\
						<th>영문 이름</th>\
						<th>영문 성</th>\
						<th>법정생년월일</th>\
						<th>성별</th>\
						<th>연락처</th>\
					</tr>\
				</thead>\
				<tbody>\
					<tr>\
						<td>\
							<input type="text" id="passport" name="passport" class="email" placeholder="여권번호" required data-error="여권번호를 확인해 주시기 바랍니다">\
						</td>\
						<td><input type="text" id="korName" name="korName" class="email" placeholder="한글 이름" required data-error="한글 이름을 확인해 주시기 바랍니다"></td>\
						<td><input type="text" id="lastName" name="lastName" class="email" placeholder="영문 이름" required data-error="영문 이름을 확인해 주시기 바랍니다"></td>\
						<td><input type="text" id="firstName" name="firstName" class="email" placeholder="영문 성" required data-error="영문 성을 확인해 주시기 바랍니다"></td>\
						<td><input type="text" id="realbirth" name="realbirth" class="email" placeholder="법정생년월일" required data-error="법정생년월일을 확인해 주시기 바랍니다"></td>\
						<td style="width: 10%">\
							<select class="form-control" id="gender">\
								<option value="여자">여자</option>\
								<option value="남자">남자</option>\
							</select>\
						</td>\
						<td><input type="text" id="realphone" name="realphone" class="email" placeholder="연락처" required data-error="연락처를 확인해 주시기 바랍니다"></td>\
					</tr>\
				<tr><th>기타 정보</th></tr>\
				<tr><td colspan="7"><textarea class="email" id="comments" name="comments" width="100%"></textarea><td></tr>\
				</tbody>\
			</table>';
			
			return difRes;
		}
	}
	
}