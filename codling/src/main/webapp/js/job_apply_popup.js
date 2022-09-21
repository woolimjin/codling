/**
 * 
 */
function popUp(){
    var url = "job_apply_popup.jsp";
    var name = "popup";
    var option = "width = 1500, height = 700, top = 100, left = 200, status=no,toolbar=no,scrollbars=no,resizable=no";
    window.open(url, name, option);
}

// 등록 버튼
function isSubmit(){
    var isChk = $(".form-select option:selected").val();
    var isChk2 = $('input[name="chk"]:checked').val();
    if(isChk === "0" || isChk2 === undefined){
        alert("지원할 분야 및 자기소개서를 하나 이상 선택해 주세요.")
        return false;
    } else{
    	document.clFrm.submit();
    	alert("등록되었습니다.")
    	window.close(this);
    }
}

// 슬라이더
$(function(){
    $(".slider-div").slick({
        prevArrow : "<button type='button' class='slick-prev'><img src='img/arrow_mini.png'></button>",		
        nextArrow : "<button type='button' class='slick-next'><img src='img/arrow_mini.png'></button>",	
        slidesToShow: 4,
        slidesToScroll: 1,
    });
});

// 라디오박스 체크
$('input[name="chk"]').change(function() {    
    $('input[name="chk"]').each(function() {
            var value = $(this).val();              
            var checked = $(this).prop('checked');  
            var $label = $(this).next();
            if(checked){
                $('.containerBot').closest('div').css('background-color', 'rgba(0,0,0,0.1)');
                $('.containerBot>label').closest('label').css('color','#A5E374');
    
                $(this).closest('div').css('background-color', '#A5E374');
                $(this).closest('label').css('color','#50b500');
                $(this).closest('label').removeAttr("style");
            }
        });
    });

