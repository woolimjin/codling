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

function deleteChk() {
	var pwCheck = document.indiInfoForm.re_password.value;
	var password = document.indiInfoForm.password.value;
	
	if(pwCheck == password)
		document.indiInfoForm.submit();
	else
		alert("비밀번호가 일치하지 않습니다.");
}

function updateChk() {
	var pwCheck = prompt('비밀번호를 입력하세요.', '비밀번호');
	var password = document.indiInfoForm.password.value;
	
	if(pwCheck == password)
		location.href = "individual_modify";
	else if(pwCheck != null && pwCheck != "")
		alert("비밀번호가 일치하지 않습니다.");
}