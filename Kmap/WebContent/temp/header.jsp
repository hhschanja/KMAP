<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
  	$(function() {
  		$("#company").hover(function() {
  			$(".menu_sub").html('<ul class="slide-menu1 slide-list "><li class="active"><a href="${pageContext.request.contextPath}/introduce/daedong.jsp">대동여주도</a></li><li><a href="${pageContext.request.contextPath}/introduce/object.jsp">사업목적</a></li><li><a href="${pageContext.request.contextPath}/introduce/alcholHistory.jsp">전통주 이야기</a></li></ul>');
		}); 
  		$("#sool").hover(function() {
  			$(".menu_sub").html('<ul class="slide-list slide-menu1"><li class="active"><a href="${pageContext.request.contextPath}/alchol/fruit_wine.jsp">과실주</a></li><li><a href="${pageContext.request.contextPath}/alchol/hard_liquor.jsp">증류주</a></li><li><a href="${pageContext.request.contextPath}/alchol/herbal_liquor.jsp">약주 / 청주</a></li><li><a href="${pageContext.request.contextPath}/alchol/liquor.jsp">리큐르</a></li><li><a href="${pageContext.request.contextPath}/alchol/makgeolli.jsp">막걸리</a></li></ul>');			
		}); 
  		$("#maker").hover(function() {
			$(".menu_sub").html(' <ul class="slide-list slide-menu1"><li class="active"><a href="${pageContext.request.contextPath}/maker/makerList.maker">양조장소개</a></li><li><a href="${pageContext.request.contextPath}/ticket/ticketList.ticket">양조장체험</a></li></ul>');
		});
  		$("#com").hover(function() {
			$(".menu_sub").html('<ul class="slide-list slide-menu1"><li class="active"><a href="${pageContext.request.contextPath}/pairing/pairingList.pairing">안주 페어링</a></li><li><a href="${pageContext.request.contextPath}/freeboard/freeboardList.freeboard">자유게시판</a></li><li><a href="${pageContext.request.contextPath}/festival/festivalList.festival">우리술 대잔치</a></li></ul> ');
		});
  		 
	})
  </script>
  
<div class="head">
  <div class="container text-center">
  	
  	<div id="list1">
      <ul class="list">
        <li class="active" id="company"><a href="${pageContext.request.contextPath}/introduce/daedong.jsp">기업소개</a></li>
        <li class="active" id="sool"><a href="${pageContext.request.contextPath}/alchol/alcholList.alchol">전통주</a></li>
        <li class="active" id="maker"><a href="${pageContext.request.contextPath}/maker/makerList.maker">양조장</a></li>
        <li class="active" id="com"><a href="${pageContext.request.contextPath}/pairing/pairingList.pairing">주주총회</a></li>
      </ul>
      </div>
      <div id="list2">
    		<a href="${pageContext.request.contextPath}/index.jsp"><img style="width: 100%; height: 100%;" alt="" src="${pageContext.request.contextPath}/images/common/대동여주도로고.png"></a>      
      </div>
      <div id="list3">
      	<div id="list3_1">
      <ul class="list22">
      	<li><a href="${pageContext.request.contextPath}/board/questionList.question">질의응답</a></li>
      	<li><a href="${pageContext.request.contextPath}/board/noticeList.notice">공지사항</a></li>
      	<c:if test="${empty member and empty admin }">
        <li><a href="${pageContext.request.contextPath}/member/joinForm.jsp">회원가입</a></li>      	
        <li><a href="${pageContext.request.contextPath}/member/login.jsp"><span class="glyphicon glyphicon-user"></span>로그인</a></li>
      	</c:if>
      	<c:if test="${not empty member and empty admin }">
      	<li><a href="${pageContext.request.contextPath}/basket/basketList.basket">장바구니</a></li>
      	<li><a href="${pageContext.request.contextPath}/member/mypage.jsp">마이페이지</a></li>
      	<li><a href="${pageContext.request.contextPath}/member/memberLogout.member">로그아웃</a></li>
      	</c:if>
      </ul>
      	</div>
      </div>
  </div>
</div>

<nav class="navbar navbar-inverse">
   <div class="menu_sub">
   </div>                            
</nav> 
    
