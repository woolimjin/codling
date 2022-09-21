
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
//공고 검색 옵션
$(function(){
    $("#scroll_check").hide();
	$("#up_button").hide();
        $("#detail_search").hover(function() {
            $("#scroll_check").stop().slideDown();
			$("#down_button").hide();
			$("#up_button").show();
        },function(){
            $("#scroll_check").stop().slideUp();
			$("#down_button").show();
			$("#up_button").hide();
        });
        $("#scroll_check").hover(function() {
            $(this).stop().slideDown();
			$("#down_button").hide();
			$("#up_button").show();
        },function(){
            $(this).stop().slideUp();
			$("#down_button").show();
			$("#up_button").hide();
    });
		$("#submit_box").hover(function() {
            $("#scroll_check").stop().slideDown();
			$("#down_button").hide();
			$("#up_button").show();
        },function(){
            $("#scroll_check").stop().slideUp();
			$("#down_button").show();
			$("#up_button").hide();
    });

});

$(function(){
        $("#scroll_notbox").hover(function() {
			$("#default").on('scroll touchmove mousewheel', function(e){
			e.preventDefault();
			e.stopPropagation(); 
			return false;
			});
        },function(){
			$("#default").off('scroll touchmove mousewheel');
        });
        
});

//공고 검색 옵션 사용시 들어가는 값
function getzoneValue(event)  {
  var zone_length = document.getElementsByName("zone").length;
  var zone_input = "";
	for(var i=0; i<zone_length; i++){
		if (document.getElementsByName("zone")[i].checked == true){
				zone_input += "  " + document.getElementsByName("zone")[i].value
		}
	}
  
  document.getElementById('zone_in').innerText = zone_input;
}
function getcareerValue(event)  {
  var career_length = document.getElementsByName("career").length;
  var career_input = "";
	for(var i=0; i<career_length; i++){
		if (document.getElementsByName("career")[i].checked == true){
				career_input += "  " + document.getElementsByName("career")[i].value
		}
	}
  
  document.getElementById('career_in').innerText = career_input;
}
function gettaskValue(event)  {
  var task_length = document.getElementsByName("task").length;
  var task_input = "";
	for(var i=0; i<task_length; i++){
		if (document.getElementsByName("task")[i].checked == true){
				task_input += "  " + document.getElementsByName("task")[i].value
		}
	}
  
  document.getElementById('task_in').innerText = task_input;
}


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

//아이콘 클릭시 폼서브밋
function searchValue(){
	$('#search_down').val($('#search').val());
	
	document.search_Fmr.submit();
}

//엔터키시 폼서브밋
function searchEnter() {
	if(window.event.keyCode == 13) {
		searchValue();
	}
}