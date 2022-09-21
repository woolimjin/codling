$(function () {
    // 각각 서브메뉴가 내려오기
    $(".nav>li").mouseover(function() {
        $(this).children(".submenu").stop().slideDown();
    });
    $(".nav>li").mouseout(function() {
        $(this).children(".submenu").stop().slideUp();
    });

    //fadeIn_Out
    var x = $(".slide img")
    var y = 3;
    setInterval(function(){
        y--;
        if(y==0){
            x.fadeIn();
            y = 3;
        } else {
            x.eq(y).fadeOut();
        }
    },2000)
});