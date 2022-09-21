<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codling : 공고 관리</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/jobOpening_management.css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/jobOpening_management.js"></script>
</head>
<body onresize="update_screen_size()">
    <header>
        <div id="menu-bar">
            <div id="box_"></div>
            <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"><span id="mename"> ${name} 님</span> &nbsp;&nbsp;</div>
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
        <article id="resume">
            <h1>공고 관리</h1>
            <c:if test="${not empty allJobOpening}">
            <c:forEach var="jobOpening" items="${allJobOpening}">
            <div class="resumemg">
                <div class="resumemgbox" style="cursor: pointer;" onclick="location.href='job_accountment?no=${jobOpening.no}'">
                    <p><span>내가올린 공고</span></p>
                    <button type="button" id="applicant_status" onclick="status(event, '${jobOpening.no}')"><span>지원 현황</span></button>
                    <div class="resumemgbox2">
                        <p><span>${jobOpening.title}</span></p>
                        <table>
                            <tr>
                                <td>모집일자</td>
                                <td>${jobOpening.startDate} ~ ${jobOpening.endDate}</td>
                            </tr>
                            <tr>
                                <td>모집분야</td>
                                <td>
								<c:forEach var="field" items="${fields}" varStatus="st">
									<c:if test="${jobOpening.no == field.jobOpening_no}">
										<c:if test="${!st.last}">
											${field.name} / 
										</c:if>
										<c:if test="${st.last}">
											${field.name}
										</c:if>
									</c:if>
								</c:forEach>
								</td>
                            </tr>
                            <tr>
                                <td>경력여부</td>
                                <td>
                                <c:forEach var="field" items="${fields}" varStatus="st1">
                                	<c:if test="${jobOpening.no == field.jobOpening_no && !st1.last}">
                                		<c:forTokens var="career" items="${field.career}" delims="/" varStatus="st2">
											<c:if test="${!st2.last}">
												${career} or 
											</c:if>
											<c:if test="${st2.last}">
												<c:if test="${career == '신입'}">
													${career}
												</c:if>
												<c:if test="${career != '신입'}">
													${career}년↑
												</c:if>
											</c:if>
										</c:forTokens> / 
									</c:if>
									<c:if test="${jobOpening.no == field.jobOpening_no && st1.last}">
										<c:forTokens var="career" items="${field.career}" delims="/" varStatus="st2">
											<c:if test="${!st2.last}">
												${career} or 
											</c:if>
											<c:if test="${st2.last}">
												<c:if test="${career == '신입'}">
													${career}
												</c:if>
												<c:if test="${career != '신입'}">
													${career}년↑
												</c:if>
											</c:if>
										</c:forTokens>
									</c:if>
								</c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td>직급/직책</td>
                                <td>
                                <c:forEach var="field" items="${fields}" varStatus="st">
                                	<c:if test="${jobOpening.no == field.jobOpening_no}">
										<c:if test="${!st.last}">
											${field.position} / 
										</c:if>
										<c:if test="${st.last}">
											${field.position}
										</c:if>
									</c:if>
								</c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td>근무지 주소</td>
                                <td>${jobOpening.region}</td>
                            </tr>
                        </table>
                        <div class="chbtn-box">
                            <input type="button" onclick="updateChk(event, ${jobOpening.no})" name="update" id="update" value="수정">
                           	<input type="button" onclick="deleteChk(event)" name="delete" id="delete" value="삭제"/>
                       	</div>
                       	<form action="jobOpening_management?no=${jobOpening.no}" method="post" class="delForm"></form>
                    </div>
                </div>
            </div>
            </c:forEach>
            </c:if>
            <c:if test="${empty allJobOpening}">
	            <div class="resumemg" style="cursor: pointer; height: 165px;" onclick="location='jobOpening_writing'">
		                <div class="resumemgbox">
		                    <p><span>내가올린 공고</span></p>
		                    <div class="resumemgbox2">
		                        <h2>작성한 공고가 없습니다.</h2>
		                        <p>공고를 작성해주세요.</p>
		                    </div>
		                </div>
		            </div>
				</c:if>
            <div class="btn-res">
                <a href="jobOpening_writing"><button id="btn-res"><span class="btn-resspan">공고 작성</span></button></a>
            </div>
         </article>
    </section>
    <footer>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>