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

// 공고 지원 현황 화살표 클릭
$(function() {
    var idx = 1;
    var marginPx = 1040;
    var rightMarginPx = 1040;
    var leftMarginPx = -1040;
    var marginVal = document.querySelector('.apply').children.length * marginPx;
    $(".leftArrow").click(function() {
        if(leftMarginPx >= 0) {
            $(".apply").stop().animate({"margin-left":"-" + leftMarginPx + "px"}, 500, function() {
                leftMarginPx -= marginPx;
                rightMarginPx -= marginPx;
                idx --;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        } else {
            alert("가장 최근 지원한 공고입니다.");
        }
    })
    
    $(".rightArrow").click(function() {
        if(marginVal > rightMarginPx) {
            $(".apply").stop().animate({"margin-left":"-" + rightMarginPx + "px"}, 500, function() {
                rightMarginPx += marginPx;
                leftMarginPx += marginPx;
                idx ++;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        } else {
            alert("더이상 지원한 공고가 없습니다.");
        }
    })

    // 공고 지원 현황 바 클릭
    var bar = document.getElementById('btn_bar').children;
    for(var i = 0; i < bar.length; i++) {
        const bar_idx = i;
        bar[bar_idx].addEventListener('click', function() {
            $(".apply").stop().animate({"margin-left":"-" + bar_idx*1040 + "px"}, 500, function() {
                idx = bar_idx + 1;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
                rightMarginPx = idx * marginPx;
                leftMarginPx = -1040 + ((idx-1) * marginPx);
            });
        })
    }
});

function showWrite() {
    $("#self_inbox").show();
    $("#btn-sel").hide();
	$("#createBtn").show();
	$("#updateBtn").hide();
}
function showUpdate(no, title, content) {
	$("#self_inbox").show();
    $("#btn-sel").hide();
	$("#createBtn").hide();
	$("#updateBtn").show();
	
	const form = document.selfFrm;
	form.selfTitle.value = title;
	form.selfContent.value = content;
	form.coverLetterNo.value = no;
	form.selfTitle.focus();
}
function hideWrite() {
	$("#input_title").val('');
	$("#input_contents").val('');
    $("#self_inbox").hide();
	$("#btn-sel").show();
}    

function self_check() {
    if(document.selfFrm.selfTitle.value == ""){
        alert("자기소개서 제목을 입력해 주세요");
        document.selfFrm.selfTitle.focus();
        return;
    }
    if(document.selfFrm.selfContent.value == ""){
        alert("자기소개서 내용을 입력해 주세요");
        document.selfFrm.selfContent.focus();
        return;
    }

	const check = confirm('자기소개서를 작성하시겠습니까?');
	if(check) {
		document.selfFrm.action = "resume_management?crud=c";
	    document.selfFrm.submit();
	}
}

function self_update() {
    if(document.selfFrm.selfTitle.value == ""){
        alert("자기소개서 제목을 입력해 주세요");
        document.selfFrm.selfTitle.focus();
        return;
    }
    if(document.selfFrm.selfContent.value == ""){
        alert("자기소개서 내용을 입력해 주세요");
        document.selfFrm.selfContent.focus();
        return;
    }

	const check = confirm('자기소개서를 수정하시겠습니까?');
	if(check) {
		document.selfFrm.action = "resume_management?crud=u";
	    document.selfFrm.submit();
	}
}

function self_delete(no) {
	const check = confirm('자기소개서를 삭제하시겠습니까?\n삭제한 자기소개서는 복구가 불가능합니다.');
	if(check) {
		document.selfFrm.action = "resume_management?crud=d&no=" + no;
	    document.selfFrm.submit();
	}
}