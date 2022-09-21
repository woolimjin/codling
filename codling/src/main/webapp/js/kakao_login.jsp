<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <a href="javascript:kakaoLogin()"><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:60px; width:auto;"></a>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
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
    </script>
</body>
</html>