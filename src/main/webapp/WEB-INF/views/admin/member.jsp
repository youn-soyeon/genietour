<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="content"><div class="container"><div class="row">	
	<form id="memberListForm">
	<div align="center"><h3 class="classic-title"><span>회원 리스트</span></h3></div>
		<div align="right">
		<button class="btn-system btn-mini border-btn" id="insertFormBtn">추가</button>
		<button class="btn-system btn-mini border-btn" id="updateFormBtn">수정</button>
		<button class="btn-system btn-mini border-btn" id="deleteBtn">삭제</button><br />
	</div>
	<table class="table table-hover" style="font-size:90%">
		<thead style="background-color: #00afd1; color: white"><tr>
			<th></th>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰</th>
			<th>회원유형</th>
		</tr></thead>
		<c:forEach begin="${paging.startRow}" end="${paging.endRow - 1}" var="member" items="${memList}">
			<tr>
				<td><input type="checkbox" class="checkfor-member" name="checkfor-member" value="${member.memId}"></td>
				<td class="memId">${member.memId}</td>
				<td class="memName">${member.memName}</td>
				<td class="phone">${member.phone}</td>
				<td class="role">${member.role}</td>
			</tr>
		</c:forEach>
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
	
	
	<div id="memberFormDiv" style="display: none">
	<br /><br />
	
	<div class="col-md-3"></div>
	<div class="col-md-6">
	<div align="center"><h3 class="classic-title"><span id="memberAction">회원 추가</span></h3></div>
	<form id="memberForm">
		<div class="form-group"><div class="controls">
			<div class="col-md-2" align="right"><label for="password" style="margin-top:8px"><b>회원 이름</b></label></div>
			<div class="col-md-10">
			<input type="text" id="memName" name="memName" class="email" placeholder="회원 이름" required data-error="이름 확인해 주시기 바랍니다">
			<div class="help-block with-errors"></div>
			</div>
		</div></div>
		<div class="form-group"><div class="controls">
			<div class="col-md-2" align="right"><label for="passwordCheck" style="margin-top:8px"><b>핸드폰</b></label></div>
			<div class="col-md-10">
			<input type="text" id="phone" name="phone" class="email" placeholder="핸드폰" required data-error="핸드폰을 확인해 주시기 바랍니다">
			<div class="help-block with-errors"></div>
			</div>
		</div></div>
		<div class="form-group"><div class="controls">
			<div class="col-md-2" align="right"><label for="name" style="margin-top:8px"><b>회원 유형</b></label></div>
			<div class="col-md-10">
			<input type="text" id="role" name="role" class="email" placeholder="회원 유형" required data-error="회원유형을 확인해 주시기 바랍니다">
			<div class="help-block with-errors"></div>
			</div>
		</div></div>
		<div align="center">
			<button type="submit" class="btn-system btn-small" id="updateBtn">정보 수정</button>
			<button type="reset" class="btn-system btn-small" id="cancelBtn">취소</button>
		</div>
	</form>
	</div>
		<div class="col-md-3"></div>
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
			$('#memberAction').text('회원 추가');
			$("#memberFormDiv").slideToggle("slow", function() {
				if ($(this).is(':hidden')) {
					location.href = '#content';
				} else {
					location.href = '#memberFormDiv';
				}
			});
		});
		
		
 		$("input[name=checkfor-member]").click(function() {
			var memId = $(this).parent().siblings('td.memId').text();
			//$('#memId').val(memId);
			var memName = $(this).parent().siblings('td.memName').text();
			//$('#memName').val(memName);
			var phone = $(this).parent().siblings('td.phone').text();
			//$('#phone').val(phone);
			var role = $(this).parent().siblings('td.role').text();
			//$('#role').val(role);
		});

 		$('#updateFormBtn').click(function(e) {
			e.preventDefault();
			$('#memberAction').text('회원 수정');
			$("#memberFormDiv").slideToggle("slow", function() {
				if ($(this).is(':hidden')) {
					location.href = '#content';
				} else {
					location.href = '#memberFormDiv';
				}
			});
		});
		$('#deleteBtn').click(function(e) {
			e.preventDefault();
			alert('삭제 버튼 클릭');
		});
	});
</script>