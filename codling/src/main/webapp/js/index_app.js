window.onscroll = function() {scrollFunction()};

function scrollFunction(){
    if(document.body.scrollTop > 250 || document.documentElement.scrollTop > 250){
        document.getElementById("scroll-header").style.top = "0";
    }else{
        document.getElementById("scroll-header").style.top = "-130px";
    }
}

$(function() {

    var idx = 1;
    var marginPx = 1020;
    var rightMarginPx = 1020;
    var leftMarginPx = -1020;

    var marginVal = document.querySelector('.advertisement').children.length * marginPx;
    $(".leftArrow").click(function() {
        if(leftMarginPx >= 0) {
            $(".advertisement").stop().animate({"margin-left":"-" + leftMarginPx + "px"}, 500, function() {
                leftMarginPx -= marginPx;
                rightMarginPx -= marginPx;
                idx --;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }else{
            $(".advertisement").stop().animate({"margin-left":"-" + rightMarginPx*5 + "px"}, 500, function() {
                leftMarginPx += marginPx*5;
                rightMarginPx += marginPx*5;
                idx +=5;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }
    })
    
    $(".rightArrow").click(function() {
        if(marginVal > rightMarginPx) {
            $(".advertisement").stop().animate({"margin-left":"-" + rightMarginPx + "px"}, 500, function() {
                rightMarginPx += marginPx;
                leftMarginPx += marginPx;
                idx ++;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }else{
            $(".advertisement").stop().animate({"margin-left": "0px"}, 500, function() {
                rightMarginPx -= marginPx*5;
                leftMarginPx -= marginPx*5;
                idx -=5;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }
    })
    //이미지 자동 슬라이드 호버시 슬라이드 멈춤
    var timer = setInterval(fnSlide,5000);
    $(".pow_box").hover(function(){
        clearInterval(timer);
    },function(){
        timer = setInterval(fnSlide,5000);
    });
    function fnSlide() {
       
        if(marginVal > rightMarginPx) {
            $(".advertisement").stop().animate({"margin-left":"-" + rightMarginPx + "px"}, 500, function() {
                rightMarginPx += marginPx;
                leftMarginPx += marginPx;
                idx ++;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }else{
            $(".advertisement").stop().animate({"margin-left": "0px"}, 500, function() {
                rightMarginPx -= marginPx*5;
                leftMarginPx -= marginPx*5;
                idx -=5;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }
    };


    // 바 클릭
    var bar = document.getElementById('btn_bar').children;
    for(var i = 0; i < bar.length; i++) {
        const bar_idx = i;
        bar[bar_idx].addEventListener('click', function() {
            $(".advertisement").stop().animate({"margin-left":"-" + bar_idx*1020 + "px"}, 500, function() {
                idx = bar_idx + 1;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
                rightMarginPx = idx * marginPx;
                leftMarginPx = -1020 + ((idx-1) * marginPx);
            });
        })
    }
});
//스크롤 마이메뉴 다운드롭
$(function(){
    $("#scroll-profile-hover").hide();

        $("#scroll-hover-box").hover(function() {
            $("#scroll-profile-hover").stop().slideDown();
        },function(){
            $("#scroll-profile-hover").stop().slideUp();
        });
        $("#scroll-profile-hover").hover(function() {
            $(this).stop().slideDown();
        },function(){
            $(this).stop().slideUp();
    });
});
//top 마이메뉴 다운드롭
$(function(){
    $("#profile-hover").hide();

        $("#hover-box").hover(function() {
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

// hover시 조회수 show
/*$(function() {
    $('.card').hover( function() {
        if($(".count").css("display") == "none") {
        	$('.count').css('display', 'block');
        }       
    },function(){
        $('.count').css('display', 'none');
    });
});*/

function showCount(no) {
    if($("#" + no).css("display") == "none") {
    	$("#" + no).css('display', 'block');
	}
}

function hideCount(no) {
    if($("#" + no).css("display") == "block") {
    	$("#" + no).css('display', 'none');
	}
}
//스크롤 엔터키시 폼서브밋
$(function(){
	$("#scroll_search").keypress(function (e){
		if(e.keyCode === 13){
			scroll_search();
		}
	});
});
//스크롤 돋보기 버튼 클릭시 폼 서브밋
function scroll_search() {
    document.scroll_search_Frm.submit();
}

//엔터키시 폼서브밋
$(function(){
	$("#search").keypress(function (e){
		if(e.keyCode === 13){
			search();
		}
	});
});
//돋보기 버튼 클릭시 폼 서브밋
function search() {
    document.search_Frm.submit();
}