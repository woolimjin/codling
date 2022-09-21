let didScroll;
let lastScrollTop = 0;
let delta = 70;
let navHeight = $('nav').outerHeight();


$(window).scroll(function (event) {
    didScroll = true;
});

setInterval(function () {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 400);

function hasScrolled() {
    var st = $(this).scrollTop();

    if (Math.abs(lastScrollTop - st) <= delta)
        return;

    if (st > lastScrollTop && st > navHeight) {
        $('nav').stop().animate({
            top: ["-20px", "swing"]
        }, 400).promise();
    } else {
        if (st + $(window).height() < $(document).height()) {
            $('nav').stop().animate({
                top: ["-130px", "swing"]
            }, 400).promise();
        }
    }

    lastScrollTop = st;
}

// 지원하기 popup show, hide
function popupShow() {
    $("#apply").show();
    showPopBlur(true);
}

function popupHide() {
    $("#apply").hide();
    showPopBlur(false);
}

function showPopBlur(check) {
    if(check) {
		$('body').css("overflow", "hidden");
		$('#main').css({"opacity" : "0.3",  "background-color": "rgb(0, 0, 0)", "pointer-events":"none"});
    } else {
		$('body').css("overflow", "auto");
		$('#main').css({"opacity" : "1", "background-color": "white", "pointer-events":"auto"});
	}
}

// 지원하기 popup
$(function() {
    var idx = 1;
    var marginPx = 780;
    var rightMarginPx = 780;
    var leftMarginPx = -780;
    var marginVal = document.querySelector('.apply_coverLetter').children.length * marginPx;
    $(".leftArrow").click(function() {
        if(leftMarginPx >= 0) {
            $(".apply_coverLetter").stop().animate({"margin-left":"-" + leftMarginPx + "px"}, 500, function() {
                leftMarginPx -= marginPx;
                rightMarginPx -= marginPx;
                idx --;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        } else {
            alert("가장 최근 작성한 자기소개서 입니다.");
        }
    })
    
    $(".rightArrow").click(function() {
        if(marginVal > rightMarginPx) {
            $(".apply_coverLetter").stop().animate({"margin-left":"-" + rightMarginPx + "px"}, 500, function() {
                rightMarginPx += marginPx;
                leftMarginPx += marginPx;
                idx ++;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        } else {
            alert("더이상 작성한 자기소개서가 없습니다.");
        }
    })

    // 자기소개서 현황 바 클릭
    var bar = document.getElementById('btn_bar').children;
    for(var i = 0; i < bar.length; i++) {
        const bar_idx = i;
        bar[bar_idx].addEventListener('click', function() {
            $(".apply_coverLetter").stop().animate({"margin-left":"-" + bar_idx*780 + "px"}, 500, function() {
                idx = bar_idx + 1;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
                rightMarginPx = idx * marginPx;
                leftMarginPx = -780 + ((idx-1) * marginPx);
            });
        })
    }
});

// 지원하기 팝업에서 자기소개서 클릭 시
function choice(obj, coverLetterNo) {
	$(".choice").parents().css("box-shadow", "none");
	$(obj).parent().css("box-shadow", "0 0 0 3px #33ff33 inset");
	
	document.applyForm.coverLetterNo.value = coverLetterNo;
	console.log(document.applyForm.coverLetterNo.value);
}

// 지원하기 버튼 클릭 시
function applyChk() {
	if(document.applyForm.fieldName.value == "") {
		alert("지원분야를 선택해 주세요.");
		return;
	}
	if(document.applyForm.coverLetterNo.value == "") {
		var check = confirm('선택된 자기소개서가 없습니다.\n자기소개서 없이 지원하시겠습니까?');
		if(check) document.applyForm.submit();
	} else{
		document.applyForm.submit();
	}
}

// 지도 Library
var address = document.getElementById('area').value; // 회사 주소
var corpName = document.getElementById('corpName').value; // 회사 이름
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도 생성    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체 생성
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색
geocoder.addressSearch(address, function(result, status) {

	// 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

       // 결과값으로 받은 위치를 마커로 표시
       var marker = new kakao.maps.Marker({
           map: map,
           position: coords
       });

       // 인포윈도우로 장소에 대한 설명을 표시
       var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="width:150px;text-align:center;padding:6px 0;">' + corpName + '</div>'
       });
       infowindow.open(map, marker);

       // 지도의 중심을 결과값으로 받은 위치로 이동
       map.setCenter(coords);
    } 
});

//top 마이메뉴 다운드롭
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