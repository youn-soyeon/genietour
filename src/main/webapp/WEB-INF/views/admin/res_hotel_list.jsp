<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<form id="hotResForm">
	<div align="center"><h3 class="classic-title"><span>호텔 예약 리스트</span></h3></div>
	<div align="right">
		<button class="btn-system btn-mini" id="updateFormBtn">수정</button>
		<button class="btn-system btn-mini" id="deleteBtn">삭제</button>
	</div>
	<div>
	<br />
	<table class="table table-hover" style="font-size:90%">
		<thead style="background-color: #00afd1; color: white"><tr>
			<th></th>
			<th>예약코드</th>
			<th>예약자</th>
			<th>E-Mail</th>
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
		</tr></thead>
		<tbody>
		<c:forEach begin="${paging.startRow}" end="${paging.endRow - 1}" var="hotres" items="${resList}">
			<tr>
				<td><input type="checkbox" class="checkfor-hotres" name="checkfor-hotres" value="${hotres.hotResCode}"></td>
				<td class="hotResCode">${hotres.hotResCode}</td>
				<td class="hotResName">${hotres.hotResName}</td>
				<td class="memEmail">${hotres.email}</td>
				<td class="phone">${hotres.phone}</td>
				<td class="nationality">${hotres.nationality}</td>
				<td class="gender">${hotres.gender}</td>
				<td class="arrTime">${hotres.arrTime}</td>
				<td class="stayDate">${hotres.stayDate}</td>
				<td class="resDate">${hotres.resDate}</td>
				<td class="payment">${hotres.payment}</td>
				<td class="comments">${hotres.comments}</td>
				<td class="memId">${hotres.memId}</td>
				<td class="roomCode">${hotres.roomCode}</td>	
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
					<span class="page-num" href="/hotroom/hotreslist/${i.index }">${i.index}</span>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.totalPages - paging.endPage lt 0 }">
			<a class="next-page" href="#">&raquo;</a>
		</c:if>
	</div>
	</form>
	
	
	<div id="hotResUpdate" style="display: none;"><br /><br /><br /><br />
	<div align="center"><h3 class="classic-title"><span>호텔예약정보 수정</span></h3></div>
	<form id="hotResUpdateForm">
		<input type="hidden" id="hotResCode" name="hotResCode">
		<div class="col-md-6">
			<div class="form-group">
				<div class="controls" >
					<div class="col-md-2" align="right"><label for="memEmail" style="margin-top:8px"><b>e-mail</b></label></div>
					<div class="col-md-10">
					<input type="text" id="memEmail" name="memEmail" class="email" placeholder="e-mail" required data-error="e-mail을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>성별</b></label></div>
					<div class="col-md-10">
					<input type="text" id="gender" name="gender" class="email" placeholder="성별" required data-error="성별을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="stayDate" style="margin-top:8px"><b>머무는날</b></label></div>
					<div class="col-md-10">
					<input type="text" id="stayDate" name="stayDate" class="email" placeholder="머무는날" required data-error="머무는날을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<div class="col-md-2" align="right"><label for="payment" style="margin-top:8px"><b>비용</b></label></div>
					<div class="col-md-10">
					<input type="text" id="payment" name="payment" class="email" placeholder="비용" required data-error="비용을 확인해 주시기 바랍니다">
					<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="phone" style="margin-top:8px"><b>전화번호</b></label></div>
						<div class="col-md-10">
						<input type="text" id="phone" name="phone" class="email" placeholder="전화번호" required data-error="전화번호를 확인해 주시기 바랍니다">
						<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="nationality" style="margin-top:8px"><b>국적</b></label></div>
						<div class="col-md-10">
						<input type="text" id="nationality" name="nationality" class="email" placeholder="국적" required data-error="국적을 확인해 주시기 바랍니다">
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
				<div class="form-group">
					<div class="controls">
						<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>방코드</b></label></div>
						<div class="col-md-10">
						<input type="text" id="roomCode" name="roomCode" class="email" placeholder="방코드" required data-error="방코드를 확인해 주시기 바랍니다">
						<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
			</div>
		<div align="center">
			<button type="submit" class="btn-system btn-small" id="updateBtn">정보 수정</button>
			<button type="button" class="btn-system btn-small" id="resetBtn">취소</button>
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
		
		$('#deleteBtn').click(function(e) {
			e.preventDefault();
			$('#hotResForm').attr('action', '/hotroom/deletehotres').attr('method', 'post').submit();
		});
		
		
		$("input[name=checkfor-hotres]").click(function() {
			var hotResCode = $(this).parent().siblings('td.hotResCode').text();
			$('#hotResCode').val(hotResCode);
			var memEmail = $(this).parent().siblings('td.memEmail').text();
			$('#memEmail').val(memEmail);
			var gender = $(this).parent().siblings('td.gender').text();
			$('#gender').val(gender);
			var stayDate = $(this).parent().siblings('td.stayDate').text();
			$('#stayDate').val(stayDate);
			var payment = $(this).parent().siblings('td.payment').text();
			$('#payment').val(payment);
			
			var nationality = $(this).parent().siblings('td.nationality').text();
			$('#nationality').val(nationality);
			var phone = $(this).parent().siblings('td.phone').text();
			$('#phone').val(phone);
			var arrTime = $(this).parent().siblings('td.arrTime').text();
			$('#arrTime').val(arrTime);
			var roomCode = $(this).parent().siblings('td.roomCode').text();
			$('#roomCode').val(roomCode);
			
		});
		
		$('#updateFormBtn').click(function(e) {
			e.preventDefault();
			if($('input:checkbox[name=checkfor-hotres]:checked').length != 1){
				alert('수정하기 위한 데이터를 하나만 선택해주시기 바랍니다.');
			} else {
				$('#hotResUpdate').slideDown("slow");
				location.href='#hotResUpdate';
			}
			$('#updateBtn').click(function() {
				alert('수정버튼 클릭');
				$('#hotResUpdateForm').attr('action','/hotroom/updatehotres').attr('method', 'post').submit();
			});
			$('#resetBtn').click(function() {
				$("#hotResUpdate").slideUp("slow");
				location.href='#content';
			});
		});
	})
</script>