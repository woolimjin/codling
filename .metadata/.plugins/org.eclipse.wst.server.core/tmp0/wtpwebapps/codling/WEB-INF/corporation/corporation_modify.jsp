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
    <title>Codling : 내 정보 수정</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="css/corporation_modify.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="js/corporation_modify.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <header>
        <a href="index"><img src="img/logo.png" alt="logoImg" id="logo"></a>
    </header>
    <section>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-10 col-md-7 col-lg-5 col-xl-4">
                        <form class="validation-form" novalidate name="updateCorpForm" action="corporation_modify" method="post" enctype="multipart/form-data">
                        <div id="individual" class="form-action show container-fluid align-items-center">
                            <div class="row align-items-center mt-4" id="frame">
                                <!-- 아이디 -->
                                <p class="fw-bold">아이디</p>
                                <div class="col" id="chain">
                                    <input type="text" maxlength="20" oninput="maxLengthCheck(this)" onkeyup="inputDataCheck(this.id)" name="id" id="id" class="form-control" placeholder="아이디" required readonly value="${corporation.id}">
                                    <div class="invalid-feedback">
                                        아이디를 입력하세요
                                    </div>     
                                </div>
                            </div>
                            <!-- 비밀번호 -->
                            <div class="row align-items-center mt-4 frame" id="hey">
                                <div class="col" >
                                    <p class="fw-bold">비밀번호</p>
                                        <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 비밀번호 확인-->
                            <div class="row align-items-center mt-4" id="">
                                <div class="col">
                                    <p class="fw-bold">비밀번호 재확인</p>
                                        <input type="password" name="confirmPassword" id="cfpw" class="form-control" placeholder="비밀번호 재확인"  onkeyup="inputDataCheck(this.id)" required >
                                            <div class="invalid-feedback">
                                                비밀번호를 다시 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">회사명</p>
                                        <input type="text" name="companyName" id="comName" class="form-control" placeholder="회사명" onkeyup="inputDataCheck(this.id)" required value="${corporation.corporateName}">
                                            <div class="invalid-feedback">
                                                회사명을 입력하세요.
                                            </div>
                                </div>
                            </div> 
                            <div class="row align-items-center mt-4">
                                <p class="fw-bold">회사 전화번호</p>
                                    <div class="col-3">
                                        <input class="form-control" value="010" readonly>
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" name="corporatePhone" id="telePhone" placeholder="'-'없이 입력" value="${fn:substring(corporation.corporatePhone, 3, 11)}">
                                    </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">대표자명</p>
                                        <input type="text" name="ceoName" id="representative" class="form-control" placeholder="대표자명" onkeyup="inputDataCheck(this.id)" required value="${corporation.ceoName}">
                                            <div class="invalid-feedback">
                                                대표자명을 입력하세요.
                                            </div>
                                </div>
                            </div>               
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">사업자 등록번호</p>
                                        <input type="text" name="companyNum" id="comNum" class="form-control" placeholder="사업자 등록번호"  onkeyup="inputDataCheck(this.id)" required value="${corporation.corporateNumber}">
                                            <div class="invalid-feedback">
                                                사업자 등록번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">증빙서류 첨부</p>
									<input class="form-control" type="file" name="fileName" id="formFile"  required>
									<div class="invalid-feedback">증빙서류를 첨부하세요.</div>
									<c:if test="${empty corporation.fileName }">
										<p>증빙서류가 없습니다 증빙서류를 제출해주세요.</p>
									</c:if>
									<c:if test="${not empty corporation.fileName }">
										<p>제출하신 증빙서류${corporation.fileName }</p>
									</c:if>
                                </div>
                            </div>     
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">회사 로고 이미지 첨부</p>
                                    <input class="form-control" type="file" id="formlogo_File" name="logo_fileName"  required> 
                                    <c:if test="${corporation.logo_fileName == 'logo.png'}">
										<p>회사 대표 로고가 없습니다 로고 를 첨부해주세요.</p>
									</c:if>
									<c:if test="${corporation.logo_fileName != 'logo.png'}">
										<div id="logobox">
											<div>
												<span>현재 회사로고</span>
											</div>
											<div id="logo_img">
												<img alt="회사 로고 이미지" src="/upload/${corporation.logo_fileName }" />
											</div>
										</div>
									</c:if>
                                </div>
                            </div>                  
                            <div class="row align-items-left mt-4 address" id="frame2">
                            	<p class="fw-bold" id="addressCom">주소</p>
                                    <input type="text" placeholder="우편번호" name="postCode" id="postCode" class="form-control mb-1" style="display:inline-block;width:100px;"  onkeyup="inputDataCheck(this.id)" required > 
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" id="search"><br>
                                    <input type="text"  name="address" id="address" class="form-control  mb-1" placeholder="주소" onkeyup="inputDataCheck(this.id)" required value="${corporation.address}">
                                    <input type="text" name="detailAddress" id="detailAddress" class="form-control mb-3 col-md-7" placeholder="상세주소"  onkeyup="inputDataCheck(this.id)" required value="${corporation.detailAddress}">
                            </div>
                            <div id="modify_btn" >
                                <button type="button" id="#btn1" value="modifyIndividual" onclick="signUpInd_submit()" class="btn-xlarge modifyBtn">수정하기</button>
                            </div> 
                        </div>
                    </form>
                        </div>
                        </div>
            </div>
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