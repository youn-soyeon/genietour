<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="content">
	<div class="container">
		<form>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<!-- 이미지 슬라이드 : 이미지 가운데로 불러오는 작업이 안됨 ㅠ -->
				<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1" class=""></li>
						<li data-target="#myCarousel" data-slide-to="2" class=""></li>
					</ol>
					<div class="carousel-inner" role="listbox" align="center" style="height:500px">
						<div class="item active">
							<img src="../resources/img/member/hotel_ex1.jpg" alt="" style="width: 100%"/>
						</div>
						<div class="item">
							<img src="../resources/img/member/hotel_ex2.jpg" alt="" style="width: 100%"/>
						</div>
						<div class="item">
							<img src="../resources/img/member/hotel_ex3.jpg" alt="" style="width: 100%"/>
						</div>
					</div>
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
					
				</div><!-- 이미지 슬라이드 끝 -->
				
				<br />
				<br />
				
				<!-- 호텔정보(왼쪽) -->
				<div class="col-xs-7">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">
						<!-- 호텔주인 -->
						<img src="../resources/img/member/owner_ex1.png" alt="" class="img-circle ownerimg" >
					</div>
					<div class="col-xs-8">
						<!-- 호텔정보 -->
						<br />
						<h4><%=request.getParameter("hot-name") %></h4>
						<h5><%=request.getParameter("country") %>, <%=request.getParameter("city") %></h5>
					<br />
					<br />
					<br />
					</div><!-- 호텔 기본 정보 끝 -->
				
					<legend></legend>
					<br />
					<!-- 호텔 상세 정보 숙소 -->
					<div class="col-xs-2" style="text-align: center;">
						<h5>숙소</h5>
					</div>
					<div class="col-xs-3">
						<table class="table table-striped table-hover " >
							<thead >
								<tr>
									<th style="text-align: center;">주소</th>
								</tr>
								<tr>
									<th style="text-align: center;">홈페이지</th>
								</tr>
								<tr>
									<th style="text-align: center;">전화번호</th>
								</tr>
							</thead>
						</table> 
					</div>
					<div class="col-xs-7">
						<table class="table table-striped table-hover ">
							<tbody>
								<tr>
									<td><%=request.getParameter("addr") %></td>
								</tr>
								<tr>
									<td><%=request.getParameter("tel") %></td>
								</tr>
								<tr>
									<td><a href="#"><%=request.getParameter("url") %></a></td>
								</tr>
							</tbody>
						</table> 
						<br />
					</div><!-- 호텔 상세정보 숙소 끝 -->
					<legend></legend>
					<br />
					
					<!-- 호텔 상세 정보 시설 -->
					<div class="col-xs-2" style="text-align: center;">
						<h5>시설</h5></div>
					<div class="col-xs-10"></div> <!-- 호텔 상세정보 시설 끝 -->
					
				</div><!-- 호텔정보(왼쪽) 끝 -->
				
				<!-- 호텔정보(오른쪽) -->
				<div class="col-xs-1"></div>
				<div class="col-xs-4">
					<table class="table table-striped table-hover " >
						<thead style="background-color: #ff9800; color: white; font-size: 1.5em">
							<tr>
								<th>￦ <%=request.getParameter("price") %></th>
								<th style="text-align: right">1박</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>체크 인</td>
								<td>2016/04/06</td>
							</tr>
							<tr>
								<td>체크 아웃</td>
								<td>2016/04/07</td>
							</tr>
							<tr>
								<td>숙박 인원</td>
								<td>1명</td>
							</tr>
							<tr>
								<td>￦ <%=request.getParameter("price") %>X1박</td>
								<td>￦  <%=request.getParameter("price") %></td>
							</tr>
							<tr>
								<td>수수료</td>
								<td>￦ 5000</td>
							</tr>
							<tr>
								<td>합계</td>
								<td>￦ <%=request.getParameter("price") %> + 5000</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<button id="okButton" style="width: 200px">예 약 하 기</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<legend></legend>
				<br />
				<br />
				<br />
				<br />
				<br />
			</div>
		</div>
	</div>
</form>
	</div>
</div>