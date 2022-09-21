<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="js/jobOpening_writing.js"></script>
    <link rel="stylesheet" href="css/jobOpening_writing.css">

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
                <li id="mypage"><a href="corporationInfo"><span>내 정보</span></a></li>
                <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
                <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
            </ul>
        </div>
    </header>
        <section>
		<form action="jobOpening_writing" method="post" name="jobOpForm">
       		<!-- 회사정보 -->
           	<h3>회사 정보</h3>
           	<article id="companyinfo">
                   <table>
                       <tr>
                           <td>회사명</td>
                           <td id="font_medium">${name}</td>
                       </tr>
                       <tr>
                           <td>근무지역*</td>
                           <td id="font_medium"><input name="address" id="address" size="60" placeholder="주소" readonly><input type="button" id="companyinfo_btn" onclick="findAddr()" value="주소찾기"></input></td>
                       </tr>
                       <tr>
                           <td></td>
                           <td id="font_medium"><input name="detailAddress" type="text" id="detailAddr" placeholder="상세주소" size="30"></td>
                       </tr>
                   </table>
           	</article>	
           	<!-- 제목 및 채용 일자 -->
           	<h3>제목 및 채용 일자</h3>
           	<article id="title">
                <table>
                    <tr>
                        <td>공고제목*</td>
                        <td id="font_medium"><input name="title" id="jobopening_title" size="60"></td>
                    </tr>
                    <tr>
                        <td>시작일*</td>
                        <td><input id="font_medium" name="startDate" type="date">&emsp;&emsp;&emsp;&emsp;&emsp;마감일*&emsp;&emsp;<input name="endDate" type="date"></input>
                        
                    </tr>
                </table>
           	</article>
           	<!-- 모집분야(추가 폼) -->
           	<div id="problem_list">
               	<h3>모집분야<input type="button" id="add" onclick="addForm();" value="추가"></h3>
           		<article class="field">
                    <table>
                        <tr>
                            <td>분야명*</td>
                            <td id="font_medium"><input name="name" size="60"></td>
                        </tr>
                        <tr>
                            <td>경력여부*</td>
                            <td id="font_medium">
                            	<input name="career_status" value="신입" type="checkbox"><label>&nbsp;신입&emsp;&emsp;</label>
                                <input name="career_status" value="경력" class="careerChk" type="checkbox"><label>&nbsp;경력&emsp;</label>
                                <input name="career_year" class="career_year" readonly> ※숫자(연차)만 입력
                                <input name="career" type="hidden">
                            </td>
                        </tr>
                        <tr>
                            <td>직급/직책*</td>
                            <td id="font_medium"><input name="position" size="30"></td>
                        </tr>
                        <tr>
                            <td>급여*</td>
                            <td id="font_medium">
	                            <input name="pay_" size="10" id="inputprice" id="comma" onkeyup="commas(this)" />&nbsp;만원 <span>&emsp;&emsp;
	                            <input type="checkbox" name="pay_" value="면접 후 결정"><label>&nbsp;면접 후 결정</label></span>
	                            <input type="hidden" name="pay">
                            </td>
                        </tr>
                        <tr>
                            <td>근무요일*</td>
                            <td id="font_medium">
                                <input name="workday" type="checkbox" value="주5일(월~금)"><label>&nbsp;주5일(월~금)</label>&emsp;
                                <input name="workday" type="checkbox" value="유연근무제"><label>&nbsp;유연근무제</label>&emsp;
                                <input name="workday" type="checkbox" value="면접 후 결정"><label>&nbsp;면접 후 결정</label>
                            </td>
                        </tr>
                        <tr>
                        	<td></td>
                        	<td>
                        		<div id="stacks"></div>
                        		<input type="hidden" name="stack">
                        		<input type="hidden" name="stackCount">
                        	</td>
                        </tr>
                        <tr>
                            <td>사용스택 및 툴*</td>
                            <td id="font_medium" class="stackTd">
	                            <input id="stack" name="keyword" onkeydown="keyDown(this)">
	                            <ul id="suggest" style="position: absolute; display: none; top: 48px;"></ul>
                            </td>
                        </tr>
                        <tr>
                            <td>주요업무*</td>
                            <td id="font_medium"><textarea id="textbox" name="work"></textarea>
                        </tr>
                        <tr>
                            <td>자격요건*</td>
                            <td id="font_medium"><textarea id="textbox" name="requirement"></textarea>
                        </tr>
                        <tr>
                            <td>우대사항*</td>
                            <td id="font_medium"><textarea id="textbox" name="preference"></textarea>
                        </tr>
                    </table>
           		</article>
           	</div>
           		<!-- 모집분야(삭제 폼) -->
           		<div id="list_file_tag" class="field_del">
           			<article class="field">
                    	<table>
                        	<button id="del" onclick="delForm(this);">삭제</button>
                        	<tr>
                            	<td>분야명*</td>
                            	<td id="font_medium"><input name="name" size="60"></td>
                        	</tr>
                        	<tr>
	                            <td>경력여부*</td>
	                            <td id="font_medium">
	                            	<input name="career_status" value="신입" type="checkbox"><label>&nbsp;신입&emsp;&emsp;</label>
	                                <input name="career_status" value="경력" class="careerChk" type="checkbox"><label>&nbsp;경력&emsp;</label>
	                                <input name="career_year" class="career_year" readonly> ※숫자(연차)만 입력
	                                <input name="career" type="hidden">
	                            </td>
                        	</tr>
                        	<tr>
	                            <td>직급/직책*</td>
	                            <td id="font_medium"><input name="position" size="30"></td>
                        	</tr>
                        	<tr>
	                            <td>급여*</td>
	                            <td id="font_medium">
	                            	<input name="pay_" id="comma" onkeyup="commas(this)" size="10">&nbsp;만원 <span>&emsp;&emsp;
	                            	<input type="checkbox" name="pay_" value="면접 후 결정"><label>&nbsp;면접 후 결정</label></span>
	                            	<input type="hidden" name="pay">
	                            </td>
                        	</tr>
                        	<tr>
	                            <td>근무요일*</td>
	                            <td id="font_medium">
	                                <input name="workday" type="checkbox" value="주5일(월~금)"><label>&nbsp;주5일(월~금)</label>&emsp;
	                                <input name="workday" type="checkbox" value="유연근무제"><label>&nbsp;유연근무제</label>&emsp;
	                                <input name="workday" type="checkbox" value="면접 후 결정"><label>&nbsp;면접 후 결정</label>
	                            </td>
                        	</tr>
                        	<tr>
	                        	<td></td>
	                        	<td>
	                        		<div id="stacks"></div>
	                        		<input type="hidden" name="stack">
	                        		<input type="hidden" name="stackCount">
	                        	</td>
	                        </tr>
	                        <tr>
	                            <td>사용스택 및 툴*</td>
	                            <td id="font_medium" class="stackTd">
		                            <input id="stack" name="keyword" onkeydown="keyDown(this)">
		                            <ul id="suggest" style="position: absolute; display: none; top: 48px;"></ul>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>주요업무*</td>
	                            <td id="font_medium"><textarea id="textbox" name="work"></textarea>
	                        </tr>
	                        <tr>
	                            <td>자격요건*</td>
	                            <td id="font_medium"><textarea id="textbox" name="requirement"></textarea>
	                        </tr>
	                        <tr>
	                            <td>우대사항*</td>
	                            <td id="font_medium"><textarea id="textbox" name="preference"></textarea>
	                        </tr>
                    	</table>
           			</article>
       			</div>
	            <!-- 기업소개 -->
	            <h3>채용절차</h3>
            <article id="process">
            	<table>
                    <tr>
                        <td>채용절차 및 기타 지원 유의사항</td>
                    </tr>
                    <tr>
                        <td id="font_medium"><textarea id="textbox" name="process"></textarea></td>
                    </tr>
                </table>
            </article>
		    <!-- 등록버튼 -->
		    <div id="submit">
		        <input type="button" onclick="insertJobOpeningCheck()" value="등록">
		    </div>
   		</form>
   	</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>