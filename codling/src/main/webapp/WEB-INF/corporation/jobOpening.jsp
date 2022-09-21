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
    <title>Document</title>
    <link rel="stylesheet" href="css/jobOpening.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=370fa568d4acbeb9115655e735792c45&libraries=services"></script>
</head>
<body>
	<div id="main">
    <header>
    <div class="header_Wrap header_top">
        <div class="logo-default">
            <a href="index"><img src="img/logo.png"></a>
        </div>
        <ul id="header_menu">
            <li><a href="newcomer">신입채용</a></li>
            <li><a href="career">경력채용</a></li>
            <li><a href="top100">Top100</a></li>
        </ul>
        <form class="search_box" action="search" id="searbox">
            <input id="searchbox"type="text" name="search" placeholder="검색어를 입력하세요.">
        </form>
            <input type="submit" form="searbox" style="cursor: pointer;" class="search" value="">
            <c:if test="${empty indiId && empty corpId}">
            	<button type="button" id="log" onclick="location.href='login'">Login</button>
            </c:if>
            <c:if test="${not empty indiId && empty corpId}">
            
            </c:if>
            <c:if test="${empty indiId && not empty corpId}">
            
            </c:if>
            
            <c:if test="${not empty indiId && empty corpId}">
	            <div id="profile-box" class="profile-box">
	              <div id="scroll-hover-box" class="pf-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> <span id=name>${indiName} 님</span> &nbsp;&nbsp;</div>
	              <div id="scroll-profile-hover" class="pfhover">
	                <ul>
	                    <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
	                    <li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
	                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
	                </ul>
	              </div>
	            </div>
            </c:if>
            
            <c:if test="${empty indiId && not empty corpId}">
	            <div id="profile-box" class="profile-box">
	              <div id="scroll-hover-box" class="pf-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> <span id=name>${corpName} 님</span> &nbsp;&nbsp;</div>
	              <div id="scroll-profile-hover" class="pfhover">
	                <ul>
	                    <li id="mypage"><a href="corporationInfo"><span>내 정보</span></a></li>
	                    <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
	                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
	                </ul>
	              </div>
	            </div>
            </c:if>
            
    </div>
</header>
<div id="downmenu">
    <nav id="downupmenu">
        <div class="header_Wrap">
                <div id="title_box">
                    <div class="title_container">
                        <span class="title">${jobOpening.title}</span>
                        <div class="title_inside">
                            <span>${corporation.corporateName}</span>&ensp;&ensp;
	                        <c:forEach var="field" items="${fields}">
                        		<span>${field.name} | </span>
	                			<c:forTokens var="career" items="${field.career}" delims=" / " varStatus="st">
	                				<c:if test="${fn:length(field.career) <= 3}">
	                					<c:if test="${career == '신입'}">
				                			<span>${career}</span>&ensp;&ensp;
				                		</c:if>
				                		<c:if test="${career != '신입'}">
				                			<span>${career}년↑</span>&ensp;&ensp;
				                		</c:if>
				                	</c:if>
				                
				                	<c:if test="${fn:length(field.career) > 3}">
				                		<c:if test="${career == '신입'}">
				                			<span>${career} or</span>
				                		</c:if>
				                		<c:if test="${career != '신입'}">
				                			<span>${career}년↑</span>&ensp;&ensp;
				                		</c:if>
				                	</c:if>
				                </c:forTokens>
                            </c:forEach>
                        </div>
                    </div>
                <c:if test="${not empty indiId}">
                	<div class="apply"><a onclick="popupShow()">지원하기</a></div>
                </c:if>
                <c:if test="${not empty corpId}">
                	<div class="apply"></div>
                </c:if>
                <c:if test="${empty indiId && empty corpId}">
                	<div class="apply"><a onclick="alert('공고 지원은 개인회원만 가능합니다.\n로그인 후 이용하시기 바랍니다.'); location.href = 'login'">지원하기</a></div>
                </c:if>
            </div>
        </div>
    </nav>
