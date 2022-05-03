<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
 
 <!DOCTYPE html>
 
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

	<!-- //////////////////////////	CSS	///////////////////////////////////////////////// -->
	<style>
		div.container {
			margin-top : 20px;
		}
	</style>
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	  $(function(){
		  
		  /* 로고 클릭 */
		  $("a.navbar-brand").bind("click", function(){
			 self.location = "/index.jsp" 
		  });
		  
		  /* 로그인 */
		  $("a[href='#']:contains('로그인')").bind("click", function(){
			 	self.location = "/user/login" 
		  });
		  
		  /* 회원가입 */
		  $("a[href='#']:contains('회원가입')").bind("click", function(){
			 	self.location = "/user/addUser" 
		  });
		  
		  /* 상품조회 */
		  $("a[href='#']:contains('상품조회')").bind("click", function(){
			 	self.location = "/product/listProduct?menu=search" 
		  });
	  });
	   
	</script>
	
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
		<div class="container">
		  <div class="row">
		  	<div class="col-2">
		  		<div class="list-group">
				  <a href="#" class="list-group-item list-group-item-action">상품조회</a>
				  <a href="#" class="list-group-item list-group-item-action">최근본 상품</a>
				  <a class="list-group-item list-group-item-action disabled">A disabled item</a>
				</div>
		  	</div>
		  	<div class="col-10">
		  		<div class="jumbotron">
				  <h1 class="display-4">Model2MVC Shop</h1>
				  <p class="lead">Don't be afraid of death, Winnie. Be afraid of the unlived life.</p>
				  <hr class="my-4">
				  <p>빨리 회원가입 하자</p>
				  <a class="btn btn-primary btn-lg" href="#" role="button">로그인</a>
				  <a class="btn btn-primary btn-lg" href="#" role="button">회원가입</a>
				</div>
		  	</div>
		  </div>
		 </div>
	

</body>

</html>