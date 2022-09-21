$(function(){
    let num = document.documentElement.scrollWidth
    if(num <= 1220){
        $("header").css({"width":"100vw"})
    } else {
        $("header").css({"width":"1220px"})
    }
    if(num <= 1220){
        $("#menu-bar").css({"width":"100vw"})
    } else {
        $("#menu-bar").css({"width":"1220px"})
    }
    if(num <= 1220){
        $(".btn-sel").css({"width":"100vw"})
    } else {
        $(".btn-sel").css({"width":"1220px"})
    }
    if(num <= 1220){
        $(".btn-res").css({"width":"100vw"})
    } else {
        $(".btn-res").css({"width":"1220px"})
    }
    $(window).resize(function(){
        let number = document.documentElement.scrollWidth
	    if(number <= 1220){
	        $("header").css({"width":"100vw"})    
	    } else {
	        $("header").css({"width":"1220px"})
	    }
	    if(number <= 1220){
	        $("#menu-bar").css({"width":"100vw"})    
	    } else {
	        $("#menu-bar").css({"width":"1220px"})
	    }
	    if(number <= 1220){
	        $(".btn-sel").css({"width":"100vw"})    
	    } else {
	        $(".btn-sel").css({"width":"1220px"})
	    }
	    if(number <= 1220){
	        $(".btn-res").css({"width":"100vw"})
	    } else {
	        $(".btn-res").css({"width":"1220px"})
	    }
    });
    $("#profile-hover").hide();

    $("#profile-box").hover(function() {
        $("#profile-hover").stop().slideDown();
    },function(){
        $("#profile-hover").stop().slideUp();
    });
    $("#profile-hover").hover(function() {
        $(this).stop().slideDown();
    },function(){
        $(this).stop().slideUp();
    });
});

/* 지원 현황 */
function status(event, jobOpening_no) {
	event.stopPropagation();
	location.href = 'applicant_status?no=' + jobOpening_no;
}

/* 공고 수정 */
function updateChk(event, no) {
	event.stopPropagation();
	
	var check = confirm('공고를 수정하시겠습니까?');
	if(check) location.href = 'jobOpening_update?no=' + no;
}

/* 공고 삭제 */
function deleteChk(event) {
	event.stopPropagation();
	
	var check = confirm('공고를 삭제하시겠습니까?');
	if(check) {
		$(".delForm").submit();
	}
}