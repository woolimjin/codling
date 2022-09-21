<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/signUp.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/signUp.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <header>
        <div>
            <a href="index"><img src="img/logo.png" alt="logoimg" id="logo"></a>
        </div>
    </header>
    <section>
        <div id="member_box">
            <ul class="tabs">
                <li id="indi_btn" >
                <a id="personButton">개인회원</a>
                </li>
                <li id="comp_btn" >
                <a id="companyButton">기업회원</a>
                </li>
            </ul>
        </div>
    </section>
    <section>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-10 col-md-7 col-lg-5 col-xl-4">
                        <form class="validation-form" novalidate name="perFrm" action="signUp?num=1" method="post">
                        <!-- 개인 -->
                        <div id="individual" class="form-action show container-fluid align-items-center">
                        <!-- 개인 시작-->
                            <div  class="row align-items-center mt-4" id="frame">
                                <p class="fw-bold">아이디</p>
                                <div class="col" id="chain">
                                    <input type="text" maxLength=20 onInput="maxLengthCheck(this)" onKeyUp="inputDataCheck(this.id)" name="id" id="id" class="form-control" placeholder="아이디" required/>
                                        <div class="invalid-feedback">
                                            아이디를 입력해주세요.
                                        </div>      
                                 </div>
                            </div>

                            <div class="row align-items-center mt-4 frame" id="hey">
                                <div class="col" >
                                    <p class="fw-bold">비밀번호</p>
                                        <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호"  onKeyUp="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                  
                            <div class="row align-items-center mt-4" id="frame">
                                <div class="col">
                                    <p class="fw-bold">비밀번호 재확인</p>
                                        <input type="password" name="confirmpassword" id="cfpw" class="form-control" placeholder="비밀번호 재확인"  onKeyUp="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 다시 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4" id="frame">
                                <div class="col">
                                    <p class="fw-bold">이름</p>
                                        <input type="text" name="name" id="name" class="form-control" placeholder="이름"  onKeyUp="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                이름을 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 나이제한 구현해야 함 -->
                            <div class="row align-items-center mt-4" id="frame">
                                <p class="fw-bold">생년월일<span class="caution"> ⚠만 14세 이상 가입가능</span></p>
                                    <div class="col">
                                        <select name="yy" id="year" class="form-select" aria-label="Default select example"></select>
                                            <div class="invalid-feedback">
                                                년을 입력하세요.
                                            </div>
                                    </div>
                                    <div class="col">
                                        <select name="mm" id="month" class="form-select" aria-label="Default select example"></select>
                                            <div class="invalid-feedback">
                                                월을 입력하세요.
                                            </div>
                                    </div>
                                    <div class="col">
                                        <select name="dd" id="day" class="form-select" aria-label="Default select example"></select>
                                            <div class="invalid-feedback">
                                                일을 입력하세요.
                                            </div>
                                    </div>
                            </div>
                                 <!-- 나이제한 구현해야 함 -->
                            <div class="row align-items-center mt-4" id="frame">
                                <div class="col">
                                    <p class="fw-bold">성별 </p>
                                        <select class="form-select" id="gender" name="gender" >
                                            <option value="">성별</option>

                                            <option value="남">남성</option>
                                            <option value="여">여성</option>
                                        </select>
                                            <div class="invalid-feedback">
                                                성별을 선택하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4" id="frame">
                                <div class="col">
                                    <p class="fw-bold">이메일</p>
                                        <input type="email" name="email" id="email" class="form-control" placeholder="name@example.com"  onKeyUp="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                이메일을 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4" id="frame">
                                <p class="fw-bold">전화번호</p>
                                    <div class="col-4">
                                        <input class="form-control" id="010" readonly value="010" name="phoneInd1">
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" id="phoneInd2" name="phoneInd2" placeholder="'-'없이 입력"  onKeyUp="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                전화번호를 입력하세요.
                                            </div>
                                    </div>
                            </div>
                            <div class="row align-items-center mt-4 address" id="frame2">
                                <p class="fw-bold" id="addressCom">주소</p>
                                    <input type="text" placeholder="우편번호" name="postCode" id="postCode" class="form-control mb-1 " style="display:inline-block; width:100px;"  onkeyup="inputDataCheck(this.id)" required> 
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" id="search"><br>
                                    <input type="text"  name="address" id="address" class="form-control  mb-1" placeholder="주소" onkeyup="inputDataCheck(this.id)" required>
                                    <input type="text" name="detailAddress" id="detailAddress" class="form-control mb-3 col-md-7" placeholder="상세주소"  onkeyup="inputDataCheck(this.id)" required>
                            </div>
                            <div id="signUp" >
                                <button type="button" id="#btn1" value="signUpIndividual" onClick="signUpInd_submit()" class="btn-xlarge"  style="color: white; background-color: #A5E374;">가입하기</button>
                            </div>
                        </div>
                    </form>
                        <!-- 개인 내용 -->
                        <!-- 기업 내용 -->
                    <form class="validation-form" novalidate name="comFrm" action="signUp?num=2" method="post" enctype="multipart/form-data">
                        <div id="company">    
                        <!-- 기업 내용 시작 -->
                            <div  class="row align-items-center mt-4" id="frame">
                                <p class="fw-bold">아이디</p>
                                <div class="col" id="chain">
                                    <input type="text" maxLength=20 onInput="maxLengthCheck(this)" name="corId" id="corId" class="form-control" placeholder="아이디"  onKeyUp="inputDataCheck(this.id)" required/>
                                        <div class="invalid-feedback">
                                            아이디를 입력하세요
                                        </div>      
                                 </div>
                            </div>

                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">비밀번호</p>
                                        <input type="password" name="corPw" id="corPw" class="form-control" placeholder="비밀번호" onKeyUp="inputDataCheck(this.id)"  required>
                                            <div class="invalid-feedback">
                                                비밀번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">비밀번호 재확인</p>
                                        <input type="password" name="confirmpassword" id="cfpwCom" class="form-control" placeholder="비밀번호 재확인" onKeyUp="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 다시 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">회사명</p>
                                        <input type="text" name="companyName" id="comName" class="form-control" placeholder="회사명"  onKeyUp="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                회사명을 입력하세요.
                                            </div>
                                </div>
                            </div> 
                            <div class="row align-items-center mt-4">
                                <p class="fw-bold">회사 전화번호</p>
                                    <div class="col-4">
                                        <select class="form-select" id="localNum" name="localNum">
                                            <option value="02">02</option>
                                            <option value="031">031</option>
                                            <option value="032">032</option>
                                            <option value="033">033</option>
                                            <option value="041">041</option>
                                            <option value="042">042</option>
                                            <option value="043">043</option>
                                            <option value="044">044</option>
                                            <option value="051">051</option>
                                            <option value="052">052</option>
                                            <option value="053">053</option>
                                            <option value="054">054</option>
                                            <option value="055">055</option>
                                            <option value="061">061</option>
                                            <option value="062">062</option>
                                            <option value="063">063</option>
                                            <option value="064">064</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" id="telePhone" name="corptel" placeholder="'-'없이 입력" >
                                    </div>
                                    <div class="invalid-feedback">전화번호를 입력하세요.</div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">대표자명</p>
                                        <input type="text" name="representative" id="representative" class="form-control" placeholder="대표자명"  onKeyUp="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                대표자명을 입력하세요.
                                            </div>
                                </div>
                            </div>               
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">사업자 등록번호</p>
                                        <input type="text" name="companyNum" id="comNum" class="form-control" placeholder="000-00-00000" maxlength="12" onKeyUp="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                사업자 등록번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">증빙서류 첨부</p>
                                        <input class="form-control" type="file" id="formFile" name="fileName"  required>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">회사 로고 이미지 첨부</p>
                                    <input class="form-control" type="file" id="formlogo_File" name="logo_fileName"  required>
                                    <span>※이미지 사이즈는 280x100 으로 해주세요.</span>    
                                </div>
                            </div>                         
                            <div class="row align-items-left mt-4 address" id="frame2">
                                <p class="fw-bold" id="addressCom">주소</p>
                                    <input type="text" placeholder="우편번호" name="postCode2" id="postCode2" class="form-control mb-1 " style="display:inline-block; width:100px;"  onkeyup="inputDataCheck(this.id)" required> 
                                    <input type="button" onclick="sample7_execDaumPostcode()" value="주소 찾기" id="search"><br>
                                    <input type="text"  name="address2" id="address2" class="form-control  mb-1" placeholder="주소" onkeyup="inputDataCheck(this.id)" required>
                                    <input type="text" name="detailAddress2" id="detailAddress2" class="form-control mb-3 col-md-7" placeholder="상세주소"  onkeyup="inputDataCheck(this.id)" required>
                            </div>
                            <div id="signUp" >
                                <button type="button" value="signUpCompany" onClick="signUpCom_submit()" class="btn-xlarge submit"  style="color: white; background-color: #A5E374;">가입하기</button>
                            </div>
                        </div>
                        </form>
                    </div>
                        <!-- 기업 내용 -->
                </div>
                </div>
            <div  id="ifUHave">
                <p class="text-center mt-3 text-secondary">만약 계정이 있으시다면, <a id="sugg" href="logIn.jsp">로그인</a> 을 해주세요🍏</p>
            </div>     
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>