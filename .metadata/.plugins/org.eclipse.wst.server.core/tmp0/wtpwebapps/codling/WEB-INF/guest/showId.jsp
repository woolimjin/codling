<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/showId.css" type="text/css">
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
            <h1 class="title">회원 아이디</h1><hr>
			<h2>회원님의 아이디는 <span id="id">${id}</span>입니다.</h2>
			<div id="buttonWrap">
				<a href="index">홈으로</a>
				<a href="login">로그인</a>
				<a href="find_account">비밀번호 찾기</a>
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