</div>
<section>
    <div class="titleWrap">
        <div class="top_title_container">
            <div id="top_title_container">
                <span class="title">${jobOpening.title}</span><br>
                <span class="corpName">${corporation.corporateName}</span>&ensp;&ensp;
				<c:forEach var="field" items="${fields}">
               		<span>${field.name} | </span>
	                <c:forTokens var="career" items="${field.career}" delims=" / " varStatus="st">
	             		<c:if test="${fn:length(field.career) <= 3}">
	             			<c:if test="${career == '신입'}">
	                			<span class="corpCarrer">${career}</span>&ensp;&ensp;
	                		</c:if>
	                		<c:if test="${career != '신입'}">
	                			<span class="corpCarrer">${career}년↑</span>&ensp;&ensp;
	                		</c:if>
	                	</c:if>
	                
	                	<c:if test="${fn:length(field.career) > 3}">
	                		<c:if test="${career == '신입'}">
	                			<span class="corpCarrer">${career} or</span>
	                		</c:if>
	                		<c:if test="${career != '신입'}">
	                			<span class="corpCarrer">${career}년↑</span>&ensp;&ensp;
	                		</c:if>
	                	</c:if>
	                </c:forTokens>
                </c:forEach>
            </div>
            <div id="apply_box">
            	<c:if test="${not empty indiId}">
                	<div class="apply" id="top_apply"><a onclick="popupShow()">지원하기</a></div>
                </c:if>
                <c:if test="${not empty corpId}">
                	<div class="apply" id="top_apply"></div>
                </c:if>
                <c:if test="${empty indiId && empty corpId}">
                	<div class="apply" id="top_apply"><a onclick="alert('공고 지원은 개인회원만 가능합니다.\n로그인 후 이용하시기 바랍니다.'); location.href = 'login'">지원하기</a></div>
                </c:if>
            </div>
        </div>
    </div>
    <c:forEach var="field" items="${fields}">
    	<hr>
        <article>
        	<div class="contents">
        		<h2>모집분야</h2>
	                <div class="inContent">
	                    <span class="content">${field.name}</span>
	                </div>
	            <h2>주요업무</h2>
	                <div class="inContent">
	                    <span class="content">${fn:replace(field.work, replaceChar, '</br>')}</span>
	                </div>
	            <h2>자격요건</h2>
	                <div class="inContent">
	                    <span class="content">${fn:replace(field.requirement, replaceChar, '</br>')}</span>
	                </div>
	            <h2>우대사항</h2>
	            <div class="inContent">
	                <span class="content">${fn:replace(field.preference, replaceChar, '</br>')}</span>
	            </div>
	            <h2>사용스택 및 툴</h2>
	                <div class="corpStacks">
	                	<c:forTokens var="stack" items="${field.stack}" delims="/">
	                    	<span class="stack">${stack}</span>
	                    </c:forTokens>
	                </div>
			</div>
		</article>
	</c:forEach>
	<hr>
	<article>
        <div class="contents">
            <h2>채용절차 및 기타 지원 유의사항</h2>
            <div class="inContent">
                <span class="content">${fn:replace(jobOpening.process, replaceChar, '</br>')}</span>
            </div>
        </div>
    </article>
    <div id="hr">   
        <hr>
    </div>
        <div id="comcon">
            <div>
                <p><span>모집일</span>${fn:replace(jobOpening.startDate, "-", ".")} - ${fn:replace(jobOpening.endDate, "-", ".")}</p>
                <p><span>근무지역</span>${jobOpening.region} ${jobOpening.detailRegion}</p>
            </div>
        </div>
        <div id="companyInfo">
            <div class="companyInfo">
                <div class="comLogo">
                	<c:forEach var="JobOpenings" items="${allJobOpenings }" varStatus="">
	                	<c:if test="${no == JobOpenings.no}">
	                		<img src="/upload/${JobOpenings.logo_fileName }" alt="회사로고">
	                	</c:if>
                	</c:forEach>
                </div>
                <dl>
                    <dt>기 업 명</dt>
                        <dd>${corporation.corporateName}</dd>                  
                    <dt>연 락 처</dt>
                        <dd>${fn:substring(corporation.corporatePhone, 0, 3)}-${fn:substring(corporation.corporatePhone, 3, 7)}-${fn:substring(corporation.corporatePhone, 7, 11)}</dd>   
                    <dt>대표자명</dt>
                        <dd>${corporation.ceoName}</dd>
                    <dt>주 &ensp;&ensp; 소</dt>
                        <dd>${corporation.address} ${corporation.detailAddress}</dd>
                </dl>
            </div>
        </div>
        <div id="hr">   
            <hr>
        </div>
		<input type="hidden" id="area" value="${jobOpening.region} ${jobOpening.detailRegion}">
		<input type="hidden" id="corpName" value="${corporation.corporateName}">
		<div id="mapWrap">
        	<div id="map"></div>
        </div>
        <div id="hr">   
            <hr>
        </div>
        <div id="dldddt">
	        <div class="jobs">
	        	<c:set var="job_length" value="${fn:length(allJobOpenings) }"/>
	        	<c:forEach var="JobOpenings" items="${allJobOpenings }" begin="${no }" end="${no+5}" varStatus="st">
		            <dl onclick="location='jobOpening?no=${JobOpenings.no}'" style="cursor: pointer;">
		                <dt><img src="/upload/${JobOpenings.logo_fileName }"></dt>
		                <dd>${JobOpenings.title}</dd>
		                <dd>${JobOpenings.corporateName}</dd>
		                <dd>${JobOpenings.stack}</dd>
		                <dd>
		                	<c:forEach var="field" items="${JobOpenings.name}">
		                		${JobOpenings.name} | 
			                	<c:forTokens var="career" items="${JobOpenings.career}" delims=" / " varStatus="st">
			            			<c:if test="${fn:length(JobOpenings.career) <= 3}">
			              				<c:if test="${career == '신입'}">
				                			<span>${career}</span>&ensp;&ensp;
				                		</c:if>
				                		<c:if test="${career != '신입'}">
				                			<span>${career}년↑</span>&ensp;&ensp;
				                		</c:if>
				                	</c:if>
				                
				                	<c:if test="${fn:length(JobOpenings.career) > 3}">
				                		<c:if test="${career == '신입'}">
				                			<span>${career} or</span>
				                		</c:if>
				                		<c:if test="${career != '신입'}">
				                			<span>${career}년↑</span>&ensp;&ensp;
				                		</c:if>
				                	</c:if>
						        </c:forTokens>
					        </c:forEach>
		                </dd>
		                <dd>급여 | 
							<c:if test="${JobOpenings.pay == '면접 후 결정'}">
								${JobOpenings.pay}
							</c:if>
							<c:if test="${JobOpenings.pay != '면접 후 결정'}">
								${JobOpenings.pay} 만원
							</c:if>
						</dd>
		            </dl>
	            </c:forEach>
	            <c:set var="job_index" value="${no - (job_length-5) }" />
	            <c:if test="${no > job_length-6}">
	            	<c:forEach var="JobOpeningtwo" items="${allJobOpeningtwo }" begin="0" end="${job_index }">
		            	<dl onclick="location='jobOpening?no=${JobOpeningtwo.no}'" style="cursor: pointer;">
		                <dt><img src="/upload/${JobOpeningtwo.logo_fileName }"></dt>
		                <dd>${JobOpeningtwo.title}</dd>
		                <dd>${JobOpeningtwo.corporateName}</dd>
		                <dd>${JobOpeningtwo.stack}</dd>
		                <dd>
		                	<c:forEach var="field" items="${JobOpeningtwo.name}">
		                		${JobOpeningtwo.name} | 
			                	<c:forTokens var="career" items="${JobOpeningtwo.career}" delims=" / ">
			            			<c:if test="${fn:length(JobOpeningtwo.career) <= 3}">
			              				<c:if test="${career == '신입'}">
				                			<span>${career}</span>&ensp;&ensp;
				                		</c:if>
				                		<c:if test="${career != '신입'}">
				                			<span>${career}년↑</span>&ensp;&ensp;
				                		</c:if>
				                	</c:if>
				                
				                	<c:if test="${fn:length(JobOpeningtwo.career) > 3}">
				                		<c:if test="${career == '신입'}">
				                			<span>${career} or</span>
				                		</c:if>
				                		<c:if test="${career != '신입'}">
				                			<span>${career}년↑</span>&ensp;&ensp;
				                		</c:if>
				                	</c:if>
						        </c:forTokens>
					        </c:forEach>
		                </dd>
		                <dd>급여 | 
							<c:if test="${JobOpeningtwo.pay == '면접 후 결정'}">
								${JobOpeningtwo.pay}
							</c:if>
							<c:if test="${JobOpeningtwo.pay != '면접 후 결정'}">
								${JobOpeningtwo.pay} 만원
							</c:if>
						</dd>
		            	</dl>
		            </c:forEach>
				</c:if>
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
	</div>
	<!-- 지원하기 클릭 시 -->
	<div id="apply">
		<form action="jobOpening" method="post" name="applyForm">
		    <div id="apply_logo">
		    	<div></div>
		        <img src="img/logo.png">
		        <span id="exit">
		        	<img src="img/exit.png" onclick="popupHide()">
		        </span>
		    </div>
		    <div id="field">
		        <h1>지원분야</h1>
		        <div id="selectField">
		            <select name="fieldName" id="selField">
		                <option value="" selected>지원분야를 선택해 주세요.</option>
		                <c:forEach var="field" items="${fields}">
			                <option value="${field.no}">${field.name}</option>
		                </c:forEach>
		            </select>
		        </div>
		    </div>
		    <h1 id="self">자기소개서</h1>
		    <article id="applyStatus">
		    	<c:if test="${not empty coverLetters}">
			        <div class="applybox">
			            <span class="leftArrow"><img src="img/leftArrow.png"></span>
			            <div class="applys">
			                <div class="applyWrap">
			                    <ul class="apply_coverLetter">
			                        <c:forEach var="coverLetter" items="${coverLetters}" varStatus="st">
			                        	<c:if test="${st.first || st.count % 3 == 1}">
			                        		<li class="apply_item">
			                        	</c:if>
			                        		<div class="app">
				                                <div class="app_content">
				                                    <p><span>자기소개서</span></p>
				                                    <p class="apply_title">${coverLetter.title}</p>
				                                </div>
			                                	<input type="button" class="choice" value="선택하기" onclick="choice(this, ${coverLetter.no})">
			                            	</div>
				                        <c:if test="${st.count % 3 == 0}">
			                        		</li>
			                        	</c:if>
			                        </c:forEach>
			                    </ul>
			                </div>
			            </div>
			            <span type="button" class="rightArrow"><img src="img/rightArrow.png"></span>
			        </div>
			        <div id="btn_bar">
			        	<c:forEach var="coverLetter" items="${coverLetters}" varStatus="st">
			        		<c:if test="${st.first || st.count % 3 == 1}">
			            		<input type="button" class="apply_bar">
			            	</c:if>
			            </c:forEach>
			        </div>
			    </c:if>
			    <c:if test="${empty coverLetters}">
			    	<div id="resume_empty">
			    		<div>
			    			<h2>자기소개서가 없습니다.</h2>
			    			<p>자기소개서를 작성하시겠습니까?</p>
			    			<a id="resume_empty_href" href="resume_management">작성하러 가기</a>
			    		</div>
			    	</div>
			    </c:if>
		        <div id="applyBtn_wrap">
		            <input type="button" value="지원하기" id="applyBtn" onclick="applyChk()">
		        </div>
		    	<input type="hidden" name="coverLetterNo">
		    </article>
		</form>
	</div>
</body>
<script src="jQuery/jquery-3.6.0.min.js"></script>
<script src="js/jobOpening.js"></script>
</html>