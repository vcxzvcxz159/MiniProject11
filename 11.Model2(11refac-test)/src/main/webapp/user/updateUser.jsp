<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>회원 정보 수정</title>
	
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
		
		//=====기존Code 주석 처리 후  jQuery 변경 ======//
		function fncUpdateUser() {
			// Form 유효성 검증
			//var name=document.detailForm.userName.value;
			var name=$("input[name='userName']").val();
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
				
			//if(document.detailForm.phone2.value != "" && document.detailForm.phone2.value != "") {
			//	document.detailForm.phone.value = document.detailForm.phone1.value + "-" + document.detailForm.phone2.value + "-" + document.detailForm.phone3.value;
			//} else {
			//	document.detailForm.phone.value = "";
			//}
			
			var value = "";	
			if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}
			
			//Debug...
			//alert("phone : "+value);
			$("input:hidden[name='phone']").val( value );
				
			//	document.detailForm.action='/user/updateUser';
			//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}//===========================================//
		//==> 추가된부분 : "수정"  Event 연결
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "td.ct_btn01:contains('수정')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
				fncUpdateUser();
			});
		});	
		
	
		 /*============= jQuery 변경 주석처리 =============
		function check_email(frm) {
				var email=document.detailForm.email.value;
			    if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
			    	alert("이메일 형식이 아닙니다.");
					return false;
			    }
			    return true;
		}========================================	*/
		//==> 추가된부분 : "이메일" 유효성Check  Event 처리 및 연결
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		
		
	 	/*============= jQuery 변경 주석처리 =============
		function resetData() {
			document.detailForm.reset();
		}========================================	*/
		//==> 추가된부분 : "취소"  Event 연결 및 처리
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		
			
			 $( "button:contains('수 정')" ).on("click" , function() {
				 fncUpdateUser();
			});
		});
	
	</script>		
</head>

<body bgcolor="#ffffff" text="#000000">
	
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
		<h3>회원정보수정</h3>
	</div>
	
	<div class="container">
		<form>
			<label for="InputUserId">아 이 디</label>
			<input class="form-control" name="userId" id="InputUserId" type="text" value="${user.userId}" readonly>
		  	<div class="form-group">
			   <label for="inputUserName">이 름</label>
			   <input type="text" name="userName" class="form-control" id="inputUserName" value="${user.userName}">
			</div>
			<div class="form-group">
			   <label for="inputAddr">주 소</label>
			   <input type="text" name="addr" class="form-control" id="inputAddr" value="${user.addr }">
			</div>
			  
			<div class="form-row align-items-center">
			   <div class="col-auto my-1">
				    <div class="form-row">
					    <div class="col-3">
					      <label for="InputPhone">휴대전화</label>
					      <select class="custom-select mr-sm-2" name="phone1" id="InputPhone" >
					        <option value="${user.phone1 }" selected>${user.phone1 }</option>
					        <option value="010">010</option>
					        <option value="011">011</option>
					        <option value="016">016</option>
					        <option value="018">018</option>
					        <option value="019">019</option>
					      </select>
					     </div>
					     <div class="col-4">
					     	<label for="InputPhone2" style="width: 62px; height: 18px;"> </label>
				      		<input type="text" name="phone2" class="form-control" id="InputPhone2" value="${user.phone2 }">
				    	 </div>
				    	  <h4 style="margin-top: 35px;"> - </h4>
				    	 <div class="col-4">
				    	 	<label for="InputPhone3" style="width: 62px; height: 18px;"> </label>
				      		<input type="text" name="phone3" class="form-control" id="InputPhone3" value="${user.phone3 }">
				    	 </div>
			    	</div>
			   </div>
		   	</div>
		   	<input type="hidden" name="phone" value="">
		   	
		   	<div class="form-group">
			   <label for="inputAddr">이메일</label>
			   <input type="text" name="email" class="form-control" id="inputAddr" value="${user.email }">
			</div>
			  
			<div class="container">
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				  <button class="btn btn-primary me-md-2" >수 정</button>
				  <button class="btn btn-primary" onClick="history.go(-1);" style="margin-left:10px;" return false; >취 소</button>
				</div>
			</div>
		</form>
	</div>
	
</body>

</html>