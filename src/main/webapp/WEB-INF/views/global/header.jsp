<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Start Header Section -->
<header class="clearfix">

      <!-- Start  Logo & Naviagtion  -->
      <div class="navbar navbar-default navbar-top col-xs-12">
        <div class="container">
          <div class="navbar-header">
            <!-- Stat Toggle Nav Link For Mobiles -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <i class="fa fa-bars"></i>
            </button>
            <!-- End Toggle Nav Link For Mobiles -->
            <a id="genie-img" class="navbar-brand" href="#">
              <img alt="" src="${context}/resources/images/genietour.png" style="margin-top:-40px">
            </a>
          </div>
          <div class="navbar-collapse collapse">
            <!-- Start Navigation List -->
            <ul class="nav navbar-nav navbar-right" id="tiles_navbar">
              <li><a href="#" id="main">지니투어</a></li>
              <li>
                <a href="#" id="flight">항공예약</a>
              </li>
              <li>
                <a href="#" id="hotel">호텔예약</a>
              </li>
              <li>
              <a href="#" id="headerJoin">회원가입</a>
              </li>
              <li >
              	<a href="#" id="headerLogin">로그인</a>
              </li>
              
              <li><a href="#" id="customerCenter">고객센터<c:if test="${user != null}">로그인 했네? </c:if></a></li>
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
 <!-- End Header Section -->