<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Start Page Banner -->
<div class="page-banner no-subtitle"><div class="container"><div class="row">
			<div class="col-md-6"><h2>지니투어 - 로그인</h2></div>
			<div class="col-md-6">
				<ul class="breadcrumbs">
					<li><a href="/">지니투어 홈</a></li>
					<li>관리자</li>
					<li class="active">호텔 관리</li>
				</ul>
			</div>
</div></div></div>
<!-- End Page Banner -->
<div id="content"><div class="container"><div class="row">
	<div align="center"><h3 class="classic-title"><span>호텔 예약 리스트</span></h3></div>
	<div>
	<table class="table table-hover" style="font-size:90%">
		<thead style="background-color: #00afd1; color: white"><tr>
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
				<td>${hotres.hotResCode}</td>
				<td>${hotres.hotResName}</td>
				<td>${hotres.email}</td>
				<td>${hotres.phone}</td>
				<td>${hotres.nationality}</td>
				<td>${hotres.gender}</td>
				<td>${hotres.arrTime}</td>
				<td>${hotres.stayDate}</td>
				<td>${hotres.resDate}</td>
				<td>${hotres.payment}</td>
				<td>${hotres.comments}</td>
				<td>${hotres.memId}</td>
				<td>${hotres.roomCode}</td>	
			</tr>
			</c:forEach>
			</tbody>
	</table>
	</div>
	<div id="pagination" align="center">
		<span class="all-pages">Page ${paging.pageNo} of ${paging.startPage }</span>
		<c:if test="${paging.startPage - paging.GROUPSIZE gt 0}">
			<a class="prev-page" href="#">&laquo;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" step="1" varStatus="i">
			<c:choose>
				<c:when test="${i.index == pageNo}">
					<span class="current page-num">${i.index}</span>
				</c:when>
				<c:otherwise>
					<span class="page-num" href="/hotroom/list/${i.index }">${i.index}</span>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- <span class="current page-num">1</span>
		<a class="page-num" href="#">2</a>
		<a class="page-num" href="#">3</a> -->
		<c:if test="${paging.totalPages - paging.endPage lt 0 }">
			<a class="next-page" href="#">&raquo;</a>
		</c:if>
	</div>
	</div>
	<div id="pagination" align="center">
		<span class="all-pages">Page ${paging.pageNo} of ${paging.startPage }</span>
		<c:if test="${paging.startPage - paging.GROUPSIZE gt 0}">
			<a class="prev-page" href="#">&laquo;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" step="1" varStatus="i">
			<c:choose>
				<c:when test="${i.index == pageNo}">
					<span class="current page-num">${i.index}</span>
				</c:when>
				<c:otherwise>
					<span class="page-num" href="/hotroom/list/${i.index }">${i.index}</span>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- <span class="current page-num">1</span>
		<a class="page-num" href="#">2</a>
		<a class="page-num" href="#">3</a> -->
		<c:if test="${paging.totalPages - paging.endPage lt 0 }">
			<a class="next-page" href="#">&raquo;</a>
		</c:if>
	</div>
  </div>
</div>
<script type="text/javascript">
	$(function() {
		$('.page-num').click(function() {
			$('#content').load( $(this).attr('href') );
		});
	})
</script>