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
/*학력추가 삭제버튼*/
function addForm() {
    $('#problem_list').append($('#edu_level_info').html());
    
}
function delForm(obj){
    var div = $(obj).parent();

    //라인 삭제
    div.remove();
}
  /* 학점 숫자 소수점 허용*/ 
  function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    // Textbox value    
    var _value = event.srcElement.value;    
    // 소수점(.)이 두번 이상 나오지 못하게
    var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가
    if (_pattern0.test(_value)) {
        if (charCode == 46) {
            return false;
        }
    }
    // 1의 자리 숫자이면 .만 입력가능
    var _pattern1 = /^\d{1}$/; // 현재 value값이 1자리 숫자이면 . 만 입력가능
    if (_pattern1.test(_value)) {
        if (charCode != 46) {
            alert("4.5 이하의 숫자만 입력가능합니다");
            return false;
        }
    }
    // 소수점 둘째자리까지만 입력가능
    var _pattern2 = /^\d*[.]\d{2}$/; // 현재 value값이 소수점 둘째짜리 숫자이면 더이상 입력 불가
    if (_pattern2.test(_value)) {
        alert("소수점 둘째자리까지만 입력가능합니다.");
        return false;
    }  
    return true;
}
    //0~4.5 범위
    $(document).on("keyup", "input[name^=grade]", function() {
        var val= $(this).val();
        if(val < 0 || val > 4.5) {
            alert("0~4.5 범위로 입력해 주십시오.");
            $(this).val('');
        }
    });

// stack suggest
var xhr;
var checkFirst = loopSend = false;
var lastKeyword = "";
//Timeout을 1초로 걸었다. 일정 단어 완성 뒤 검색어를 만들어 검색하기 위해서 이다.
function keyDown() {
    if (checkFirst == false) {
    	//1초뒤 sendKeyword() 수행
        setTimeout("sendKeyword()", 300);
        loopSend = true;
    }
}
	
//Ajax를 활용하여 suggest.jsp 에게 요청을 하는 함수이다. 넘겨주는 값은 keyword이며 Post방식으로 전송한다.
function sendKeyword() {
    if (loopSend == false)
        return;
    else {
        var keyWord = document.resume_Frm.keyword.value;

        //키워드가 hide 함수를 불러 검색어 창 숨기기
        if (keyWord === "") {
            lastKeyword = "";
            hide("suggest");
        //검색어가 있는 경우 suggest.jsp에게 값 요청
        } else if (keyWord !== lastKeyword) {
            lastKeyword = keyWord;

            var para = "keyword=" + keyWord;
            
            xhr = new XMLHttpRequest();
            xhr.open("post", "suggest", true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        process();
                    } else {
                        alert("요청실패1" + xhr.status);
                    }
                }
            }
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send(para);
        }
    }
}

//Ajax의 결과를 받고 처리하는 공간이다.
//Ajax에게 받은 Data(이름)에 링크를 건 뒤 Output-Suggest에 보여지는 형식이다.
function process() {
    var data = xhr.responseText;
    var result = data.split("|");
    var tot = result[0];
    if (tot > 0) {
        var datas = result[1].split(",");
        var stack = "";
        //각각의 이름에 링크 걸기 각각의 이름은 func(자기이름)이 들어가 있다.
        for (var i = 0; i < datas.length; i++) {
            stack += "<li class='stackli'><a href=\"javascript:func('" + datas[i] + "')\">" + datas[i] + "</a></li>";
        }
        //Output-Suggest에 결과 보여주기
        var listView = document.getElementById("suggest").innerHTML = stack;
        show('suggest');
    }
}

//이름 클릭시 Output-Selected 에 값 넣기. Suggest창 숨기기
function func(reData) {
	$('#stacks').append('<div class="st"><div class="stack">' + reData + '</div><div onclick="parentElement.remove(this)" style="cursor:pointer"> X </div></div>');
	
    loopSend = checkFirst = false;
    lastKeyword = "";
    hide("suggest");

    resume_Frm.keyword.value="";

}

