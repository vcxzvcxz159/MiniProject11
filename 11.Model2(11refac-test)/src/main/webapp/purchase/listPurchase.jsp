<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

	function fncGetList(currentPage, priceCondition) {
		document.getElementById("priceCondition").value = priceCondition;
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="13" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${i+1}" />		
	
		<tr class="ct_list_pop">
			<td align="center">
				<a href="/getProduct.do?prodNo=${purchase.purchaseProd.prodNo}">${i}</a>
			</td>
			<td></td>
			<td align="left">
				<a href="/getUser.do?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
			</td>
			<td></td>
			<td align="left">${purchase.receiverName}</td>
			<td></td>
			<td align="left">${purchase.quantity+product.quantity}��</td>
			<td></td>
			<td align="left">���� 
			
				<c:if test="${fn:trim(purchase.tranCode) == '1'}">
					���ſϷ� 
				</c:if>
				<c:if test="${fn:trim(purchase.tranCode) == '2'}">
					�������
				</c:if>
				<c:if test="${fn:trim(purchase.tranCode) == '3'}">
				 	��ۿϷ� 
				 </c:if>
				
			���� �Դϴ�.</td>
			<td></td>
			<td align="left"> 
			<c:if test="${fn:trim(purchase.tranCode) == '1'}">
					<a href="/purchase/updatePurchase?tranNo=${purchase.tranNo}&prodNo=${purchase.purchaseProd.prodNo}">����</a>
			</c:if>
				
			<c:if test="${fn:trim(purchase.tranCode) == '2'}">
					<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3&menu=search">��ۿϷ�</a>
			</c:if>
			</td>
			<td></td>
			<c:if test="${fn:trim(purchase.tranCode) == '1'}">
				<td align="left">
					<a href="/purchase/deletePurchase?tranNo=${purchase.tranNo}">���</a>
				</td>
			</c:if>
			<c:if test="${fn:trim(purchase.tranCode) != '1'}">
				<td align="left">
					��Ұ� �Ұ����մϴ�.
				</td>
			</c:if>
		</tr>
		<tr>
			<td colspan="13" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<input type="hidden" id="priceCondition" name="priceCondition" value=""/>
		 	<jsp:include page="../common/pageNavigator.jsp"/>
		 	
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>