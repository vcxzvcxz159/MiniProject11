<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">

<title>상품 목록조회</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

	<!-- //////////////////////////	CSS	///////////////////////////////////////////////// -->
	<style>
		div.container {
			margin-top : 20px;
		}
		
		img {
			height : 290px;
		}
	</style>
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncGetList(currentPage, priceCondition) {
		//var minCharge = document.detailForm.minCharge.value;
		var minCharge = $("input[name='minCharge']").val();
		//var maxCharge = document.detailForm.maxCharge.value;
		var maxCharge = $("input[name='maxCharge']").val();
		
		if(parseInt(minCharge) > parseInt(maxCharge)) {
			alert("가격입력이 잘못되었습니다.");
			return;
		}
		
		//document.getElementById("priceCondition").value = priceCondition;
		$("#priceCondition").val(priceCondition);
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage);
		//document.detailForm.submit();
		$("form").attr("method", "POST").attr("action", "/product/listProduct").submit();
	}
	
	$(function(){
		$("td.ct_btn01:contains('검색')").bind("click", function(){
			fncGetList('0', '1');
		});
		
		$("td:contains('높은순')").bind("click", function(){
			fncGetList('1', '1');
		});
		
		$("td:contains('낮은순')").bind("click", function(){
			fncGetList('1', '2');
		});
			
	});
	
	$(window).bind("scroll", function(){
		if($(window).scrollTop() == $(document).height() - $(window).height()){
			console.log("작동!!")
			var c_Page = $("#currentPage").val();
			
			c_Page = Number(c_Page) +1;
			jQuery.ajax(
					{
						url : "/product/json/listProduct" ,
						method : "POST" ,
						data : JSON.stringify({
							currentPage : c_Page
						}),
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
						
							$("#currentPage").val(c_Page);
							var HtmlString = ""

							for(var i=0; i<JSONData.list.length; i++){
								console.log("JSONData : " + JSONData.list[i].prodNo);
								console.log("ProdName : " + JSONData.list[i].prodName);
								console.log("fileName : " + JSONData.list[i].fileName);
								
								HtmlString += "<div class='col mb-4'>"
										+ "<div class='card h-100'>"
										
										if(JSONData.list[i].fileName != null){
											HtmlString += "<a href='/product/getProduct?prodNo="+JSONData.list[i].prodNo+"&menu=search'><img src='/images/uploadFiles/"+JSONData.list[i].fileName+"' class='card-img-top'></a>"
										}else{
											HtmlString +=  "<a href='/product/getProduct?prodNo="+JSONData.list[i].prodNo+"&menu=search'><img src='/images/uploadFiles/noImage.jpg' class='card-img-top'></a>"
										}
										
								HtmlString += "<div class='card-body'>"
										+ "<h5 class='card-title'>"+JSONData.list[i].prodName+"</h5>"
										+ "<p class='card-text'>"+JSONData.list[i].prodDetail+"</p>"
										+ "<p class='card-text'>"+JSONData.list[i].price+"원<a href='/purchase/addPurchase?prodNo="+JSONData.list[i].prodNo+"' class='btn btn-primary' style='float: right;'>구매하기</a></p>"
										+ "</div>"
										+ "</div>"
										+ "</div>"
										
							}
							
							 console.log(HtmlString); 
							 
							 $("#productList").append(HtmlString);
						}
					}		
				);
		}
	});
	
	function notLogin(){
		alert("로그인을 하셔야 합니다.");
		document.detailForm.action='/user/loginView.jsp';
		document.detailForm.submit();
		$("form").attr("method", "POST").attr("action", "/user/loginView.jsp").submit();
	}
	
	

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- NavBar -->
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
		
		<h3>상품 목록</h3>
		
	
		<form>
			<div class="row">
				<div class="col-md-6 text-left">
						<label for="InputProductName" class="col-sm-2 col-form-label">상품명</label>
						<div class="col-sm-2">
				   			<input type="text" name="prodName" class="form-control" id="InputProductName">
						</div>
				</div>
				
				<div class="row">
					
					<label for="minCharge" class="col-sm-2 col-form-label">최소가격</label>
					<div class="col-sm-5">
				   		<input type="text" name="minCharge" class="form-control" id="minCharge" value="${! empty search.minCharge ? search.minCharge : ""}" style="width:150px;" >
				   	</div>
				   	<label for="maxCharge" class="col-sm-2 col-form-label">최대가격</label>
				   	<div class="col-sm-5">
				   		<input type="text" name="maxCharge" class="form-control" id="maxCharge" value="${! empty search.maxCharge ? search.maxCharge : ""}" style="width:150px;">
					</div>
				
				</div>
			</div>
			<input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage }"/>
			<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
			<input type="hidden" id="priceCondition" name="priceCondition" value=""/>
		</form>
	
	
	<div class="row row-cols-1 row-cols-md-3" id="productList">
	<c:forEach var="product" items="${list}">
	  <div class="col mb-4">
	    <div class="card h-100">
	    	<c:if test="${!empty product.fileName}">
	    		<a href="/product/getProduct?prodNo=${product.prodNo }&menu=search">
	      			<img src="/images/uploadFiles/${product.fileName}" class="card-img-top">
	      		</a>
	      	</c:if>
	      	<c:if test="${empty product.fileName}">
	      		<a href="/product/getProduct?prodNo=${product.prodNo }&menu=search">
	      			<img src="/images/uploadFiles/noImage.jpg" class="card-img-top">
	      		</a>
	      	</c:if>
	      	<div class="card-body" style="float: bottom">
	        	<h5 class="card-title">${product.prodName }</h5>
	        	<p class="card-text">${product.prodDetail }</p>
	        	<p class="card-text">${product.price}원 <a href="/purchase/addPurchase?prodNo=${product.prodNo }" class="btn btn-primary" style="float : right;">구매하기</a></p> 
	      	</div>
	    </div>
	 </div>
	 </c:forEach>
	</div>
	
</div>
	
</body>
</html>