//Suggest 창 숨기는 함수
function hide(ele) {
    var e = document.getElementById(ele);
    if (e) e.style.display = "none";
}

//Suggest 창 보이게 속성 바꾸는 함수
function show(ele) {
    var e = document.getElementById(ele);
    if (e) e.style.display = "";
}

/* 경력사항 추가 삭제 버튼 */
function addForm2() {
    $('#problem_list2').append($('#experienced_info').html());
    check_click();
}
function delForm2(obj){
    var div = $(obj).parent();

    //라인 삭제
    div.remove();
}
/* 자격증 추가 삭제 버튼 */
function addForm3() {
    $('#problem_list3').append($('#license_info').html());
    check_click();
}
function delForm3(obj){
    var div = $(obj).parent();

    //라인 삭제
    div.remove();
}
/* 포트폴리오 추가 삭제 버튼 */
function addForm4() {
    $('#problem_list4').append($('#portfolio_info').html());
    check_click();
}
function delForm4(obj){
    var div = $(obj).parent();

    //라인 삭제
    div.remove();
}
/* 파일첨부 추가 삭제 버튼 */
function addForm5() {
    $('#problem_list5').append($('#portfolio_file').html());
    check_click();
}
function delForm5(obj){
    var div = $(obj).parent();

    //라인 삭제
    div.remove();
}
//첨부파일, url중에 선택
// $(function() {
//     $("#company").hide()
//     $("#personButton").click(function(){
//       $("#personButton").css({"background-color": "#A5E374", "color": "white"})
//       $("#companyButton").css({"background-color": "#F0F0F0", "color": "#858585"})
//       $("#individual").show()
//       $("#company").hide()
//     })
//     $("#companyButton").click(function(){
//       $("#companyButton").css({"background-color": "#A5E374", "color": "white"})
//       $("#personButton").css({"background-color": "#F0F0F0", "color": "#858585"})
//       $("#individual").hide()
//       $("#company").show()
//       $("#company").prop("display","block")
//     })
// });
//첨부파일명 가져오기
// $(document).ready(function(){
//     $('input[type=file]').on('change',function(){
//         if(window.FileReader){
//             var filename = $(this).val().split('/').pop().split('\\').pop();
//            } else {
//             var filename = $(this).val().split('/').pop().split('\\').pop();
//            }
//     });
   
//   });
/* 첨부파일 */
$(document).ready(function(){
    var fileTarget = $('.filebox .upload-hidden');
  
    fileTarget.on('change', function(){  // 값이 변경되면
      if(window.FileReader){  // modern browser
        var filename = $(this)[0].files[0].name;
      } 
      else {  // old IE
        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
      }
      
      // 추출한 파일명 삽입
      $(this).siblings('.uploadname').val(filename);
    });
  }); 
/////////////////
   $("#file").on('change',function(){
    var fileName = $("#file").val();
    $(".upload_name").val(fileName);
});
  
