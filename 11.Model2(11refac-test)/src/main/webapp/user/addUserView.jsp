<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>ȸ������</title>
	
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
		function fncAddUser() {
			// Form ��ȿ�� ����
			//var id=document.detailForm.userId.value;
			//var pw=document.detailForm.password.value;
			//var pw_confirm=document.detailForm.password2.value;
			//var name=document.detailForm.userName.value;
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			//if(document.detailForm.password.value != document.detailForm.password2.value) {
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				//document.detailForm.password2.focus();
				$("input:text[name='password2']").focus();
				return;
			}
				
			//if(document.detailForm.phone2.value != "" && document.detailForm.phone2.value != "") {
			//	document.detailForm.phone.value = document.detailForm.phone1.value + "-" + document.detailForm.phone2.value + "-" + document.detailForm.phone3.value;
			//} else {
			//	document.detailForm.phone.value = "";
			//}
			
			var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}
			//Debug..
			//alert("phone : "+value)
			$("input:hidden[name='phone']").val( value );
			
			//document.detailForm.action='/user/addUser';
			//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		//===========================================//
		//==> �߰��Ⱥκ� : "����"  Event ����
		
		
		$(function() {	
			 $( "button:contains('ȸ������')" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		$(function() {	
			 $( "button:contains('���')" ).on("click" , function() {
				$("form")[0].reset();
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
		
	   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   //==> �ֹι�ȣ ��ȿ�� check �� ����������....
		function checkSsn() {
			var ssn1, ssn2; 
			var nByear, nTyear; 
			var today; 
	
			ssn = document.detailForm.ssn.value;
			// ��ȿ�� �ֹι�ȣ ������ ��츸 ���� ��� ����, PortalJuminCheck �Լ��� CommonScript.js �� ���� �ֹι�ȣ üũ �Լ��� 
			if(!PortalJuminCheck(ssn)) {
				alert("�߸��� �ֹι�ȣ�Դϴ�.");
				return false;
			}
		}
	
		function PortalJuminCheck(fieldValue){
		    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
			var num = fieldValue;
		    if (!pattern.test(num)) return false; 
		    num = RegExp.$1 + RegExp.$2;
	
			var sum = 0;
			var last = num.charCodeAt(12) - 0x30;
			var bases = "234567892345";
			for (var i=0; i<12; i++) {
				if (isNaN(num.substring(i,i+1))) return false;
				sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
			}
			var mod = sum % 11;
			return ((11 - mod) % 10 == last) ? true : false;
		}
		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		/*============= jQuery ���� �ּ�ó�� =============
		function fncCheckDuplication() {
			popWin 
				= window.open("/user/checkDuplication.jsp",
											"popWin", 
											"left=300,top=200,width=300,height=200,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		}========================================	*/
		//==> �߰��Ⱥκ� : "ID�ߺ�Ȯ��" Event ó�� �� ����
		 $(function() {
			
			$("a.navbar-brand").bind("click", function(){
				self.location = "/index.jsp";	
			});
		});	

	</script>		
	
</head>

<body bgcolor="#ffffff" text="#000000">
	
	<!-- NavBar -->
	<jsp:include page="/layout/toolbar.jsp" />


<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
<form name="detailForm"  method="post" >
////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<div class="container">
		<h3>ȸ������</h3>
	</div>
	
	<div class="container">
		<form name="detailForm">
		  <div class="form-group">
		    <label for="InputUserId">�� �� �� </label>
		    <input type="text" name="userId" class="form-control" id="userId" aria-describedby="emailHelp">
		    <small id="userIdHelp" class="form-text text-muted">��� �����մϴ�.</small>
		  </div>
		  <div class="form-group">
		  	<div class="form-row">
		  		<div class="col">
		    		<label for="InputPassword1">��й�ȣ</label>
		   			<input type="password" name="password" class="form-control" id="InputPassword1">
		  		</div>
		  		<div class="col">
		    		<label for="InputPassword2">��й�ȣ Ȯ��</label>
		   			<input type="password" name="password2" class="form-control" id="InputPassword2">
		  		</div>
		  	</div>
		  	<small id="userIdHelp" class="form-text text-muted">��� �����մϴ�.</small>
		  </div>
		  <div class="form-row">
		  	<div class="col-6">
		  		<label for="InputUserName">�� ��</label>
		   		<input type="text" name="userName" class="form-control" id="InputUserName">
		  	</div>
		  </div>
		  <div class="form-row">
		  	<div class="col-6">
		  		<label for="InputSsn">�ֹι�ȣ</label>
		   		<input type="text" name="ssn" class="form-control" id="InputSsn">
		  	</div>
		  </div>
		  <!-- �ּ��Է� -->
		  	<label for="InputUserName">�� ��</label>
		   	<input type="text" name="addr" class="form-control" id="InputAddr">
		   	
		  <div class="form-row align-items-center">
		    <div class="col-auto my-1">
			    <div class="form-row">
				    <div class="col-3">
				      <label for="InputPhone">�޴���ȭ</label>
				      <select class="custom-select mr-sm-2" name="phone1" id="InputPhone">
				        <option value="010" selected>010</option>
				        <option value="011">011</option>
				        <option value="016">016</option>
				        <option value="018">018</option>
				        <option value="019">019</option>
				      </select>
				     </div>
				     <div class="col-4">
				     	<label for="InputPhone2" style="width: 62px; height: 18px;"> </label>
			      		<input type="text" name="phone2" class="form-control" id="InputPhone2">
			    	 </div>
			    	  <h4 style="margin-top: 35px;"> - </h4>
			    	 <div class="col-4">
			    	 	<label for="InputPhone3" style="width: 62px; height: 18px;"> </label>
			      		<input type="text" name="phone3" class="form-control" id="InputPhone3">
			    	 </div>
			    </div>
		    </div>
		   </div>
		   
		   
		  	<div class="form-group">
			   <label for="InputEmail">�̸���</label>
			   <input type="text" name="email" class="form-control" id="InputEmail" aria-describedby="emailHelp">
			   <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			</div>

		  <button type="button" class="btn btn-primary">ȸ������</button>
		  <button type="button" class="btn btn-primary">���</button>
		  <input type="hidden" name="phone" value="">
		</form>
	
	</div>

</body>

</html>