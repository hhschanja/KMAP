<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>

<p class="chargeChoose">!&ensp;포인트 사용시 유의사항</p>
<p class="charge_type">&ensp;&ensp;1. 포인트는 본인 계정에 있는 포인트 만큼 최대 구매할 상품의 총 가격 만큼 사용 가능합니다.</p>
<p class="charge_type">&ensp;&ensp;2. 포인트를 사용해서 상품을 구매하는 경우 적립되는 포인트는 없습니다.</p>
<p class="charge_type">&ensp;&ensp;3. 포인트를 통해 구매한 상품은 환불이 불가능 합니다</p>

</div>
<span class="charge_type">보유 포인트&ensp;</span> <input type="text" style="width: 200px;" readonly="readonly" value="${member.point }"><br>

<span class="charge_type">사용 포인트&ensp;</span> <input type="number" style="width: 200px;" min="1"  name="memberPoint" id="memberPoint"><br>


