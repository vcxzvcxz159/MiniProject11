<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>ȸ�� ���� ����</title>
	
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
		
		//=====����Code �ּ� ó�� ��  jQuery ���� ======//
		function fncUpdateUser() {
			// Form ��ȿ�� ����
			//var name=document.detailForm.userName.value;
			var name=$("input[name='userName']").val();
			
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
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
		//==> �߰��Ⱥκ� : "����"  Event ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
				fncUpdateUser();
			});
		});	
		
	
		 /*============= jQuery ���� �ּ�ó�� =============
		function check_email(frm) {
				var email=document.detailForm.email.value;
			    if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
			    	alert("�̸��� ������ �ƴմϴ�.");
					return false;
			    }
			    return true;
		}========================================	*/
		//==> �߰��Ⱥκ� : "�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
		
	 	/*============= jQuery ���� �ּ�ó�� =============
		function resetData() {
			document.detailForm.reset();
		}========================================	*/
		//==> �߰��Ⱥκ� : "���"  Event ���� �� ó��
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		
			
			 $( "button:contains('�� ��')" ).on("click" , function() {
				 fncUpdateUser();
			});
		});
	
	</script>		
</head>

<body bgcolor="#ffffff" text="#000000">
	
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
		<h3>ȸ����������</h3>
	</div>
	
	<div class="container">
		<form>
			<label for="InputUserId">�� �� ��</label>
			<input class="form-control" name="userId" id="InputUserId" type="text" value="${user.userId}" readonly>
		  	<div class="form-group">
			   <label for="inputUserName">�� ��</label>
			   <input type="text" name="userName" class="form-control" id="inputUserName" value="${user.userName}">
			</div>
			<div class="form-group">
			   <label for="inputAddr">�� ��</label>
			   <input type="text" name="addr" class="form-control" id="inputAddr" value="${user.addr }">
			</div>
			  
			<div class="form-row align-items-center">
			   <div class="col-auto my-1">
				    <div class="form-row">
					    <div class="col-3">
					      <label for="InputPhone">�޴���ȭ</label>
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
			   <label for="inputAddr">�̸���</label>
			   <input type="text" name="email" class="form-control" id="inputAddr" value="${user.email }">
			</div>
			  
			<div class="container">
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				  <button class="btn btn-primary me-md-2" >�� ��</button>
				  <button class="btn btn-primary" onClick="history.go(-1);" style="margin-left:10px;" return false; >�� ��</button>
				</div>
			</div>
		</form>
	</div>
	
</body>

</html>