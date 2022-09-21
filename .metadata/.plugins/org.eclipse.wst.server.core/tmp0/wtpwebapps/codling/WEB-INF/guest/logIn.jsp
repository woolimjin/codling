<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
    <meta name ="google-signin-client_id" content="284499893832-9k98h204k3rhjp1jevbuclg4dc8b4nk2.apps.googleusercontent.com">
    <title>Codling : 로그인</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="css/logIn.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/login.js"></script> 
</head>
<body>
    <div id="login">
    <header>
        <a href="index"><img src="img/logo.png" alt="logoimg" id="logo"></a>
    </header>
    <article>
        <p id="suv">서비스를 이용하시려면 로그인을 하세요</p>
        <p id="suv2">Codling 회원이 아니시면 <a href="signUp" id="join1">회원가입</a>을 해주세요</p>
        <ul class="tab_member_type">
            <li class="t_per t_on"><a class="a_per" style="cursor: pointer;">개인회원</a></li>
            <li class="t_com"><a class="a_com" style="cursor: pointer;">기업회원</a></li>
        </ul>
        <div class="per_log">


            <form action="login" method="post" id="per_log_frm" name="perLogFrm">
                <div id="inputchang">
                    <div class="id-input-box focus">
                        <input type="text" id="per-id" name="perId" class="txt_tool" placeholder="아이디">
                    </div>
                    <div class="pw-input-box">
                        <input type="password" id="password" name="perPassword" class="txt_tool" placeholder="비밀번호" maxlength="32">
                    </div>
                </div>
                <button type="button" class="btn-login" onclick="perCheck()">로그인</button>
            </form>
            
            
        </div>
        <div class="com_log">
        
        
            <form action="login" method="post" id="com_log_frm" name="comLogFrm">
                <div id="inputchang">
                    <div class="id-input-box focus">
                        <input type="text" id="com-id" name="comId" class="txt_tool" placeholder="아이디">
                    </div>
                    <div class="pw-input-box">
                        <input type="password" id="com-password" name="comPassword" class="txt_tool" placeholder="비밀번호" maxlength="32">
                    </div>
                </div>
                <button type="button" class="btn-login" onclick="comCheck()">로그인</button>
            </form>
            
            
        </div>
        <p id="join2"><a href="signUp">회원가입</a><a href="find_account">아이디/비밀번호 찾기</a></p>
    </article>
    <div id="loginAPI">
        <div>
            <a href="javascript:kakaoLogin()"><img src="img/kakao.png" alt=""></a>
			<a id="GgCustomLogin" href="javascript:void(0)"><img src="img/google.png" alt=""></a>
            <a id="naverIdLogin_loginButton" href="javascript:void(0)"><img src="img/naver.png" alt=""></a>
        </div>
    </div>
        <p id="loginAPI-Pt">
            <span>
                <a href="#">이용약관</a> | 
                <a href="#">개인정보처리방침</a> | 
                <a href="#">회원정보</a> | 
                <a href="#">고객센터</a>
            </span>
        </p>
    </div>
    <!-- 카카오 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript">
    window.Kakao.init("370fa568d4acbeb9115655e735792c45");

    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope:'profile_nickname, profile_image, account_email, gender',
            success: function(authObj) {
                console.log(autoObj);
                window.Kakao.API.request({
                    url:'/v2/user/me', 
                    success: res => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account);
                    }
                });
            }
        })
    }

	//처음 실행하는 함수
	function init() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
			options = new gapi.auth2.SigninOptionsBuilder();
			options.setPrompt('select_account');
	        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
			options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
	        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
	        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
			gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
		})
	}
    </script>
	<!-- 구글 api 사용을 위한 스크립트 -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    
    <!-- 네이버 -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
   	<script type="text/javascript">
    var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "VbyRMVals_lVgeC5hpie", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
				callbackUrl: "http://localhost:8090/index.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
				isPopup: false,
				callbackHandle: true
			}
		);	
	
	naverLogin.init();
	
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
	    		
				console.log(naverLogin.user); 
	    		
	            if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
	
	
	var testPopUp;
	function openPopUp() {
	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp(){
	    testPopUp.close();
	}
	
	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			}, 1000);
	}
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>