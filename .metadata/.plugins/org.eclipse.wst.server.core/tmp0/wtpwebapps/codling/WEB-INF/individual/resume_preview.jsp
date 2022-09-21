<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codling : 이력서</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/resume_preview.css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/resume_preview.js"></script>
</head>
<body onresize="update_screen_size()">
    <header>
        <div id="menu-bar">
            <div></div>
            <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${name} 님 &nbsp;&nbsp;</div>
                </div>
        </div>
            <div id="profile-hover">
                <ul>
	                 <c:if test="${not empty indiId }">
	                    <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
	                    <li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
	                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
					</c:if>
					<c:if test="${not empty corpId }">
						<li id="mypage"><a href="corporationInfo"><span>내 정보</span></a></li>
	                    <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
	                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
					</c:if>
                </ul>
            </div>
    </header>
    <section>
            <div id="Preview">
                <h2 id="title">${individual.resumeTitle }</h2>
                <div id="idInfo">
                    <div>
                        <h2>&nbsp;${name}&nbsp;<span id="gender">${individual.gender }성</span></h2>
                        <p>
                            <span>&nbsp;&nbsp;<img src="img/email.png" class="icon">&nbsp;${individual.email }</span>&nbsp;&nbsp;&ensp;&ensp;
                            <span><img src="img/birthday.png" class="icon">&nbsp;${fn:substring(individual.birth, 0, 4) }년생</span>&nbsp;&nbsp;&ensp;&ensp;
                            <span><img src="img/career.png" class="icon">
								<c:if test="${empty career}">
	                    				신입
	                    		</c:if>
	                    		<c:if test="${not empty career}">
	                    				<c:set var="tenure" value="0"/>
	                    				<c:set var="month" value="0"/>
	                    				<c:set var="result" value="0"/>
	                    				<c:forTokens var="carS" items="${career.tenureStart}" delims=" / " varStatus="st">
	                    				<c:forTokens var="carE" items="${career.tenureEnd}" begin="${st.index }" end="${st.index }" delims=" / ">
	                    					<fmt:parseNumber var="tenureStartYear" value="${fn:substring(carS, 0, 4)}" type="number"/>
		                    				<fmt:parseNumber var="tenureEndYear" value="${fn:substring(carE, 0, 4)}" type="number"/>
		                    				<fmt:parseNumber var="tenureStartmonth" value="${fn:substring(carS, 5, 7)}" type="number"/>
		                    				<fmt:parseNumber var="tenureEndmonth" value="${fn:substring(carE, 5, 7)}" type="number"/>
		                    				<c:set var="tenure" value="${tenure + (tenureEndYear - tenureStartYear)}"/>
		                    				<c:set var="month" value="${month + (tenureEndmonth - tenureStartmonth)}"/>
	                    				</c:forTokens>
	                    				</c:forTokens>
	                    				<!-- 0년 중에 경력 개월 -->
	                    				<c:if test="${tenure == '0'}">
	                    					<c:if test="${month == '0'}">
	                    						신입
	                    					</c:if>
	                    					<c:if test="${month < 12}">
	                    						<c:if test="${month != '0'}">
	                    							${month}개월
	                    						</c:if>
	                    					</c:if>
	                    					<c:if test="${month == 12}">
	                    						1년
	                    					</c:if>
	                    					<c:if test="${month > 12}">
	                    						${tenure + 1}년 ${month - 12}개월
	                    					</c:if>
	                    					<c:if test="${month > 24}">
	                    						${tenure + 2}년 ${month - 24}개월
	                    					</c:if>
	                    					<c:if test="${month > 36}">
	                    						${tenure + 3}년 ${month - 36}개월
	                    					</c:if>
	                    					<c:if test="${month > 48}">
	                    						${tenure + 4}년 ${month - 48}개월
	                    					</c:if>
	                    					<c:if test="${month > 60}">
	                    						${tenure + 5}년 ${month - 60}개월
	                    					</c:if>
	                    				</c:if>
	                    				
	                    				<!-- 1년 중에 경력 개월 -->
	                    				<c:if test="${tenure == '1'}">
	                    					<c:if test="${month == '0'}">
	                    						${tenure}년
	                    					</c:if>
	                    					<c:if test="${month < 0}">
	                    						<c:set var="result" value="${(tenure * 12) + month}"/>
	                    						${result}개월
	                    					</c:if>
	                    					<c:if test="${month > 0}">
	                    						${tenure }년 ${month}개월
	                    					</c:if>
	                    				</c:if>
	                    				
	                    				<c:if test="${tenure > 1}">
	                    					<!-- 2년 이상 중에 경력 개월 -->
	                    					<c:if test="${month == '0'}">
	                    						${tenure}년
	                    					</c:if>
	                    					<c:if test="${month < 0}">
	                    						<c:if test="${month < -48}">
		                    						<c:set var="result" value="${month + 60}"/>
		                    						${tenure - 5}년 ${result}개월
		                    					</c:if>
	                    						<c:if test="${month < -36}">
		                    						<c:set var="result" value="${month + 48}"/>
		                    						${tenure - 4}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month < -24}">
		                    						<c:set var="result" value="${month + 36}"/>
		                    						${tenure - 3}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month < -12}">
		                    						<c:set var="result" value="${month + 24}"/>
		                    						${tenure - 2}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month >= -12}">
		                    						<c:set var="result" value="${month + 12}"/>
		                    						${tenure - 1}년 ${result}개월
		                    					</c:if>
	                    					</c:if>
	                    					
	                    					<!-- 2년 이상 중에 경력 개월 -->
	                    					<c:if test="${month > 0}">
	                    						<c:if test="${month > 60}">
		                    						<c:set var="result" value="${month - 60}"/>
		                    						${tenure + 5}년 ${result}개월
		                    					</c:if>
	                    						<c:if test="${month > 48}">
		                    						<c:set var="result" value="${month - 48}"/>
		                    						${tenure + 4}년 ${result}개월
		                    					</c:if>
	                    						<c:if test="${month > 36}">
		                    						<c:set var="result" value="${month - 36}"/>
		                    						${tenure + 3}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month > 24}">
		                    						<c:set var="result" value="${month - 24}"/>
		                    						${tenure + 2}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month > 12}">
		                    						<c:set var="result" value="${month - 12}"/>
		                    						${tenure + 1}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month <= 12}">
		                    						<c:set var="result" value="${month}"/>
		                    						${tenure}년 ${result}개월
		                    					</c:if>
	                    					</c:if>
	                    				</c:if>
	                    				
	                    			</c:if>
							</span>
                        </p>
                        <p>&nbsp;&nbsp;<img src="img/phone.png" class="icon">&nbsp;${fn:substring(individual.phone, 0, 3)}-${fn:substring(individual.phone, 3, 7)}-${fn:substring(individual.phone, 7, 11)}</p>
                        <p>&nbsp;&nbsp;<img src="img/address.png" class="icon">&nbsp;${individual.address} ${individual.detailAddress}</p>
                    </div>
                </div>
                <div class="resume" id="education">
                    <div class="fr">
                        <h2>학력</h2>
                    </div>
                    <div class="content">
                    <c:forTokens var="schoolName" items="${education.schoolName}" delims="/" varStatus="st">
                    <c:forTokens var="school" items="${education.school}" begin="${st.index }" end="${st.index }" delims="/">
                    <c:forTokens var="schoolStartDate" items="${education.schoolStartDate}" begin="${st.index }" end="${st.index }" delims="/">
                    <c:forTokens var="schoolEndDate" items="${education.schoolEndDate}" begin="${st.index }" end="${st.index }" delims="/">
                    <c:forTokens var="status" items="${education.status}" begin="${st.index }" end="${st.index }" delims="/">
                    <c:forTokens var="department" items="${education.department}" begin="${st.index }" end="${st.index }" delims="/">
                    <c:forTokens var="score" items="${education.score}" begin="${st.index }" end="${st.index }" delims="/">    
                        <p id="schoolname">${schoolName } / ${school }</p>
                        <p id="schooinfo">${department}</p>
                        <p id="schooend">재학기간 &ensp;${schoolStartDate} ~ ${schoolEndDate }</p>
                        <p id="scor">학점 &ensp; ${score }/4.5</p>
                        <c:if test="${not st.last}">
                        	</br></br>
                        </c:if>
					</c:forTokens>
					</c:forTokens>
					</c:forTokens>
					</c:forTokens>
					</c:forTokens>
                    </c:forTokens>
                    </c:forTokens>     
                    </div>
                </div>
                <div class="resume" id="stack">
                    <div class="fr">
                        <h2>보유기술스택</h2>
                    </div>
                    <div class="content">
                        	<p id="sts">
                        		<c:forTokens var="stack" items="${individual.stack}" delims="/" varStatus="st">
                        			<span>${stack}</span>
                        			<c:if test="${not st.last}">,</c:if>
                        		</c:forTokens>
                        	</p>
                    </div>
                </div>
                <c:if test="${not empty career.prev_company}">
	                <div class="resume" id="career">
	                    <div class="fr">
	                        <h2>경력사항</h2>
	                    </div>
	                    <div class="content">
	                    	<c:forTokens var="prev_company" items="${career.prev_company }" delims="/" varStatus="st">
		                    <c:forTokens var="tenureStart" items="${career.tenureStart }" begin="${st.index }" end="${st.index }" delims="/">
		                    <c:forTokens var="tenureEnd" items="${career.tenureEnd }" begin="${st.index }" end="${st.index }" delims="/"> 
		                    <c:forTokens var="position" items="${career.position }" begin="${st.index }" end="${st.index }" delims="/"> 
		                    <c:forTokens var="department" items="${career.department }" begin="${st.index }" end="${st.index }" delims="/"> 
		                    <c:forTokens var="work_content" items="${career.work_content }" begin="${st.index }" end="${st.index }" delims="/">  
		                        <p id="comname">${prev_company }</p>
		                        <p id="part">${department } / ${position }</p>
		                        <p>재직일자&nbsp;&nbsp;${tenureStart } ~ ${tenureEnd }</p>
		                        <p>주요업무</p>
		                        <c:set var="wc" value="${work_content }"/>
		                        <c:set var="w_content" value="${fn:replace(wc, escape, '<br>') }"/>
		                        <p>${w_content }</p>
		                        <c:if test="${not st.last }"></br></br></c:if>
		                    </c:forTokens>
		                    </c:forTokens>
		                    </c:forTokens>
		                    </c:forTokens>
		                    </c:forTokens>
	                    	</c:forTokens>
	                    </div>
	                </div>
	            </c:if>
                <c:if test="${not empty license.name}">
	                <div class="resume" id="license">
	                    <div class="fr">
	                        <h2>자격증 내역</h2>
	                    </div>
	                    <div class="content">
	                    	<c:forTokens var="name" items="${license.name }" delims="/" varStatus="st">
	                    	<c:forTokens var="agency" items="${license.agency }" begin="${st.index }" end="${st.index }" delims="/">
	                    	<c:forTokens var="pass" items="${license.pass }" begin="${st.index }" end="${st.index }" delims="/">
	                    	<c:forTokens var="acquireDate" items="${license.acquireDate }" begin="${st.index }" end="${st.index }" delims="/">
		                        <p id="licname">${name }</p>
		                        <p id="agency">발행기관 &nbsp;&nbsp;${agency }</p>
		                        <p>취득날짜 &nbsp;&nbsp;${acquireDate }</p>
		                        <p>합격여부 &nbsp;&nbsp;${pass }</p>
		                        <c:if test="${not st.last }"></br></br></c:if>
	                        </c:forTokens>
	                        </c:forTokens>
	                        </c:forTokens>
	                        </c:forTokens>
	                    </div>
	                </div>
	            </c:if>
                <c:if test="${not empty portfolio.name}">
	                <div class="resume" id="popol">
	                    <div class="fr">
	                        <h2>포트폴리오</h2>
	                    </div>
	                    <div class="content">
	                    	<c:forTokens var="name" items="${portfolio.name }" delims="/" varStatus="st">
	                    	<c:forTokens var="detail" items="${portfolio.detail }" begin="${st.index }" end="${st.index }" delims="/">
	                    	<c:forTokens var="url" items="${portfolio.url }" begin="${st.index }" end="${st.index }" delims="|">
	                        	<p id="url">${name } &ensp;&ensp;</p>
	                        	<p><span class="url">url</span> &ensp;&ensp;<a href="${url }">${url }</a></p>
	                        	<p>상세내용</p>
	                        	<c:set var="de" value="${detail }"/>
		                        <c:set var="re_detail" value="${fn:replace(de, escape, '<br>') }"/>
	                        	<div>${re_detail }</div>
	                        	<c:if test="${not st.last }"></br></br></c:if>
	                        </c:forTokens>
	                        </c:forTokens>
	                        </c:forTokens>
	                    </div>
	                </div>
	            </c:if>
	            <c:if test="${not empty fileupload.title}">
	                <div class="resume" id="popol">
	                    <div class="fr">
	                        <h2>첨부파일</h2>
	                    </div>
	                    <div class="content">
	                        <c:forTokens var="title" items="${fileupload.title }" delims="/" varStatus="st">
	                        <c:forTokens var="fileName" items="${fileupload.fileName }" begin="${st.index }" end="${st.index }" delims="/">
	                        <c:forTokens var="fileaddress" items="${fileupload.fileaddress }" begin="${st.index }" end="${st.index }" delims="|">
	                        <c:forTokens var="filedetail" items="${fileupload.filedetail }" begin="${st.index }" end="${st.index }" delims="/">
	                        <c:forTokens var="fileSize" items="${fileupload.fileSize }" begin="${st.index }" end="${st.index }" delims="/">
	                        	<p id="file">${title }</p>
	                        	<p><a download href="/upload/${fileName }">${fileName }</a>&nbsp;&nbsp;<span></span></p>
	                        	<c:set var="fi" value="${filedetail }"/>
		                        <c:set var="re_filedetail" value="${fn:replace(fi, escape, '<br>') }"/>
	                        	<p>${re_filedetail }</p>
	                        	<c:if test="${not st.last }"><br><br></c:if>
	                        </c:forTokens>
	                        </c:forTokens>
	                        </c:forTokens>
	                        </c:forTokens>
	                        </c:forTokens>
	                    </div>
                	</div>
                </c:if>
	                <c:if test="${not empty indiId }">
	                	<c:if test="${coverLetter_no == -1}">
			                <div class="resume" id="resume">
			                    <div class="fr">
			                        <h2>자기소개</h2>
			                    </div>
			                    <div class="content">
			                    	<c:forEach var="coverLetter" items="${coverLetter }" varStatus="st">
				                        <p id="reti">${coverLetter.title }</p>
				                        <c:set var="content" value="${coverLetter.content }"/>
				                        <c:set var="re_content" value="${fn:replace(content, escape, '<br>') }"/>
				                        <p style="word-wrap: break-word;">${re_content }</p>
			                        </c:forEach>
			                    </div>
			                </div>
		                </c:if>
	                </c:if>
	                <c:forEach var="coverLetter" items="${coverLetter }" varStatus="st">
						<c:if test="${coverLetter_no == coverLetter.no}">
			                <c:if test="${not empty indiId }">
			                	<c:if test="${coverLetter_no != 0}">
					                <div class="resume" id="resume">
					                    <div class="fr">
					                        <h2>자기소개</h2>
					                    </div>
					                    <div class="content">
					                        <p id="reti">${coverLetter.title }</p>
					                        <c:set var="content" value="${coverLetter.content }"/>
					                        <c:set var="re_content" value="${fn:replace(content, escape, '<br>') }"/>
					                        <p style="word-wrap: break-word;">${re_content }</p>
										</div>
									</div>
		                		</c:if>
	                		</c:if>
	                	</c:if>
					</c:forEach>
	                <c:if test="${not empty corpId }">
		                <div class="resume" id="resume">
		                    <div class="fr">
		                        <h2>자기소개</h2>
		                    </div>
		                    <div class="content">
		                    	<c:forEach var="coverLetter" items="${coverLetter }" varStatus="st">
		                    		<c:if test="${coverLetter_no == coverLetter.no}">
				                        <p id="reti">${coverLetter.title }</p>
				                        <c:set var="content" value="${coverLetter.content }"/>
				                        <c:set var="re_content" value="${fn:replace(content, escape, '<br>') }"/>
				                        <p style="word-wrap: break-word;">${re_content }</p>
			                        </c:if>
		                        </c:forEach>
		                    </div>
		                </div>
	                </c:if>
	                
                <form name="resumeForm" method="post">
                    <input type="hidden" name="resumNo" value="resumNo">
                    <div id="btn_box">
                        <div>
	                        <c:if test="${not empty indiId}">
	                            <button type="button" class="btn_" id="yes" onclick="location='/resume_writingmodify'"><span>수정</span></button>
                            	<button type="button" class="btn_" id="no" onclick="history.back();"><span>뒤로</span></button>
	                        </c:if>
                        	<c:if test="${not empty corpId}">
                        		<c:if test="${status == '미열람' || status == '열람'}">
		                            <input type="button" class="btn_" id="yes" value="수락" onclick="resume_accept()">
		                            <input type="button" class="btn_" id="no" value="거절" onclick="resume_refuse()">
                        		</c:if>
                        		<c:if test="${status == '수락'}">
                        			<div>수락한 이력서 입니다.</div>
                        		</c:if>
                        		<c:if test="${status == '거절'}">
                        			<div>거절한 이력서 입니다.</div>
                        		</c:if>
	                        </c:if>
                        </div>
                    </div>
                </form>
            </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>       