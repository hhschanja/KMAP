
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${festivalList }"  varStatus="i"  var="festival">
	
<div id="list">
	<div id="list_photo">
		<img style="width: 100%; height: 100%;" alt="" src="../upload/${files[i.index]}">
	</div>
		
	<div id="list_contents">
		<p id="list_contents_1"><a href="festivalView.festival?num=${festival.num }">${festival.name }</a></p>
		<p id="list_contents_2">${festival.start_date} ~ ${festival.last_date}</p>
	</div>

</div>
</c:forEach>
				
<div id="pager">           

<div id="pagination">

<c:if test="${pageResult.curBlock > 1}">
	<span class="block"><a href="./festivalList.festival?curPage=${pageResult.startNum-1}&kind=${param.kind}&search=${param.search}">&lt; Prior</a></span>  
</c:if>

<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="y"> <!-- 이거 page를 num으로 바꿔여해 -->  
    <span><a href="./festivalList.festival?curPage=${y}&kind=${param.kind}&search=${param.search}">${y}</a></span>
</c:forEach>  

<c:if test="${pageResult.curBlock < pageResult.totalBlock}">
	<span class="block"><a href="./festivalList.festival??curPage=${pageResult.lastNum+1}">Next &gt;</a></span>  
</c:if>

</div>
</div>