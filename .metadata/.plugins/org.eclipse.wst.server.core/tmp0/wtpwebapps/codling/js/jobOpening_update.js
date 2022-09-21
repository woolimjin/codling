/*hover*/ 
$(function(){
    let num = document.documentElement.scrollWidth
    if(num <= 1220){
        $("header").css({"width":"98vw"})
    } else {
        $("header").css({"width":"1220px"})
    }

    $(window).resize(function(){
        let number = document.documentElement.scrollWidth
        if(number <= 1220){
        $("header").css({"width":"98vw"})     
    } else {
        $("header").css({"width":"1220px"})
    }
    })
    
    $("#profile-hover").hide();

    $("#profile-box").hover(function() {
        $("#profile-hover").stop().slideDown();
    },function(){
        $("#profile-hover").stop().slideUp();
    });
    $("#profile-hover").hover(function() {
        $(this).stop().slideDown();
    },function(){
        $(this).stop().slideUp();
    });
})

/*추가 삭제버튼*/

function addForm() {
    $('#problem_list').append($('#list_file_tag').html());
}
function delForm(obj){
    var div = $(obj).parent();
    //라인 삭제
    div.remove();
}

/*주소찾기*/
function findAddr() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = ''; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수
	
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
	                
			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
	
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("address").value = addr + extraRoadAddr;
			
			document.getElementById("detailAddr").focus();
		}
	}).open();
}

/*input 숫자만 입력*/
$(function(){
    $('.num').on('keypress', function(e){
        var charCode = e.which || e.keyCode;

        if (charCode > 31 && (charCode < 48 || charCode > 57)){
            alert("숫자만 입력하세요");
            return false;
        }
        return true;
    });
});


/*금액입력받기 */
function commas(t) {
    // 콤마 빼고 
    var x = t.value;         
    x = x.replace(/,/gi, '');
    // 숫자 정규식 확인
    var regexp = /^[0-9]*$/;
    if(!regexp.test(x)){ 
    $(t).val(""); 
        alert("숫자만 입력 가능합니다.");
    } else {
        x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");         
        $(t).val(x);         
    }
}

// 경력 체크 시 경력 input readonly 해제
$(document).ready(function(){
	let checkList = $(".careerChk");
	let careerList = $(".career_year");
	
	for(let i = 0; i < checkList.length; i++) {
		const idx = i;
		checkList[idx].addEventListener('change', function() {
			if($(checkList[idx]).is(":checked")) {
				$(careerList[idx]).attr('readonly', false);
				$(careerList[idx]).focus();
			} else {
				$(careerList[idx]).val('');
				$(careerList[idx]).attr('readonly', true);
			}
		});
	}
	$("#add").click(function() {
		let checkList = $(".careerChk");
		let careerList = $(".career_year");
		
		for(let i = 0; i < checkList.length; i++) {
			const idx = i;
			checkList[idx].addEventListener('change', function() {
				if($(checkList[idx]).is(":checked")) {
					$(careerList[idx]).attr('readonly', false);
					$(careerList[idx]).focus();
				} else {
					$(careerList[idx]).val('');
					$(careerList[idx]).attr('readonly', true);
				}
			});
		}
	});
});

// 급여 숫자 or 면접 후 결정 체크 제어
$(function() {
	var payList = document.getElementsByName('pay');
	
	for(var idx = 0; idx < payList.length; idx += 2) {
		const i = idx;
		
		$(payList[i]).on('keypress', function() {
			$(payList[i + 1]).prop('checked', false);
		});
		$(payList[i + 1]).change(function() {
			$(payList[i]).val('');
		});
	}

	$("#add").click(function() {
		var payList = document.getElementsByName('pay');
	
		for(var idx = 0; idx < payList.length; idx += 2) {
			const i = idx;
			
			$(payList[i]).on('keypress', function() {
				$(payList[i + 1]).prop('checked', false);
			});
			$(payList[i + 1]).change(function() {
				$(payList[i]).val('');
			});
		}
	});
});

