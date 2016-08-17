/**
 * hotel
 */

var hotel = {
		functions : {
			calculateBill : function(bill) {
				$('#price').text(Global.comma(bill.price));
				$('#nights').text(bill.nights);
				$('#roomCharge').text(Global.comma(bill.roomCharge));
				$('#commission').text(Global.comma(bill.commission));
				$('#totalPrice').text(Global.comma(bill.totalPrice));
				$('#titleNights').text(bill.titleNights);
			}
		},	// functions ends
		
		event : {
			reservation : function(checkin, totalPrice, night) {
				$('#hotReservaion').click(function() {
					hotel.ajax.reservation.reservation(checkin, totalPrice, night);
				});
						
			},
			list : function() {
				$('.hotelDetail').click(hotel.ajax.detail.detail);
				$('#checkin').change(hotel.ajax.list.checkin);
				$('#checkout').change(hotel.ajax.list.checkout);
				$('#city').keypress(hotel.ajax.list.city);
				$('.roomtype').click(hotel.ajax.list.roomType);
			},
			detail : function(data) {
				$('#innerCheckin').change(function(e){
					hotel.ajax.detail.innerCheckin(data[0].hotCode);
				});
				$('#innerCheckout').change(function(e){
					hotel.ajax.detail.innerCheckout(data[0].hotCode);
				});
				$('#roomType').unbind('change');
				$('#roomType').change(function(e) {							
					hotel.event.roomTypeChange(data, $(this).val());						
				});	
				$('#goReservation').click(function(e) {
					e.preventDefault();
					//alert('detail.res');
					if (Global.user == undefined) {
						if(confirm('예약은 로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?') == true){
							member.init.login(Global.context);
						}
						
					}else{
						var hotelDetailInfo = {
								night : $('#nights').text().substring(0,$('#nights').text().length-1),
								roomCode  : $('option[name=roomCode]:selected').attr('roomCode'),
								roomCharge : $('#roomCharge').text(),
								commission : $('#commission').text(),
								totalPrice : $('#totalPrice').text(),
								innerCheckin : $('#innerCheckin').val(),
								innerCheckout : $('#innerCheckout').val(),
						};
						hotel.view.reservation(Global.context, data[0], hotelDetailInfo);
						hotel.event.reservation(hotelDetailInfo.innerCheckin, hotelDetailInfo.totalPrice, hotelDetailInfo.night);
					}
					
				});
				
			},
			roomTypeChange : function(data, selectedRoomType,checkin, checkout )
			{
				for ( var index in data) {
					if( data[index].roomType == selectedRoomType ) {
						var price = data[index].price;
						break;
					}
				}
				hotel.functions.calculateBill({ 'price'		: price,
												'roomCharge': price * $('#nights').text().substring(0,$('#nights').text().length-1),
												'commission': price*0.1,
												'totalPrice': price * $('#nights').text().substring(0,$('#nights').text().length-1) + price*0.1  });
				
			},
			day : function(checkin, checkout) {
				var checkin = checkin.split('-');
				var checkout = checkout.split('-');
				
				var date1 = new Date(checkin[0],checkin[1],checkin[2]);
				var date2 = new Date(checkout[0],checkout[1],checkout[2]);
				var diff = date2 - date1;
				var day = 1000*60*60*24;
				
				var result = parseInt(diff/day);
				//alert(result);
				$('#nights').text(result + '박');
				
			}
		}, // event end
		
		
		
		ajax : {
			detail :
			{	
				detail : function() {
					var hoteldata = {
			    			city : $('#city').val(),
							checkin : $('#checkin').val(),
							checkout : $('#checkout').val(),
							roomType : $('input[type=radio][name=roomtype]:checked').val()
					};
			    	$.ajax({
						url : $(this).attr('click'), 
						data : hoteldata,
						type : 'post',
						success : function(data) {
							$('#content').html(hotel.view.detail(Global.context, data, hoteldata.checkin, hoteldata.checkout));
							hotel.event.detail(data);
						},
						error : function(xhr,status,msg) {
							alert('에러발생상태 city :'+status+',내용 : '+msg);
						}
			    	});
				},
				
		    	innerCheckin: function(hotCode) {
					var data = {
							hotCode : hotCode,
							innerCheckin : $('#innerCheckin').val(),
							innerCheckout : $('#innerCheckout').val(),
					};
					if(data.innerCheckin!="" && data.innerCheckout!=""){
						$.ajax({
							url : Global.context + '/hotel/RoomListByInnerDate',
							data : data,
							type : 'post',
							success : function(data) {
								//alert('innerCheckin ==== /hotel/RoomListByInnerDate 갔다옴');
								hotel.event.day($('#innerCheckin').val(), $('#innerCheckout').val());
								hotel.event.roomTypeChange(data, $('#roomType').val());
								var newRoomType = '<select name="roomType" id="roomType">';
								for ( var index in data) {
									newRoomType += '<option value="'+data[index].roomType+'">'+data[index].roomType+'</option>';
								}
								newRoomType+='</select>';
								$('#innerRoomType').html(newRoomType);
								$('#roomType').unbind('change');
								$('#roomType').change(function(e) {
									hotel.event.roomTypeChange(data, $(this).val());						
								});	
							},
							error : function(xhr,status,msg) {
								alert('에러발생상태 checkout :'+status+',내용 : '+msg);
							}
						});
					}
				}, // ajax list innerCheckout end
				
				innerCheckout : function(hotCode) {
					var data = {
							hotCode : hotCode,
							innerCheckin : $('#innerCheckin').val(),
							innerCheckout : $('#innerCheckout').val(),
					};
					if(data.innerCheckin!="" && data.innerCheckout!=""){
						
						$.ajax({
							url : Global.context + '/hotel/RoomListByInnerDate',
							data : data,
							type : 'post',
							success : function(data) {
								//alert('innerCheckout ==== /hotel/RoomListByInnerDate 갔다옴' + data.length);
								hotel.event.day($('#innerCheckin').val(), $('#innerCheckout').val());
								hotel.event.roomTypeChange(data, $('#roomType').val());
								var newRoomType = '<select name="roomType" id="roomType">';
								for ( var index in data) {
									//alert(data[index].roomCode);
									newRoomType += '<option name="roomCode" roomCode="'+data[index].roomCode+'" value="'+data[index].roomType+'">'+data[index].roomType+'</option>';
								}
								newRoomType+='</select>';
								$('#innerRoomType').html(newRoomType);
								$('#roomType').unbind('change');
								$('#roomType').change(function(e) {			
									//alert($('option[name=roomCode]:selected').attr('roomCode'));
									hotel.event.roomTypeChange(data, $('#roomType').val());						
								});	
							},
							error : function(xhr,status,msg) {
								alert('에러발생상태 checkout :'+status+',내용 : '+msg);
							}
						});
					}
				}
				
			},	// ajax detail end
			
			list :
			{
				checkin : function(e) {
					e.preventDefault();
					var data = {
							city : $('#city').val(),
							checkin : $('#checkin').val(),
							checkout : $('#checkout').val(),
							roomType : $("input[type=radio][name=roomtype]:checked").val()
					};
					if(data.checkin!="" && data.checkout!=""){
						$.ajax({
							url : Global.context + '/hotel/listAll',
							data : data,
							type : 'post',
							success : function(data) {
								//alert('checkin ==== /hotel/listAll 갔다옴');
								
								var newHotelList =  '<div id="hotelList" class="filters-section intro-filter panel-body panel-light" style="background-color:#F6F6F6">';
									$.each(data,function(index,value){
										newHotelList +='<a class="hotelDetail" href="#" click="/hotel/detail/'+value.hotCode+'"><img src="'+Global.context+'/resources/img/hotel/'+value.image1+'" style="width: 350px;height: 350px"></a>';
									});
									newHotelList +='<div>';
									
								$('#hotelList').html(newHotelList);
								$('.hotelDetail').click(hotel.ajax.detail.detail);
								
							},
							error : function(xhr,status,msg) {
								alert('에러발생상태 checkin :'+status+',내용 : '+msg);
							}
						});
					}
				}, //ajax checkin end
				checkout : function(e) {
					e.preventDefault();
					var data = {
							city : $('#city').val(),
							checkin : $('#checkin').val(),
							checkout : $('#checkout').val(),
							roomType : $("input[type=radio][name=roomtype]:checked").val()
					};
					if(data.checkin!="" && data.checkout!=""){
						$.ajax({
							url : Global.context + '/hotel/listAll',
							data : data,
							type : 'post',
							success : function(data) {
								//alert('checkout ==== /hotel/listAll 갔다옴');
								var newHotelList =  '<div id="hotelList" class="filters-section intro-filter panel-body panel-light" style="background-color:#F6F6F6">';
									$.each(data,function(index,value){
										newHotelList +='<a class="hotelDetail" href="#" click="/hotel/detail/'+value.hotCode+'"><img src="'+Global.context+'/resources/img/hotel/'+value.image1+'" style="width: 350px;height: 350px"></a>';
									});
									newHotelList +='<div>';
								$('#hotelList').html(newHotelList);
								$('.hotelDetail').click(hotel.ajax.detail.detail);
							},
							error : function(xhr,status,msg) {
								alert('에러발생상태 checkout :'+status+',내용 : '+msg);
							}
						});
					}
				}, //ajax checkout end
				city : function(e){
				    if(e.which===13){
				    	var data = {
				    			city : $('#city').val(),
								checkin : $('#checkin').val(),
								checkout : $('#checkout').val(),
								roomType : $('input[type=radio][name=roomtype]:checked').val()
						};
				    	$.ajax({
							url : Global.context + '/hotel/listAll',
							data : data,
							type : 'post',
							success : function(data) {
								//alert('city ==== /hotel/listAll 갔다옴');
								var newHotelList =  '<div id="hotelList" class="filters-section intro-filter panel-body panel-light" style="background-color:#F6F6F6">';
									$.each(data,function(index,value){
										newHotelList +='<a class="hotelDetail" href="#" click="/hotel/detail/'+value.hotCode+'"><img src="'+Global.context+'/resources/img/hotel/'+value.image1+'" style="width: 350px;height: 350px"></a>';
									});	
									newHotelList +='<div>';
								$('#hotelList').html(newHotelList);
								$('.hotelDetail').click(hotel.ajax.detail.detail);
								
							},
							error : function(xhr,status,msg) {
								alert('에러발생상태 city :'+status+',내용 : '+msg);
							}
						});
				    }
				}, //ajax city end
				roomType : function(e) {
					e.preventDefault();
					//alert($('input[type=radio][name=roomtype]:checked').val());
					var data = {
							city : $('#city').val(),
							checkin : $('#checkin').val(),
							checkout : $('#checkout').val(),
							roomType : $("input[type=radio][name=roomtype]:checked").val()
					};
					$.ajax({
						url : Global.context + '/hotel/listAll',
						data : data,
						type : 'post',
						success : function(data) {
							//alert('roomtype ==== /hotel/listAll 갔다옴');
							
							var newHotelList =  '<div id="hotelList" class="filters-section intro-filter panel-body panel-light" style="background-color:#F6F6F6">';
								$.each(data,function(index,value){
									newHotelList +='<a class="hotelDetail" href="#" click="/hotel/detail/'+value.hotCode+'"><img src="'+Global.context+'/resources/img/hotel/'+value.image1+'" style="width: 350px;height: 350px"></a>';
								});
								newHotelList +='<div>';
							$('#hotelList').html(newHotelList);
							$('.hotelDetail').click(hotel.ajax.detail.detail);
						},
						error : function(xhr,status,msg) {
							alert('에러발생상태 roomtype :'+status+',내용 : '+msg);
						}
					});
				}, //ajax roomType end
			},
			reservation : {
				reservation : function(checkin, totalPrice, night) {
						if (($('input[type="text"]').val() == '') 
							||  ($("#gender option:selected").val() == '') 
							||  ($("#nationality option:selected").val() == '') 
							||  ($("#arrTime option:selected").val() == '')){
							alert('정보를 모두 입력해주세요.');
							history.go(-1);
						}else{
							/*alert('hotResName : '+$('#lastname').val()+$('#firstname').val());
							alert('email : '+$('#email1').val());
							alert('phone : '+$('#tel').val());
							alert('nationality : '+$('#nationality').val());
							alert('gender : '+$('#gender').val());
							alert('arrTime : '+$('#arrTime').val());
							alert('stayDate : '+checkin);
							alert('payment : '+totalPrice);
							alert('comments : '+$('#comments').val());
							alert('memId : '+Global.user.memId);
							alert('roomCode : '+$('#roomCode').val());
							alert('nights : ' +night);*/
							var data = {
									hotResName : $('#lastname').val()+$('#firstname').val(),
									email : $('#email1').val(),
									phone : $('#tel').val(),
									nationality : $('#nationality').val(),
									gender : $('#gender').val(),
									arrTime : $('#arrTime').val(),
									stayDate : checkin,
									payment : totalPrice,
									comments : $('#comments').val(),
									memId : Global.user.memId,
									roomCode : $('#roomCode').val(),
									nights : night
							};
							$.ajax({
								url : Global.context + '/hotel/reservation',
								data : data,
								type : 'post',
								success : function(data) {
									//alert('reservation ==== /hotel/reservation 갔다옴');
									hotel.init(Global.context);
								},
								error : function(xhr,status,msg) {
									alert('에러발생상태 roomtype :'+status+',내용 : '+msg);
								}
							});
						
						
					}
					
						
					
				}//ajax reservation end
			}
	
		},// ajax end
	
		
		
		
		init : function(context) {
			Global.ajax(context+'/hotel/list')
			.done( function(data){
				$('#content').html(hotel.view.list(context, data));
				hotel.event.list();
			});
		},
		view : {
			detail : function(context, hotelRoomList, checkin, checkout)
			{				
				var hotelDetail = '';
				hotelDetail +=
				'<div class="container">	<form>\
				\
				<div class="container-fluid">\
					<div class="row">\
						<div class="col-xs-12 col-md-12">\
					<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">\
								<ol class="carousel-indicators">\
									<li data-target="#myCarousel" data-slide-to="0" class="active"></li>\
									<li data-target="#myCarousel" data-slide-to="1" class=""></li>\
									<li data-target="#myCarousel" data-slide-to="2" class=""></li>\
								</ol>\
								<div class="carousel-inner" role="listbox" align="center" style="height:500px">\
									<div class="item active">\
										<img src="'+context+'/resources/img/hotel/'+hotelRoomList[0].image1+'" alt="" style="width: 100%"/>\
									</div>\
									<div class="item">\
										<img src="'+context+'/resources/img/hotel/'+hotelRoomList[0].image2+'" alt="" style="width: 100%"/>\
									</div>\
									<div class="item">\
										<img src="'+context+'/resources/img/hotel/'+hotelRoomList[0].image3+'" alt="" style="width: 100%"/>\
									</div>\
								</div>\
								<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">\
									<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>\
									<span class="sr-only">Previous</span>\
								</a>\
								<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">\
									<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>\
									<span class="sr-only">Next</span>\
								</a>\
							</div>\
							<br />\
							<br />\
							\
							<div class="col-xs-7">\
								<div class="col-xs-1"></div>\
								<div class="col-xs-3">\
									<img src="'+context+'/resources/img/owner/'+hotelRoomList[0].owner+'" alt="" class="img-circle ownerimg" >\
								</div>\
								<div class="col-xs-8">\
									<br />\
									<h4>'+hotelRoomList[0].hotName+'</h4>\
									<h5>'+hotelRoomList[0].country+','+hotelRoomList[0].city+'</h5>\
								<br />\
								<br />\
								<br />\
								</div>\
								\
								<legend></legend>\
								<br />\
								\
								<div class="col-xs-2" style="text-align: center;">\
									<h5>숙소</h5>\
								</div>\
								<div class="col-xs-3">\
									<table class="table table-striped table-hover " >\
										<thead >\
											<tr>\
												<th style="text-align: center;">주소</th>\
											</tr>\
											<tr>\
												<th style="text-align: center;">전화번호</th>\
											</tr>\
											<tr>\
												<th style="text-align: center;">홈페이지</th>\
											</tr>\
										</thead>\
									</table>\
								</div>\
								<div class="col-xs-7">\
									<table class="table table-striped table-hover ">\
										<tbody>\
											<tr>\
												<td>'+hotelRoomList[0].address+'</td>\
											</tr>\
											<tr>\
												<td>'+hotelRoomList[0].tel+'</td>\
											</tr>\
											<tr>\
												<td><a href="'+hotelRoomList[0].homepage+'">'+hotelRoomList[0].homepage+'</a></td>\
											</tr>\
										</tbody>\
									</table>\
									<br />\
								</div>\
								<legend></legend>\
								<br />\
								\
								\
								<div class="col-xs-2" style="text-align: center;">\
									<h5>시설</h5></div>\
								<div class="col-xs-10"><h5>'+hotelRoomList[0].options.replace(/\^/g,"<br>")+'</h5></div> \
								\
							</div>\
							\
							<div class="col-xs-1"></div>\
							<div class="col-xs-4">\
								<table class="table table-striped table-hover " >\
									<thead style="background-color: #ff9800; color: white; font-size: 1.5em">\
										<tr class="thremove">\
											<th id="price">￦ </th>\
											<th id="nights"style="text-align: right">1박</th>\
										</tr>\
									</thead>\
									<tbody>\
										<tr>\
											<td>체크 인</td>\
											<td> <input name="innerCheckin" id="innerCheckin" type="date" value="'+checkin+'">\
											</td>\
										</tr>\
										<tr>\
											<td>체크 아웃</td>\
											<td><input name="innerCheckout" id="innerCheckout" type="date" value="'+checkout+'">\
											</td>\
										</tr>\
										<tr>\
											<td>룸타입</td>\
											<td id="innerRoomType">\
											<select name="roomType" id="roomType">';
											for ( var index in hotelRoomList) {
												hotelDetail += '<option value="'+hotelRoomList[index].roomType+'">'+hotelRoomList[index].roomType+'</option>';
											}
//											$.each(hotelRoomList, function(index,value) {
//												hotel_detail+='<option value="'+value.roomType+'">'+value.roomType+'</option>';
//											});
								hotelDetail+='</select></td>\
										</tr>\
										<tr>\
											<td>방가격</td>\
											<td id="roomCharge">￦ </td>\
										</tr>\
										<tr>\
											<td>수수료</td>\
											<td id="commission">￦</td>\
										</tr>\
										<tr>\
											<td>합계</td>\
											<td id="totalPrice">￦</td>\
										</tr>\
										<tr>\
											<td align="center" colspan="2">\
												<button id="goReservation" style="width: 200px">예 약 하 기</button>\
											</td>\
										</tr>\
									</tbody>\
								</table>\
							</div>\
						</div>\
				</div>\
				\
				</form></div></div></div>';
				
				return hotelDetail;			
			}, /// detail ends
			
			list : function(context,data)
			
			{
				var hotelList = '<div id="content"><div class="container">\
					<div id="hotel-detail-form">\
				  <div class="filters-section intro-filter panel-body panel-light">\
			       <div class="row">\
					<div class="col-lg-2 col-md-12 text-center-sm text-center-md row-space-sm-1 filter-label">\
			           <label>도시</label>\
			         </div>\
			         <div class="row row-condensed">\
					<div class="col-md-4 col-sm-6 row-space-1-sm">\
		               <input name="city" id="city" value="" type="text" placeholder="ex) 서울">\
		             </div>\
					</div>\
					<hr>\
			         <div class="col-lg-2 col-md-12 text-center-sm text-center-md row-space-sm-1 filter-label">\
			           <label>날짜</label>\
			         </div>\
			         <form class="col-lg-9 trip-form">\
			           <div class="row row-condensed">\
			             <div class="col-md-4 col-sm-6 row-space-1-sm">\
			               <input name="checkin" id="checkin" type="date">\
			             </div>\
			   \
			             <div class="col-md-4 col-sm-6 row-space-1-sm">\
			               <input name="checkout" id="checkout" type="date">\
			             </div>\
			   \
			             <div class="col-md-4 col-sm-12">\
			               <div class="select select-block">\
			               </div>\
			             </div>\
			           </div>\
			         </form>\
			       </div>\
			     </div>\
			     \
			     <hr>\
			     \
			     <div class="filters-section intro-filter panel-body panel-light">\
			       <div class="row">\
			         <div class="col-lg-2 col-md-12 text-center-sm text-center-md row-space-sm-1 filter-label">\
			           <label>숙소 유형</label>\
			         </div>\
			   \
					<form class="col-lg-9 trip-form">\
			           <div id="room-type" class="row row-condensed room-type__buttons">\
			              <div class="radio-inline">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="radio" name="roomtype" class="roomtype" value="싱글룸" checked>싱글룸\
			                </label>\
			              </div>\
			              <div class="radio-inline">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="radio" name="roomtype" class="roomtype" value="트윈룸">트윈룸\
			                </label>\
			              </div>\
			              <div class="radio-inline">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="radio" name="roomtype" class="roomtype" value="더블룸">더블룸\
			                </label>\
			              </div>\
						  <div class="radio-inline">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="radio" name="roomtype" class="roomtype" value="패밀리룸">패밀리룸\
			                </label>\
			              </div>\
							<div class="radio-inline">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="radio" name="roomtype" class="roomtype" value="패밀리 트윈">패밀리 트윈\
			                </label>\
			              </div>\
							<br>\
							<div class="radio-inline">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="radio" name="roomtype" class="roomtype" value="스탠다드 트윈">스탠다드 트윈\
			                </label>\
			              </div>\
							<div class="radio-inline">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="radio" name="roomtype" class="roomtype" value="스탠다드 더블">스탠다드 더블\
			                </label>\
			              </div>\
							<div class="radio-inline">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="radio" name="roomtype" class="roomtype" value="디럭스 더블">디럭스 더블\
			                </label>\
			              </div>\
							<div class="radio-inline">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="radio" name="roomtype" class="roomtype" value="프리미어 스위트더">프리미어 스위트더\
			                </label>\
			              </div>\
			         </div>\
					</form>\
			       </div>\
			     </div>\
			     <hr>\
			        <div class="col-lg-2 col-md-12 filter-label">\
			        <label>시설</label>\
			      </div> \
			      <div class="col-lg-9">\
			        <div id="room-options" class="row row-condensed room-type__buttons">\
			              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">무선인터넷\
			                </label>\
			              </div>\
			              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">조식가능\
			                </label>\
			              </div>\
			              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">세탁기\
			                </label>\
			              </div>\
			              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">엘리베이터\
			                </label>\
			              </div>\
			              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">케이블TV\
			                </label>\
			              </div>\
			              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">\
			                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">\
			                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">수영장\
			                </label>\
			              </div>\
			         </div>\
					</div>\
			        </div>\
			      </div>\
			      <div class="container">\
				  <div id="hotelList" class="filters-section intro-filter panel-body panel-light" style="background-color:#F6F6F6">';
				
				$.each(data,function(index,value){
					hotelList +='<a class="hotelDetail" href="#" click="'+context+'/hotel/detail/'+value.hotCode+'"><img src="'+context+'/resources/img/hotel/'+value.image1+'" style="width: 350px;height: 350px"></a>';
				});
				hotelList += '</div></div></div>';
				
				return hotelList; 
			}, // view list end
			reservation : function(context, hotelRoom, hotelDetailInfo) 
			{
				var res_form = '<div id="content">\
					<div class="container">\
				<div class="col-xs-8">\
				<div style="border: 1px solid #eaeaea; padding: 1rem; background-color: #f4f4f4;"class="form-group">\
					<h2>귀하의 세부 정보</h2>\
					<ul>\
						<li style="text-align: -webkit-match-parent; margin-top: 20px">\
							<label class="ff-wrapper">\
							<input name="firstname"	id="firstname" placeholder="이름 *" type="text" required value="" class="form-control" style="width: 300px">\
							</label>\
							<label class="ff-wrapper ">\
							<input name="lastname" id="lastname" placeholder="성 *" type="text" required value=""	class="form-control" style="width: 300px">\
							</label>\
						</li>\
\
						<li style="text-align: -webkit-match-parent; margin-top: 20px">\
							<label class="ff-wrapper ">\
							<input name="oemail" placeholder="이메일 주소 *" type="text" id="email1" class="form-control" style="width: 300px" value="" required>\
							</label>\
							<label class="ff-wrapper">\
							<input name="cemail" placeholder="이메일 주소 확인 *" type="text" id="email2"	class="form-control" style="width: 300px" value="" required>\
							</label>\
						</li>\
\
						<li style="text-align: -webkit-match-parent; margin-top: 20px">\
							<label class="ff-wrapper ff-select">\
							<select name="nationality" id="nationality" required style="width: 300px" class="form-control">\
									<option title="아일랜드" value="Ireland">아일랜드</option>\
									<option title="아이슬란드" value="Iceland">아이슬란드</option>\
									<option title="요르단" value="Jordan">요르단</option>\
							</select>\
							</label>\
							<label class="ff-wrapper ff-select">\
								<select name="gender" id="gender" style="width: 300px" class="form-control" required>\
										<option value="Male">남성</option>\
										<option value="Female">여성</option>\
								</select>\
							</label>\
						</li>\
\
					</ul>\
				</div>\
				<br>\
				<div style="border: 1px solid #eaeaea; padding: 1rem; background-color: #f4f4f4;" class="form-group">\
					<h2>귀하의 숙박 정보</h2><br>\
					<ul>\
						<li>\
							<label class="ff-wrapper ff-select">\
								<select name="arrTime" id="arrTime" required	style="width: 300px" class="form-control">\
										<option value="15:00">15:00</option>\
										<option value="16:00">16:00</option>\
								</select>\
							</label>\
							<label class="ff-wrapper">\
								<input name="tel" id="tel" type="text" style="width: 300px" placeholder="전화번호 *" class="form-control" value="" >\
							</label>\
						</li>\
					</ul>\
				</div>\
				<br>\
				<div class="greybox rounded clearfix">\
\
					<div style="border: 1px solid #eaeaea; padding: 1rem; background-color: #f4f4f4;" class="form-group">\
					<h2>Comments</h2><br>\
					<input name="comments" type="text" id="comments" class="form-control" value="" ><br>\
						<div align="center">\
							<button  id="hotReservaion" class="btn btn-default btn-lg">예약 완료</button>\
						</div>\
					</div>\
				</div>\
				</div>\
\
				<div class="col-xs-4">\
					<input type="hidden" id="roomCode" value="'+hotelDetailInfo.roomCode+'">\
					<input type="hidden" id="night" value="'+hotelDetailInfo.roomCode+'">\
					<table class="table table-striped table-hover ">\
						<thead style="background-color: #ff9800;">\
							<tr>\
								<td colspan="2"><img alt="" src="'+Global.context+'/resources/img/hotel/'+hotelRoom.image1+'"></td>\
\
							</tr>\
						</thead>\
						<tbody>\
							<tr>\
								<td colspan="2">'+hotelRoom.country+','+hotelRoom.city+','+hotelRoom.address+'</td>\
							</tr>\
							<tr>\
								<td>객실</td>\
								<td>'+hotelRoom.roomType+'</td>\
							</tr>\
							<tr>\
								<td>체크인</td>\
								<td>'+hotelDetailInfo.innerCheckin+'</td>\
							</tr>\
							<tr>\
								<td>체크아웃</td>\
								<td>'+hotelDetailInfo.innerCheckout+'</td>\
							</tr>\
							<tr>\
								<td>방가격</td>\
								<td>￦'+hotelDetailInfo.roomCharge+'</td>\
							</tr>\
							<tr>\
								<td>수수료</td>\
								<td>￦'+hotelDetailInfo.commission+'</td>\
							</tr>\
							<tr>\
								<td>합계</td>\
								<td>￦ '+hotelDetailInfo.totalPrice+'</td>\
							</tr>\
\
						</tbody>\
					</table>\
				</div>\
				</div>\
			</div>';
			$('#content').html(res_form);
			}//view reservation end

		}
		
}