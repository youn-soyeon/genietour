/**
 * Genie 팩토리 : 즉시 실행함수
 */



(function() {
	$.fn.extend({
		global : function(arg) {
			return new Global(arg);
		},
		member : function(arg) {
			return new Member(arg);
		}
	});
})
