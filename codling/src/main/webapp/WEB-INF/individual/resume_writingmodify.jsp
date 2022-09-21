<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codling : 이력서 수정</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="css/resume_writingmodify.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/resume_writingmodify.js"></script>
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
    <!--이력서제목-->
    <form action="resume_writingmodify" name="resume_Frm" method="post" enctype="multipart/form-data">
    <section>
        <h2><b>이력서 제목</b></h2>
        <div><input name="resumetitle" class="resume_title" placeholder="이력서 제목을 입력하세요" value="${individual.resumeTitle}"></div>
    </section>
    <!--학력사항-->
    <section>
    	<c:forTokens var="school" items="${education.school}" begin="0" end="0" delims=" / ">
    	<c:forTokens var="schoolName" items="${education.schoolName }" begin="0" end="0" delims="/">
    	<c:forTokens var="schoolStartDate" items="${education.schoolStartDate}" begin="0" end="0" delims=" / ">
    	<c:forTokens var="schoolEndDate" items="${education.schoolEndDate}" begin="0" end="0" delims=" / ">
    	<c:forTokens var="status" items="${education.status}" begin="0" end="0" delims=" / ">
    	<c:forTokens var="department" items="${education.department }" begin="0" end="0" delims="/">
    	<c:forTokens var="score" items="${education.score }" begin="0" end="0" delims=" / ">
	        <div id="problem_list">
	            <h2><input type="button" class="edu_add" value="추가" onclick="addForm();">학력사항</h2>
	            <div class="eduLevelbox">
	            <button type="button" class="edu_del" onclick="delForm(this);">삭제</button>
	            <br><br>
	                <table class="edu_level_info">
	                     <tr>
	                         <td><p>학력 * 
	                            <select name="school_update" onchange="schoolchange()" class="edu_select" required>
		                            <option value="">선택</option>
		                            <option value="고등학교" <c:if test="${school == '고등학교'}">selected="selected" </c:if>>고등학교</option>
		                            <option value="대학교(2년)" <c:if test="${school == '대학교(2년)'}">selected="selected" </c:if>>대학교(2년)</option>
		                            <option value="대학교(4년)" <c:if test="${school == '대학교(4년)'}">selected="selected" </c:if>>대학교(4년)</option>
		                            <option value="대학원(석사)" <c:if test="${school == '대학원(석사)'}">selected="selected" </c:if>>대학원(석사)</option>
		                            <option value="대학원(박사)" <c:if test="${school == '대학원(박사)'}">selected="selected" </c:if>>대학원(박사)</option>
	                            </select>
	                        </p></td>
	                     </tr>
	                     <tr>
	                        <td><p>학교명 *<input name="schoolName_update" id="uni_name" class="infoForm2" placeholder=" 학교명을 입력하세요" value="${schoolName }"></p></td>
	                     </tr>
	                     <tr>
	                        <td><p id="qqq2"><span>재학기간 *</span><input type="date" name="schoolStartDate_update" id="start" value="${schoolStartDate}"><span class="qqqtext"> ~ </span><input type="date" name="schoolEndDate_update" class="infoForm2" value="${schoolEndDate}">
	                            <select name="status_update" class="edu_select2" required>
	                                <option value="" disabled selected>선택</option>
                                	<option value="졸업" <c:if test="${status == '졸업'}">selected="selected"</c:if>>졸업</option>
                                	<option value="졸업예정" <c:if test="${status == '졸업예정'}">selected="selected"</c:if>>졸업예정</option>
                                	<option value="재학" <c:if test="${status == '재학'}">selected="selected"</c:if>>재학</option>
                                	<option value="휴학" <c:if test="${status == '휴학'}">selected="selected"</c:if>>휴학</option>
	                            </select>
	                        </p></td>
	                     </tr>
	                     <tr>
	                        <td><p>학과명<input name="department_update" id="major" class="infoForm2" placeholder=" 학과명을 입력하세요" value="${department }"></p></td>
	                     </tr>
		                     <tr>
		                        <td>
		                        	<p id="grade" class="grade"><span>학점</span><input type="text" name="score_update" id="insertgrade" placeholder=" 본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');" value="${score }"/>
		                            	<span class="gradetext">/</span><input type="text" class="infoForm2" placeholder=" 4.5" readonly>
		                            </p>
		                     	</td>
		                    </tr>
	                </table>
	                 <p id="description">※ 재학 휴학 졸업예정 이라면 졸업년도에 현재 날자를 입력해 주세요.</p>
	            </div> 
	        </div>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        
    	<c:forTokens var="school" items="${education.school}" begin="1" delims=" / " varStatus="st">
    	<c:forTokens var="schoolName" items="${education.schoolName }" begin="${st.index }" end="${st.index }" delims="/">
    	<c:forTokens var="schoolStartDate" items="${education.schoolStartDate}" begin="${st.index }" end="${st.index }" delims=" / ">
    	<c:forTokens var="schoolEndDate" items="${education.schoolEndDate}" begin="${st.index }" end="${st.index }" delims=" / ">
    	<c:forTokens var="status" items="${education.status}" begin="${st.index }" end="${st.index }" delims=" / ">
    	<c:forTokens var="department" items="${education.department }" begin="${st.index }" end="${st.index }" delims="/">
    	<c:forTokens var="score" items="${education.score }" begin="${st.index }" end="${st.index }" delims=" / ">
	        <div id="edu_level_info_input" class="list_file_tag_input"> 
	            <div class="eduLevelbox"> 
	            <button type="button" class="edu_del" onclick="delForm(this);">삭제</button>
	                <table class="edu_level_info">
	                     <tr>
	                         <td><p>학력 * 
	                            <select name="school_update" onchange="schoolchange()" class="edu_select" required>
	                            <option value="">선택</option>
	                            <option value="">선택</option>
		                            <option value="고등학교" <c:if test="${school == '고등학교'}">selected="selected" </c:if>>고등학교</option>
		                            <option value="대학교(2년)" <c:if test="${school == '대학교(2년)'}">selected="selected" </c:if>>대학교(2년)</option>
		                            <option value="대학교(4년)" <c:if test="${school == '대학교(4년)'}">selected="selected" </c:if>>대학교(4년)</option>
		                            <option value="대학원(석사)" <c:if test="${school == '대학원(석사)'}">selected="selected" </c:if>>대학원(석사)</option>
		                            <option value="대학원(박사)" <c:if test="${school == '대학원(박사)'}">selected="selected" </c:if>>대학원(박사)</option>
	                            </select>
	                        </p></td>
	                     </tr>
	                     <tr>
	                        <td><p>학교명 *<input name="schoolName_update" id="uni_name" class="infoForm2" placeholder="학교명을 입력하세요" value="${schoolName }"></p></td>
	                     </tr>
	                     <tr>
	                        <td><p id="qqq2"><span>재학기간 *</span><input type="date" name="schoolStartDate_update" id="start" value="${schoolStartDate}"><span class="qqqtext"> ~ </span><input type="date" name="schoolEndDate_update" class="infoForm2" value="${schoolEndDate}">
	                            <select name="status_update" class="edu_select2" required>
	                                <option value="졸업" <c:if test="${status == '졸업'}">selected="selected"</c:if>>졸업</option>
                                	<option value="졸업예정" <c:if test="${status == '졸업예정'}">selected="selected"</c:if>>졸업예정</option>
                                	<option value="재학" <c:if test="${status == '재학'}">selected="selected"</c:if>>재학</option>
                                	<option value="휴학" <c:if test="${status == '휴학'}">selected="selected"</c:if>>휴학</option>
	                            </select></p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td><p>학과명<input name="department_update" id="major" class="infoForm2" placeholder="학과명을 입력하세요" value="${department }"></p></td>
	                    </tr>
		                    <tr>
		                        <td>
		                        	<p id="grade" class="grade"><span>학점</span><input type="text" name="score_update" id="insertgrade" placeholder="본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');" value="${score }"/>
		                            	<span class="gradetext">/</span><input type="text" class="infoForm2" value="4.5" readonly>
		                            </p>
		                     	</td>
		                    </tr>
	                </table> 
	                <p id="description">※ 재학 휴학 졸업예정 이라면 졸업년도에 현재 날자를 입력해 주세요.</p>
	            </div> 
	        </div>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        
        <div id="edu_level_info" class="list_file_tag"> 
            <div class="eduLevelbox"> 
            <button type="button" class="edu_del" onclick="delForm(this);">삭제</button>
                <table class="edu_level_info">
                     <tr>
                         <td><p>학력 * 
                            <select name="school_update" onchange="schoolchange()" class="edu_select" required>
                            <option value="">선택</option>
                            <option value="고등학교">고등학교</option>
                            <option value="대학교(2년)">대학교(2년)</option>
                            <option value="대학교(4년)">대학교(4년)</option>
                            <option value="대학원(석사)">대학원(석사)</option>
                            <option value="대학원(박사)">대학원(박사)</option>
                            </select>
                        </p></td>
                     </tr>
                     <tr>
                        <td><p>학교명 *<input name="schoolName_update" id="uni_name" class="infoForm2" placeholder="학교명을 입력하세요"></p></td>
                     </tr>
                     <tr>
                        <td><p id="qqq2"><span>재학기간 *</span><input type="date" name="schoolStartDate_update" id="start"><span class="qqqtext"> ~ </span><input type="date" name="schoolEndDate_update" class="infoForm2">
                            <select name="status_update" class="edu_select2" required>
                                <option value="" disabled selected>선택</option>
                                <option value="졸업">졸업</option>
                                <option value="졸업예정">졸업예정</option>
                                <option value="재학">재학</option>
                                <option value="휴학">휴학</option>
                            </select></p>
                        </td>
                    </tr>
                    <tr>
                        <td><p>학과명<input name="department_update" id="major" class="infoForm2" placeholder="학과명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td><p id="grade" class="grade"><span>학점</span><input type="text" name="score_update" id="insertgrade" placeholder="본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"/>
                            <span class="gradetext">/</span><input type="text" class="infoForm2" value="4.5" readonly></p>
                     	</td>
                    </tr>
                </table> 
                <p id="description">※ 재학 휴학 졸업예정 이라면 졸업년도에 현재 날자를 입력해 주세요.</p>
            </div> 
        </div>

    </section>
    <!--보유기술스택-->
    <section>
        <h2>보유기술스택</h2>
        <article id="stackbox">
        <div id="stack_box">
            <h3>기술스택</h3>
            <div id="stc_box">
            	<div id="stc_box2"></div>
            	<div id="stacks" name="sel" size="10">
            		<c:forTokens var="stack" items="${individual.stack}" delims="/">
	            		<div class="st">
	            			<div class="stack">
								${stack}
							</div>
	            			<div onclick="parentElement.remove(this)" style="cursor:pointer"> X </div>
	            		</div>
            		</c:forTokens>
            	</div>
            </div>
            <input id="stack" name="keyword" onkeydown="keyDown()">
            <ul id="suggest" style="display:none; position:relative; top:-15px;"></ul>
            <input type="hidden" name="stack" id="st">
        </div>
        </article>
    </section>
    <!--경력사항-->
    <section>
    
    	<c:forTokens var="prev_company" items="${career.prev_company }" begin="0" end="0" delims="/" varStatus="st">
    	<c:forTokens var="tenureStart" items="${career.tenureStart }" begin="0" end="0" delims=" / " varStatus="st">
    	<c:forTokens var="tenureEnd" items="${career.tenureEnd }" begin="0" end="0" delims=" / " varStatus="st">
    	<c:forTokens var="position" items="${career.position }" begin="0" end="0" delims="/" varStatus="st">
    	<c:forTokens var="department" items="${career.department }" begin="0" end="0" delims="/" varStatus="st">
    	<c:forTokens var="work_content" items="${career.work_content }" begin="0" end="0" delims="/" varStatus="st">
	        <div id="problem_list2">
	            <h2>경력사항<input type="button" class="ex_add" value="추가" onclick="addForm2();"></h2>
	            <div id="experiencebox">
				<button type="button" class="ex_del" onclick="delForm2(this);">삭제</button>
	                <table id= "ex_info_box">
		                <tr>
		                    <td><p> 회사 명 * <input name="prev_company_update" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요" value="${prev_company }"> </p></td>
		                </tr>
		                <tr>
		                    <td><p id="qqq"><span>재직기간 *</span><input type="date" name="tenureStart_update" class="infoForm4" value="${tenureStart }">
		                        <span class="qqqtext"> ~ </span><input type="date" name="tenureEnd_update" class="infoForm4" value="${tenureEnd }"></p></td>
		                </tr>
		                <tr>
		                    <td> <p>직급/직책 *<input name="position_update" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요" value="${position }"></p></td>
		                </tr>
		                <tr>
		                    <td><p>근무 부서 <input name="company_department_update" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요" value="${department }"></p></td>
		                </tr>
		                <tr>
		                    <td><p>주요업무<textarea name="work_content_update" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail">${work_content }</textarea></p></td>
		                </tr>
	            	</table> 
	        	</div>
	        </div>
		</c:forTokens>
		</c:forTokens>
		</c:forTokens>
		</c:forTokens>
		</c:forTokens>
		</c:forTokens>
		
		<c:if test="${career.prev_company == ''}">
			<div id="problem_list2">
	            <h2>경력사항<input type="button" class="ex_add" value="추가" onclick="addForm2();"></h2>
	            <div id="experiencebox">
				<button type="button" class="ex_del" onclick="delForm2(this);">삭제</button>
	                <table id= "ex_info_box">
		                <tr>
		                    <td><p> 회사 명 * <input name="prev_company_update" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요"> </p></td>
		                </tr>
		                <tr>
		                    <td><p id="qqq"><span>재직기간 *</span><input type="date" name="tenureStart_update" class="infoForm4">
		                        <span class="qqqtext"> ~ </span><input type="date" name="tenureEnd_update" class="infoForm4"></p></td>
		                </tr>
		                <tr>
		                    <td> <p>직급/직책 *<input name="position_update" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요"></p></td>
		                </tr>
		                <tr>
		                    <td><p>근무 부서 <input name="company_department_update" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요"></p></td>
		                </tr>
		                <tr>
		                    <td><p>주요업무<textarea name="work_content_update" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail"></textarea></p></td>
		                </tr>
	            	</table> 
	        	</div>
	        </div>
		</c:if>
		
		<c:forTokens var="prev_company" items="${career.prev_company }" begin="1" delims="/" varStatus="st">
    	<c:forTokens var="tenureStart" items="${career.tenureStart }" begin="${st.index }" end="${st.index }" delims=" / ">
    	<c:forTokens var="tenureEnd" items="${career.tenureEnd }" begin="${st.index }" end="${st.index }" delims=" / ">
    	<c:forTokens var="position" items="${career.position }" begin="${st.index }" end="${st.index }" delims="/">
    	<c:forTokens var="department" items="${career.department }" begin="${st.index }" end="${st.index }" delims="/">
    	<c:forTokens var="work_content" items="${career.work_content }" begin="${st.index }" end="${st.index }" delims="/">
        	<div id="experienced_info_input" class="list_file_tag_input"> 
	            <div id="experiencebox">
					<button type="button" class="ex_del" onclick="delForm2(this);">삭제</button>
	                <table id= "ex_info_box">        
		                <tr>
		                    <td><p>회사 명 * <input name="prev_company_update" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요" value="${prev_company }"> </p></td>
		                </tr>
		                <tr>
		                    <td><p id="qqq"><span>재직 기간 *</span><input type="date" name="tenureStart_update" class="infoForm4" value="${tenureStart }">
		                        <span class="qqqtext"> ~ </span><input type="date" name="tenureEnd_update" class="infoForm4" value="${tenureEnd }"></p></td>
		                </tr>
		                <tr>
		                    <td> <p>직급/직책 *<input name="position_update" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요" value="${position }"></p></td>
		                </tr>
	                    <tr>
		                    <td><p>근무 부서 <input name="company_department_update" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요" value="${department }"></p></td>
		                </tr>
		                <tr>
		                    <td><p>주요 업무<textarea name="work_content_update" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail">${work_content }</textarea></p></td>
		                </tr>
		           	</table>
	            </div> 
        	</div>
        </c:forTokens>
		</c:forTokens>
		</c:forTokens>
		</c:forTokens>
		</c:forTokens>
		</c:forTokens>
        
        <div id="experienced_info" class="list_file_tag"> 
            <div id="experiencebox">
				<button type="button" class="ex_del" onclick="delForm2(this);">삭제</button>
                <table id= "ex_info_box">        
	                <tr>
	                    <td><p>회사 명 * <input name="prev_company_update" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요"> </p></td>
	                </tr>
	                <tr>
	                    <td><p id="qqq"><span>재직 기간 *</span><input type="date" name="tenureStart_update" class="infoForm4">
	                        <span class="qqqtext"> ~ </span><input type="date" name="tenureEnd_update" class="infoForm4"></p></td>
	                </tr>
	                <tr>
	                    <td> <p>직급/직책 *<input name="position_update" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요"></p></td>
	                </tr>
                    <tr>
	                    <td><p>근무 부서 <input name="company_department_update" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요"></p></td>
	                </tr>
	                <tr>
	                    <td><p>주요 업무<textarea name="work_content_update" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail"></textarea></p></td>
	                </tr>
	           	</table>
            </div> 
        </div>
    </section>
    <!--자격증-->
    <section>
    <c:forTokens var="license_name" items="${license.name}" begin="0" end="0" delims=" / " varStatus="st">
    <c:forTokens var="license_agency" items="${license.agency}" begin="0" end="0" delims=" / ">
    <c:forTokens var="license_pass" items="${license.pass}" begin="0" end="0" delims=" / ">
    <c:forTokens var="license_acquireDate" items="${license.acquireDate}" begin="0" end="0" delims=" / ">
        <div id="problem_list3">
            <h2>자격증 내역<input type="button" class="license_add" value="추가" onclick="addForm3();"></h2>
            <div id="licensebox"> 
            <button type="button" class="license_del" onclick="delForm3(this);">삭제</button>
                    <table>
                        <tr>
                            <td>
                        	<p>자격증명
                        		<input name="license_name_update" class="infoForm3" placeholder="자격증명을 입력하세요" value="${license_name}">
                        		
                        	</p>
                        </td>
                        </tr>
                        <tr>
                            <td><p>발행처/기관<input name="agency_update" class="infoForm3" placeholder="발행기관명을 입력하세요" value="${license_agency }"></p></td>
                        </tr>
                        <tr>
                            <td>
                                <p>합격구분 <select name="pass_update" class="license_select">
                                    <option value="">선택</option>
                                    <option value="1차합격" <c:if test="${license_pass == '1차합격'}">selected="selected"</c:if>>1차합격</option>
	                                <option value="2차합격" <c:if test="${license_pass == '2차합격'}">selected="selected"</c:if>>2차합격</option>
	                                <option value="필기합격" <c:if test="${license_pass == '필기합격'}">selected="selected"</c:if>>필기합격</option>
	                                <option value="실기합격" <c:if test="${license_pass == '실기합격'}">selected="selected"</c:if>>실기합격</option>
	                                <option value="최종합격" <c:if test="${license_pass == '최종합격'}">selected="selected"</c:if>>최종합격</option>
                                </select></p>
                            </td>
                        </tr>
                        <tr>
                            <td><p>취득일<input type="date" name="acquireDate_update" id="passday" class="infoForm3" value="${license_acquireDate }"></p></td>
                        </tr>
                    </table>
            </div>
        </div>
	</c:forTokens>
	</c:forTokens>		        
    </c:forTokens>
	</c:forTokens>
	
	<c:if test="${empty license.name}">
		<div id="problem_list3">
            <h2>자격증 내역<input type="button" class="license_add" value="추가" onclick="addForm3();"></h2>
            <div id="licensebox"> 
            <button type="button" class="license_del" onclick="delForm3(this);">삭제</button>
                    <table>
                        <tr>
                            <td>
                        	<p>자격증명
                        		<input name="license_name_update" class="infoForm3" placeholder="자격증명을 입력하세요">
                        	</p>
                        </td>
                        </tr>
                        <tr>
                            <td><p>발행처/기관<input name="agency_update" class="infoForm3" placeholder="발행기관명을 입력하세요"></p></td>
                        </tr>
                        <tr>
                            <td>
                                <p>합격구분 <select name="pass_update" class="license_select">
                                    <option value="" disabled selected>선택</option>
                                    <option value="1차합격">1차합격</option>
                                    <option value="2차합격">2차합격</option>
                                    <option value="필기합격">필기합격</option>
                                    <option value="실기합격">실기합격</option>
                                    <option value="최종합격">최종합격</option>
                                    
                                </select></p>
                            </td>
                        </tr>
                        <tr>
                            <td><p>취득일<input type="date" name="acquireDate_update" id="passday" class="infoForm3"></p></td>
                        </tr>
                    </table>
            </div>
        </div>
	</c:if>
	
	<c:forTokens var="license_name" items="${license.name}" begin="1" delims=" / " varStatus="st">
    <c:forTokens var="license_agency" items="${license.agency}" begin="${st.index }" end="${st.index }" delims=" / ">
    <c:forTokens var="license_pass" items="${license.pass}" begin="${st.index }" end="${st.index }" delims=" / ">
    <c:forTokens var="license_acquireDate" items="${license.acquireDate}" begin="${st.index }" end="${st.index }" delims=" / ">
        <div id="license_info_input" class="list_file_tag_input">
            <div id="licensebox">
            	<button type="button" class="license_del" onclick="delForm3(this);">삭제</button>
                <table>
                    <tr>
                        <td>
                        	<p>자격증명
                        		<input name="license_name_update" class="infoForm3" placeholder="자격증명을 입력하세요" value="${license_name}">
                        	</p>
                        </td>
                    </tr>
                    <tr>
                        <td><p>발행처/기관<input name="agency_update" class="infoForm3" placeholder="발행기관명을 입력하세요" value="${license_agency}"></p></td>
                    </tr>
                    <tr>
                        <td>
                            <p>합격구분 <select name="pass_update" class="license_select">
                                <option value="" disabled selected>선택</option>
                                <option value="1차합격" <c:if test="${license_pass == '1차합격'}">selected="selected"</c:if>>1차합격</option>
                                <option value="2차합격" <c:if test="${license_pass == '2차합격'}">selected="selected"</c:if>>2차합격</option>
                                <option value="필기합격" <c:if test="${license_pass == '필기합격'}">selected="selected"</c:if>>필기합격</option>
                                <option value="실기합격" <c:if test="${license_pass == '실기합격'}">selected="selected"</c:if>>실기합격</option>
                                <option value="최종합격" <c:if test="${license_pass == '최종합격'}">selected="selected"</c:if>>최종합격</option>
                            </select></p>
                        </td>
                    </tr>
                    <tr>
                        <td><p>취득일<input type="date" name="acquireDate_update" id="passday" class="infoForm3" value="${license_acquireDate }"></p></td>
                    </tr>
                </table>
            </div>  
		</div>
	</c:forTokens>
	</c:forTokens>		        
   	</c:forTokens>
	</c:forTokens>
        
        <div id="license_info" class="list_file_tag"> 
            <div id="licensebox">
            	<button type="button" class="license_del" onclick="delForm3(this);">삭제</button>
                <table>
                    <tr>
                        <td><p>자격증명<input name="license_name_update" class="infoForm3" placeholder="자격증명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td><p>발행처/기관<input name="agency_update" class="infoForm3" placeholder="발행기관명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td>
                            <p>합격구분 <select name="pass_update" class="license_select">
                                <option value="" disabled selected>선택</option>
                                <option value="1차합격">1차합격</option>
                                <option value="2차합격">2차합격</option>
                                <option value="필기합격">필기합격</option>
                                <option value="실기합격">실기합격</option>
                                <option value="최종합격">최종합격</option>
                            </select></p>
                        </td>
                    </tr>
                    <tr>
                        <td><p>취득일<input type="date" name="acquireDate_update" id="passday" class="infoForm3"></p></td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
    
    
    
    <!--포트폴리오-->
    <section>
    
    	<c:forTokens var="name" items="${portfolio.name}" begin="0" end="0" delims="/">
    	<c:forTokens var="detail" items="${portfolio.detail}" begin="0" end="0" delims="/">
    	<c:forTokens var="url" items="${portfolio.url }" begin="0" end="0" delims=" | ">
	        <div id="problem_list4">
	            <h2>포트폴리오 제출<input type="button" class="portfolio_add" value="추가" onclick="addForm4();"></h2>
	            <div id="portfoliobox">
					<button type="button" class="portfolio_del" onclick="delForm4(this);">삭제</button>
	            	<!-- title -->
	                <input type="text" name="portfolio_name_update" class="portfolio_title" placeholder="GitHub" value="${name }"><br><br>
	                
	                <button type="button" class="urlbtn">url</button>
	                <div class="url_box">
	                	<!-- url -->
	                    <input type="text" name="url_update" class="url" placeholder="https://github.com" value="${url }">
	                </div>
	                <textarea name="detail_update" id="deepcontents" placeholder="상세내용" >${detail }</textarea>
	            </div>
	        </div>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        
        <c:if test="${empty portfolio.url}">
        	<div id="problem_list4">
	            <h2>포트폴리오 제출<input type="button" class="portfolio_add" value="추가" onclick="addForm4();"></h2>
	            <div id="portfoliobox">
					<button type="button" class="portfolio_del" onclick="delForm4(this);">삭제</button>
	            	<!-- title -->
	                <input type="text" name="portfolio_name_update" class="portfolio_title" placeholder="GitHub"><br><br>
	                
	                <button type="button" class="urlbtn">url</button>
	                <div class="url_box">
	                	<!-- url -->
	                    <input type="text" name="url_update" class="url" placeholder="https://github.com">
	                </div>
	                <textarea name="detail_update" id="deepcontents" placeholder="상세내용" ></textarea>
	            </div>
	        </div>
        </c:if>
        
        <c:forTokens var="name" items="${portfolio.name}" begin="1" delims="/" varStatus="st">
    	<c:forTokens var="detail" items="${portfolio.detail}" begin="${st.index }" end="${st.index }" delims="/">
    	<c:forTokens var="url" items="${portfolio.url }" begin="${st.index }" end="${st.index }" delims=" | ">
        <div id="portfolio_info_input" class="list_file_tag_input"> 
            <div id="portfoliobox">
	            <button type="button" class="portfolio_del" onclick="delForm4(this);">삭제</button>
	            <!-- title -->
	            <input type="text" name="portfolio_name_update" class="portfolio_title" placeholder="GitHub" value="${name }"><br><br>
                
                <button type="button" class="urlbtn">url</button>
                <div class="url_box">
                	<!-- url -->
                    <input type="text" name="url_update" class="url" placeholder="https://github.com" value="${url }">
                </div>
                <textarea name="detail_update" id="deepcontents" placeholder="상세내용">${detail }</textarea>
            </div>
        </div>
        </c:forTokens>
        </c:forTokens>
        </c:forTokens>
        
        <div id="portfolio_info" class="list_file_tag"> 
            <div id="portfoliobox">
	            <button type="button" class="portfolio_del" onclick="delForm4(this);">삭제</button>
	            <!-- title -->
	            <input type="text" name="portfolio_name_update" class="portfolio_title" placeholder="GitHub"><br><br>
                
                <button type="button" class="urlbtn">url</button>
                <div class="url_box">
                	<!-- url -->
                    <input type="text" name="url_update" class="url" placeholder="https://github.com">
                </div>
                <textarea name="detail_update" id="deepcontents" placeholder="상세내용"></textarea>
            </div>
        </div>
        
    </section>
    
    
    <!-- 파일첨부 -->
    <section>
    
    <c:forTokens var="title" items="${fileupload.title }" begin="0" end="0" delims="/">
    <c:forTokens var="fileName" items="${fileupload.fileName }" begin="0" end="0" delims="/">
    <c:forTokens var="filedetail" items="${fileupload.filedetail }" begin="0" end="0" delims="/">
    <c:forTokens var="fileaddress" items="${fileupload.fileaddress }" begin="0" end="0" delims=" | ">
    <c:forTokens var="fileSize" items="${fileupload.fileSize }" begin="0" end="0" delims=" / ">
        <div id="problem_list5">
            <h2>첨부파일<input type="button" class="portfolio_add" value="추가" onclick="addForm5();"></h2>
            <div id="portfoliobox">
			<button type="button" class="portfolio_del" onclick="delForm5(this);">삭제</button>
            	<!-- title -->
                <input type="text" name="fileTitle_update" class="portfolio_title" placeholder="첨부파일" value="${title }"><br><br>
                
                <button type="button" class="filebtn">첨부파일</button>
                <div class="file_box">
                	<!-- 첨부파일 -->
                    <span class="uploadfile">업로드된 파일 </span><input name="fileName_update" class="getfilename" readonly="readonly" value="${fileName}">
                </div>
                <input type="hidden" name="fileaddress_update" value="${fileaddress }">
                <textarea name="file_detail_update" id="deepcontents" placeholder="상세내용">${filedetail }</textarea>
                <input type="hidden" name="fileSize_update" value="${fileSize}">
            </div>
        </div>
    </c:forTokens>
	</c:forTokens>
	</c:forTokens>
	</c:forTokens>
	</c:forTokens>
	
	<c:forTokens var="title" items="${fileupload.title }" begin="1" delims="/" varStatus="st">
    <c:forTokens var="fileName" items="${fileupload.fileName }" begin="${st.index }" end="${st.index }" delims="/">
    <c:forTokens var="filedetail" items="${fileupload.filedetail }" begin="${st.index }" end="${st.index }" delims="/">
    <c:forTokens var="fileaddress" items="${fileupload.fileaddress }" begin="${st.index }" end="${st.index }" delims=" | ">
    <c:forTokens var="fileSize" items="${fileupload.fileSize }" begin="${st.index }" end="${st.index }" delims=" / ">
        <div id="portfolio_file_input" class="list_file_tag_input"> 
            <div id="portfoliobox">
	            <button type="button" class="portfolio_del" onclick="delForm5(this);">삭제</button>
	            <!-- title -->
	            <input type="text" name="fileTitle_update" class="portfolio_title" placeholder="첨부파일" value="${title }"><br><br>
                
                <button type="button" class="filebtn">첨부파일</button>
                <div class="file_box">
                	<!-- 첨부파일 -->
                    <span class="uploadfile">업로드된 파일 </span><input name="fileName_update" class="getfilename" readonly="readonly" value="${fileName}">
                </div>
                <input type="hidden" name="fileaddress_update" value="${fileaddress }">
                <textarea name="file_detail_update" id="deepcontents" placeholder="상세내용">${filedetail }</textarea>
                <input type="hidden" name="fileSize_update" value="${fileSize}">
            </div>
        </div>
	</c:forTokens>   
	</c:forTokens>
	</c:forTokens>
	</c:forTokens>
	</c:forTokens>
	
	<c:if test="${empty fileupload.title }">
		<div id="problem_list5">
            <h2>첨부파일<input type="button" class="portfolio_add" value="추가" onclick="addForm5();"></h2>
            <div id="portfoliobox">
				<button type="button" class="portfolio_del" onclick="delForm5(this);">삭제</button>
            	<!-- title -->
                <input type="text" name="fileTitle" class="portfolio_title" placeholder="첨부파일"><br><br>
                
                <button type="button" class="filebtn">첨부파일</button>
                <div class="file_box">
                	<!-- 첨부파일 -->
                    <label for="ex_filename"><span class="choose_file">파일선택</span>
                    <input type="file" name="fileName" id="ex_filename" class="filename"></label>
                </div>
                <textarea name="file_detail" id="deepcontents" placeholder="상세내용"></textarea>
            </div>
        </div>
	</c:if>
        
        <div id="portfolio_file" class="list_file_tag"> 
            <div id="portfoliobox">
	            <button type="button" class="portfolio_del" onclick="delForm5(this);">삭제</button>
	            <!-- title -->
	            <input type="text" name="fileTitle" class="portfolio_title" placeholder="첨부파일"><br><br>
                
                <button type="button" class="filebtn">첨부파일</button>
                <div class="file_box">
                	<!-- 첨부파일 -->
                    <label><span class="choose_file">파일선택</span>
                    <input type="file" name="fileName" id="ex_filename" class="filename"></label>
                </div>
                <textarea name="file_detail" id="deepcontents" placeholder="상세내용"></textarea>
            </div>
        </div>
    </section>
    
    <!--완료버튼-->
    <div id="submit">
    	<input type="button" value="수 정" class="resume_submit" onclick="check()">
    </div>
    </form>
</body>
</html>