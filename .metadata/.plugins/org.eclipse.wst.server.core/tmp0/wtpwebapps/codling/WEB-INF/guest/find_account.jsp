<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/find_account.css" type="text/css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
</head>
<body>
    <header>
        <div></div>
        <a href="index"><img src="img/logo.png" alt="logo image" id="logo"></a>
        <a href="login"><button type="button" id="logIn">Login</button></a>
    </header>
    <section>
        <article>
            <h1 class="title">회원 찾기</h1><hr>
            <b class="txt">회원 구분별로 찾으시려는 아이디 혹은 비밀번호를 선택해주세요.</b>
            <div class="find_account">
                <ul>
                    <li class="identity">
                        <strong class="indi">개인회원</strong>
                    </li>
                    <li class="find_link">
                        <a href="indi_findId" id="find_id"><b>아이디 찾기</b></a>
                        <a href="indi_findPassword" id="find_pw"><b>비밀번호 찾기</b></a>
                    </li>
                </ul>
                <ul>
                    <li class="identity">
                        <strong class="corp">기업회원</strong>
                    </li>
                    <li class="find_link">
                        <a href="corp_findId" id="find_id"><b>아이디 찾기</b></a>
                        <a href="corp_findPassword" id="find_pw"><b>비밀번호 찾기</b></a>
                    </li>
                </ul>
            </div>
        </article>
    </section>
    <footer>
        <a href="#up"><img src="img/footerLogo.png"></a>
        <a href="#">전체서비스</a>&ensp;|&ensp; 
        <a href="#">이용약관</a>&ensp;|&ensp; 
        <a href="#">개인정보처리방침</a>&ensp;|&ensp;
        <a href="#">제휴문의</a>&ensp;| 
        © CODLING Corp.
    </footer>
</body>
</html>