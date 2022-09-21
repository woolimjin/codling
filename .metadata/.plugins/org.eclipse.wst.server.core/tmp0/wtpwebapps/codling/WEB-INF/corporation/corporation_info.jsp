<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codling : 내 정보</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="css/corporation_info.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/corporation_info.js"></script>
</head>
<body>
    <!--header-->
    <header>
        <div id="menu-bar">
            <div></div>
            <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"><span id="mename"> ${corpName} 님</span> &nbsp;&nbsp;</div>
                </div>
        </div>
        <div id="profile-hover">
            <ul>
                <li id="mypage"><a href="corporationInfo"><span>내 정보</span></a></li>
                <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
                <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
            </ul>
        </div>
    </header>
    <section>
        <h2>회원정보</h2>
        <form action="corporationInfo" name="corpInfoForm" method="post">
	        <div id="wrap">
	            <div class="type">
	                <p>아이디</p>
	                <div>${corporation.id}</div>
	            </div>
	            <div class="type">
	                <p>회사명</p>
	                <div>${corporation.corporateName}</div>
	            </div>
	            <div class="type">
	                <p>회사 연락처</p>
	                <div>${fn:substring(corporation.corporatePhone,0 , 3)}-${fn:substring(corporation.corporatePhone,3 , 7)}-${fn:substring(corporation.corporatePhone,7 , 11)}</div>
	            </div>
	            <div class="type">
	                <p>대표자명</p>
	                <div>${corporation.ceoName}</div>
	            </div>
	            <div class="type">
	                <p>사업자등록번호</p>
	                <div>${corporation.corporateNumber}</div>
	            </div>
	            <div class="type">
	                <p>증빙서류</p>
	                <div>
		                <c:if test="${not empty corporation.fileName}">
		                	${corporation.fileName}
		                </c:if>
		                <c:if test="${empty corporation.fileName}">
		                	증빙서류가 없습니다 증빙서류를 등록해주세요.
		                </c:if>
	                </div>
	            </div>
	            <div class="type">
	                <p>회사 로고 파일</p>
	                <div id="logo_filebox">
	                	<c:if test="${corporation.logo_fileName != 'logo.png'}">
		                	<img class="logo_file" alt="logo_file" src="/upload/${corporation.logo_fileName}">
		                </c:if>
		                <c:if test="${corporation.logo_fileName == 'logo.png'}">
		                	회사 로고가 없습니다 회사 로고를 등록해주세요.
		                </c:if>
	                </div>
	            </div>
	            <div class="type">
	                <p>주소</p>
	                <div>${corporation.address}</div>
	            </div>
	        </div>
	        <div id="choice">
	        	<input type="hidden" name="password" value="${corporation.password}">
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