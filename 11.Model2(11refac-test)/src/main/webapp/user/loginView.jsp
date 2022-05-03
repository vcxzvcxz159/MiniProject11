<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>�α��� ȭ��</title>
	
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
	   
		/*=============jQuery ���� �ּ�ó�� =============
		function fncLogin() {
			var id=document.loginForm.userId.value;
			var pw=document.loginForm.password.value;
			
			if(id == null || id.length <1) {
				alert('ID �� �Է����� �����̽��ϴ�.');
				document.loginForm.userId.focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('�н����带 �Է����� �����̽��ϴ�.');
				document.loginForm.password.focus();
				return;
			}
		}
		
		//Call Back Method �̿� onload �� Event ó��
		window.onload = function(){
			document.getElementById("userId").focus();
		}========================================	*/
		$( function() {
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#userId").focus();
			
			//==> �߰��Ⱥκ� : "Login"  Event ����
			$("button.btn-primary:contains('�� �� ��')").on("click" , function() {

				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("input:text").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("input:password").focus();
					return;
				}
				
				//$("form").attr("method" , "POST");
				//$("form").attr("action" , "/login.do");
				//$("form").attr("target" , "_parent");
			    //$("form").submit();
				//==> ���� 4���๮�� �����ǹ�			    
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
				
			});
			
			$("button.btn-primary:contains('ȸ������')").on("click" , function(){
				self.location = "/user/addUser" 
			});
		});
		
		
		//*=============jQuery �߰��Ⱥκκ� : ȸ��������ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("img[src='/images/btn_add.gif']").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>		
	
</head>

<body bgcolor="#ffffff" text="#000000" >
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container" style="margin-top: 100px;">
		  <h3 style="text-align: center">�� �� ��</h3>
	</div>
	
	<div class="container">
		<form name="detailForm">
			<div class="form-row">
				<div class="col-4"></div>
				<div class="col-4">
			   		<input type="text" name="userId" class="form-control" id="InputUserId" placeholder="���̵�">
			   		<input type="password" name="password" class="form-control" id="InputPassword" placeholder="��й�ȣ">
				</div>
				<div class="col-4"></div>
				
			</div>
			<div style="text-align: center; margin-top: 20px;">
				<button type="button" class="btn btn-primary" >�� �� ��</button>
				<button type="button" class="btn btn-primary" >ȸ������</button>
			</div>
		</form>	
	</div>

</body>

</html>