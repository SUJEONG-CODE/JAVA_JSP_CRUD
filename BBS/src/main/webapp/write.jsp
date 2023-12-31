<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet"   href="css/bootstrap.css">
<title>JSP</title>
</head>
<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collasped" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1" aria-expanded = "false">
				<span class="icon-bar"></span>	
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP BBS</a>
		</div>
		<div class="collapse navbar-collaps" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">MAIN</a></li>
				<li class="active"><a href="bbs.jsp">LIST</a></li>
			</ul>
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">CONNECT<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">LOG IN</a></li>
						<li><a href="join.jsp">SIGN UP</a></li>
					</ul>
				</li>
			</ul>	
			<%		
				} else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">MEMBER<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">LOG OUT</a></li>
					</ul>
				</li>
			</ul>
			<%		
				}
			%>	
		</div>
	</nav>
	
	<div class = "container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class= "table table-striped" style= "text-align: center; border: 1px solid #ddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeee; text-align: center;">WRITING</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="TITLE" name="bbsTitle" maxlength="50" ></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="CONTENT" name="bbsContent" maxlength="2048" ></textarea></td>
						</tr>
					</tbody>
 				</table>
 				<input type="submit" class="btn btn-primary pull-right" value="WRITE">
 				
			</form>	 
		</div>
	
	</div>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>