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


$(function() {
    $('.btn').click( function() {
        if( $(this).html() == '선택' ) {
        $(this).html('취소');
        }
        else {
        $(this).html('선택');
        }
    });
    $('.btn').click( function() {
        if( $(this).html() == '선택' ) {
        $(this).css('background', '#A5E374');
        $(this).css('color', 'white');
        }
        else {
        $(this).css('background', '#D6D6D6');
        $(this).css('color', '#858585');
        }
    });
    });
    

/* 개인회원 이력서 수정 */
function resume_update() {
	var check = confirm('이력서를 수정하시겠습니까?');
	
	if(check) {
		location.href = 'resume_update';
	}
}

/* 기업회원 이력서 수락 */
function resume_accept() {
	var check = confirm('이력서를 수락하시겠습니까?');
	
	if(check) {
		document.resumeForm.action = 'resume_preview?ar=a';
		document.resumeForm.submit();
	}
}

/* 기업회원 이력서 거절 */
function resume_refuse() {
	var check = confirm('이력서를 거절하시겠습니까?');
	
	if(check) {
		document.resumeForm.action = 'resume_preview?ar=r';
		document.resumeForm.submit();
	}
}