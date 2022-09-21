<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codling : 내 정보</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="css/individual_info.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/individual_info.js"></script>
</head>
<body>
    <!--header-->
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
                <li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
                <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
            </ul>
        </div>
    </header>
    <section>
        <h2>회원정보</h2>
        <form action="individualInfo" name="indiInfoForm" method="post">
        	<div id="wrap">
	            <div class="type">
	                <p>아이디</p>
	                <div>${individual.id}</div>
	            </div>
	            <div class="type">
	                <p>이름</p>
	                <div>${individual.name}</div>
	            </div>
	            <div class="type">
	                <p>생년월일</p>
	                <div>${individual.birth}</div>
	            </div>
	            <div class="type">
	                <p>성별</p>
	                <div>${individual.gender}성</div>
	            </div>
	            <div class="type">
	                <p>이메일</p>
	                <div>${individual.email}</div>
	            </div>
	            <div class="type">
	                <p>전화번호</p>
	                <div>${fn:substring(individual.phone, 0, 3)}-${fn:substring(individual.phone, 3, 7)}-${fn:substring(individual.phone, 7, 11)}</div>
	            </div>
	            <div class="type">
	                <p>주소</p>
	                <div>${individual.address} ${individual.detailAddress}</div>
	            </div>
	        </div>
	        <div id="choice">
	        	<input type="hidden" name="password" value="${individual.password}">
	            <input type="button" class="modify" value="수 정" onclick="updateChk()">
	            <input type="button" class="drop" value="탈 퇴" onclick="deleteChk()">
	        </div>
	    </form>
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