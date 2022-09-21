function checkPassword() {
	const pwCheck =  RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/);
	
	if(document.updatePasswordForm.password.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.updatePasswordForm.password.focus();
	} else if(document.updatePasswordForm.rePassword.value == "") {
		alert("비밀번호 재확인을 입력해 주세요.");
		document.updatePasswordForm.rePassword.focus();
	} else if(!pwCheck.test($("#pw").val())){
      	alert("특수문자, 소문자, 숫자를 혼합하여 4자리~12자리 이내로 입력해주세요");
		document.updatePasswordForm.password.focus();
	} else if(document.updatePasswordForm.password.value != document.updatePasswordForm.rePassword.value) {
		alert("비밀번호가 같지 않습니다.\n비밀번호를 확인해 주세요.");
		document.updatePasswordForm.rePassword.focus();
	} else {
		document.updatePasswordForm.submit();
	}
}