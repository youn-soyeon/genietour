<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>

	<head>
	  <!-- Basic -->
	  <title>지니투어</title>
	
	  <!-- Define Charset -->
	  <meta charset="utf-8">
	
	  <!-- Responsive Metatag -->
	  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	  <!-- jQuery CDN -->
	  <script src="https://code.jquery.com/jquery-1.12.3.js"   integrity="sha256-1XMpEtA4eKXNNpXcJ1pmMPs8JV+nwLdEqwiJeCQEkyc=" crossorigin="anonymous"></script>
	  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js" integrity="sha256-DI6NdAhhFRnO2k51mumYeDShet3I8AKCQf/tf7ARNhI=" crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
	  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	  <!-- Bootstrap CSS  -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
	  <!-- Font Awesome CSS -->
	  <link rel="stylesheet" href="${css}/font-awesome.min.css" type="text/css" media="screen">
	
	  <!-- Slicknav -->
	  <link rel="stylesheet" type="text/css" href="${css}/slicknav.css" media="screen">
	
	  <!-- Margo CSS Styles  -->
	  <link rel="stylesheet" type="text/css" href="${css}/style.css" media="screen">
		
	  <!-- Slicknav -->
	  <link rel="stylesheet" type="text/css" href="${css}/slicknav.css" media="screen">
	
	  <!-- Margo CSS Styles  -->
	  <link rel="stylesheet" type="text/css" href="${css}/style.css" media="screen">
	
	  <!-- Responsive CSS Styles  -->
	  <link rel="stylesheet" type="text/css" href="${css}/responsive.css" media="screen">
	
	  <!-- Css3 Transitions Styles  -->
	  <link rel="stylesheet" type="text/css" href="${css}/animate.css" media="screen">
	
	  <!-- Color CSS Styles  -->
	   <link rel="stylesheet" type="text/css" href="${css}/colors/blue.css" title="blue" media="screen" />
		<style>
		.test {
			position: relative;
			background: #FFF;
			padding: 20px;
			width: 70%;
			height: 70%;
			margin: 20px auto;
		}
		</style>
	
	</head>
	<body>
		<div class="wrap-loading display-none">
			<img src="${context}/resources/images/loading.gif"/>
		</div>		
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="content" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
		<div id="test" class="test white-popup-block mfp-hide auto bg-white">
			<jsp:include page="popup.jsp"></jsp:include>
		</div>
		<a class="popup" href="#test">Open popup</a>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	</body>
	
	<script src="${js}/Global.js"></script>
	<script src="${js}/Admin.js"></script>
	<script src="${js}/Genie.js"></script>
	<script src="${js}/Member.js"></script>
	<script src="${js}/Flight.js"></script>
	<script src="${js}/Hotel.js"></script>
	<script>
		$(function() {
			Global.context = '${context}';
			Global.header.init();
			
			$('.popup').magnificPopup({
				type: 'inline',
				preloader: false,
				modal: true,
				closeContentPos: true,
				fixedContentPos: true,
				alignTop: false,
				showCloseBtn: true
			});
			
			$('.popup').click().css('display','none');
		});
	</script>
</html>
