<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/corp_findId.css" type="text/css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/corp_findId.js"></script>
</head>
<body>
    <header>
        <div></div>
        <a href="index"><img src="img/logo.png" alt="logoImage" id="logo"></a>
        <a href="login"><button type="button" id="logIn">Login</button></a>
    </header>
    <section>
        <article>
            <h1 class="title">기업회원 아이디 찾기</h1><hr>
            <h2 class="txt">기업회원 본인인증 수단을 선택해 주세요.</h2>
            <div class="chk">
                <a href="#chk_phone" id="btn_phone"><b>휴대폰 번호로 찾기</b></a>
                <a href="#chk_email" id="btn_email"><b>이메일 주소로 찾기</b></a>
            </div>
            <div id="chk_phone">
                <b>가입 시 입력한 기업정보를 입력해 주세요.</b>
                <form action="" method="post" name="findPhoneForm">
                    <div class="input">
                        <div class="item"><b>기업명</b></div>
                        <div class="item"><input name="name"></div>
                        <div class="item"></div>
                        <div class="item"><b>휴대폰 번호</b></div>
                        <div class="item"><input type="tel" name="phoneNum" placeholder="'-'없이 입력"></div>
                        <div class="item"><input type="button" class="chk_btn" name="chk_btn" value="인증번호 발송" onclick=""></input></div>
                        <div class="item"><b>인증번호</b></div>
                        <div class="item"><input name="chk"></div>
                        <div class="item"></div>
                    </div>
                    <div>
                        <input type="button" id="chk_phone_ok" value="아이디 찾기" onClick="checkFindPhone()">
                    </div>
                </form>
            </div>
                
            <div id="chk_email">
                <b>가입 시 입력한 기업정보를 입력해 주세요.</b>
                <form action="corp_findId" method="post" name="findEmailForm">
                    <div class="input">
                        <div class="item"><b>기업명</b></div>
                        <div class="item"><input name="name"></div>
                        <div class="item"></div>
                        <div class="item"><b>이메일 주소</b></div>
                        <div class="item"><input type="email" name="email" placeholder="example@codling.com"></div>
                        <div class="item"><input type="button" class="chk_btn" name="chk_btn" value="인증번호 발송" onclick="sendCheckCode()"></input></div>
                        <div class="item"><b>인증번호</b></div>
                        <div class="item"><input name="chk"></div>
                        <div class="item"></div>
                    </div>
                    <div>
                        <input type="button" id="chk_email_ok" value="아이디 찾기" onClick="checkEmail()">
                    </div>
                </form>
                </div>
            </div>
        </article>
    </section>
</body>
</html>