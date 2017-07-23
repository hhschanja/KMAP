<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <table class="freeboard">
    	<c:forEach items="${best}" var="B">
    	<tr>
    		<td class="tkind">[${B.kind}]${B.title}(${B.recommend})<img alt="" src="./images/common/good.png"></td>
    	</tr>
    	</c:forEach>
    </table>
    
    