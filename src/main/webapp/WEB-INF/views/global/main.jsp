<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="content">
  <!-- Full Body Container -->
  <div id="container" >
    
    <!-- Start Home Page Slider -->
    <section id="home">
      <!-- Carousel -->
      <div id="main-slide" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ol class="carousel-indicators">
        	
          <li data-target="#main-slide" data-slide-to="0" class="active"></li>
          <li data-target="#main-slide" data-slide-to="1"></li>
          <li data-target="#main-slide" data-slide-to="2"></li>
        </ol>
        <!--/ Indicators end-->

        <!-- Carousel inner -->
        <div class="carousel-inner">
          <div class="item active">
            <img class="img-responsive" src="${context}/resources/images/slider/bg1.jpg" alt="slider">
            <div class="slider-content">
              <div class="col-md-12 text-center">
                <h2 class="animated2"><span style="color: white">Welcome to <strong>GenieTour</strong></span></h2>
                <h3 class="animated3"><span style="color: white">It is the wind on weekends</span></h3>
                <p class="animated4"><a href="#" class="slider btn btn-info btn-large">항공 및 숙박 예약하기</a>
                </p>
              </div>
            </div>
          </div>
          <!--/ Carousel item end -->
          <div class="item">
            <img class="img-responsive" src="${context}/resources/images/slider/bg3.jpg" alt="slider">
            <div class="slider-content">
              <div class="col-md-12 text-center">
                <h2 class="animated7 white">
                      <span><strong>유럽!</strong> 어디까지 가봤니?</span>
                </h2>
                <h3 class="animated8 white"> <span>유럽여행 최저가 미리 예약하기</span></h3>
                <div>
                  <a class="animated4 slider btn btn-system btn-large btn-min-block" href="#">지금 바로 확인하기</a>
                </div>
              </div>
            </div>
          </div>
          <!--/ Carousel item end -->
          <div class="item">
            <img class="img-responsive" src="${context}/resources/images/slider/bg2.jpg" alt="slider">
            <div class="slider-content" style="margin-top:-200px">
              <div class="animated6">
					<div class="row sidebar-page ">
						<form action="">
						<div>
							<button type="submit" class="btn-system btn-large btn-wite">항공</button>
							<button type="submit" class="btn-system btn-large btn-wite">호텔</button>
						</div>
						</form>
						<!-- Page Content -->
						<div class="col-md-3 page-content"></div>
						<div class="col-md-6 page-content">
						
							<div class="tabs-section">
								<!-- Nav Tabs -->
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab-1" data-toggle="tab">호텔명으로 검색</a></li>
									<li><a href="#tab-2" data-toggle="tab">도시명으로 검색</a></li>
								</ul>
								<!-- Tab panels -->
								<div class="tab-content">
									<!-- Tab Content 1 -->
									<div class="tab-pane fade in active" id="tab-1">
										<!-- Hotel Search Form Start -->
										<form class="form-inline" id="contactForm" role="form">
											<div>
												<p style="font-size: 15pt; color:black">호텔명 / 날짜 선택</p>
												<br />
											</div>
											<div class="form-group">
												<div class="controls">
													<input type="text" class="email" id="hot_name" name="hot_name" placeholder="호텔이름" required data-error="Please enter hotel name">
													<div class="help-block with-errors"></div>
												</div>
											</div>
											<div class="form-group">
												<div class="controls">
													<input type="date" class="email" id="check_in1" name="check_in1" placeholder="체크인" required data-error="Please enter your check-in">
													<div class="help-block with-errors"></div>
												</div>
											</div>
											<div class="form-group">
												<div class="controls">
													<input type="date" class="email" id="check_out1" name="check_out1" placeholder="체크아웃" required data-error="Please enter your check-out">
													<div class="help-block with-errors"></div>
												</div>
											</div>
											
											
											<div>
												<br />
												<br />
												<p style="font-size: 15pt; color:black">객실 / 인원 수 선택</p>
												<br />
											</div>
											<div class="form-group">
												<div class="controls">
													<input type="text" class="email" id="adult1" name="adult1" placeholder="성인" required data-error="Please enter hotel name">
													<div class="help-block with-errors"></div>
												</div>
											</div>
											<div class="form-group">
												<div class="controls">
													<input type="text" class="email" id="child1" name="child1" placeholder="어린이" required data-error="Please enter your check-in">
													<div class="help-block with-errors"></div>
												</div>
											</div>
											<div class="form-group">
												<div class="controls">
													<input type="text" class="email" id="room1" name="room1" placeholder="객실 수" required data-error="Please enter your check-out">
													<div class="help-block with-errors"></div>
												</div>
											</div>
											
											
											
											
											<div>
												<button type="submit" class="btn-system btn-large">검색</button>
											</div>
										</form>
										<!-- End Hotel Search Form -->

									</div>
									<!-- Tab Content 2 -->
									<div class="tab-pane fade" id="tab-2">
									<form class="form-inline" id="contactForm" role="form">
										<div>
											<p style="font-size: 15pt; color:black">도시명 / 날짜 선택</p>
											<br />
										</div>
										<div class="form-group">
											<div class="controls">
												<input type="text" class="email" id="city_name" name="city_name" placeholder="도시이름" required data-error="Please enter hotel name">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="controls">
												<input type="date" class="email" id="check_in2" name="check_in2" placeholder="체크인" required data-error="Please enter your check-in">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="controls">
												<input type="date" class="email" id="check_out2" name="check_out2" placeholder="체크아웃" required data-error="Please enter your check-out">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div>
											<br /><br />
											<p style="font-size: 15pt; color:black">객실 / 인원 수 선택</p><br />
										</div>
										<div class="form-group">
											<div class="controls">
												<input type="text" class="email" id="adult2" name="adult2" placeholder="성인" required data-error="Please enter hotel name">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="controls">
												<input type="text" class="email" id="child2" name="child2" placeholder="어린이" required data-error="Please enter your check-in">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="controls">
												<input type="text" class="email" id="room2" name="room2" placeholder="객실 수" required data-error="Please enter your check-out">
												<div class="help-block with-errors"></div>
											</div>
										</div>
											
										
										
										
										<div>
											<button type="submit" class="btn-system btn-large">검색</button>
										</div>
									</form>
										
								</div>
								<!-- End Tab Panels -->
								
								</div>
							</div>
							<!-- End Nav Tabs -->
						</div>
						<div class="col-md-2 page-content"></div>
						<!-- End Page Content -->
					</div>
                
              </div>
            </div>
          </div>
        </div>
        <!-- Carousel inner end-->

        <!-- Controls -->
        <a class="left carousel-control" id="main-slide" href="#main-slide" data-slide="prev">
          <span ><i class="fa fa-angle-left" aria-hidden="true"></i></span>
        </a>
        <a class="right carousel-control" href="#main-slide" data-slide="next">
          <span ><i class="fa fa-angle-right"></i></span>
        </a>
      </div>
      <!-- /carousel -->
    </section>
    <!-- End Home Page Slider -->
    </div>
</div>