//포트폴리오 첨부파일 url 변경
/*$(document).ready(function() {
	let urlBtn = $('.urlbtn');
	let fileBtn = $('.filebtn');
	let urlBox = $('.url_box');
	let filebox = $('.file_box');
	
	for(var i = 0; i < urlBtn.length; i++) {
		const idx = i;
		urlBtn[idx].addEventListener('click', function() {
			$(urlBtn[idx]).css({"background-color": "#A5E374", "color": "white"});
	        $(fileBtn[idx]).css({"background-color": "#d6d6d6", "color": "#858585"});
	        $(urlBox[idx]).css('display', 'block');
	        $(filebox[idx]).css('display', 'none');
		});
		fileBtn[idx].addEventListener('click', function() {
			$(urlBtn[idx]).css({"background-color": "#d6d6d6", "color": "#858585"});
	        $(fileBtn[idx]).css({"background-color": "#A5E374", "color": "white"});
	        $(urlBox[idx]).css('display', 'none');
	        $(filebox[idx]).css('display', 'block');
		});
	}
	
	$('.portfolio_add').click(function() {
		let urlBtn = $('.urlbtn');
		let fileBtn = $('.filebtn');
		let urlBox = $('.url_box');
		let filebox = $('.file_box');
		
		for(var i = 0; i < urlBtn.length; i++) {
			const idx = i;
			urlBtn[idx].addEventListener('click', function() {
				$(urlBtn[idx]).css({"background-color": "#A5E374", "color": "white"});
		        $(fileBtn[idx]).css({"background-color": "#d6d6d6", "color": "#858585"});
		        $(urlBox[idx]).css('display', 'block');
		        $(filebox[idx]).css('display', 'none');
			});
			fileBtn[idx].addEventListener('click', function() {
				$(urlBtn[idx]).css({"background-color": "#d6d6d6", "color": "#858585"});
		        $(fileBtn[idx]).css({"background-color": "#A5E374", "color": "white"});
		        $(urlBox[idx]).css('display', 'none');
		        $(filebox[idx]).css('display', 'block');
			});
		}
	});
});*/

//유효성검사
function check(){
	
		if(document.resume_Frm.resumetitle.value == ""){
			alert("이력서 제목을 입력해주세요.");
			document.resume_Frm.resumetitle.focus();
			return;
		}
	
	var schoollist = document.getElementsByName('school');
	var schoolNamelist = document.getElementsByName('schoolName');
	var startDatelist = document.getElementsByName('schoolStartDate');
	var endDatelist = document.getElementsByName('schoolEndDate');
	var statuslist = document.getElementsByName('status');
	var departmentlist = document.getElementsByName('department');
	var scorelist = document.getElementsByName('score');
	
	for(var i = 0; i< schoollist.length-1; i++){
		
		if(schoollist[i].value == ""){
			alert("학력을 선택해주세요.");
			schoollist[i].focus();
			return;
			}
			
		if(schoolNamelist[i].value == ""){
			alert("학교명을 입력해주세요.");
			schoolNamelist[i].focus();
			return;
			}
			
		if(startDatelist[i].value == ""){
			alert("입학 일자를 입력해 주세요.");
			startDatelist[i].focus();
			return;
			}	
		
		if(endDatelist[i].value == ""){
			alert("졸업 일자를 입력해주세요\n재학 휴학 졸업예정 이라면 현재 날자를 입력해 주세요.");
			endDatelist[i].focus();
			return;
			}
			
		if(statuslist[i].value == ""){
			alert("졸업 상태를 입력 해주세요.");
			statuslist[i].focus();
			return;
			}	
			
		if(departmentlist[i].value == ""){
			alert("학과명을 입력해 주세요.");
			departmentlist[i].focus();
			return;
			}			
			
		}
		
		let stackList = document.getElementsByClassName('stack');
		var stack = "";
		for(var idx = 0; idx < stackList.length; idx++) {
			var i = idx;

			if(i != stackList.length - 1) {
				stack += stackList[i].innerText + " / ";
			} else {
				stack += stackList[i].innerText;
			}
		}
		$('#st').val(stack);

		if(!$('div').hasClass('stack')){
			alert("보유하신 기술스택을 입력해주세요.");
			document.resume_Frm.keyword.focus();
			return;
		}
		document.resume_Frm.submit();
}

//학력이 고등학교이면 학점 hidden
function schoolchange(){
	
	var schoollist = document.getElementsByName('school');
	let grade = $('.grade');
	let eduLevelbox = $('.eduLevelbox');
	
	for(var i = 0; i < schoollist.length; i++){
		const idx = i;
		if(schoollist[i].value == '고등학교'){
			$(grade[idx]).css({"visibility": "hidden"});
			$(eduLevelbox[idx]).css({"height": "310px"});
		}else{
			$(grade[idx]).css({"visibility": "visible"});
			$(eduLevelbox[idx]).css({"height": "385px"});
		}
	}
}


  