// 근무요일 checkbox 중복 체크 제어
$(function() {
	var workdayList = document.getElementsByName('workday');
	
	for(var idx = 0; idx < workdayList.length; idx += 3) {
		const i = idx;
		
		workdayList[i].addEventListener('click', function() {
			if($(workdayList[i]).is(":checked")) {
				$(workdayList[i + 1]).prop('checked', false);
				$(workdayList[i + 2]).prop('checked', false);
			}
		});
		workdayList[i + 1].addEventListener('click', function() {	
			if($(workdayList[i + 1]).is(":checked")) {
				$(workdayList[i]).prop('checked', false);
				$(workdayList[i + 2]).prop('checked', false);
			}
		});
		workdayList[i + 2].addEventListener('click', function() {	
			if($(workdayList[i + 2]).is(":checked")) {
				$(workdayList[i]).prop('checked', false);
				$(workdayList[i + 1]).prop('checked', false);
			}
		});
	}
	
	$("#add").click(function() {
		var workdayList = document.getElementsByName('workday');
		
		for(var idx = 0; idx < workdayList.length; idx += 3) {
			 const i = idx;
			workdayList[i].addEventListener('click', function() {
				if($(workdayList[i]).is(":checked")) {
					$(workdayList[i + 1]).prop('checked', false);
					$(workdayList[i + 2]).prop('checked', false);
				}
			});
			workdayList[i + 1].addEventListener('click', function() {	
				if($(workdayList[i + 1]).is(":checked")) {
					$(workdayList[i]).prop('checked', false);
					$(workdayList[i + 2]).prop('checked', false);
				}
			});
			workdayList[i + 2].addEventListener('click', function() {	
				if($(workdayList[i + 2]).is(":checked")) {
					$(workdayList[i]).prop('checked', false);
					$(workdayList[i + 1]).prop('checked', false);
				}
			});
		}
	});
});

var xhr;
var checkFirst = loopSend = false;
var lastKeyword = "";
//Timeout을 1초로 걸었다. 일정 단어 완성 뒤 검색어를 만들어 검색하기 위해서 이다.
function keyDown(obj) {
	/*let stackWrap = document.querySelector(".field");
	let height = stackWrap.clientHeight;
	$(stackWrap).css('height', height);*/
	
    if (checkFirst == false) {
    	//1초뒤 sendKeyword() 수행
        setTimeout(function() {
			//Ajax를 활용하여 suggest.jsp 에게 요청을 하는 함수이다. 넘겨주는 값은 keyword이며 Post방식으로 전송한다.
		    if (loopSend == false)
		        return;
		    else {
		        var keyWord = obj.value;

		        //키워드가 hide 함수를 불러 검색어 창 숨기기
		        if (keyWord === "") {
		            lastKeyword = "";
		            hide(obj);
		        //검색어가 있는 경우 suggest.jsp에게 값 요청
		        } else if (keyWord !== lastKeyword) {
		            lastKeyword = keyWord;
		
		            var para = "keyword=" + keyWord;
		            
		            xhr = new XMLHttpRequest();
		            xhr.open("post", "suggest", true);
		            xhr.onreadystatechange = function () {
		                if (xhr.readyState == 4) {
		                    if (xhr.status == 200) {
		                        process(obj);
		                    } else {
		                        alert("요청실패1" + xhr.status);
		                    }
		                }
		            }
		            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		            xhr.send(para);
		        }
		    }
		}, 300);
        loopSend = true;
    }
}

//Ajax의 결과를 받고 처리하는 공간이다.
//Ajax에게 받은 Data(이름)에 링크를 건 뒤 Output-Suggest에 보여지는 형식이다.
function process(obj) {
    var data = xhr.responseText;
    var result = data.split("|");
    var tot = result[0];
    if (tot > 0) {
        var datas = result[1].split(",");
        var stack = "";

        //각각의 이름에 링크 걸기 각각의 이름은 func(자기이름)이 들어가 있다.
        for (var i = 0; i < datas.length; i++) {
            stack += "<li><span class='s'>" + datas[i] + "</span></li>";
        }
        //Output-Suggest에 결과 보여주기
        var listView = obj.nextSibling.nextSibling.innerHTML = stack;
		$('.s').click(function() {
			//이름 클릭 시 Output-Selected 에 값 넣기. Suggest창 숨기기
			$(obj).parent().parent().prev().children('td:eq(-1)').children('div').append('<span class="st"><div class="stack">' + this.innerHTML + '</div><span onclick="parentRemove(this)" style="cursor:pointer"> X </span></span>');
			
			var count = $(obj).closest('tr').prev().children().last().children().last().val();
			count++;
			$(obj).closest('tr').prev().children().last().children().last().val(count);
	
		    loopSend = checkFirst = false;
		    lastKeyword = "";
		    hide(obj);
		
		    obj.value="";
		});
        show(obj);
    }
}


//Suggest 창 숨기는 함수
function hide(obj) {
    var e = obj.nextSibling.nextSibling;
    if (e) e.style.display = "none";

	let stackWrap = document.querySelector(".field");
	/*$(stackWrap).css('height', 'auto');*/
}

