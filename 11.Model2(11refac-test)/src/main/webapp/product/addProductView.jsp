<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head>
<title>상품등록</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

	<script type="text/javascript" src="../javascript/calendar.js"></script>
	

	<!-- //////////////////////////	CSS	///////////////////////////////////////////////// -->
	<style>
		div.container {
			margin-top : 20px;
		}
	</style>
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript"> 

	$(function(){
		$("td.ct_btn01:contains('등록')").bind("click", function(){
			//var name = document.detailForm.prodName.value;
			var name = $("input[name='prodName']").val();
			//var detail = document.detailForm.prodDetail.value;
			var detail = $("textarea[name='prodDetail']").val();
			//var manuDate = document.detailForm.manuDate.value;
			var manuDate = $("input[name='manuDate']").val();
			//var price = document.detailForm.price.value;
			var price = $("input[name='price']").val();
			//var quantity = document.detailForm.quantity.value;
			var quantity = $("input[name='quantity']").val();
			
			if(name == null || name.length<1){
				alert("상품명은 반드시 입력하여야 합니다.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("상품상세정보는 반드시 입력하여야 합니다.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				alert("제조일자는 반드시 입력하셔야 합니다.");
				return;
			}
			if(price == null || price.length<1){
				alert("가격은 반드시 입력하셔야 합니다.");
				return;
			}
			if(quantity == null || quantity<1){
				alert("수량은 반드시 입력하셔야 합니다.");
				return;
			}
	
			//document.detailForm.action='/product/addProduct';
			//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/product/addProduct").submit();
		});
	});
	
	$(function(){
		$("td.ct_btn01:contains('취소')").bind("click", function(){
			$("form")[0].reset();
		});
	});
	
	</script>
</head>

<body bgcolor="#ffffff" text="#000000">
	
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
		<h3>상품 등록</h3>
	</div>
	
	<div class="container">
		<form name="detailForm">
		
		  <div class="form-group">
		    <label for="prodName">상품명 </label>
		    <input type="text" name="prodName" class="form-control" id="prodName" >
		  </div>
		  
		  <div class="form-group">
		  	<label for="manuDate">제조일자</label>
		   	<input type="date" name="manuDate"  class="form-control" id="manuDate" >	
		  </div>
		  
		  <div class="form-group">
		    <label for="price">가격</label>
		    <input type="number" name="price" class="form-control" id="price" >
		  </div>
		  
		  <div>
		    <label for="quantity">수량</label>
		    <input type="number" name="quantity" class="form-control" id="quantity" >
		  </div>
		  
		  <div>
		    <label for="prodDetail">상품상세정보</label>
		    <textarea name="prodDetail" class="form-control" id="prodDetail" rows="5"></textarea>
		  </div>
		  
		  <div>
		    <label for="file">상품이미지</label>
		    <input type="file" name="file" class="form-control" id="file" >
		  </div>
		</form>
	</div>  
		 
		  


<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					등록
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
					취소
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</form>
</body>
</html>