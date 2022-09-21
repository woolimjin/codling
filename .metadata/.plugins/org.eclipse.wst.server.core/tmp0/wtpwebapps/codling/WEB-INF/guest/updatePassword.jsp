<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/updatePassword.css" type="text/css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/updatePassword.js"></script> 
</head>
<body>
    <header>
        <div></div>
        <a href="index"><img src="img/logo.png" alt="logo image" id="logo"></a>
        <a href="login"><button type="button" id="logIn">Login</button></a>
    </header>
    <section>
        <article>
            <h1 class="title">회원 비밀번호 수정</h1><hr>
			<h2>변경할 비밀번호를 입력해 주세요.</h2>
			<form action="updatePassword" method="post" name="updatePasswordForm">
				<table>
					<tr>
						<td class="txt">비밀번호</td>
						<td><input type="password" name="password" id="pw"></td>
					</tr>
					<tr>
						<td class="txt">비밀번호 재확인</td>
						<td><input type="password" name="rePassword" id="rePw"></td>
					</tr>
					<tr class="empty"></tr>
					<tr>
						<td colspan="2" id="btnWrap">
							<input type="hidden" name="position" value="${position}">
							<input type="hidden" name="id" value="${id}">
							<input type="button" id="btn" value="비밀번호 변경" onclick="checkPassword()">
						</td>
					</tr>
				</table>
			</form>
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