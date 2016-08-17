<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="content"><div class="container"><div class="row">	
	<form id="memberListForm">
	<div align="center"><h3 class="classic-title"><span>항공사 및 좌석 리스트</span></h3></div>
		<div align="right">
		<button class="btn-system btn-mini border-btn" id="insertFormBtn">추가</button>
		<button class="btn-system btn-mini border-btn" id="updateFormBtn">수정</button>
		<button class="btn-system btn-mini border-btn" id="deleteBtn">삭제</button><br />
	</div>
	<table class="table table-hover" style="font-size:90%">
		<thead style="background-color: #00afd1; color: white"><tr>
			<th></th>
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
		</tr></thead>
		<tbody>
		<c:forEach begin="${paging.startRow}" end="${paging.endRow - 1}" var="flight" items="${fliList}">
			<tr>
				<td><input type="checkbox" name="checkfor-flight" value="${flight.fliCode}"></td>
				<td class="fliCode">${flight.fliCode}</td>
				<td class="airline">${flight.airline}</td>
				<td class="fliName">${flight.fliName}</td>
				<td class="depCity">${flight.depCity}</td>
				<td class="arrCity">${flight.arrCity}</td>
				<td class="depDate">${flight.depDate}</td>
				<td class="arrDate">${flight.arrDate}</td>
				<td class="depTime">${flight.depTime}</td>
				<td class="arrTime">${flight.arrTime}</td>
				<td class="seatCode">${flight.seatCode}</td>
				<td class="seatType">${flight.seatType}</td>
				<td class="price">${flight.price}</td>
				<td class="vacancy">${flight.vacancy}</td>
				<td><input type="radio" id ="flight-update-radio" name="flight-update" ></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
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
	
	
	<div id="flightFormDiv" style="display: none">
	<br /><br /><br /><br /><br />
	<div align="center"><h3 class="classic-title" ><span id="flightAction"></span></h3></div>
	<form id="flightForm">
	<div class="container"><div class="row">
		<div class="col-md-6">
			<input type="hidden" id="fliCode" name="fliCode" class="email" placeholder="항공사코드" required data-error="항공사코드를 확인해 주시기 바랍니다">
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="fliName" style="margin-top:8px"><b>항공사</b></label></div>
					<div class="col-md-10">
					<input type="text" id="fliName" name="fliName" class="email" placeholder="항공사" required data-error="항공사를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="airline" style="margin-top:8px"><b>편명</b></label></div>
					<div class="col-md-10">
					<input type="text" id="airline" name="airline" class="email" placeholder="편명" required data-error="편명을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="depCity" style="margin-top:8px"><b>출발도시</b></label></div>
					<div class="col-md-10">
					<input type="text" id="depCity" name="depCity" class="email" placeholder="출발도시" required data-error="출발도시를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="arrCity" style="margin-top:8px"><b>도착도시</b></label></div>
					<div class="col-md-10">
					<input type="text" id="arrCity" name="arrCity" class="email" placeholder="도착도시" required data-error="도착도시를 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="depDate" style="margin-top:8px"><b>출발일</b></label></div>
					<div class="col-md-10">
					<input type="text" id="depDate" name="depDate" class="email" placeholder="출발일" required data-error="출발일을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="arrDate" style="margin-top:8px"><b>도착일</b></label></div>
					<div class="col-md-10">
					<input type="text" id="arrDate" name="arrDate" class="email" placeholder="도착일" required data-error="도착일을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="depTime" style="margin-top:8px"><b>출발시간</b></label></div>
					<div class="col-md-10">
					<input type="text" id="depTime" name="depTime" class="email" placeholder="출발시간" required data-error="출발시간을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="arrTime" style="margin-top:8px"><b>도착시간</b></label></div>
					<div class="col-md-10">
					<input type="text" id="arrTime" name="arrTime" class="email" placeholder="도착시간" required data-error="도착시간을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
		</div>
			<div class="col-md-6">
				<input type="hidden" id="seatCode" name="seatCode" class="email" placeholder="좌석코드" required data-error="좌석코드를 확인해 주시기 바랍니다">
				<div class="form-group">
					<div class="controls">
						<label for="name" style="margin-top:8px"><b>좌석</b></label>
						<div class="col-md-12">
						<table class="table table-striped" style="font-size: 13px">
							<thead>
								<tr>
									<th></th>
									<th>좌석 수</th>
									<th>가격</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row"><input type="checkbox" id="first" name="Checkfor-seatType" value="퍼스트">퍼스트</th>
									<td><input type="text" size="10" id="vacancy1" name="vacancy1" disabled="true"></td>
									<td><input type="text" size="10" id="price1" name="price1" disabled="true"></td>
								</tr>
								<tr>
									<th scope="row"><input type="checkbox" id="business" name="Checkfor-seatType" value="비지니스">비지니스</th>
									<td><input type="text" size="10" id="vacancy1" name="vacancy2" disabled="true"></td>
									<td><input type="text" size="10" id="price2" name="price2" disabled="true"></td>
								</tr>
								<tr>
									<th scope="row"><input type="checkbox" id="economy" name="Checkfor-seatType" value="이코노미">이코노미</th>
									<td><input type="text" size="10" id="vacancy1" name="vacancy3" disabled="true"></td>
									<td><input type="text" size="10" id="price3" name="price3" disabled="true"></td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
				</div>
		</div></div></div>
		<div align="center">
		<button type="submit" class="btn-system btn-small" id="insertBtn">추가하기</button>
		<button type="submit" class="btn-system btn-small" id="cancelBtn">취소</button>
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
			$('#flightAction').text('항공사 및 좌석 추가');
			$("#flightFormDiv").slideToggle("slow", function() {
				if ($(this).is(':hidden')) {
					location.href = '#content';
				} else {
					location.href = '#flightFormDiv';
					$('input:checkbox[name=Checkfor-seatType]').click(function() {
						for (var i = 0; i < $(this).length; i++) {
							alert($('input:checkbox[name=Checkfor-seatType]:checked').text());
						}
					});
					$('#insertBtn').click(function(e) {
						e.preventDefault();			
						$('#flightForm').attr('action', '/admin/insertfliseat').attr('method', 'post').submit();
					});
				}
			});
		});
		
		$('#updateFormBtn').click(function(e) {
			e.preventDefault();
			$('#flightAction').text('항공사 및 좌석 정보 수정');
			$("#flightFormDiv").slideToggle("slow", function() {
				if ($(this).is(':hidden')) {
					location.href = '#content';
				} else {
					location.href = '#flightFormDiv';
				}
			});
		});
		
	});
</script>