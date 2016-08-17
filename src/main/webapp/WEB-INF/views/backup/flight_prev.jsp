<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div id="content">
	<form class="form-inline">
		
		<div align="center" >
			<div class="container">
			<h3>출발지/도착지/날짜 선택</h3>
		<ul id="myTab" class="nav nav-tabs" role="tablist">
		  	<li role="presentation" class="active">
		  	<a data-target="#returnway" role="tab" id="returnway-tab" data-toggle="tab" aria-controls="home" aria-expanded="false">편도항공권</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
		  	<div role="tabpanel" class="tab-pane fade active in" id="returnway" aria-labelledby="returnway-tab">
					<p>출발할때</p>
					<li>출발지<div class="input-group input-group-xs">
						<span class="input-group-addon" id="CityName">
							<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
						</span>
						<select name="dep-city" id="dep-city" class="form-control" multiple="multiple" style="width: 150px;">
							<c:forEach var="depCityList" items="${dCityList}">
								<option value="${depCityList}">${depCityList}</option>
							</c:forEach>
						</select>
					<button id="ok" class="btn btn-success btn-md">검색</button>
					</div>
					도착지
					<div class="input-group input-group-xs">
						<span class="input-group-addon" id="CityName">
							<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
						</span>
					
					<select name="arr-city" id="arr-city" class="form-control" multiple="multiple" style="width: 150px;">
								<c:forEach var="arrCityList" items="${aCityList}">
									<option value="${arrCityList}">${arrCityList}</option>
								</c:forEach>
					        </select>
					</div>
					출국일
					<div class="input-group input-group-xs">
						<span class="input-group-addon" id="CityName">
							<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
						</span>
					<input type="date" name="date" class="form-control">
					</div>
					</li>
		  	</div>
		</div>
		
		
		<br/><br/><br/><br/>
		
		<div align="center" class="form-group"  >
		
			<div class="container">
					<h3 >인원수 선택</h3>
			<ul class="nav nav-tabs">
				    <li class="active"><a href="#">인원</a></li>
			</ul>
					<label for="sel1" style="color: red">성인</label>
						<select name="" id="sel1" class="form-control " style=" height: 30px; width: 100px">
							<option >1</option>
							<option >2</option>
							<option >3</option>
							<option >4</option>
				     	</select>
				</div>
			</div>
		
			<br />
			<br />
			
			<div align="center">
	         <button type="button" id="search" name="search" class="btn btn-success btn-md">항공권 검색</button>
			</div>
		</div>
	</div>
	</form>
</div>






<script>
$(function() {
	$('form').addClass('form-horizontal');
	
	$( "#datepicker-22" ).datepicker();
	$( "#datepicker-25" ).datepicker();	
	$( "#datepicker-28" ).datepicker();	
	
	$('#ok').click(function() {			
		$('form').attr('action', '${context}/flight/flight_list.do').submit();
	});
	$('#search').click(function() {
		location.href = '${context}/flight/flight_fareNschedule.do';
		//$('form').attr('action', '${context}/flight/search_list.do').attr('method', 'post').submit();
	});
});
</script>