<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../temp/bootStrap.jsp"/>
<title>환불하기</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/SE2/js/HuskyEZCreator.js" charset="utf-8"></script><!-- 네이버 에디터 -->
<script type="text/javascript">

$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "contents",
        sSkinURI: "/Kmap/SE2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#btn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
        var cou =$("#cou").val();
        var title = $("#title").val();
        var contents = $("#contents").val();
        if(cou !=""&&title !="" &&contents !=""){
 
        $("#frm").submit();
        }else{
        	alert("제목, 내용, 계좌번호는 필수적으로 적어주시기 바랍니다.")
        }
    })
     $("#btn2").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
        var title = $("#title").val();
        var contents = $("#contents").val();
        if(title !="" &&contents !=""){
 
        $("#frm").submit();
        }else{
        	alert("제목, 내용은 필수적으로 적어주시기 바랍니다.")
        }
    })
})
</script>
<style type="text/css">
/* =============SECTION start============= */
a {
	color: black;
}
section {
	width: 60%;
	margin: 0 auto;
}
span {
	font-size: 30px;
	width : 100%;
	height : 50px;
	font-weight: bold;
}

#title{

font-size: 1.5em;

}

.table {
	margin: 0 auto;
	margin-top: 20px;
	width: 100%;
	
}
#boardWrap {
	width: 80%;
	margin: 0 auto;
}
#boardWrap > img {
	margin-top: 5%;
	margin-bottom: 3%;
}
.boardSearch{
	margin-top : 30px;
	display: inline-block;
}
.thead {
	text-align : center;
	border-bottom: 3px gray solid;
	border-top: 1px black solid;
}
.tbody{
	text-align : center;
	border-bottom: 0.5px gray solid;
}
.tkind{
	width : 15%;
}
.tnum{
	width: 9%;
}
.tdate {
	width : 15%;
}
.thit {
	width : 9%;
}
.trecomend {
	width: 10%;
}
#btn{
	width : 50px;
	
}
/* =============SECTION finish============= */
</style>

</head>
<body>
<c:import url="../temp/header.jsp"/>

<section> 

	<form action="../refund/refundInsert.refund" method="get" id="frm">
	<input type="hidden" name="purchase_num" value="${param.purchase_num }">
	<input type="hidden" name="point" value="${param.point }">
	<input type="hidden" name="id" value="${member.id }">
	<span>제목 </span><br> 
	
	<input type="text" style="width: 100%; height: 30px;" name="title" id="title"><br><br>
	<span>내용 </span><br>
	<textarea style="width: 100%" rows="30" cols="30" name="contents" id="contents"></textarea><br><br>
	<c:if test="${param.refund_type eq '무통장입금' }">
	<span>환불받을 계좌 </span><br>
	결제방식이 무통장 입금일 경우 환불받을 계좌 정보를 입력하셔야 합니다.<br>
	은행명:&ensp;<select name="refund_type_1" style="height: 30px;">
	 <option value="신한은행">신한은행</option>
	 <option value="국민은행">국민은행</option>
	 <option value="SC제일은행">SC제일은행</option>
	 <option value="우리은행">우리은행</option> </select><br><br>
	계좌번호:&ensp;<input type="text" style="width: 30%;" name="refund_type_2" placeholder="-없이 입력해 주세요" id="cou">	
	<input style="width: 80px;font-weight: bolder;" type="button" class="form-control" id="btn" value="환불신청">
	</c:if>
	<br><br>
	<c:if test="${param.refund_type != '무통장입금' }">
	<input style="width: 80px;font-weight: bolder;" type="button" id="btn2" class="form-control"  value="환불신청">
	</c:if>
	</form>
	

</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>