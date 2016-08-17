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
	<div align="center"><h3 class="classic-title"><span>호텔 리스트</span></h3></div>
	<table class="table table-hover" style="font-size:90%">
		<thead style="background-color: #00afd1; color: white"><tr>
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
			<th>싱글룸 가격</th>
			<th>트윈룸 가격</th>
			<th>트리플룸 가격</th>
			<th>최대 룸수</th>
			<th>남은 룸수</th>
		</tr></thead>
		<tbody>
		<c:forEach var="hotroom" items="${roomList}">
			<tr>
				<td>${hotroom.hotCode}</td>
				<td>${hotroom.hotName}</td>
				<td>${hotroom.country}</td>
				<td>${hotroom.city}</td>
				<td>${hotroom.address}</td>
				<td>${hotroom.tel}</td>
				<td>${hotroom.homepage}</td>
				<td>${hotroom.options}</td>
				<td>${hotroom.roomCode}</td>
				<td>${hotroom.roomType}</td>
				<td>싱글룸 가격</td>
				<td>트윈룸 가격</td>
				<td>트리플룸 가격</td>
				<td>${hotroom.maxRoom}</td>
				<td>${hotroom.vacancy}</td> 
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<div id="pagination">
		<span class="all-pages">Page 1 of 3</span>
		<span class="current page-num">1</span>
		<a class="page-num" href="#">2</a>
		<a class="page-num" href="#">3</a>
		<a class="next-page" href="#">Next</a>
	</div>
</div></div></div>