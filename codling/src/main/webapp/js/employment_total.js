window.onscroll = function() {scrollFunction()};

function scrollFunction(){
    if(document.body.scrollTop > 250 || document.documentElement.scrollTop > 250){
        document.getElementById("scroll-header").style.top = "0";
    }else{
        document.getElementById("scroll-header").style.top = "-130px";
    }
}

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
$(function() {
    $('.col').hover( function() {
        if($("#count").css("display") == "none") {
        $('#count').css('display', 'block');
        }       
    },function(){
        $('#count').css('display', 'none');
        });

   });
