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
});

function deleteChk() {
	var pwCheck = prompt("비밀번호를 입력해 주세요.", "비밀번호");
	var password = document.corpInfoForm.password.value;
	
	if(pwCheck == password)
		document.corpInfoForm.submit();
	else
		alert("비밀번호가 일치하지 않습니다.");
}

function updateChk() {
	var pwCheck = prompt("비밀번호를 입력해 주세요.", "비밀번호");
	var password = document.corpInfoForm.password.value;
	
	if(pwCheck == password)
		location.href = "corporation_modify";
	else
		alert("비밀번호가 일치하지 않습니다.");
}