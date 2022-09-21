<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/cancelRequest.css" type="text/css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/cancelRequest.js"></script>
</head>
<body> 
	<header>
        <div id="menu-bar">
            <div></div>
            <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"><span id="mename"> ${name} 님</span> &nbsp;&nbsp;</div>
                </div>
        </div>
        <div id="profile-hover">
            <ul>
                <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
                <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
                <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
            </ul>
        </div>
    </header>
    <section>
    	<div id="del">
    		<div>
	    		<h2>광고 업로드 취소</h2>
				<form name="cancelForm" method="post" target="_self" action="cancelResult">
					<input type="hidden" name="no" value="${no }">
					<table>
						<tr>
							<th>원거래 ID</th>
							<td><input type="text" name="TID" value="" /></td>
						</tr>
						<tr>
							<th>취소 금액</th>
							<td><input type="text" name="CancelAmt" value="" /></td>
						</tr>
						<tr>
							<th>부분취소 여부</th>
							<td>
								<input type="radio" name="PartialCancelCode" value="0" checked="checked"/> 전체취소
								<input type="radio" name="PartialCancelCode" value="1"/> 부분취소
							</td>
						</tr>
					</table>
					<button id="" href="#" onClick="reqCancel();">요 청</button>				
				</form>	
			</div>
		</div>
    </section>
    <footer>
		<a href="#up"><img src="img/footerLogo.png"></a> <a href="#">전체서비스</a>&ensp;|&ensp;
		<a href="#">이용약관</a>&ensp;|&ensp; <a href="#">개인정보처리방침</a>&ensp;|&ensp;
		<a href="#">제휴문의</a>&ensp;| © CODLING Corp.
	</footer>
</body>
</html>