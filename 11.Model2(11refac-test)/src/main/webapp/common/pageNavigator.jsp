<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<%-- <c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
			◀ 이전
	</c:if>
	<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
			<a href="javascript:fncGetList('${ resultPage.beginUnitPage-1}','${search.priceCondition}')">◀ 이전</a>
	</c:if>
	
	<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		<a href="javascript:fncGetList('${ i }','${search.priceCondition}');">${ i }</a>
	</c:forEach>
	
	<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
			이후 ▶
	</c:if>
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
			<a href="javascript:fncGetList('${resultPage.endUnitPage+1}','${search.priceCondition}')">이후 ▶</a>
	</c:if> --%>
<div class="container">
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  
	  	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
	  		<li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
	  	</c:if>
	  
	  	<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
	  		<li class="page-item">
		      <a class="page-link" href="javascript:fncGetList('${ resultPage.beginUnitPage-1}','${search.priceCondition}')" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
	  	</c:if>
	    
	    <c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
	    	<li class="page-item"><a class="page-link" href="javascript:fncGetList('${ i }','${search.priceCondition}');">${i}</a></li>
	    </c:forEach>
	    
	    <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
	    	<li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
	    </c:if>
	  
	  	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
	  		<li class="page-item">
		      <a class="page-link" href="javascript:fncGetList('${ resultPage.beginUnitPage-1}','${search.priceCondition}')" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
	  	</c:if>
	    
	    
	  </ul>
	</nav>
</div>