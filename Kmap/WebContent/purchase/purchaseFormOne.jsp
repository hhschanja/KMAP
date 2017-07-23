<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 우편번호API -->
<c:import url="../temp/bootStrap.jsp"/>
<title>구매하기</title>
<style type="text/css">
section{
	width: 60%;
	margin: 0 auto;
}
table{
	width: 100%;
}
th{
border-top: 1px solid black;
	border-bottom: 1px solid black;
	
	text-align: center;
	font-size: 20px;
}
td{
	border-bottom: 1px solid black;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}
.table_short{
width: 18%;


}
.table_short_first{
width: 10%;


}
.table_short_second{
width: 12%;

}
.table_middle{
width: 15%;

}
.table_long{
width: 30%;

}

.purchaseForm{

width: 100%;
margin-top: 20px;
display: inline-block;

}
.chargeChoose{
	font-size: 20px;
	font-weight: bold;
	letter-spacing: 5px;
}
.charge_type{
font-size: 15px;
	font-weight: bold;
}
span{
	font-size: 25px;
}
.priceViewForm{
	overflow:hidden;
	width: 33%;
	float:right;
	margin-bottom: 0px;
	display: inline-block;
	
}

.buy{
	margin-left: 60%;
}
.buy2{
margin-left: 46%;
width :200px;
height: 50px;
border: none;
font-size: 30px;
background-color: black; 
color: white; 

}

/* 배송자 정보 나타나는 부분  */
.information{
	width: 90%;
	margin-top: 30px;
	margin: 0 auto;
	
	font-size: 20px;
}
	.information td{
		border-top: 1px solid black;
		height: 40px;
		
		
	}

 .type{
	width: 15%;
	
	
}
.txt{
	text-align: left;
	width: 70%;
	
}
.txt span{
	font-size: 15px;
}
.purchase_table td{
	text-align: left;
	border-bottom: 1px solid black;
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section>

<form method="get" action="./purchaseBuyOne.purchase">
<table>
<tr>
<th class="table_short_first">선택</th>
<th class="table_middle">이미지 </th>
<th class="table_long">상품명</th>
<th class="table_short_second">상품갯수</th>
<th class="table_short">상품가격</th>
<th class="table_middle">총 가격</th>
</tr>
<tr>
<td class="table_short_first"><input type="checkbox" value="${param.num}" name="ck0" class="totalPrice" title="0"></td>
<td class="table_middle"><img style="width: 100px; height: 120px;" alt="" src="../upload/${param.fname}"></td>
<td class="table_long">${param.name} </td>
<td class="table_short_second">${param.count} </td>
<td class="table_short">
<fmt:formatNumber value="${param.price}" type="currency" currencySymbol=""/> 원
 </td>
<td class="table_middle">
<fmt:formatNumber value="${param.count * param.price}" type="currency" currencySymbol=""/> 원
 </td></tr>
</table>
<input type="hidden" name="name" value="${param.name}">
<input type="hidden" name="count" value="${param.count}">
<input type="hidden" name="price" value="${param.price}">
<input type="hidden" name="type_num" value="${param.type_num}">
<input type="hidden" name="type" value="${param.type}">


<input type="hidden" name="t0" value="${param.type_num}">
<input type="hidden" name="a0" value="0"><!--총 수량 구하기 위한 히든 건드리지 말것!  -->
<input type="hidden" value="${param.count * param.price}" id="totalP0">
<input type="hidden" value="${param.type_num}" name="ckck0" >
<br>
<br>
<div id="line" >
			<img alt="" src="../images/common/line.png">
		</div>




<div class="purchaseForm">

<table class="purchase_table">
<tr><td>
<br>
<p class="chargeChoose">배송지정보</p>
<p>받는이</p>
<input type="text" id="sample6_postcode" placeholder="수취인명" name="member_name" value="${member.name }">
<br>
<br>
<p>우편번호</p>
<input type="text" id="sample6_postcode" placeholder="우편번호" name="address_num" value="${member.address_num }">
<input type="button" onclick="sample6_execDaumPostcode()" style="width :120px;margin-top: 5px; display: inline-block; "  class="form-control" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소" name="address_main" value="${member.address_main }">
<input type="text" id="sample6_address2" placeholder="상세주소" name="address_detail" value="${member.address_detail }">
<br>
<br>

</td></tr>
<tr><td>
<br>
<p class="chargeChoose">결제방법</p>
<span class="charge_type">카드결제</span> <input type="radio" name="charge_type" value="카드결제">&ensp;
<span class="charge_type">무통장입금</span> <input type="radio" name="charge_type" value="무통장입금">&ensp;
<span class="charge_type">휴대폰결제</span> <input type="radio" name="charge_type" value="휴대폰결제">&ensp;
<br>
<br>
</td></tr>

<c:if test="${member.point>= 0 }">
<tr><td>
<div style="float: left;">
<br>
<p><span>포인트 사용하기&ensp;</span><input type="checkbox"    id="memberPointUse"></p> 
<div id="result">
</div>
<br>
</div>

</td></tr>
</c:if>
</table>
<div class="priceViewForm">


</div>

</div>


</form>
</section>



<c:import url="../temp/footer.jsp"/>
</body>
<script>
	var totalP = 0;
	var memberPoint = ${member.point};

	$(".totalPrice").click(function(){
		var sel = $(this).prop("checked") ;
		if(sel){
			var num = $(this).prop("title") ;
			totalP = totalP*1 +  $("#totalP"+num).attr("value")*1;
			
		}else{
			var num = $(this).prop("title") ;
			totalP = totalP*1 - $("#totalP"+num).attr("value")*1;
			if(totalP<=0){
				
				totalP=0;
				
			}			
		}
			
			if(memberPoint*1 >=totalP){
			$("#memberPoint").attr("max",totalP) ;
			}else{
				$("#memberPoint").attr("max",memberPoint*1) ;
			}
			$("#result2").html(totalP+" 원");
			
		
			$.ajax({
				url : "priceView.jsp",
				type : "GET",
				success : function(data){
					if(totalP>0){
						$(".priceViewForm").html(data);
						$("#result2").html(totalP+" 원");
					
					
				}else{
					
						$(".priceViewForm").html("");
					}
					
					
					}
				
			});
			
	});
	
	$("#memberPointUse").click(function(){
		var ck = $(this).prop("checked") ; 
		

		if(ck){
			$.ajax({
				url : "purchasePoint.jsp",
				type : "GET",
				success : function(data){
					$("#result").html(data);	
					$("#memberPoint").attr("max",totalP) ;
					
					}
				
			});
			
			
		}else{
			$("#result").html("");
		}
		
	} );
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

</html>