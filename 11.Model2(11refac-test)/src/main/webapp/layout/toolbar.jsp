<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	 $(function(){
		  
		 /* 로고 클릭 */
		 $("a.navbar-brand").bind("click", function(){
			self.location = "/index.jsp" 
		 });
		  
		 $("button:contains('login')").bind("click", function(){
			self.location = "/user/loginView.jsp" 
		 });
		  
		 $("button:contains('logout')").bind("click", function(){
			self.location = "/user/logout" 
		});
	 });
	   
</script>
	


<!-- ToolBar Start -->
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="target" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <a class="navbar-brand" href="#">Model2MVC Shop</a>
		
		  <div class="collapse navbar-collapse" id="target">
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      
		      <li class="nav-item">
		        <a class="nav-link" href="#">Link</a>
		      </li>
		      
		    </ul>
		    <c:if test="${empty user}">
			    <div id="login">
			    	<button type="button" class="btn btn-outline-success">login</button>
			    </div>
		    </c:if>
		    <c:if test="${!empty user}">
			    <div id="logout">
			    	<button type="button" class="btn btn-outline-warning">logout</button>
			    </div>
		    </c:if>
		  </div>
		</nav>
	</div>


