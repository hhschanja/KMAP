<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/bootStrap.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${alchol.name }</title>
<style type="text/css">
/*센션 스타트  */
section {
	width: 60%;
	margin: 0 auto;
	margin-top: 50px;
	overflow: hidden;
}

.section_top {
	width: 100%;
	height: 300px;
}

.section_top_1 {
	width: 30%;
	height: 100%;
	display: inline-block;
	overflow: hidden;;
}

.section_top_1 img {
	width: 76%;
	height: 90%;
	margin-top: 5%;
	margin-left: 5.5%;
}

.section_top_2 {
	width: 70%;
	height: 100%;
	float: right;
	display: inline-block;
}
.section_top_2 form {
	font-weight: bolder;
	margin-left: 20%;
}
.section_top_2 h2 {
	font-weight: bolder;
	margin-left: 30%;
}

table {
	margin-top: 2%;
	font-size: 20px;
	margin-left: 20%;
	width: 90%;
	height: 80%;
}

.first_td {
	font-weight: bold;
	width: 11%;
}
#result{
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
#result > p {
	display: inline;
}
#result > span {
	cursor : pointer;
	float: right;
	text-align: right;
}
#reply_contents{
	height: 20px;
	text-align: left;
}
/*======================================  */
.section_middle {
	margin-top: 30px;
	margin-left: 5%;
	width: 90%;
	font-size: 20px;
}

#line {
	width: 90%;
	height: 2%;
	margin-top: 10%;
}

#line>img {
	width: 100%;
}




#result{
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
#result > p {
	display: inline;
	margin-bottom: 0;
}
#result > span {
	cursor : pointer;
	float: right;
	text-align: right;
}
#reply_contents{
	height: 20px;
	text-align: left;
}

#reply{
	float: right;
}
#reply_writer{
	float: left;
}
.form-control{
	display: inline;
}
#del {
	cursor: pointer;
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
	<section>
		<div class="section_top">
			<div class="section_top_1">

				<c:if test="${not empty upload.fname}">
					<a href="../upload/${upload.fname}"><img alt="" src="../upload/${upload.fname}"></a>
				</c:if>

			</div>
			<div class="section_top_2">
				<h2>${alchol.name }</h2>
				<table>
					<tr>
						<td class="first_td">가&nbsp;&ensp;&nbsp;격:</td>
						<td>&ensp;<fmt:formatNumber value="${alchol.price }" type="currency" currencySymbol=""/> 원</td>
					</tr>
					<tr>
						<td class="first_td">갯&nbsp;&ensp;&nbsp;수:</td>
						<td>&ensp;${alchol.count }</td>
					</tr>
					<tr>
						<td class="first_td">종&nbsp;&ensp;&nbsp;류:</td>
						<td>&ensp;${alchol.kind }</td>
					</tr>
					<tr>
						<td class="first_td">원&nbsp;&ensp;&nbsp;료:</td>
						<td>&ensp;${alchol.material }</td>
					</tr>
					<tr>
						<td class="first_td">용&nbsp;&ensp;&nbsp;량:</td>
						<td>&ensp;${alchol.capacity }ml</td>
					</tr>
					<tr>
						<td class="first_td">도&nbsp;&ensp;&nbsp;수:</td>
						<td>&ensp;${alchol.degree }%</td>
					</tr>
					<tr>
						<td class="first_td">제조일:</td>
						<td>&ensp;${alchol.made_date }</td>
					</tr>


				</table>
					<c:if test="${member !=null }">
			<form action="../basket/basketInsert.basket" id="basket">
				장바구니 담기: <input type="number"  min="1" max="${alchol.count }" style="display: inline-block;"name="count" id="basketCount">
				 <input type="hidden" name="name"value="${alchol.name }"> 
				 <input type="hidden"name="type_num" value="${alchol.anum }"> 
				 <input type="hidden" name="price" value="${alchol.price }">
				 <input type="hidden" name="type"value="alchol">
				 <input type="button" class="form-control" style="width :60px; margin-top: 5px; display: inline-block;" value="담기" id="basketBtn">
			</form>

			<form action="../purchase/purchaseFormOne.jsp" style="margin-top: 1px;" id="purchase">
				구매 갯수: <input type="number" min="1" max="${alchol.count }" name="count" style="display: inline-block;" id="purchaseCount"> 
				<input type="hidden" name="name"value="${alchol.name }">
				<input type="hidden" name="type"value="alchol"> 
				<input type="hidden" name="fname" value="${upload.fname}">
					<input type="hidden" name="type_num"value="${alchol.anum }"> 
					<input type="hidden" name="price"value="${alchol.price }">
					<input type="button"style="width :80px;margin-top: 5px; display: inline-block;"  class="form-control" value="구매하기" id="purchaseBtn">
			</form>
				</c:if>
			</div>
		

		</div>
		
			<div id="line">
			<img alt="" src="../images/common/line.png">
		</div>
		<div class="section_middle">${alchol.contents }</div>

		<div id="line">
			<img alt="" src="../images/common/line.png">
		</div>
		<h2>상품  후기</h2>
	<c:choose>
		<c:when test="${empty member and empty admin}">
			댓글을 남기고 싶다면 로그인을 먼저하세요
			<hr>		
		</c:when>
		<c:when test="${not empty member}">
			<input type="hidden" name="type" value="alchol" class="type"> 
			<input type="hidden" name="type_num" value="${alchol.anum}" class="type_num">	
			<input type="text" name="writer" value="${member.id}" readonly="readonly" class="writer form-control" style="width: 9%;">
			<input type="text" name="contents" class="contents form-control" style="width:50%;">		
			<input type="submit" value="댓글달기" id="reply" class="form-control" style="width : 120px; text-align: center;">
			<hr>
		</c:when>
		<c:when test="${not empty admin}">
			<input type="hidden" name="type" value="alchol" class="type"> 
			<input type="hidden" name="type_num" value="${alchol.anum}" class="type_num">	
			<input type="text" name="writer" value="${admin.id}" readonly="readonly" class="writer form-control" style="width: 9%;">
			<input type="text" name="contents" class="contents form-control" style="width:50%;">		
			<input type="submit" value="댓글달기" id="reply" class="form-control" style="width : 120px; text-align: center;">
			<hr>
		</c:when>
	</c:choose>
	
	<div id="result">
	<c:forEach items="${reply}" var="R">	
	<p id="reply_writer">작성자 | ${R.writer} / ${R.reg_date}</p>
	
	<c:if test="${member.id eq R.writer}">
	<span class="mod" id="${R.num}">수정</span>
	<span>&emsp;</span>
	<span class="del" id="${R.num}">삭제</span><br>
	</c:if>
	
	<c:if test="${admin.id eq R.writer}">
	<span class="mod" id="${R.num}">수정</span>
	<span>&emsp;</span>
	<span class="del" id="${R.num}">삭제</span><br>
	</c:if>	
		
	<br>
	<div id="reply_contents">${R.contents} </div>
	<br>
	
	</c:forEach>
	</div>
		<div class="section_bottom">
			
		<c:choose>
		<c:when test="${param.atype != null }">
		<a href="alcholList_2.alchol?type=${param.atype}" style="float: left; "><input type="button"style="width :130px;margin-top: 5px; display: inline-block;"  class="form-control" value="${param.atype} 리스트로"></a>
		</c:when>
		<c:otherwise>
		<a href="./alcholList.alchol" style="float: left; "><input type="button"style="width :130px;margin-top: 5px; display: inline-block;"  class="form-control" value="목록으로"></a>
		</c:otherwise>
		</c:choose>		
		<a href="../maker/makerView.maker?num=${alchol.maker_num }" style="float: left; "><input type="button"style="width :130px;margin-top: 5px; display: inline-block;"  class="form-control" value="양조장보기"></a>
	<c:if test="${admin != null }">
			<form action="alcholDelete.alchol" method="post" id="frm">
				<input type="hidden" name="anum" value="${alchol.anum }">
				<input type="hidden" name="fname" value="${upload.fname }">
				<input type="button"style="width :130px;margin-top: 5px; display: inline-block; float: right"  class="form-control" value="삭제" id="delete">
			<a href="alcholUpdateForm.alchol?anum=${alchol.anum }" style="float: right; display: inline-block;"><input type="button"style="width :130px;margin-top: 5px; display: inline-block;"  class="form-control" value="수정"></a>
			</form>
			</c:if>

		</div>
	</section>

