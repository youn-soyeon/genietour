/**
 * Member
 */
/*-----------------로그인------------------*/

var member =
{	
	init :
	{
		login : function() {
			$('#content').html(member.view.login());
			member.event.login();
		},
		join : function() {
			$('#content').html(member.view.join());
			member.event.join();
		},
		mypage : function() {
			$('#content').html(member.view.mypage());
			member.event.mypage();
			member.ajax.mypageHotelResList(1);
		}
	},
	
	ajax : 
	{
		login : function()
		{
			var user = {
				memId 		: $('#memId').val(),
				password 	: $('#password').val(),
			}
			
			Global.ajax('/member/login', JSON.stringify(user))
			.done(function(data) {
				Global.user = data;		// 로그인 정보 세팅
				
				switch(data.role) {	// 회원 종류에 따라 화면 전환하기
					case '관리자':
						Global.header.admin();
						admin.init.main();
						break;
					case '회원':
					default:
						Global.header.member();
						$.post('/', function(data){$('#content').html(data);});	// 홈으로 돌아가기
						break;
				}
			});
		},
		join : function()
		{
			var userJoin = {
					memId 		: $('#memId').val(),
					password 	: $('#password').val(),
					memName 	: $('#memName').val(),
					phone 		: $('#phone').val(),
					role 		: $('#role').val()
			}
			
			Global.ajax('/member/join', JSON.stringify(userJoin))
			.done( function(data) {
				alert("회원가입에 성공하셨습니다.");
				member.init.login();
			});
		},	
		mypageHotelResList : function(pageNo) {
			url = Global.context + '/member/hotResList/'+Global.user.memId +'/' + pageNo;
			Global.ajax(url)
			.done( function(model) {
				$('#mypage-list').html(member.view.mypageHotelResList(model.hotRes, model.paging));
				$('.page-num').click(function(e) {
					e.preventDefault();
					member.ajax.mypageHotelResList($(this).attr('href'));
				});
			});
		},
		mypageFlightResList : function(pageNo) {
			url = Global.context + '/member/fliResList/'+Global.user.memId +'/' + pageNo;
			Global.ajax(url)
			.done( function(model) {				
				$('#mypage-list').html(member.view.mypageFlightResList(model.fliRes, model.paging));
				$('.page-num').click(function(e) {
					e.preventDefault();
					member.ajax.mypageFliResList($(this).attr('href'));
				});
			});
		}
		
	}, // ajax end
	
	event : 
	{
		
		login : function()
		{
			$('#login-btn').click(member.ajax.login);	

			var cookie_user_id = getLogin();
			if(cookie_user_id != "") {
				$("#memId").val(cookie_user_id);
				$("#cb_saveId").attr("checked", true);
			}

			$("#cb_saveId").click(function() {
				var ck = this;
				var isRemember;

				if($(ck).is(":checked")) {
					isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? ");
					$(ck).attr("checked", true);
				}
			});

			$("#login-btn").click(function() {
				if( $("#cb_saveId").is(":checked") ) {
					saveLogin($("#memId").val());
				} else { 
					saveLogin("");
				}
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
		},	// login end
		join : function()
		{
			$('#joinButton').click(member.ajax.join);
			$('#cancelButton').click(function() {
				$('#join-form').reset();
			});
		},	// event.join end
		mypage : function() 
		{
			$('#flight-label').click( function() {
				member.ajax.mypageFlightResList(1);
				
			});
			
			$('#hotel-label').click( function() {
				member.ajax.mypageHotelResList(1);
			});
		} // event.mypage end
		
	},	// event end
	
	
	
	
	
	view :
	{
		login : function()
		{
			var login = '';
			login +=
				'<body onload="getLogin()">\
				<!-- Start Page Banner -->\
				<div class="page-banner no-subtitle">\
					<div class="container">\
						<div class="row">\
							<div class="col-md-6">\
								<h2>지니투어 - 로그인</h2>\
							</div>\
						<div class="col-md-6">\
							<ul class="breadcrumbs">\
								<li><a href="/">지니투어 홈</a></li>\
								<li>로그인</li>\
							</ul>\
						</div>\
					</div>\
				</div>\
				</div>\
				<div id="content">\
				<div class="container">\
					<div class="row">\
						<!-- Page Content -->\
						<div class="col-md-4"></div>\
						<div class="main col-md-4 page-content" align="center">\
							<!-- Classic Heading -->\
							<h4 class="classic-title"><span>로그인</span></h4>\
							<!-- Forms start -->\
							<form id="login-form"  name ="loginform" method="post">\
								<div class="form-group">\
									<div class="controls">\
										<input type="text" id="memId" name="memId" class="email" placeholder="Name" required data-error="Please enter your name">\
										<div class="help-block with-errors"></div>\
									</div>\
								</div>\
								<div class="form-group">\
									<div class="controls">\
										<input type="password" id="password" name="password" class="email" placeholder="Password" required data-error="Please enter your Password">\
										<div class="help-block with-errors"></div>\
									</div>\
								</div>\
								<div class="checkbox">\
									<div class="form-group">\
										<button type="button" class="btn-system btn-large btn-block" id="login-btn">로그인</button>\
									</div>\
									<div align="right" style="height: 50px">\
										<label><input type="checkbox" id="cb_saveId"> 아이디 저장</label>\
										<br />\
									</div>\
									<a id="join" href="/member/join">회원가입</a> / <a href="/">아이디찾기</a> / <a href="/">비밀번호찾기</a>\
								</div>\
							</form>\
							<!-- Form End -->\
						</div>\
						<div class="col-md-4"></div>\
						<div class="space-bottom"></div>\
					</div>\
				</div>\
				</div>\
				</body>\ ';
			return login;
		}, // login view end

		join : function() 
		{
		 var join = '';
		 join += 
			' <!-- Start Page Banner -->\
			 <div class="page-banner no-subtitle">\
				<div class="container">\
				 	<div class="row">\
				 		<div class="col-md-6"><h2>지니투어 - 회원가입</h2></div>\
				 		<div class="col-md-6">\
				   			<ul class="breadcrumbs">\
					 			<li><a href="/">지니투어 홈</a></li>\
					 			<li>회원가입</li>\
			 				</ul>\
				 		</div>\
				 	</div>\
			 	</div>\
			 </div>\
			 <!-- End Page Banner -->\
			 	\
			 	\
		 <!-- Start Content -->\
		 <div id="content"><div class="container"><div class="row">\
		 	<!-- Page Content -->\
		 	<div class="col-md-2"></div>\
		 	<div class="main col-md-8 page-content" align="center">\
		 		<!-- Classic Heading -->\
		 		<h4 class="classic-title"><span>회원 정보 입력</span></h4>\
		 		<!-- Forms start -->\
		 		\
		 		<form role="form" id="join-form" data-toggle="validator" class="shake">\
		 			<div class="form-group">\
		 				<div class="controls" >\
		 					<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>지니투어 계정</b></label></div>\
		 					<div class="col-md-10">\
		 					<input type="text" id="memId" name="memId" class="email" placeholder="지니투어 계정" required data-error="계정을 확인해 주시기 바랍니다">\
		 					<div class="help-block with-errors"></div>\
		 					</div>\
		 				</div>\
		 			</div>\
		 			<div class="form-group">\
		 				<div class="controls">\
		 					<div class="col-md-2" align="right"><label for="password" style="margin-top:8px"><b>비밀번호</b></label></div>\
		 					<div class="col-md-10">\
		 					<input type="text" id="password" name="password" class="email" placeholder="비밀번호" required data-error="비밀번호를 확인해 주시기 바랍니다">\
		 					<div class="help-block with-errors"></div>\
		 					</div>\
		 				</div>\
		 			</div>\
		 			<div class="form-group">\
		 				<div class="controls">\
		 					<div class="col-md-2" align="right"><label for="passwordCheck" style="margin-top:8px"><b>비밀번호 확인</b></label></div>\
		 					<div class="col-md-10">\
		 					<input type="text" id="passwordCheck" name="passwordCheck" class="email" placeholder="비밀번호 확인" required data-error="비밀번호 확인을 확인해 주시기 바랍니다">\
		 					<div class="help-block with-errors"></div>\
		 					</div>\
		 				</div>\
		 			</div>\
		 			<div class="form-group">\
		 				<div class="controls">\
		 					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>이름</b></label></div>\
		 					<div class="col-md-10">\
		 					<input type="text" id="memName" name="memName" class="email" placeholder="이름" required data-error="이름을 확인해 주시기 바랍니다">\
		 					<div class="help-block with-errors"></div>\
		 					</div>\
		 				</div>\
		 			</div>\
		 			<div class="form-group">\
		 				<div class="controls">\
		 					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>핸드폰번호</b></label></div>\
		 					<div class="col-md-10">\
		 					<input type="text" id="phone" name="phone" class="email" placeholder="핸드폰번호" required data-error="핸드폰번호를 확인해 주시기 바랍니다">\
		 					<div class="help-block with-errors"></div>\
		 					</div>\
		 				</div>\
		 			</div>\
		 			<div class="form-group">\
		 				<div class="controls">\
		 					<div class="col-md-2" align="right">\
		 						<label for="name" style="margin-top:8px"><b>회원유형</b></label>\
		 					</div>\
		 					<div class="col-md-10" style="vertical-align: middle;">\
		 						<input type="radio" name="role" id="role" value="회원" checked /> 회원\
		 					<div class="help-block with-errors"></div>\
		 					<br/><br/><br/>\
		 					<button type="button" id="joinButton" class="btn btn-system btn-lg btn-warning" >회원가입</button>\
		 					<button type="reset" id="cancleButton" class="btn btn-system btn-lg btn-info" >다시입력</button>\
		 					</div>\
		 				</div>\
		 			\
		 			</div>\
		 		</form>\
		 		<!-- Form End -->\
		 	</div>\
		 	<div class="col-md-2"></div>\
		 	<br />\
		 	<br />\
		 	<br />\
			 \
		 </div></div></div>\ ';
		 return join;
		},//join view end
		mypage : function() {
			return	'<!-- Start Page Banner -->\
				<div class="col-md-12 page-banner no-subtitle">\
					<div class="container">\
						<div class="row">\
							<div class="col-md-6">\
								<h2>마이 페이지</h2>\
							</div>\
							<div class="col-md-6">\
								<ul class="breadcrumbs">\
									<li><span id="flight-label" style="cursor:pointer">항공 예약 리스트</span></li>\
									<li><span id="hotel-label" style="cursor:pointer">호텔 예약 리스트</span></li>\
								</ul>\
							</div>\
						</div>\
					</div>\
				</div>\
				<!-- End Page Banner -->\
			\
				<div class="col-md-1"></div>\
				<div class="col-md-10">\
					\
					<h4 class="classic-title"><br><span>나의 회원정보</span></h4>\
					<ul class="list-unstyled" style="line-height: 2">\
						<div class="col-md-5">\
						<div>\
							<img alt="" src="/resources/images/medal.gif"></div>\
						</div>\
						<div class="col-md-7">\
							<li>\
								<h3><span>내 포인트</span></h3>\
								<span>0p</span>\
							</li>\
							<li>\
								<h3><span>쿠폰</span></h3>\
								<span>0장</span>\
							</li>\
						</div>\
					</ul>\
					<div class="btn-group" role="group" aria-label="...">\
						<button type="button" id=""class="btn btn-default">개인정보변경</button>\
						<button type="button" id="" class="btn btn-default">회원탈퇴</button>\
					</div>\
				</div>\
				<div class="col-md-12"></div>\
			\
				<div class="col-md-1"></div>\
				<div class="col-md-10" id="mypage-list"></div>\
				<div class="col-md-1"></div>';			
		},// mypage view end
		mypageHotelResList : function(hotRes, paging) {
			var list = '';
			list +=
			'<br><div align="center"><h3 class="classic-title"><span>호텔 예약 리스트</span></h3></div>\
			<div align="right">\
				<button class="btn-system btn-mini" id="updateFormBtn">수정</button>\
				<button class="btn-system btn-mini" id="deleteBtn">삭제</button>\
			</div>\
			<div>\
			<br />\
			<table class="table table-hover" style="font-size:90%">\
				<thead style="background-color: #00afd1; color: white"><tr>\
					<th></th>\
					<th>예약코드</th>\
					<th>예약자</th>\
					<th>E-Mail</th>\
					<th>전화번호</th>\
					<th>국적</th>\
					<th>성별</th>\
					<th>도착시간</th>\
					<th>머무는날</th>\
					<th>예약일</th>\
					<th>비용</th>\
					<th>댓글</th>\
					<th>예약자ID</th>\
					<th>방 코드</th>\
				</tr></thead>\
				<tbody>';
			
			for( var i = paging.startRow ; i < paging.endRow ; i++ ) {
			list +=
				'<tr>\
					<td><input type="checkbox" class="checkfor-hotres" name="checkfor-hotres" value="' + hotRes[i].hotResCode + '"></td>\
					<td class="hotResCode">' + hotRes[i].hotResCode + '</td>\
					<td class="hotResName">' + hotRes[i].hotResName + '</td>\
					<td class="memEmail">' + hotRes[i].email + '</td>\
					<td class="phone">' + hotRes[i].phone + '</td>\
					<td class="nationality">' + hotRes[i].nationality + '</td>\
					<td class="gender">' + hotRes[i].gender + '</td>\
					<td class="arrTime">' + hotRes[i].arrTime + '</td>\
					<td class="stayDate">' + hotRes[i].stayDate + '</td>\
					<td class="resDate">' + hotRes[i].resDate + '</td>\
					<td class="payment">' + Global.comma(hotRes[i].payment) + '</td>\
					<td class="comments">' + hotRes[i].comments + '</td>\
					<td class="memId">' + hotRes[i].memId + '</td>\
					<td class="roomCode">' + hotRes[i].roomCode + '</td>\
				</tr>';
			}
			
			
			list +=
				'</tbody>\
			</table>\
			</div>\
			<div id="pagination" align="center">\
				<span class="all-pages">Page '+paging.pageNo+' of '+paging.totalPages+'</span>';
			
				if( paging.startPage - paging.GROUPSIZE > 0 ) {
					list += '<a class="prev-page" href="#">&laquo;</a>';
				}
				for(var i=paging.startPage; i<=paging.endPage; i++) {
					if (i == paging.pageNo) {
						list +='<span class="current page-num">'+i+'</span>';
					} else {
						list +='<span class="page-num" href="'+i+'">'+i+'</span>';
					}
				}
				if( paging.totalPages - paging.endPage < 0 ) {
					list += '<a class="next-page" href="#">&raquo;</a>';
				}
			list += '</div><br>';
			
			return list;
		}, // mypage.hotelList end
		mypageFlightResList : function(fliRes, paging) {
			var list = '';
			list +=
			'<br><div align="center"><h3 class="classic-title"><span>항공 예약 리스트</span></h3></div>\
			<div align="right">\
				<button class="btn-system btn-mini" id="updateFormBtn">수정</button>\
				<button class="btn-system btn-mini" id="deleteBtn">삭제</button>\
			</div>\
			<div>\
			<br />\
			<table class="table table-hover" style="font-size:90%">\
				<thead style="background-color: #00afd1; color: white"><tr>\
					<th></th>\
					<th>예약코드</th>\
					<th>여권번호</th>\
					<th>국문 이름</th>\
					<th>영문 이름</th>\
					<th>생일</th>\
					<th>성별</th>\
					<th>전화번호</th>\
					<th>예약일</th>\
					<th>예약자ID</th>\
					<th>좌석 코드</th>\
					<th>코멘트</th>\
				</tr></thead>\
				<tbody>';
			
			for( var i = paging.startRow ; i < paging.endRow ; i++ ) {
			list +=
				'<tr>\
					<td><input type="checkbox" class="checkfor-flires" name="checkfor-flires" value="' + fliRes[i].fliResCode + '"></td>\
					<td class="fliResCode">' + fliRes[i].fliResCode + '</td>\
					<td class="passport">' + fliRes[i].passport + '</td>\
					<td class="korName">' + fliRes[i].korName + '</td>\
					<td class="engName">' + fliRes[i].engName + '</td>\
					<td class="birth">' + fliRes[i].birth + '</td>\
					<td class="gender">' + fliRes[i].gender + '</td>\
					<td class="phone">' + fliRes[i].phone + '</td>\
					<td class="resDate">' + fliRes[i].resDate + '</td>\
					<td class="memId">' + fliRes[i].memId + '</td>\
					<td class="seatCode">' + fliRes[i].seatCode + '</td>\
					<td class="comments">' + fliRes[i].comments + '</td>\
				</tr>';
			}
			
			
			list +=
				'</tbody>\
			</table>\
			</div>\
			<div id="pagination" align="center">\
				<span class="all-pages">Page '+paging.pageNo+' of '+paging.totalPages+'</span>';
			
				if( paging.startPage - paging.GROUPSIZE > 0 ) {
					list += '<a class="prev-page" href="#">&laquo;</a>';
				}
				for(var i=paging.startPage; i<=paging.endPage; i++) {
					if (i == paging.pageNo) {
						list +='<span class="current page-num">'+i+'</span>';
					} else {
						list +='<span class="page-num" href="'+i+'">'+i+'</span>';
					}
				}
				if( paging.totalPages - paging.endPage < 0 ) {
					list += '<a class="next-page" href="#">&raquo;</a>';
				}
			list += '</div><br>';
			
			return list;
		} // mypage.hotelList end
		
	}	// view ends
}