//Suggest 창 보이게 속성 바꾸는 함수
function show(obj) {
    var e = obj.nextSibling.nextSibling;
    if (e) e.style.display = "";
}

// stack X버튼(삭제)
function parentRemove(obj) {
	var count = $(obj).parent().parent().next().next().val()
	count--;
	$(obj).parent().parent().next().next().val(count);

	$(obj).parent().remove();
}

// null값 검사 후 submit
function updateJobOpeningCheck() {
	if(document.jobOpForm.address.value == '') {
		alert("근무지역을 입력해 주세요.");
		document.jobOpForm.detailAddress.focus(); return;
	}
	if(document.jobOpForm.title.value == '') {
		alert("공고제목을 입력해 주세요.");
		document.jobOpForm.title.focus(); return;
	}
	if(document.jobOpForm.startDate.value == '') {
		alert("시작일을 입력해 주세요.");
		document.jobOpForm.startDate.focus(); return;
	}
	if(document.jobOpForm.endDate.value == '') {
		alert("마감일을 입력해 주세요.");
		document.jobOpForm.endDate.focus(); return;
	}
	
	var nameList          = document.getElementsByName('name');
	var career_statusList = document.getElementsByName('career_status');
	var career_yearList   = document.getElementsByName('career_year');
	var careerList        = document.getElementsByName('career');
	var positionList      = document.getElementsByName('position');
	var payList_          = document.getElementsByName('pay_');
	var payList           = document.getElementsByName('pay');
	var workdayList       = document.getElementsByName('workday');
	var stackList         = document.getElementsByClassName('stack');
	var stackCount        = document.getElementsByName('stackCount');
	var stack             = document.getElementsByName('stack');
	var keyword           = document.getElementsByName('keyword');
	var workList          = document.getElementsByName('work');
	var requirementList   = document.getElementsByName('requirement');
	var preferenceList    = document.getElementsByName('preference');
		
	var cnt = 0;  // stack 갯수
	for(let i = 0; i < nameList.length - 1; i++) {
		let i2 = i * 2;
		let i3 = i * 3;

		var stackName = "";
		for(var j = 0; j < stackCount[i].value; j++) {
			if(j != stackCount[i].value - 1)
				stackName += stackList[cnt].innerText + "/";
			else
				stackName += stackList[cnt].innerText;
			cnt++;
		}
		stack[i].value = stackName;
		
		if(nameList[i].value == '') {
			alert("분야명을 입력해 주세요.");
			nameList[i].focus(); return;
		}
		if(!career_statusList[i2].checked && !career_statusList[i2 + 1].checked) {
			alert("경력여부를 하나 이상 선택해 주세요."); return;
		}
		if(career_statusList[i2 + 1].checked && career_yearList[i].value == '') {
			alert("경력을 입력해 주세요.");
			career_yearList[i].focus(); return;
		}
		if(positionList[i].value == '') {
			alert("직급/직책을 입력해 주세요.");
			positionList[i].focus(); return;
		}
		if(payList_[i2].value == '' && !payList_[i2 + 1].checked) {
			alert("급여를 입력해 주세요.");
			payList_[i2].focus(); return;
		}
		if(!workdayList[i3].checked && !workdayList[i3 + 1].checked && !workdayList[i3 + 2].checked) {
			alert("근무요일을 선택해 주세요."); return;
		}
		if(stack[i].value == '') {
			alert("사용스택 및 툴을 입력해 주세요.");
			keyword[i].focus(); return;
		}
		if(workList[i].value == '') {
			alert("주요업무를 작성해 주세요.");
			workList[i].focus(); return;
		}
		if(requirementList[i].value == '') {
			alert("자격요건을 작성해 주세요.");
			requirementList[i].focus(); return;
		}
		if(preferenceList[i].value == '') {
			alert("우대사항을 작성해 주세요.");
			preferenceList[i].focus(); return;
		}
		
		if(career_statusList[i2].checked && !career_statusList[i2 + 1].checked) 
			careerList[i].value = career_statusList[i2].value;
		else if(!career_statusList[i2].checked && career_statusList[i2 + 1].checked)
			careerList[i].value = career_yearList[i].value;
		else careerList[i].value = career_statusList[i2].value + "/" + career_yearList[i].value;
		
		if(payList_[i2].value == '') {
			payList[i].value = '면접 후 결정';
		} else if(!payList_[i2 + 1].checked) {
			payList[i].value = payList_[i2].value; 
		}
		
	}
	
	if(document.jobOpForm.process.value == '') {
		alert("채용절차를 입력해 주세요.");
		document.jobOpForm.process.focus(); return;
	}
	document.jobOpForm.submit();
}