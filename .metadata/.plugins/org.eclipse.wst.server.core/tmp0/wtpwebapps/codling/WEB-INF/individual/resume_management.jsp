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
    <link rel="stylesheet" href="css/resume_management.css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/resume_management.js"></script>
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
                    <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
                    <li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
                </ul>
            </div>
    </header>
    <section>
       <article id="applyStatus">
            <h1>공고 지원 현황</h1>
            <div class="applybox">
                 <c:if test="${fn:length(applys) > 4}">
                     <button class="leftArrow"><img src="img/leftArrow.png"></button>
                  </c:if>
                <div class="applys">
                    <div class="applyWrap">
                        <ul class="apply">
                           <c:forEach var="apply" items="${applys}" varStatus="st">
                              <c:if test="${st.first || st.count % 4 == 1}">
                                  <li class="apply_item">
                               </c:if>
                                   <div class="app">
                                       <div class="app_content">
                                           <p><span>지원한 공고</span></p>
                                           <p class="apply_title">${apply.corporateName}</p>
                                           <p class="apply_field"><b>분야 &emsp; ${apply.fieldName}</b></p>
                                           <b>경력 &emsp;
                                              <c:forTokens var="career" items="${apply.career}" delims=" / ">
                                          <c:if test="${fn:length(apply.career) <= 3}">
                                               <c:if test="${career == '신입'}">
                                                 <span>${career}</span>
                                              </c:if>
                                              <c:if test="${career != '신입'}">
                                                 <span>${career}년↑</span>
                                              </c:if>
                                           </c:if>
                                        
                                           <c:if test="${fn:length(apply.career) > 3}">
                                              <c:if test="${career == '신입'}">
                                                 <span>${career} or</span>
                                              </c:if>
                                              <c:if test="${career != '신입'}">
                                                 <span>${career}년↑</span>&ensp;&ensp;
                                              </c:if>
                                           </c:if>
                                      </c:forTokens>
                                           </b><br>
                                           <b>급여 &emsp;
                                              <c:if test="${apply.pay == '면접 후 결정'}">
                                                 ${apply.pay}
                                              </c:if>
                                              <c:if test="${apply.pay != '면접 후 결정'}">
                                                 ${apply.pay}만↑
                                              </c:if>
                                           </b><br>
                                           <b>상태 &emsp; ${apply.status}</b><br>
                                       </div>
                                       <div class="viewInfo">
                                           <a href="jobOpening?no=${apply.jobOpening_no}">공고보기</a>
                                           <a href="resume_preview?id=${individual.id}&coverLetter_no=${apply.coverLetter_no}">이력서 보기</a>
                                       </div>
                                   </div>
                               <c:if test="${st.count % 4 == 0}">
                                  </li>
                               </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                 <c:if test="${fn:length(applys) > 4}">
                     <button class="rightArrow"><img src="img/rightArrow.png"></button>
                  </c:if>
            </div>
            <div id="btn_bar">
               <c:forEach var="apply" items="${applys}" varStatus="st">
                  <c:if test="${st.count < 9}">
                     <c:if test="${not st.first && st.count % 4 == 1}">
                         <button class="apply_bar"></button>
                         <button class="apply_bar"></button>
                      </c:if>
                  </c:if>
                  <c:if test="${st.count >= 9}">
                     <c:if test="${not st.first && st.count % 4 == 1}">
                         <button class="apply_bar"></button>
                      </c:if>
                  </c:if>
                </c:forEach>
            </div>
        </article>
        
        <c:if test="${empty education}">
	        <article id="resume">
	            <h1>이력서 관리</h1>
	            <div class="resumemg" style="cursor: pointer;" onclick="location.href='resume_writing'">
	                <div class="resumemgbox">
	                    <p><span>이력서</span></p>
	                    <div class="resumemgbox2">이력서가 없습니다. 이력서를 작성해 주세요</div>
	                </div>
	            </div>
	            <div class="btn-res">
	                <a href="resume_writing"><button id="btn-res">이력서 작성</button></a>
	            </div>
	        </article>
		</c:if>
		<c:if test="${not empty education}">
	        <article id="resume">
	            <h1>이력서 관리</h1>
	            <div class="resumemg" id="resumemg" style="cursor: pointer;" onclick="location.href='resume_preview?id=${individual.id}'">
	                <div class="resumemgbox">
	                    <p id="resumetop"><span>이력서</span></p>
	                    <p><span id="resume_title">${individual.resumeTitle}</span></p>
	                    <div class="resumemgbox2" id="resumemgbox2">
	                    	<div id="info">
	                    		<p>이름</p>
	                    		<p>경력</p>
	                    		<p>보유 기술 스택</p>
	                    		<p>보유 자격증</p>
	                    		<p>최종학력</p>
	                    		<p>휴대폰</p>
	                    		<p>이메일</p>
	                    		<p>주소</p>
	                    	</div>
	                    	<div id="myinfo">
	                    		<p>${individual.name}</p>
	                    		<p>
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
	                    		</p>
	                    		<p>
		                    		<c:if test="${not empty individual.stack}">
		                    			<c:forTokens var="stack" items="${individual.stack}" delims="/" varStatus="st">
		                    				 <c:if test="${!st.last}">
		                    				 	<span>${stack} · </span>
		                    				 </c:if>
		                    				 <c:if test="${st.last}">
		                    				 	<span>${stack}</span>
		                    				 </c:if>
		                    			</c:forTokens>
		                    		</c:if>
	                    		</p>
	                    		<p>
	                    			<c:if test="${empty license.name}">
		                    			보유하신 자격증이 있다면 등록 해주세요.
		                    		</c:if>
		                    		<c:if test="${not empty license.name}">
		                    			<c:forTokens var="license" items="${license.name}" delims="/" varStatus="st">
		                    				 <c:if test="${!st.last}">
		                    				 	<span>${license} · </span>
		                    				 </c:if>
		                    				 <c:if test="${st.last}">
		                    				 	<span>${license}</span>
		                    				 </c:if>
		                    			</c:forTokens>
		                    		</c:if>
	                    		</p>
	                    		<p>
	                    			<c:set var="lastschoolnum" value="0"/>
	                    			<c:set var="lastschool" value=""/>
	                    			<c:forTokens var="educations" items="${education.school}" delims=" / " varStatus="st">
	                    				<c:if test="${educations == '고등학교'}">
	                    					<c:set var="lastschoolnum" value="${lastschoolnum + 0.2}"/>
	                    				</c:if>
	                    				<c:if test="${educations == '대학교(2년)'}">
	                    					<c:set var="lastschoolnum" value="${lastschoolnum + 0.5}"/>
	                    				</c:if>
	                    				<c:if test="${educations == '대학교(4년)'}">
	                    					<c:set var="lastschoolnum" value="${lastschoolnum + 1}"/>
	                    				</c:if>
	                    				<c:if test="${educations == '대학원(석사)'}">
	                    					<c:set var="lastschoolnum" value="${lastschoolnum + 1}"/>
	                    				</c:if>
	                    				<c:if test="${educations == '대학원(박사)'}">
	                    					<c:set var="lastschoolnum" value="${lastschoolnum + 1}"/>
	                    				</c:if>
	                    			</c:forTokens>
	                    			<c:if test="${lastschoolnum == 0.2}">
	                    				<c:set var="lastschool" value="고등학교"/>
	                    			</c:if>
	                    			<c:if test="${lastschoolnum == 0.5}">
	                    				<c:set var="lastschool" value="대학교(2년)"/>
	                    			</c:if>
	                    			<c:if test="${lastschoolnum == 0.7}">
	                    				<c:set var="lastschool" value="대학교(2년)"/>
	                    			</c:if>
	                    			<c:if test="${lastschoolnum == 1}">
	                    				<c:set var="lastschool" value="대학교(4년)"/>
	                    			</c:if>
	                    			<c:if test="${lastschoolnum == 1.2}">
	                    				<c:set var="lastschool" value="대학교(4년)"/>
	                    			</c:if>
	                    			<c:if test="${lastschoolnum == 1.7}">
	                    				<c:set var="lastschool" value="대학교(4년)"/>
	                    			</c:if>
	                    			<c:if test="${lastschoolnum == 2.2}">
	                    				<c:set var="lastschool" value="대학원(석사)"/>
	                    			</c:if>
	                    			<c:if test="${lastschoolnum == 2.7}">
	                    				<c:set var="lastschool" value="대학원(석사)"/>
	                    			</c:if>
	                    			<c:if test="${lastschoolnum == 3.2}">
	                    				<c:set var="lastschool" value="대학원(박사)"/>
	                    			</c:if>
	                    			<c:if test="${lastschoolnum == 3.7}">
	                    				<c:set var="lastschool" value="대학원(박사)"/>
	                    			</c:if>
	                    			${lastschool}
								</p>
	                    		<p>
	                    			${fn:substring(individual.phone, 0, 3)} - ${fn:substring(individual.phone, 3, 7)} - ${fn:substring(individual.phone, 7, 11)}
	                    		</p>
	                    		<p>${individual.email}</p>
	                    		<p>${individual.address}&nbsp;${individual.detailAddress}</p>
	                    	</div>
	                    </div>
	                </div>
	            </div>
	            <div class="btn-res">
	                <a href="resume_writingmodify"><button id="btn-res">이력서 수정</button></a>
	            </div>
	        </article>
		</c:if>

        <article id="self">
            <h1>자기소개서 관리</h1>
            <c:if test="${empty coverLetters}">
	            <div class="self_box">
	                <div id="self_introduction">
	                    <p><span>자기소개서</span></p>
	                    <div class="self_introductionbox">자기소개서가 없습니다. 자기소개서를 작성해주세요</div>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty coverLetters}">
           		<c:forEach var="coverLetter" items="${coverLetters}">
	            	<div class="self_box">
		                <div id="self_introduction">
		                    <p><span>자기소개서</span></p>
		                    <div class="self_introductionbox">${coverLetter.title}</div>
		                    <div class="selfContent">${fn:replace(coverLetter.content, replacePrevChar, '<br>')}</div>
		                </div>
		            </div>
		            <div class="chbtn-box">
		                <input type="button" name="update" id="update" onclick="showUpdate(${coverLetter.no}, '${coverLetter.title}', '${fn:replace(coverLetter.content, replacePrevChar, replaceCurrChar)}')" value="수정">
		                <input type="button" name="delete" id="delete" onclick="self_delete(${coverLetter.no})" value="삭제" >
		            </div>
		        </c:forEach>
            </c:if>
            <div class="btn-sel">
                <input type="button" id="btn-sel" onclick="showWrite()" value="자기소개서 작성">
            </div>
        </article>
        <div id="self_inbox">
            <form name="selfFrm" method="post">
	            <article>
	                <h1>자기소개서</h1>
	                    <div id="self_introduction_box">
	                        <div id="self_box">
	                            <div id="self_title">
	                                <input name="selfTitle" id="input_title" placeholder="제목을 입력해 주세요.">
	                            </div>
	                            <div id="contents_box">
	                                <textarea name="selfContent" id="input_contents" placeholder="내용을 입력해 주세요."></textarea>
	                            </div>
	                        </div>
	                    </div>
	            </article>
	            <div id="btn-self">
	                <input type="button" class="btn-self" id="createBtn" onclick="self_check()" value="작성">
	                <input type="button" class="btn-self" id="updateBtn" onclick="self_update()" value="수정">
	                <input type="button" class="btn-self" onclick="hideWrite()" value="취소">
	                <input type="hidden" name="coverLetterNo">
	            </div>
            </form>
        </div>
    </section>
    <footer>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>       