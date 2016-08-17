<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Start Header Section -->
<header class="clearfix">

      <!-- Start  Logo & Naviagtion  -->
      <div class="navbar navbar-default navbar-top">
        <div class="container">
          <div class="navbar-header">
            <!-- Stat Toggle Nav Link For Mobiles -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <i class="fa fa-bars"></i>
            </button>
            <!-- End Toggle Nav Link For Mobiles -->
            <a class="navbar-brand" href="/">
              <img alt="" src="${context }/resources/images/genietour.png" style="margin-top:-40px">
            </a>
          </div>
          <div class="navbar-collapse collapse">
            <!-- Start Navigation List -->
            <ul class="nav navbar-nav navbar-right" id="tiles_navbar">
              <li><a href="/admin/search" id="main">관리자 홈</a></li>
              <li><a href="/admin/memlist/1" id="adminMember">멤버관리</a></li>
              <li><a href="/admin/flilist/1" id="adminFlight">항공관리</a></li>
              <li><a href="/hotroom/hotlist/1" id="adminHotel">호텔관리</a></li>
              <li><a href="#">고객센터</a></li>
              <li><a href="/member/mypage/${user.memId}" id="mypage">${user.memId}님</a></li>
              <li><a href="/member/logout" id="logout">로그아웃</a></li>
            </ul>
            <!-- End Navigation List -->
          </div>
        </div>

        <!-- Mobile Menu Start -->
        <ul class="wpb-mobile-menu">
          <li>
            <a class="active" href="/">Home</a>
            <ul class="dropdown">
              <li><a class="active" href="#">Home Main Version</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#">Pages</a>
            <ul class="dropdown">
              <li><a href="#">About</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#">Shortcodes</a>
            <ul class="dropdown">
              <li><a href="#">Tabs</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#">Portfolio</a>
            <ul class="dropdown">
              <li><a href="#">2 Columns</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#">Blog</a>
            <ul class="dropdown">
              <li><a href="#">Blog - right Sidebar</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#">Contact</a>
          </li>
        </ul>
        <!-- Mobile Menu End -->

</div>
<!-- End Header Logo & Naviagtion -->


</header>