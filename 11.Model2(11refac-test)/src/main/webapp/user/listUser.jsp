<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>ȸ�� ��� ��ȸ</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js" integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk=" crossorigin="anonymous"></script>

	<!-- //////////////////////////	CSS	///////////////////////////////////////////////// -->
	<style>
		div.container {
			margin-top : 20px;
		}
	</style>
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}

		//==>"�˻�" ,  userId link  Event ���� �� ó��
		
		 $(function() {
			 
		 });
			 
			//==> �˻� Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
			 $( "button:contains('�˻�')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
				fncGetList(1);
			});
			
			
			//==> userId LINK Event ����ó��
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					
					//////////////////////////// �߰� , ����� �κ� ///////////////////////////////////
					//self.location ="/user/getUser?userId="+$(this).text().trim();
					////////////////////////////////////////////////////////////////////////////////////////////
					var userId = $(this).text().trim();
					$.ajax( 
							{
								url : "/user/json/getUser/"+userId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									//Debug...
									//alert(status);
									//Debug...
									//alert("JSONData : \n"+JSONData);
									
									var displayValue = "<h3>"
																+"���̵� : "+JSONData.userId+"<br/>"
																+"��  �� : "+JSONData.userName+"<br/>"
																+"�̸��� : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"����� : "+JSONData.regDateString+"<br/>"
																+"</h3>";
									//Debug...									
									//alert(displayValue);
									$("h3").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		
	</script>		
	
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form>

	<jsp:include page="/layout/toolbar.jsp" />
		
	<div class="container">
		<h3>ȸ�� �����ȸ</h3>
	</div>
	
	<div class="container" style="height: 35px;">
		<div class="form-row">
			<div class="form-group col-md-8"></div>
			<div class="form-group col-md-4">
				<select class="form-group">
					<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
					<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ����</option>
				</select>
				<input type="text" id="searchKeyword" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="form-group" style="width:150px; height:25px" />
				<button type="button" class="btn btn-light">�˻�</button>
			</div>
		</div>
	</div>
	
	<div class="container" style="margin-top: 0px;">
		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
	</div>
	
	<div class="container">
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th scope="col" width="100" style="padding-bottom:23px;">No</th>
		      <th scope="col" width="180">ȸ��ID<br/><h7 >(id click:������)</h7></th>
		      <th scope="col" width="150" style="padding-bottom:23px;">ȸ����</th>
		      <th scope="col" style="padding-bottom:23px;">�̸���</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
		  	<c:set var="i" value="${i+1}" />
			    <tr>
			      <th scope="row">${i }</th>
			      <td>${user.userId }</td>
			      <td>${user.userName }</td>
			      <td>${user.email }</td>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
<input type="hidden" id="currentPage" name="currentPage" value=""/>

 <!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   
	
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>

</html>