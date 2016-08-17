<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Start Page Banner -->
<div class="page-banner no-subtitle">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>지니투어 - 호텔 목록</h2>
			</div>
			<div class="col-md-6">
				<ul class="breadcrumbs">
					<li><a href="/">지니투어 홈</a></li>
					<li>호텔</li>
					<li>목록</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Page Banner-->
<div id="content">
	<div class="container">	
  
	  <div class="filters-section intro-filter panel-body panel-light">
	    <div align="center">
	    	<h4 class="classic-title"><span>호텔 리스트 전체보기</span></h4>
	    </div>
	    <div class="row">
	      <div class="col-lg-2 col-md-12 text-center-sm text-center-md row-space-sm-1 filter-label">
	        <label for="date" style="margin-top:8px"><b>날짜</b></label>
	      </div>
	
	      <form class="col-lg-9 trip-form">
	        <div class="row row-condensed">
	          <div class="col-md-4 col-sm-6 row-space-1-sm">
	            <input name="checkin" id="map-search-checkin" type="date" autocomplete="off" class="email" placeholder="체크인">
	          </div>
	
	          <div class="col-md-4 col-sm-6 row-space-1-sm">
	            <input name="checkout" id="map-search-checkout" type="date" autocomplete="off" class="email" placeholder="체크아웃">
	          </div>
	
	        </div>
	      </form>
	    </div>
	  </div>
	  <hr>
	  
	  <div class="filters-section intro-filter panel-body panel-light">
	    <div class="row">
	      <div class="col-lg-2 col-md-12 text-center-sm text-center-md row-space-sm-1 filter-label">
			<label for="type" style="margin-top:8px"><b>유형</b></label>
	      </div>
	
	
	
	
	
	
	<div class="filters-section room-type-group intro-filter panel-body panel-light" data-name="room_types">
    <div class="row">

	
	      <form class="col-lg-9 trip-form">
	      
	      <div>
                  <div class="separator"></div>
	<section id="lby-content">
		<div id="lby-demo">
			<ul id="lby-checkbox-demo">
				<li>
					<input class="to-labelauty synch-icon" type="checkbox" checked/>싱글룸
				</li>
				<li>
					<input class="to-labelauty synch-icon" type="checkbox" />더블룸
				</li>
				<li>
					<input class="to-labelauty synch-icon" type="checkbox" />트리플룸
				</li>
			</ul>
			</div>
			</section>
			
               </div> 
	      </form>
	    </div>
	  </div>
	  <hr>
	    	  
        <div class="col-lg-2 col-md-12 filter-label">
        <label for="sisul" style="margin-top:8px"><b>부가시설</b></label>
      </div> 
      <div class="col-lg-9">
        <div id="room-options" class="row row-condensed room-type__buttons">
              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">
                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">
                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">무선인터넷
                </label>
              </div>
              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">
                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">
                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">조식가능
                </label>
              </div>
              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">
                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">
                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">세탁기
                </label>
              </div>
              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">
                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">
                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">엘리베이터
                </label>
              </div>
              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">
                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">
                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">케이블TV
                </label>
              </div>
              <div class="col-middle-alt col-md-4 col-sm-12 room-type__section">
                <label class="checkbox facet-checkbox facet-checkbox--room-type room-type__button-label">
                    <input type="checkbox" name="room-options" value="room-options" class="room-type__input hide-md hide-sm">부엌
                </label>
              </div>
         </div>
        </div>
		</div>
		  <br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-4">
					<img alt="" src="${context }/resources/img/hotel/hotel1.jpg" style="height: 350px"><br />
					- 설명1
					<br />
				</div>
				<div class="col-md-4">
					<img alt="" src="${context }/resources/img/hotel/hotel1.jpg" style="height: 350px"><br />
					- 설명1
					<br />
				</div>
				<div class="col-md-4">
					<img alt="" src="${context }/resources/img/hotel/hotel1.jpg" style="height: 350px"><br />
					- 설명1
					<br />
				</div>
			</div>
			<div class="col-md-12">
				<div class="col-md-4">
					<img alt="" src="${context }/resources/img/hotel/hotel1.jpg" style="height: 350px"><br />
					- 설명1
					<br />
				</div><div class="col-md-4">
					<img alt="" src="${context }/resources/img/hotel/hotel1.jpg" style="height: 350px"><br />
					- 설명1
					<br />
				</div><div class="col-md-4">
					<img alt="" src="${context }/resources/img/hotel/hotel1.jpg" style="height: 350px"><br />
					- 설명1
					<br />
				</div>
			</div>
		</div>
	</div>
</div></div>
</div>
