<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<li><a href="/hotroom/hotlist/1">호텔 리스트</a></li>
					<li><a href="/hotroom/hotreslist/1">호텔 예약 리스트</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Page Banner -->
<div id="content"><div class="container"><div class="row">
	<form id="hotListForm">
	<div align="center"><h3 class="classic-title"><span>호텔 리스트</span></h3></div>
	<div align="right">
		<button class="btn-system btn-mini border-btn" id="insertFormBtn">추가</button>
		<button class="btn-system btn-mini border-btn" id="updateFormBtn">수정</button>
		<button class="btn-system btn-mini border-btn" id="deleteBtn">삭제</button>
	</div>
	<div>
	<br />
	<table class="table table-hover" style="font-size:90%">
		<thead style="background-color: #00afd1; color: white"><tr>
			<th></th>
			<th>코드</th>
			<th>호텔명</th>
			<th>나라</th>
			<th>도시</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>홈페이지</th>
			<!-- <th>옵션</th> -->
			<th>룸 코드</th>
			<th>룸 타입</th>
			<th>가격</th>
			<th>방 개수</th>
		</tr></thead>
		<tbody>
		<c:forEach begin="${paging.startRow}" end="${paging.endRow - 1}" var="hotroom" items="${roomList}">
			<tr>
				<td><input type="checkbox" class="checkfor-room" name="checkfor-room" value="${hotroom.roomCode}"></td>
				<td class="hotCode">${hotroom.hotCode}</td>
				<td class="hotName">${hotroom.hotName}</td>
				<td class="country">${hotroom.country}</td>
				<td class="city">${hotroom.city}</td>
				<td class="address">${hotroom.address}</td>
				<td class="tel">${hotroom.tel}</td>
				<td class="homepage">${hotroom.homepage}</td>
				<%-- <td class="options">${hotroom.options}</td> --%>
				<td class="roomCode">${hotroom.roomCode}</td>
				<td class="roomType">${hotroom.roomType}</td>
				<td class="price">${hotroom.price}</td>
				<td class="vacancy">${hotroom.vacancy}</td> 
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>

	<div id="pagination" align="center">
		<span class="all-pages">Page ${paging.pageNo} of ${paging.totalPages }</span>
		<c:if test="${paging.startPage - paging.GROUPSIZE gt 0}">
			<a class="prev-page" href="#">&laquo;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" step="1" varStatus="i">
			<c:choose>
				<c:when test="${i.index == pageNo}">
					<span class="current page-num">${i.index}</span>
				</c:when>
				<c:otherwise>
					<span class="page-num" href="/hotroom/hotlist/${i.index }">${i.index}</span>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.totalPages - paging.endPage lt 0 }">
			<a class="next-page" href="#">&raquo;</a>
		</c:if>
	</div>
	</form>
	
	<div id="hotelInsert" style="display: none">
	<br /><br /><br /><br /><br />
	<div align="center"><h3 class="classic-title" ><span>호텔 추가 폼</span></h3></div>
	<form id="hotelInsertForm">
	<div class="container"><div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<div class="controls" >
					<div class="col-md-2" align="right"><label for="email" style="margin-top:8px"><b>호텔코드</b></label></div>
					<div class="col-md-10">
					<input type="text" id="memId" name="memId" class="email" placeholder="호텔코드" required data-error="호텔코드를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="password" style="margin-top:8px"><b>호텔명</b></label></div>
					<div class="col-md-10">
					<input type="text" id="password" name="password" class="email" placeholder="호텔명" required data-error="호텔명를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="passwordCheck" style="margin-top:8px"><b>국가</b></label></div>
					<div class="col-md-10">
					<input type="text" id="passwordCheck" name="passwordCheck" class="email" placeholder="국가" required data-error="국가를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>도시</b></label></div>
					<div class="col-md-10">
					<input type="text" id="memName" name="memName" class="email" placeholder="도시" required data-error="도시를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>주소</b></label></div>
					<div class="col-md-10">
					<input type="text" id="phone" name="phone" class="email" placeholder="상세 주소" required data-error="주소를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>전화번호</b></label></div>
					<div class="col-md-10">
					<input type="text" id="phone" name="phone" class="email" placeholder="전화번호" required data-error="전화번호를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>홈페이지</b></label></div>
					<div class="col-md-10">
					<input type="text" id="phone" name="phone" class="email" placeholder="홈페이지" required data-error="홈페이지를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>옵션</b></label></div>
					<div class="col-md-10">
					<input type="text" id="phone" name="phone" class="email" placeholder="옵션" required data-error="옵션을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>룸 코드</b></label></div>
						<div class="col-md-10">
						<input type="text" id="roomCode" name="roomCode" class="email" placeholder="룸 코드" required data-error="룸 코드를 확인해 주시기 바랍니다">
						<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>룸 코드</b></label></div>
						<div class="col-md-10">
						<table class="table table-striped" style="font-size: 13px">
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
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>가격</b></label></div>
						<div class="col-md-10">
						<input type="text" id="roomCode" name="roomCode" class="email" placeholder="가격" required data-error="가격을 확인해 주시기 바랍니다">
						<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>방 개수</b></label></div>
						<div class="col-md-10">
						<input type="text" id="roomCode" name="roomCode" class="email" placeholder="방 개수" required data-error="방 개수를 확인해 주시기 바랍니다">
						<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
			</div>
		</div></div>
		<div align="center">
		<button type="submit" class="btn-system btn-small" id="insertBtn">호텔정보추가</button>
		<button type="reset" class="btn-system btn-small" id="insertBtn">다시 입력</button>
		</div>
		</form>
		</div>
		
		
		
	<div id="hotelUpdate" style="display: none">
	<br /><br />
	<div align="center"><h3 class="classic-title" ><span>호텔 정보 수정</span></h3></div>
	<form id="hotelUpdateForm">
	<div class="container"><div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="password" style="margin-top:8px"><b>호텔명</b></label></div>
					<div class="col-md-10">
					<input type="text" id="password" name="password" class="email" placeholder="호텔명" required data-error="호텔명를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="passwordCheck" style="margin-top:8px"><b>국가</b></label></div>
					<div class="col-md-10">
					<input type="text" id="passwordCheck" name="passwordCheck" class="email" placeholder="국가" required data-error="국가를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>도시</b></label></div>
					<div class="col-md-10">
					<input type="text" id="memName" name="memName" class="email" placeholder="도시" required data-error="도시를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>주소</b></label></div>
					<div class="col-md-10">
					<input type="text" id="phone" name="phone" class="email" placeholder="상세 주소" required data-error="주소를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>전화번호</b></label></div>
					<div class="col-md-10">
					<input type="text" id="phone" name="phone" class="email" placeholder="전화번호" required data-error="전화번호를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>홈페이지</b></label></div>
					<div class="col-md-10">
					<input type="text" id="phone" name="phone" class="email" placeholder="홈페이지" required data-error="홈페이지를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>옵션</b></label></div>
					<div class="col-md-10">
					<input type="text" id="phone" name="phone" class="email" placeholder="옵션" required data-error="옵션을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>룸 코드</b></label></div>
						<div class="col-md-10">
						<input type="text" id="roomCode" name="roomCode" class="email" placeholder="룸 코드" required data-error="룸 코드를 확인해 주시기 바랍니다">
						<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>룸 타입</b></label></div>
						<div class="col-md-10">
						<table class="table table-striped" style="font-size: 13px">
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
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>가격</b></label></div>
						<div class="col-md-10">
						<input type="text" id="roomCode" name="roomCode" class="email" placeholder="가격" required data-error="가격을 확인해 주시기 바랍니다">
						<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>방 개수</b></label></div>
						<div class="col-md-10">
						<input type="text" id="roomCode" name="roomCode" class="email" placeholder="방 개수" required data-error="방 개수를 확인해 주시기 바랍니다">
						<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
			</div>
		</div></div>
		<div align="center">
		<button type="submit" class="btn-system btn-small" id="updateBtn">정보 수정</button>
		<button type="reset" class="btn-system btn-small" id="cancelBtn">취소</button>
		</div>
		</form>
		</div>
</div></div></div>

<script type="text/javascript">
	$(function() {
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
	})
</script>