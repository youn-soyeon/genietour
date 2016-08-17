/**
 * Admin
 */

var admin =
{
	init :
	{
		main : function() {
			$('#content').html(admin.view.main());
			admin.event.main();
		},
		member : function() {
			admin.ajax.member();
		},
		flight : function() {
			admin.ajax.flight();
		},
		hotel : function() {
			admin.ajax.hotel();
		},
	},
	
	ajax :
	{
		member : function() 
		{
	    	$.ajax({
				url : Global.context + '/admin/memlist/1',
				data : {},
				dataType : 'json',
				type : 'get',
				success : function(model) {
					$('#content').html( admin.view.member(model.memList, model.paging) );
					admin.event.member();
				},
				error : function(xhr,status,msg) {
					alert('에러발생상태 memberlist :'+status+', 내용 : '+msg);
				}
			});
		},
		
		memberUpdate : function() 
		{
			var userData = {
					memId : $('#memId').val(),
					password : $('#password').val(),
					memName : $('#memName').val(),
					phone : $('#phone').val(),
					role : $('#role').val()
			}
			$.ajax({
				url : Global.context + '/member/join',
				data : JSON.stringify(userData),
				dataType : 'json',
				type : 'POST',
				contentType : 'application/json',
				mimeType : 'application/json',
				async : true,
				success : function(data) {
					alert("수정 성공");
					$('#content').html(member.view.login());
					member.event.loginEvent();
					location.href = '#content';
				},
				error : function(request,status,msg) {
					alert("code : " + request.status + "\n message : " + reqeust.responseText + "\n" + "error : ");
				}
			});
		},
		
		flight : function()
		{
			$.ajax({
				url : Global.context + '/admin/flilist/1',
				data : {},
				dataType : 'json',
				type : 'get',
				success : function(model) {
					$('#content').html( admin.view.flight(model.fliList, model.paging, model.airList) );
					admin.event.flight();
				},
				error : function(xhr,status,msg) {
					alert('에러발생상태 memberlist :'+status+', 내용 : '+msg);
				}
			});
		},
		
		fliSeatInsert : function( seatData ) 
		{
			$.ajax({
				url : Global.context + '/admin/fliseatinsert',
				data : JSON.stringify( seatData ),
				dataType : 'json',
				type : 'POST',
				contentType : 'application/json',
				mimeType : 'application/json',
				async : true,
				success : function(data) {
					if (data == 1) {
						alert("추가 성공");
						admin.ajax.flight();
						location.href = '#content';
					} else {
						alert("추가 실패");
					}
				},
				error : function(request,status,msg) {
					alert("code : " + request.status + "\n message : " + request.responseText + "\n" + "error : ");
				}
			});
		},
		
		fliSeatUpdate : function() 
		{
			var seatData = {
				'fliCode' : $('#fliCode').text(),
				'seatCode' : $('#seatCode').val(),
				'seatType' : $('#seatType').val(),
				'vacancy' : $('#vacancy').val(),
				'price' : $('#price').val()
			};
			$.ajax({
				url : Global.context + '/admin/fliseatupdate',
				data : JSON.stringify( seatData ),
				dataType : 'json',
				type : 'POST',
				contentType : 'application/json',
				mimeType : 'application/json',
				async : true,
				success : function(data) {
					if (data == 1) {
						alert("수정 성공");
						admin.ajax.flight();
						location.href = '#content';
					} else {
						alert("수정 실패");
					}
				},
				error : function(request,status,msg) {
					alert("code : " + request.status + "\n message : " + reqeust.responseText + "\n" + "error : ");
				}
			});
		},
		
		fliSeatDelete : function( seatCodes ) 
		{
			$.ajax({
				url : Global.context + '/admin/fliseatdelete',
				data : JSON.stringify(seatCodes),
				dataType : 'json',
				type : 'POST',
				contentType : 'application/json',
				mimeType : 'application/json',
				async : true,
				success : function(data) {
					if (data == 1) {
						alert("삭제 성공");
						admin.ajax.flight();
						location.href = '#content';
					} else {
						alert("삭제 실패");
					}
				},
				error : function(request,status,msg) {
					alert("code : " + request.status + "\n message : " + reqeust.responseText + "\n" + "error : ");
				}
			});
		},
		
		hotel : function()
		{
			$.ajax({
				url : Global.context + '/admin/hotroomlist/1',
				data : {},
				dataType : 'json',
				type : 'get',
				success : function(model) {
					$('#content').html( admin.view.hotel(model.hotList, model.paging) );
					admin.event.hotel();
				},
				error : function(xhr,status,msg) {
					alert('에러발생상태 memberlist :'+status+', 내용 : '+msg);
				}
			});
		},
	
	},
	
	functions : {
		flight : {
			setUpdateForm : function(data) {
				//({airline: '', })
				$('#airline').text(data.airline);
				$('#fliName').text(data.fliName);
				$('#fliCode').text(data.fliCode);
				$('#arrCity').text(data.arrCity);
				$('#depCity').text(data.depCity);
				$('#arrDate').text(data.arrDate);
				$('#depDate').text(data.depDate);
				$('#arrTime').text(data.arrTime);
				$('#depTime').text(data.depTime);
				$('#seatCode').val(data.seatCode);
				$('#seatType').val(data.seatType);
				$('#vacancy').val(data.vacancy);
				$('#price').val(data.price);
			}
		}
	},
	
	event :
	{
		main : function()
		{
			$('#memberBtn').click(admin.ajax.member);
			$('#statisticsBtn').click(function() {
				alert('statisticsBtn 클릭');
			});
			$('#flightBtn').click(admin.ajax.flight);
			$('#hotelBtn').click(admin.ajax.hotel);
		},
		
		member : function() {
			$('.page-num').click(function(e) {
				e.preventDefault();
				$('#content').load( $(this).attr('href') );
			});		
			
	 		$("input[name=checkfor-member]").click(function() {
				var memId = $('input[name=checkfor-member]:checked').parent().siblings('td.memId').text();
				$('#memId').val(memId);
				var memName = $('input[name=checkfor-member]:checked').parent().siblings('td.memName').text();
				$('#memName').val(memName);
				var phone = $('input[name=checkfor-member]:checked').parent().siblings('td.phone').text();
				$('#phone').val(phone);
				var role = $('input[name=checkfor-member]:checked').parent().siblings('td.role').text();
				$('#role').val(role);
			});

	 		
	 		$('#updateFormBtn').click(function(e) {
				e.preventDefault();
				$()
				if ($('#memberFormDiv').is(':hidden')) {
					if($('input:checkbox[name=checkfor-member]:checked').length != 1){
						alert('수정하기 위한 데이터를 하나만 선택해주시기 바랍니다.');
					} else {
						$("#memberFormDiv").slideDown("slow", function() {
							location.href = '#memberFormDiv';
							$("input[name=checkfor-member]").click(function(){
								if ($('input[name=checkfor-member]:checked').length != 1) {
									location.href = '#content';
									$('#memberFormDiv').hide();
									alert('수정할 회원의 정보는 반드시 하나만 선택되어야 합니다. 다시 시도하시기 바랍니다.');
									$('input[name=checkfor-member]').unbind('click');
								}
							});
						});
					}
				} else {
					$("#memberFormDiv").slideUp("slow", function() {
						location.href = '#content';
					});
				}
				
				$('#okBtn').click(function() {
					$('#hotResUpdateForm').attr('action','/hotroom/updatehotres').attr('method', 'post').submit();
				});
				
				$('#cancelBtn').click(function() {
					location.href='#content';
					$("#memberFormDiv").slideUp("slow");
				});
			});
	 		
			$('#deleteBtn').click(function(e) {
				e.preventDefault();
			});
			
		},
		
		flight : function() {
			$('.page-num').click(function(e) {
				e.preventDefault();
				$('#content').load( $(this).attr('href') );
			});
			
			var fliCode = '';
			$('#insertFormBtn').click(function(e) {
				e.preventDefault();
				if( $('.checkfor-flight').attr('type') == 'radio' ) {
					$('.checkfor-flight').attr('type','checkbox');
				}
				if( $('input[name=checkfor-flight]').is(':checked') == true) {
					$('input[name=checkfor-flight]').prop('checked',false);
				}
				$("input[name=checkfor-flight]").attr("disabled", true);
				$("#flightInsertFormDiv").slideToggle("slow", function() {
					if ($(this).is(':hidden')) {
						location.href = '#content';
					} else {
						location.href = '#flightInsertFormDiv';
					}
				});
				
				$('input[name=checkfor-airline]').click(function() {
					fliCode = $('input[name=checkfor-airline]:checked').val();
				});
				
			});
			
			$('#seatInsertFormBtn').click(function() {
				$('#seatInsertTr').append(admin.view.seatInsert());
			});
			
			$('#updateFormBtn').click(function(e) {
				e.preventDefault();
				$("input[name=checkfor-flight]").attr("disabled", false);
				if( $('.checkfor-flight').attr('type') == 'checkbox' ) {
					$('.checkfor-flight').attr('type','radio');
				}
				if( $('.checkfor-flight').attr('type') == 'radio' ){
					alert('수정하기 위한 데이터를 선택해주시기 바랍니다.');
					$('.checkfor-flight').click(function() {
						$("#flightUpdateFormDiv").slideToggle("slow", function() {
							if ($(this).is(':hidden')) {
								location.href = '#content';
							} else {
								location.href = '#flightUpdateFormDiv';
							}
						});
						
						admin.functions.flight.setUpdateForm({
							airline : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.airline').text(),
							fliName : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.fliName').text(),
							fliCode : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.fliCode').text(),
							arrCity : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.arrCity').text(),
							depCity : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.depCity').text(),
							arrDate : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.arrDate').text(),
							depDate : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.depDate').text(),
							arrTime : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.arrTime').text(),
							depTime : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.depTime').text(),
							seatCode : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.seatCode').text(),
							seatType : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.seatType').text(),
							vacancy : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.vacancy').text(),
							price : $('input:radio[name=checkfor-flight]:checked').parent().siblings('td.price').text()
						});
					});
				}
				
			});
			
			$('#seatOkBtn').click(function() {
				var seatType = [];
				var vacancy = [];
				var price = [];
				
				$("select[name=select-seatType]").each(function(i) {
					seatType.push( $(this).val() );
		        });
				$("input[name=insertVacancy]").each(function(i) {
					vacancy.push( $(this).val() );
		        });
				$("input[name=insertPrice]").each(function(i) {
					price.push( $(this).val() );
		        });
				
				var seatData = {};
				seatData.fliCode = $("input[name=checkfor-airline]:checked").val();
				seatData.seatTypes = seatType;
				seatData.vacancies = vacancy;
				seatData.prices = price;
				
				admin.ajax.fliSeatInsert( seatData );
			});
			
			$('#updateOkBtn').click(function() {
				admin.ajax.fliSeatUpdate();
			});
			
			$('#deleteBtn').click(function() {
				if( $('.checkfor-flight').attr('type') == 'radio' ) {
					$('.checkfor-flight').attr('type','checkbox');
				}
				$('#deleteBtn').text('삭제하기');
				$('.checkfor-flight').click(function() {
					var seatCodes = [];
					$("input[name=checkfor-flight]:checked").each(function(i) {
						seatCodes.push( $(this).val() );
			        });
					$('#deleteBtn').click(function() {
						admin.ajax.fliSeatDelete( seatCodes );
					});
				});
				
			});
			
			$('#test').click(function() {
				location.href="/admin/test";
			});
			
		},
		
		hotel : function() {
			$('.page-num').click(function(e) {
				e.preventDefault();
				$('#content').load( $(this).attr('href') );
			});
			$('#insertFormBtn').click(function(e) {
				e.preventDefault();
				$("#hotelInsert").slideToggle("slow", function() {
					if ($(this).is(':hidden')) {
						location.href = '#content';
					} else {
						location.href = '#hotelInsert';
					}
				});
			});
			$('#deleteBtn').click(function(e) {
				e.preventDefault();
				$('#hotListForm').attr('action', '/admin/deletehotel').attr('method', 'post').submit();
			});

			$('#updateFormBtn').click(function(e) {
				e.preventDefault();
				if($("input:checkbox[name=checkfor-room]:checked").length != 1){
					alert('수정하기 위한 데이터를 하나만 선택해주시기 바랍니다.');
				} else {
					$("#hotelUpdate").slideDown("slow");
					location.href='#hotelUpdate';
				}
				$('#updateBtn').click(function() {
					alert('수정버튼 클릭');
					/* $('#hotResUpdateForm').attr('action','/hotroom/updatehotres').attr('method', 'post').submit(); */
				});
				$('#cancelBtn').click(function() {
					$("#hotelUpdate").slideUp("slow");
					location.href='#content';
				});
			});
		}
	},
	
	
	
	view :
	{
		main : function() {
			return '<div id="content"><div class="container">\
			<div class="row">\
				<div class="col-md-12">\
					<div class="col-md-3"></div>\
					<div class="col-md-3">\
						<button type="button" class="btn-system" id="memberBtn"><img src="'+ Global.context +'/resources/images/user.png" alt="" style=""/></button>\
					</div>\
					<div class="col-md-3">\
						<button type="button" class="btn-system" id="statisticsBtn"><img src="'+ Global.context +'/resources/images/statistics.png" alt="" style=""/></button>\
					</div>\
					<div class="col-md-3"></div>\
				</div>\
				<div class="col-md-12">\
					<br />\
					<div class="col-md-3"></div>\
					<div class="col-md-3">\
						<button type="button" class="btn-system" id="flightBtn"><img src="'+ Global.context +'/resources/images/flight.png" alt="" /></button>\
					</div>\
					<div class="col-md-3">\
						<button type="button" class="btn-system" id="hotelBtn"><img src="'+ Global.context +'/resources/images/hotel.png" alt="" /></button>\
					</div>\
					<div class="col-md-3"></div>\
				</div>\
			</div>\
			</div></div>';
		},
		
		member : function(memList, paging)
		{
			var memberForm = '';
			memberForm +=
			'<div id="content"><div class="container"><div class="row">\
			<form id="memberListForm">\
			<div align="center"><h3 class="classic-title"><span>회원 리스트</span></h3></div>\
				<div align="right">\
				<button class="btn-system btn-mini border-btn" id="insertFormBtn">추가</button>\
				<button class="btn-system btn-mini border-btn" id="updateFormBtn">수정</button>\
				<button class="btn-system btn-mini border-btn" id="deleteBtn">삭제</button><br />\
			</div>\
			<table class="table table-hover" style="font-size:90%">\
				<thead style="background-color: #00afd1; color: white"><tr>\
					<th></th>\
					<th>아이디</th>\
					<th>이름</th>\
					<th>핸드폰</th>\
					<th>회원유형</th>\
				</tr></thead>';
			for( var i = paging.startRow ; i < paging.endRow ; i++ ) {
			memberForm += 
				'<tr>\
					<td><input type="checkbox" class="checkfor-member" name="checkfor-member" value="'+memList[i].memId+'"></td>\
					<td class="memId">'+memList[i].memId+'</td>\
					<td class="memName">'+memList[i].memName+'</td>\
					<td class="phone">'+memList[i].phone+'</td>\
					<td class="role">'+memList[i].role+'</td>\
				</tr>';
			}
			memberForm +=
				'</table>\
			<div id="pagination" align="center">\
				<span class="all-pages">Page '+paging.pageNo+' of '+paging.totalPages+'</span>';
			
			if( paging.startPage - paging.GROUPSIZE > 0 ) {
				memberForm += '<a class="prev-page" href="#">&laquo;</a>';
			}

			for(var i=paging.startPage; i<paging.endPage; i++) {
				if (i == paging.pageNo) {
					memberForm +='<span class="current page-num">'+i+'</span>';
				} else {
					memberForm +='<span class="page-num" href="/hotroom/hotlist/'+i+'">'+i+'</span>';
				}
			}
			if( paging.totalPages - paging.endPage < 0 ) {
				memberForm += '<a class="next-page" href="#">&raquo;</a>';
			}
			memberForm +=
			'</div>\
			</form>\
			<div id="memberFormDiv" style="display: none">\
			<br /><br />\
			\
			<div class="col-md-3"></div>\
			<div class="col-md-6">\
			<div align="center"><h3 class="classic-title"><span id="memberAction">회원 수정</span></h3></div>\
			<form id="memberForm">\
				<input type="hidden" id="memId" name="memId" class="email">\
				<div class="form-gr\oup"><div class="controls">\
					<div class="col-md-2" align="right"><label for="password" style="margin-top:8px"><b>회원 이름</b></label></div>\
					<div class="col-md-10">\
					<input type="text" id="memName" name="memName" class="email" placeholder="회원 이름" required data-error="이름 확인해 주시기 바랍니다">\
					<div class="help-block with-errors"></div>\
					</div>\
				</div></div>\
				<div class="form-group"><div class="controls">\
					<div class="col-md-2" align="right"><label for="passwordCheck" style="margin-top:8px"><b>핸드폰</b></label></div>\
					<div class="col-md-10">\
					<input type="text" id="phone" name="phone" class="email" placeholder="핸드폰" required data-error="핸드폰을 확인해 주시기 바랍니다">\
					<div class="help-block with-errors"></div>\
					</div>\
				</div></div>\
				<div class="form-group"><div class="controls">\
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>회원 유형</b></label></div>\
					<div class="col-md-10">\
					<input type="text" id="role" name="role" class="email" placeholder="회원 유형" required data-error="회원유형을 확인해 주시기 바랍니다">\
					<div class="help-block with-errors"></div>\
					</div>\
				</div></div>\
				<div align="center">\
					<button type="submit" class="btn-system btn-small" id="okBtn">확인</button>\
					<button type="reset" class="btn-system btn-small" id="cancelBtn">취소</button>\
				</div>\
			</form>\
			</div>\
				<div class="col-md-3"></div>\
			</div>\
			</div></div>';
			return memberForm;
		},
		
		flight : function(fliList, paging, airList) 
		{
			var flightForm = 
				'<div id="content"><div class="container"><div class="row">\
				<form id="memberListForm">\
				<div align="center"><h3 class="classic-title"><span>항공권 좌석 리스트</span></h3></div>\
					<div align="right">\
					<button type="button" class="btn-system btn-mini border-btn" id="insertFormBtn">추가</button>\
					<button type="button" class="btn-system btn-mini border-btn" id="updateFormBtn">수정</button>\
					<button type="button" class="btn-system btn-mini border-btn" id="deleteBtn">삭제</button><br />\
				</div>\
				<table class="table table-hover" style="font-size:90%">\
					<thead style="background-color: #00afd1; color: white"><tr>\
						<th></th>\
						<th>항공사코드</th>\
						<th>항공사</th>\
						<th>이름</th>\
						<th>출발도시</th>\
						<th>도착도시</th>\
						<th>출발날짜</th>\
						<th>도착날짜</th>\
						<th>출발시간</th>\
						<th>도착시간</th>\
						<th>좌석코드</th>\
						<th>좌석타입</th>\
						<th>가격</th>\
						<th>좌석</th>\
					</tr></thead>\
					<tbody>';
				
					for( var i = paging.startRow ; i < paging.endRow ; i++ ) {
						flightForm +=
							'<tr>\
								<td><input type="checkbox" class="checkfor-flight" name="checkfor-flight" value="' + fliList[i].seatCode + '"></td>\
								<td class="fliCode">' + fliList[i].fliCode + '</td>\
								<td class="airline">' + fliList[i].airline + '</td>\
								<td class="fliName">' + fliList[i].fliName + '</td>\
								<td class="depCity">' + fliList[i].depCity + '</td>\
								<td class="arrCity">' + fliList[i].arrCity + '</td>\
								<td class="depDate">' + fliList[i].depTime + '</td>\
								<td class="arrDate">' + fliList[i].arrDate + '</td>\
								<td class="depTime">' + fliList[i].depTime + '</td>\
								<td class="arrTime">' + fliList[i].arrTime + '</td>\
								<td class="seatCode">' + fliList[i].seatCode + '</td>\
								<td class="seatType">' + fliList[i].seatType + '</td>\
								<td class="price">' + fliList[i].price + '</td>\
								<td class="vacancy">' + fliList[i].vacancy + '</td>\
							</tr>';
					}
				flightForm +=
					'</tbody>\
				</table>\
				<div id="pagination" align="center">\
					<span class="all-pages">Page '+paging.pageNo+' of '+paging.totalPages+'</span>';
				if( paging.startPage - paging.GROUPSIZE > 0 ) {
					flightForm += '<a class="prev-page" href="#">&laquo;</a>';
				}

				for(var i=paging.startPage; i<=paging.endPage; i++) {
					if (i == paging.pageNo) {
						flightForm +='<span class="current page-num">'+i+'</span>';
					} else {
						flightForm +='<span class="page-num" href="/hotroom/hotlist/'+i+'">'+i+'</span>';
					}
				}
				if( paging.totalPages - paging.endPage < 0 ) {
					memberForm += '<a class="next-page" href="#">&raquo;</a>';
				}
				flightForm +=
				'</div>\
				</form>\
					<div id="flightInsertFormDiv" style="display: none">\
				<br /><br /><br /><br /><br />\
				<div align="center"><h3 class="classic-title" ><span>좌석 정보 추가</span></h3></div>\
				<form id="flightInsertForm">\
				<div class="container"><div class="row">\
					<div class="col-md-6">\
						<div align="center"><h3 class="classic-title"><span>항공 스케쥴 선택</span></h3></div>\
						<table class="table table-striped" style="font-size:90%">\
							<tbody>';
				for (var i = 0; i < airList.length; i++) {
					flightForm +=
						'<tr>\
							<td><input type="radio" class="checkfor-airline" name="checkfor-airline" value="' + airList[i].fliCode + '"></td>\
							<td>' + airList[i].fliCode + '</td>\
							<td>' + airList[i].airline + '</td>\
							<td>' + airList[i].fliName + '</td>\
							<td>' + airList[i].depCity + '</td>\
							<td>' + airList[i].arrCity + '</td>\
							<td>' + airList[i].depDate + '</td>\
							<td>' + airList[i].arrDate + '</td>\
						</tr>';
				}
				flightForm +=
						'</tbody></table>\
					</div>\
						<div class="col-md-6">\
							<div align="center"><h3 class="classic-title"><span>좌석 정보 입력</span></h3></div>\
							<div align="right"><button type="button" class="btn-system btn-mini border-btn" id="seatInsertFormBtn">좌석 추가</button></div>\
								<div class="controls">\
									<div class="col-md-12">\
									<table class="table table-striped" style="font-size: 90%">\
										<thead>\
											<tr>\
												<th style="text-align:center">좌석유형</th>\
												<th style="text-align:center">좌석 수</th>\
												<th style="text-align:center">가격</th>\
											</tr>\
										</thead>\
										<tbody id="seatInsertTr">\
											<tr>\
												<td scope="row">\
												<select class="form-control select-seatType" name="select-seatType">\
													<option value="퍼스트">퍼스트</option><option value="비즈니스">비즈니스</option><option value="이코노미">이코노미</option>\
												</select>\
												</td>\
												<td><input class="email insertVacancy" type="text" size="10" name="insertVacancy"></td>\
												<td><input class="email insertPrice" type="text" size="10" name="insertPrice"></td>\
											</tr>\
										</tbody>\
									</table>\
									</div>\
							</div>\
					</div></div></div>\
					<div align="center">\
					<button type="button" class="btn-system btn-small" id="seatOkBtn">확인</button>\
					<button type="reset" class="btn-system btn-small" id="seatCancelBtn">취소</button>\
					</div>\
					</form>\
					</div>\
					</form>\
					<div id="flightUpdateFormDiv" style="display: none">\
					<br /><br /><br /><br /><br />\
					<div align="center"><h3 class="classic-title" ><span id="flightAction">좌석 정보 수정</span></h3></div>\
					<form id="flightUpdateForm">\
					<div class="container"><div class="row">\
						<div class="col-md-6">\
							<div align="center"><h3 class="classic-title"><span>항공사 및 스케쥴 정보</span></h3></div>\
							<table class="table table-striped" style="font-size:90%">\
							<thead style="background-color: #00afd1; color: white"><tr>\
								<td style="text-align:center">항공사코드</td>\
								<td style="text-align:center">항공사</td>\
								<td style="text-align:center">편명</td>\
								<td style="text-align:center">출발도시</td>\
								<td style="text-align:center">도착도시</td>\
								<td style="text-align:center">출발일</td>\
								<td style="text-align:center">도착일</td>\
							</tr></thead>\
							<tbody>\
								<tr>\
									<td id="fliCode" style="text-align:center"></td>\
									<td id="airline" style="text-align:center"></td>\
									<td id="fliName" style="text-align:center"></td>\
									<td id="depCity" style="text-align:center"></td>\
									<td id="arrCity" style="text-align:center"></td>\
									<td id="depDate" style="text-align:center"></td>\
									<td id="arrDate" style="text-align:center"></td>\
								</tr>\
									</tbody></table>\
							</div>\
								<div class="col-md-6">\
									<div align="center"><h3 class="classic-title"><span>좌석 정보</span></h3></div>\
										<div class="controls">\
											<div class="col-md-12">\
											<table class="table table-striped" style="font-size: 90%">\
											<thead style="background-color: #00afd1; color: white">\
												<tr>\
													<th style="text-align:center">좌석 코드</th>\
													<th style="text-align:center">좌석유형</th>\
													<th style="text-align:center">좌석 수</th>\
													<th style="text-align:center">가격</th>\
												</tr>\
											</thead>\
											<tbody id="seatUpdateTr">\
												<tr>\
													<td><input class="email updateSeatCode" type="text" size="7" name="updateSeatCode" id="seatCode" disabled></td>\
													<td><input class="email updateSeatType" type="text" size="10" name="updateSeatType" id="seatType"></td>\
													<td><input class="email updateVacancy" type="text" size="10" name="updateVacancy" id="vacancy"></td>\
													<td><input class="email updatePrice" type="text" size="10" name="updatePrice" id="price"></td>\
												</tr>\
											</tbody>\
										</table>\
											</div>\
									</div>\
							</div></div></div>\
							<div align="center">\
							<button type="button" class="btn-system btn-small" id="updateOkBtn">수정하기</button>\
							<button type="button" class="btn-system btn-small" id="updateCancelBtn">수정취소</button>\
							</div>\
							</form>\
							</div>\
			</div></div></div>'
			return flightForm;
		},
		
		seatInsert : function() {
			var seatInsertForm = 
				'<tr>\
					<td scope="row">\
					<select class="form-control select-seatType" name="select-seatType">\
						<option value="퍼스트">퍼스트</option><option value="비즈니스">비즈니스</option><option value="이코노미">이코노미</option>\
					</select>\
					</td>\
					<td><input class="email insertVacancy"type="text" size="10" name="insertVacancy"></td>\
					<td><input class="email insertPrice"type="text" size="10" name="insertPrice"></td>\
				</tr>';
			return seatInsertForm;
		},
		
		seatUpdate : function(fliCode, airline, fliName, depCity, arrCity, depDate, arrDate) {
		},
		
		hotel : function(hotRoomList, paging) 
		{
			hotelListForm = 
				'<div id="content"><div class="container"><div class="row">\
				<form id="hotListForm">\
			<div align="center"><h3 class="classic-title"><span>호텔 리스트</span></h3></div>\
			<div align="right">\
				<button class="btn-system btn-mini border-btn" id="insertFormBtn">추가</button>\
				<button class="btn-system btn-mini border-btn" id="updateFormBtn">수정</button>\
				<button class="btn-system btn-mini border-btn" id="deleteBtn">삭제</button>\
			</div>\
			<div>\
			<br />\
			<table class="table table-hover" style="font-size:90%">\
				<thead style="background-color: #00afd1; color: white"><tr>\
					<th></th>\
					<th>코드</th>\
					<th>호텔명</th>\
					<th>나라</th>\
					<th>도시</th>\
					<th>주소</th>\
					<th>전화번호</th>\
					<th>홈페이지</th>\
					<!-- <th>옵션</th> -->\
					<th>룸 코드</th>\
					<th>룸 타입</th>\
					<th>가격</th>\
					<th>방 개수</th>\
				</tr></thead>\
				<tbody>';
			for (var i = paging.startRow ; i < paging.endRow ; i++) {
				hotelListForm +=
					'<tr>\
						<td><input type="checkbox" class="checkfor-room" name="checkfor-room" value="' + hotRoomList[i].roomCode + '"></td>\
						<td class="hotCode">' + hotRoomList[i].hotCode + '</td>\
						<td class="hotName">' + hotRoomList[i].hotName + '</td>\
						<td class="country">' + hotRoomList[i].country + '</td>\
						<td class="city">' + hotRoomList[i].city + '</td>\
						<td class="address">' + hotRoomList[i].address + '</td>\
						<td class="tel">' + hotRoomList[i].tel + '</td>\
						<td class="homepage">' + hotRoomList[i].homepage + '</td>\
						<%-- <td class="options">' + hotRoomList[i].options + '</td> --%>\
						<td class="roomCode">' + hotRoomList[i].roomCode + '</td>\
						<td class="roomType">' + hotRoomList[i].roomType + '</td>\
						<td class="price">' + hotRoomList[i].price + '</td>\
						<td class="vacancy">' + hotRoomList[i].vacancy + '</td>\
					</tr>';
			}
			hotelListForm +=
				'</tbody>\
			</table>\
			</div>\
\
			<div id="pagination" align="center">\
				<span class="all-pages">Page '+paging.pageNo+' of '+paging.totalPages+'</span>';
			if( paging.startPage - paging.GROUPSIZE > 0 ) {
				hotelListForm += '<a class="prev-page" href="#">&laquo;</a>';
			}

			for(var i=paging.startPage; i<paging.endPage; i++) {
				if (i == paging.pageNo) {
					hotelListForm +='<span class="current page-num">'+i+'</span>';
				} else {
					hotelListForm +='<span class="page-num" href="/hotroom/hotlist/'+i+'">'+i+'</span>';
				}
			}
			if( paging.totalPages - paging.endPage < 0 ) {
				hotelListForm += '<a class="next-page" href="#">&raquo;</a>';
			}
			
			hotelListForm +=
				'</div>\
			</form>\
\
			<div id="hotelInsert" style="display: none">\
			<br /><br /><br /><br /><br />\
			<div align="center"><h3 class="classic-title" ><span>호텔 추가 폼</span></h3></div>\
			<form id="hotelInsertForm">\
			<div class="container"><div class="row">\
				<div class="col-md-6">\
					<div class="form-group">\
						<div class="controls" >\
							<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>호텔코드</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="memId" name="memId" class="email" placeholder="호텔코드" required data-error="호텔코드를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="password" style="margin-top:8px"><b>호텔명</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="password" name="password" class="email" placeholder="호텔명" required data-error="호텔명를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="passwordCheck" style="margin-top:8px"><b>국가</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="passwordCheck" name="passwordCheck" class="email" placeholder="국가" required data-error="국가를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>도시</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="memName" name="memName" class="email" placeholder="도시" required data-error="도시를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>주소</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="phone" name="phone" class="email" placeholder="상세 주소" required data-error="주소를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>전화번호</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="phone" name="phone" class="email" placeholder="전화번호" required data-error="전화번호를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>홈페이지</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="phone" name="phone" class="email" placeholder="홈페이지" required data-error="홈페이지를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>옵션</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="phone" name="phone" class="email" placeholder="옵션" required data-error="옵션을 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					</div>\
					<div class="col-md-6">\
						<div class="form-group">\
							<div class="controls">\
								<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>룸 코드</b></label></div>\
								<div class="col-md-10">\
								<input type="text" id="roomCode" name="roomCode" class="email" placeholder="룸 코드" required data-error="룸 코드를 확인해 주시기 바랍니다">\
								<div class="help-block with-errors"></div>\
								</div>\
							</div>\
						</div>\
						<div class="form-group">\
							<div class="controls">\
								<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>룸 코드</b></label></div>\
								<div class="col-md-10">\
								<table class="table table-striped" style="font-size: 13px">\
									<thead>\
										<tr>\
											<th></th>\
											<th>호텔 Room 수</th>\
											<th>가격 수</th>\
										</tr>\
									</thead>\
									<tbody>\
										<tr>\
											<th scope="row"><input type="checkbox" name="Checkbox">싱글룸</th>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
											<td><input type="text" size="10" name="price" disabled="true"></td>\
										</tr>\
										<tr>\
											<th scope="row"><input type="checkbox" name="Checkbox">트윈룸</th>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
										</tr>\
										<tr>\
											<th scope="row"><input type="checkbox" name="Checkbox">트리플룸</th>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
										</tr>\
									</tbody>\
								</table>\
								</div>\
							</div>\
						</div>\
						<div class="form-group">\
							<div class="controls">\
								<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>가격</b></label></div>\
								<div class="col-md-10">\
								<input type="text" id="roomCode" name="roomCode" class="email" placeholder="가격" required data-error="가격을 확인해 주시기 바랍니다">\
								<div class="help-block with-errors"></div>\
								</div>\
							</div>\
						</div>\
						<div class="form-group">\
							<div class="controls">\
								<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>방 개수</b></label></div>\
								<div class="col-md-10">\
								<input type="text" id="roomCode" name="roomCode" class="email" placeholder="방 개수" required data-error="방 개수를 확인해 주시기 바랍니다">\
								<div class="help-block with-errors"></div>\
								</div>\
							</div>\
						</div>\
					</div>\
				</div></div>\
				<div align="center">\
				<button type="submit" class="btn-system btn-small" id="insertBtn">호텔정보추가</button>\
				<button type="reset" class="btn-system btn-small" id="insertBtn">다시 입력</button>\
				</div>\
				</form>\
				</div>\
\
			<div id="hotelUpdate" style="display: none">\
			<br /><br />\
			<div align="center"><h3 class="classic-title" ><span>호텔 정보 수정</span></h3></div>\
			<form id="hotelUpdateForm">\
			<div class="container"><div class="row">\
				<div class="col-md-6">\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="password" style="margin-top:8px"><b>호텔명</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="password" name="password" class="email" placeholder="호텔명" required data-error="호텔명를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="passwordCheck" style="margin-top:8px"><b>국가</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="passwordCheck" name="passwordCheck" class="email" placeholder="국가" required data-error="국가를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>도시</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="memName" name="memName" class="email" placeholder="도시" required data-error="도시를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>주소</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="phone" name="phone" class="email" placeholder="상세 주소" required data-error="주소를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>전화번호</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="phone" name="phone" class="email" placeholder="전화번호" required data-error="전화번호를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>홈페이지</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="phone" name="phone" class="email" placeholder="홈페이지" required data-error="홈페이지를 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					<div class="form-group">\
						<div class="controls">\
							<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>옵션</b></label></div>\
							<div class="col-md-10">\
							<input type="text" id="phone" name="phone" class="email" placeholder="옵션" required data-error="옵션을 확인해 주시기 바랍니다">\
							<div class="help-block with-errors"></div>\
							</div>\
						</div>\
					</div>\
					</div>\
					<div class="col-md-6">\
						<div class="form-group">\
							<div class="controls">\
								<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>룸 코드</b></label></div>\
								<div class="col-md-10">\
								<input type="text" id="roomCode" name="roomCode" class="email" placeholder="룸 코드" required data-error="룸 코드를 확인해 주시기 바랍니다">\
								<div class="help-block with-errors"></div>\
								</div>\
							</div>\
						</div>\
						<div class="form-group">\
							<div class="controls">\
								<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>룸 타입</b></label></div>\
								<div class="col-md-10">\
								<table class="table table-striped" style="font-size: 13px">\
									<thead>\
										<tr>\
											<th></th>\
											<th>호텔 Room 수</th>\
											<th>가격 수</th>\
										</tr>\
									</thead>\
									<tbody>\
										<tr>\
											<th scope="row"><input type="checkbox" name="Checkbox">싱글룸</th>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
											<td><input type="text" size="10" name="price" disabled="true"></td>\
										</tr>\
										<tr>\
											<th scope="row"><input type="checkbox" name="Checkbox">트윈룸</th>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
										</tr>\
										<tr>\
											<th scope="row"><input type="checkbox" name="Checkbox">트리플룸</th>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
											<td><input type="text" size="10" name="vacancy" disabled="true"></td>\
										</tr>\
									</tbody>\
								</table>\
								</div>\
							</div>\
						</div>\
						<div class="form-group">\
							<div class="controls">\
								<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>가격</b></label></div>\
								<div class="col-md-10">\
								<input type="text" id="roomCode" name="roomCode" class="email" placeholder="가격" required data-error="가격을 확인해 주시기 바랍니다">\
								<div class="help-block with-errors"></div>\
								</div>\
							</div>\
						</div>\
						<div class="form-group">\
							<div class="controls">\
								<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>방 개수</b></label></div>\
								<div class="col-md-10">\
								<input type="text" id="roomCode" name="roomCode" class="email" placeholder="방 개수" required data-error="방 개수를 확인해 주시기 바랍니다">\
								<div class="help-block with-errors"></div>\
								</div>\
							</div>\
						</div>\
					</div>\
				</div></div>\
				<div align="center">\
				<button type="submit" class="btn-system btn-small" id="updateBtn">정보 수정</button>\
				<button type="reset" class="btn-system btn-small" id="cancelBtn">취소</button>\
				</div>\
				</form>\
				</div>\
		</div></div></div>';
		
			return hotelListForm;
		}
		
	} // view end
}