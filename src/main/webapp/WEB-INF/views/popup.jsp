<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-xs-6">
	<h1>지니투어 간략 시연 동영상</h1><br>
</div>
<div class="col-xs-6">
	<abbr title="닫기"><img alt="" width="6%" height="6%" align="right" src="${img}/close-button-black.png" class="popupClose closeBtn cursor"></abbr>
</div>
<div>
	<br>
	<div class="col-xs-12"><object width="100%" height="100%"><param name="movie" value="https://www.youtube.com/v/mirWIm3vKB4?version=3&vq=hd720&rel=0"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed id="test-video" src="https://www.youtube.com/v/mirWIm3vKB4?version=3&autoplay=1&vq=hd720&rel=0" type="application/x-shockwave-flash" width="100%"  allowscriptaccess="always" allowfullscreen="true"></embed></object>
	</div>
	<div class="col-xs-8"><br>
		테스트용  ID: <strong>test</strong>        PW: <strong>1</strong><br>
		관리자용  ID: <strong>admin</strong>   PW: <strong>1</strong>
	</div>
	<div class="col-xs-4"><br>
		<h3><a href="http://www.slideshare.net/TaeHyeonLim/ss-62210844">포트폴리오 설명 PPT 바로가기(클릭)</a></h3>
	</div>
</div>
<script>
	$('.popupClose').hover(function(){
		$(this).attr("src","${img}/close-button-grey.png");	
	},function(){
		$(this).attr("src","${img}/close-button-black.png");
	});
	$('.popupClose').click(function(e){
		e.preventDefault();
		$.magnificPopup.close();
	});
	
	$('#test-video').attr("height", window.innerHeight*0.7*0.8);
</script>