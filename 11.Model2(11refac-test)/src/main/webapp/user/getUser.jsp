<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>회원정보조회</title>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
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
	
	
<!-- CDN(Content Delivery Network) 호스트 사용 -->
	
	<script type="text/javascript">
		
		//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "button:contains('확 인')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
					self.location = "/index.jsp";
			});
			
			 $( "button:contains('수 정')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
					self.location = "/user/updateUser?userId=${user.userId}";
				});
		});
		
	</script>

</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
		<h3>회원정보조회</h3>
	</div>
	
	<div class="container">
		<div class="card">
		  <div class="card-header">
		    <p><h3>${user.userId}</h3></p>
		    <p>${user.userName}</p>
		  </div>
		  <div class="card-body">
		    <blockquote class="blockquote mb-0">
		      
		      <p><i class="bi bi-telephone"></i> ${user.phone }</p>
		      <hr>
		      <p><i class="bi bi-pin-map"></i> ${user.addr}</p>
		      <hr>
		      <p><i class="bi bi-mailbox"></i> ${user.email }</p>
		      <hr>
		      <p>가입일 ${user.regDate }</p>
		    </blockquote>
		  </div>
		</div>
	</div>
	
	<div class="container">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		  <button class="btn btn-primary me-md-2" >수 정</button>
		  <button class="btn btn-primary" style="margin-left:10px;">확 인</button>
		</div>
	</div>

</body>

</html>