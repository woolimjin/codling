$(function() {
    $('.a_per').click( function() {
        $(this).css('background','#A5E374');
        $(this).css('color','white');
        $('.a_com').css('background','#F0F0F0');
        $('.a_com').css('color','#858585');
    });
    $('.a_com').click( function() {
        $(this).css('background','#A5E374');
        $(this).css('color','white');
        $('.a_per').css('background','#F0F0F0');
        $('.a_per').css('color','#858585');
    });
});

$(function() {
    $(".com_log").hide()
    $(".a_per").click(function(){
      $(".per_log").show();
      $(".com_log").hide();
    })
    $(".a_com").click(function(){
      $(".per_log").hide();
      $(".com_log").show();
      $(".com_log").prop("display","block");
    })
});

// 개인회원 로그인 공백 체크
function perCheck() {
	if(document.perLogFrm.perId.value == "") {
		alert("아이디를 입력해 주세요.");
		document.perLogFrm.perId.focus();
	} else if(document.perLogFrm.perPassword.value == "") {
		alert("패스워드를 입력해 주세요.");
		document.perLogFrm.perPassword.focus();
	} else {
		document.perLogFrm.submit();
	}
}

// 기업회원 로그인 공백 체크
function comCheck() {
	if(document.comLogFrm.comId.value == "") {
		alert("아이디를 입력해 주세요.");
		document.comLogFrm.comId.focus();
	} else if(document.comLogFrm.comPassword.value == "") {
		alert("패스워드를 입력해 주세요.");
		document.comLogFrm.comPassword.focus();
	} else {
		document.comLogFrm.submit();
	}
}
//엔터시 로그인
$(function() {
	$("#password").keypress(function (e){
		if(e.keyCode === 13){
			perCheck();
		}
	});
	
	$("#com-password").keypress(function (e){
		if(e.keyCode === 13){
			comCheck();
		}
	});
});
//google 로그인 API


	
	function onSignIn(googleUser) {
		var access_token = googleUser.getAuthResponse().access_token
		$.ajax({
	    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
			url: 'https://people.googleapis.com/v1/people/me'
	        // key에 자신의 API 키를 넣습니다.
			, data: {personFields:'birthdays', key:'AIzaSyCVu2ya6dVaACUjx4cHYS3Y43UFvNkSlj0', 'access_token': access_token}
			, method:'GET'
		})
		.done(function(e){
	        //프로필을 가져온다.
			var profile = googleUser.getBasicProfile();
			console.log(profile)
		})
		.fail(function(e){
			console.log(e);
		})
	}
	function onSignInFailure(t){		
		console.log(t);
	}
	
	