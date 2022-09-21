<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codling : 이력서 작성</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="css/resume_writing.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/resume_writing.js"></script>
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
    <form action="resume_writing" name="resume_Frm" method="post" enctype="multipart/form-data">
    <section>
        <h2><b>이력서 제목</b></h2>
        <div><input name="resumetitle" class="resume_title" placeholder="이력서 제목을 입력하세요"></div>
    </section>
    <!--학력사항-->
    <section>
        <div id="problem_list">
            <h2><input type="button" class="edu_add" value="추가" onclick="addForm();">학력사항</h2>
            <div class="eduLevelbox">
            <br><br>
                <table class="edu_level_info">                 
                     <tr>
                         <td><p>학력 * 
                            <select name="school" onchange="schoolchange()" class="edu_select" required>
                            <option value="" disabled selected>선택</option>
                            <option value="고등학교">고등학교</option>
                            <option value="대학교(2년)">대학교(2년)</option>
                            <option value="대학교(4년)">대학교(4년)</option>
                            <option value="대학원(석사)">대학원(석사)</option>
                            <option value="대학원(박사)">대학원(박사)</option>
                            </select>
                        </p></td>
                     </tr>
                     <tr>
                        <td><p>학교명 *<input name="schoolName" id="uni_name" class="infoForm2" placeholder=" 학교명을 입력하세요"></p></td>
                     </tr>
                     <tr>
                        <td><p id="qqq2"><span>재학기간 *</span><input type="date" name="schoolStartDate" id="start"><span class="qqqtext"> ~ </span><input type="date" name="schoolEndDate" class="infoForm2">
                            <select name="status" class="edu_select2" required>
                                <option value="" disabled selected>선택</option>
                                <option value="졸업">졸업</option>
                                <option value="졸업예정">졸업예정</option>
                                <option value="재학">재학</option>
                                <option value="휴학">휴학</option>
                            </select>
                        </p></td>
                     </tr>
                     <tr>
                        <td><p>학과명<input name="department" id="major" class="infoForm2" placeholder=" 학과명을 입력하세요"></p></td>
                     </tr>
                     <tr>
                        <td><p id="grade" class="grade"><span>학점</span><input type="text" name="score" id="insertgrade" placeholder=" 본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"/>
                            <span class="gradetext">/</span><input type="text" class="infoForm2" placeholder=" 4.5" readonly></p>
                     </td>
                    </tr>
                </table>
                 <p id="description">※ 재학 휴학 졸업예정 이라면 졸업년도에 현재 날자를 입력해 주세요.</p>
            </div> 
        </div>
        <div id="edu_level_info" class="list_file_tag"> 
            <div class="eduLevelbox"> 
            <button type="button" class="edu_del" onclick="delForm(this);">삭제</button>
                <table class="edu_level_info">
                     <tr>
                         <td><p>학력 * 
                            <select name="school" onchange="schoolchange()" class="edu_select" required>
                            <option value="" disabled selected>선택</option>
                            <option value="고등학교">고등학교</option>
                            <option value="대학교(2년)">대학교(2년)</option>
                            <option value="대학교(4년)">대학교(4년)</option>
                            <option value="대학원(석사)">대학원(석사)</option>
                            <option value="대학원(박사)">대학원(박사)</option>
                            </select>
                        </p></td>
                     </tr>
                     <tr>
                        <td><p>학교명 *<input name="schoolName" id="uni_name" class="infoForm2" placeholder="학교명을 입력하세요"></p></td>
                     </tr>
                     <tr>
                        <td><p id="qqq2"><span>재학기간 *</span><input type="date" name="schoolStartDate" id="start"><span class="qqqtext"> ~ </span><input type="date" name="schoolEndDate" class="infoForm2">
                            <select name="status" class="edu_select2" required>
                                <option value="" disabled selected>선택</option>
                                <option value="졸업">졸업</option>
                                <option value="졸업예정">졸업예정</option>
                                <option value="재학">재학</option>
                                <option value="휴학">휴학</option>
                            </select></p>
                        </td>
                    </tr>
                    <tr>
                        <td><p>학과명<input name="department" id="major" class="infoForm2" placeholder="학과명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td><p id="grade" class="grade"><span>학점</span><input type="text" name="score" id="insertgrade" placeholder="본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"/>
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
            <div id="stc_box"><div id="stc_box2"></div><div id="stacks" name="sel" size="10"></div></div>
            <input id="stack" name="keyword" onkeydown="keyDown()">
            <ul id="suggest" style="display:none; position:relative; top:-15px;"></ul>
            <input type="hidden" name="stack" id="st">
        </div>
        </article>
    </section>
    <!--경력사항-->
    <section>
        <div id="problem_list2">
            <h2>경력사항<input type="button" class="ex_add" value="추가" onclick="addForm2();"></h2>
            <div id="experiencebox"><br><br>
                <table id= "ex_info_box">
	                <tr>
	                    <td><p> 회사 명 * <input name="prev_company" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요"> </p></td>
	                </tr>
	                <tr>
	                    <td><p id="qqq"><span>재직기간 *</span><input type="date" name="tenureStart" class="infoForm4">
	                        <span class="qqqtext"> ~ </span><input type="date" name="tenureEnd" class="infoForm4"></p></td>
	                </tr>
	                <tr>
	                    <td> <p>직급/직책 *<input name="position" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요"></p></td>
	                </tr>
	                <tr>
	                    <td><p>근무 부서 <input name="company_department" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요"></p></td>
	                </tr>
	                <tr>
	                    <td><p>주요업무<textarea name="work_content" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail"></textarea></p></td>
	                </tr>
            	</table> 
        	</div>
        </div>
        <div id="experienced_info" class="list_file_tag"> 
            <div id="experiencebox">
				<button type="button" class="ex_del" onclick="delForm2(this);">삭제</button>
                <table id= "ex_info_box">        
	                <tr>
	                    <td><p>회사 명 * <input name="prev_company" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요"> </p></td>
	                </tr>
	                <tr>
	                    <td><p id="qqq"><span>재직 기간 *</span><input type="date" name="tenureStart" class="infoForm4">
	                        <span class="qqqtext"> ~ </span><input type="date" name="tenureEnd" class="infoForm4"></p></td>
	                </tr>
	                <tr>
	                    <td> <p>직급/직책 *<input name="position" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요"></p></td>
	                </tr>
                    <tr>
	                    <td><p>근무 부서 <input name="company_department" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요"></p></td>
	                </tr>
	                <tr>
	                    <td><p>주요 업무<textarea name="work_content" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail"></textarea></p></td>
	                </tr>
	           	</table>
            </div> 
        </div>
    </section>
    <!--자격증-->
    <section>
        <div id="problem_list3">
            <h2>자격증 내역<input type="button" class="license_add" value="추가" onclick="addForm3();"></h2>
            <div id="licensebox"> 
                    <table><br><br>
                        <tr>
                            <td><p>자격증명<input name="license_name" class="infoForm3" placeholder="자격증명을 입력하세요"></p></td>
                        </tr>
                        <tr>
                            <td><p>발행처/기관<input name="agency" class="infoForm3" placeholder="발행기관명을 입력하세요"></p></td>
                        </tr>
                        <tr>
                            <td>
                                <p>합격구분 <select name="pass" class="license_select">
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
                            <td><p>취득일<input type="date" name="acquireDate" id="passday" class="infoForm3"></p></td>
                        </tr>
                    </table>
            </div>
        </div>
        <div id="license_info" class="list_file_tag"> 
            <div id="licensebox">
            	<button type="button" class="license_del" onclick="delForm3(this);">삭제</button>
                <table>
                    <tr>
                        <td><p>자격증명<input name="license_name" class="infoForm3" placeholder="자격증명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td><p>발행처/기관<input name="agency" class="infoForm3" placeholder="발행기관명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td>
                            <p>합격구분 <select name="pass" class="license_select">
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
                        <td><p>취득일<input type="date" name="acquireDate" id="passday" class="infoForm3"></p></td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
    
    
    
    <!--포트폴리오-->
    <section>
        <div id="problem_list4">
            <h2>포트폴리오 제출<input type="button" class="portfolio_add" value="추가" onclick="addForm4();"></h2>
            <div id="portfoliobox"><br><br>
            	<!-- title -->
                <input type="text" name="portfolio_name" class="portfolio_title" placeholder="GitHub"><br><br>
                
                <button type="button" class="urlbtn">url</button>
                <div class="url_box">
                	<!-- url -->
                    <input type="text" name="url" class="url" placeholder="https://github.com">
                </div>
                <textarea name="detail" id="deepcontents" placeholder="상세내용"></textarea>
            </div>
        </div>
        
        <div id="portfolio_info" class="list_file_tag"> 
            <div id="portfoliobox">
	            <button type="button" class="portfolio_del" onclick="delForm4(this);">삭제</button>
	            <!-- title -->
	            <input type="text" name="portfolio_name" class="portfolio_title" placeholder="GitHub"><br><br>
                
                <button type="button" class="urlbtn">url</button>
                <div class="url_box">
                	<!-- url -->
                    <input type="text" name="url" class="url" placeholder="https://github.com">
                </div>
                <textarea name="detail" id="deepcontents" placeholder="상세내용"></textarea>
            </div>
        </div>
    </section>
    
    
    <!-- 파일첨부 -->
    <section>
        <div id="problem_list5">
            <h2>첨부파일<input type="button" class="portfolio_add" value="추가" onclick="addForm5();"></h2>
            <div id="portfoliobox"><br><br>
            	<!-- title -->
                <input type="text" name="fileTitle" class="portfolio_title" placeholder="첨부파일"><br><br>
                
                <button type="button" class="filebtn">첨부파일</button>
                <div class="file_box">
                	<!-- 첨부파일 -->
                    <label><span class="choose_file">파일선택</span>
                    <input type="file" name="fileName" id="ex_filename" class="filename"></label>
                    <input type="hidden" name="filelength" value="">
                </div>
                <textarea name="file_detail" id="deepcontents" placeholder="상세내용"></textarea>
            </div>
        </div>
        
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
                    <input type="hidden" name="filelength" value="">
                </div>
                <textarea name="file_detail" id="deepcontents" placeholder="상세내용"></textarea>
            </div>
        </div>
    </section>
    
    <!--완료버튼-->
    <div id="submit">
    	<input type="button" value="등 록" class="resume_submit" onclick="check()">
    </div>
    </form>
</body>
</html>