<c:import url="../temp/footer.jsp"/>
<script type="text/javascript">
$("#basketBtn").click(function(){
	var count = $("#basketCount").val() * 1
	var max = $("#basketCount").attr("max") * 1
	if(max>=count &&count > 0){
		$("#basket").submit();
		
	}else{
		alert("담을 수 있는 수량을 벗어났습니다.");
	}
});
$("#purchaseBtn").click(function(){
	var count = $("#purchaseCount").val() * 1
	var max = $("#purchaseCount").attr("max") * 1
	if(max>=count &&count > 0){
		$("#purchase").submit();
		
	}else{
		alert("구매할 수 있는 수량을 벗어났습니다.");
	}
});


		$("#delete").click(function(){
			var result = confirm("삭제하시겠습니까?");
			if(result){
				$("#frm").submit();
				
			}
		});
		$("#reply").click(function() {
			var type = $(".type").val();
			var type_num = $(".type_num").val();
			var writer = $(".writer").val();
			var contents = $(".contents").val();
			
			$.ajax({
				url : "replyWrite.reply",
				type : "GET",
				data :{
					type : type,
					type_num : type_num,
					writer : writer,
					contents : contents
				},
				success : function(data) {
					$(".contents").val("");
					$("#result").html(data);
				}
			});
		});
		
		$("#result").on("click",".del", function() {
			
			var id = $(this).attr('id');
			var type_num = $(".type_num").val();
			var type = $(".type").val();
			var result = confirm("댓글을 지우시겠습니까?");
			if(result){				
			$.ajax({
				url : "replyDelete.reply",
				type : "GET",
				data : {
					id : id,
					type_num : type_num,
					type : type
					},
				success : function(data) {
					$("#result").html(data);
				}
					
			});
			}
			
		});
		$("#result").on("click",".mod", function() {
			var id = $(this).attr('id');

			$.ajax({
				url : "replyUpdateForm.reply",
				type : "GET",
				data : {id : id},
				success : function(data) {
					$("#result").html(data);
				}
			});		
			
		});
		
		$("#result").on("click","#update", function() {
			var updateNum = $("#updateNum").val();
			var updateContents = $("#updateContents").val();
			var type_num = $(".type_num").val();
			var type = $(".type").val();
			$.ajax({
				url : "replyUpdate.reply",
				type : "GET",
				data : {
					updateNum : updateNum,
					updateContents : updateContents,
					type_num : type_num,
					type : type
					},
				success : function(data) {
					$("#result").html(data);
				}
			});
		});
		
	</script>
</body>
</html>