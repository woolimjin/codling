$(function(){
    let num = document.documentElement.scrollWidth
    if(num <= 1220){
        $("header").css({"width":"98vw"})
    } else {
        $("header").css({"width":"1220px"})
    }

    $(window).resize(function(){
        let number = document.documentElement.scrollWidth
        if(number <= 1220){
        $("header").css({"width":"98vw"})     
    } else {
        $("header").css({"width":"1220px"})
    }
    })
    
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
})

function showResume(obj) {
	$(".resumeMenu").css({"color":"#A3A3A3", "background-color":"#F0F0F0"});
	$(obj).css({"color":"white", "background-color":"rgb(165, 227, 116)"});
	
	if($(obj).html() == '전체 이력서') {
		$(".resumeWrap").show();
	} else if($(obj).html() == '대기중인 이력서') {
		$(".resumeWrap").hide();
		$(".wait").show();
	} else if($(obj).html() == '수락한 이력서') {
		$(".resumeWrap").hide();
		$(".accept").show();
	} else if($(obj).html() == '거절한 이력서') {
		$(".resumeWrap").hide();
		$(".refuse").show();
	}
}