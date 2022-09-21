<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="org.apache.commons.codec.binary.Hex" %>
<%
/*
*******************************************************
* <결제요청 파라미터>
* 결제시 Form 에 보내는 결제요청 파라미터입니다.
* 샘플페이지에서는 기본(필수) 파라미터만 예시되어 있으며, 
* 추가 가능한 옵션 파라미터는 연동메뉴얼을 참고하세요.
*******************************************************
*/
String merchantKey 		= "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg=="; // 상점키
String merchantID 		= "nicepay00m"; 				// 상점아이디
String goodsName 		= "나이스페이"; 					// 결제상품명
String price 			= "100"; 							// 결제상품금액	
String buyerName 		= "나이스"; 						// 구매자명
String buyerTel 		= "01000000000"; 				// 구매자연락처
String buyerEmail 		= "happy@day.co.kr"; 			// 구매자메일주소
String moid 			= "mnoid1234567890"; 			// 상품주문번호	
String returnURL 		= "http://localhost:8090/nicepay3.0_utf-8/payResult_utf.jsp"; // 결과페이지(절대경로) - 모바일 결제창 전용

/*
*******************************************************
* <해쉬암호화> (수정하지 마세요)
* SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다. 
*******************************************************
*/
DataEncrypt sha256Enc 	= new DataEncrypt();
String ediDate 			= getyyyyMMddHHmmss();	
String hashString 		= sha256Enc.encrypt(ediDate + merchantID + price + merchantKey);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codling : 결제</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="css/payRequest.css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/payRequest.js"></script>
	<!-- 아래 js는 PC 결제창 전용 js입니다.(모바일 결제창 사용시 필요 없음) -->
	<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
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
                <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
                <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
                <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
            </ul>
        </div>
    </header>
    <section>
    	<div id="del">
    		<div>
				<form name="payForm" method="post" action="payResult">
					<input type="hidden" name="no" value="${jobOpening.no }">
					<table>
						<tr>
							<th><span>결제 상품명</span></th>
							<td><input type="text" name="GoodsName" value="${jobOpening.title }"></td>
						</tr>
						<tr>
							<th><span>결제 상품금액</span></th>
							<td><input type="text" name="Amt" value="<%=price%>"></td>
						</tr>				
						<tr style="display: none;">
							<th><span>상점 아이디</span></th>
							<td><input type="text" name="MID" value="<%=merchantID%>"></td>
						</tr>
						<tr>
							<th><span>구매자명</span></th>
							<td><input type="text" name="BuyerName" value="${jobOpening.corporation_id }"></td>
						</tr>	 
						<tr style="display: none;">
							<th>구매자명 이메일</th>
							<td><input type="text" name="BuyerEmail" value="<%=buyerEmail%>"></td>
						</tr>			
						<tr>
							<th><span>구매자 연락처</span></th>
							<td><input type="text" name="BuyerTel" value="${corporation.corporatePhone }"></td>
						</tr>	 
						<tr style="display: none;">
							<th><span>인증완료 결과처리 URL<!-- (모바일 결제창 전용)PC 결제창 사용시 필요 없음 --></span></th>
							<td><input type="text" name="ReturnURL" value="<%=returnURL%>"></td>
						</tr>
						<tr>
							<th>가상계좌입금만료일(YYYYMMDD)</th>
							<td><input type="text" name="VbankExpDate" value="${date }"></td>
						</tr>		
									
						<!-- 옵션 --> 
						<input type="hidden" name="GoodsCl" value="1"/>						<!-- 상품구분(실물(1),컨텐츠(0)) -->
						<input type="hidden" name="TransType" value="0"/>					<!-- 일반(0)/에스크로(1) --> 
						<input type="hidden" name="CharSet" value="utf-8"/>					<!-- 응답 파라미터 인코딩 방식 -->
						<input type="hidden" name="ReqReserved" value=""/>					<!-- 상점 예약필드 -->
									
						<!-- 변경 불가능 -->
						<input type="hidden" name="EdiDate" value="<%=ediDate%>"/>			<!-- 전문 생성일시 -->
						<input type="hidden" name="SignData" value="<%=hashString%>"/>	<!-- 해쉬값 -->
					</table>
					<button class="btn_blue" onClick="nicepayStart();">요 청</abutton>
				</form>
			</div>
		</div>
    </section>
     <footer>
		<a href="#up"><img src="img/footerLogo.png"></a> <a href="#">전체서비스</a>&ensp;|&ensp;
		<a href="#">이용약관</a>&ensp;|&ensp; <a href="#">개인정보처리방침</a>&ensp;|&ensp;
		<a href="#">제휴문의</a>&ensp;| © CODLING Corp.
	</footer>
</body>
</html>
<%!
public final synchronized String getyyyyMMddHHmmss(){
	SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
	return yyyyMMddHHmmss.format(new Date());
}
// SHA-256 형식으로 암호화
public class DataEncrypt{
	MessageDigest md;
	String strSRCData = "";
	String strENCData = "";
	String strOUTData = "";
	
	public DataEncrypt(){ }
	public String encrypt(String strData){
		String passACL = null;
		MessageDigest md = null;
		try{
			md = MessageDigest.getInstance("SHA-256");
			md.reset();
			md.update(strData.getBytes());
			byte[] raw = md.digest();
			passACL = encodeHex(raw);
		}catch(Exception e){
			System.out.print("암호화 에러" + e.toString());
		}
		return passACL;
	}
	
	public String encodeHex(byte [] b){
		char [] c = Hex.encodeHex(b);
		return new String(c);
	}
}
%>