<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
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
		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
			
		}
		
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('This is an invalid post.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
		
		
		
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
						<li><a href="login.jsp">LOGIN</a></li>
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
						<li><a href="logoutAction.jsp">LOGOUT</a></li>
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
			<table class= "table table-striped" style= "text-align: center; border: 1px solid #ddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeee; text-align: center;">VIEW</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%;">TITLE</td>
						<td colspan="2"><%= bbs.getBbsTitle() %></td>	
					</tr>
					<tr>
						<td>USERID</td>
						<td colspan="2"><%= bbs.getUserID() %></td>	
					</tr>
					<tr>
						<td>DATE</td>
						<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11,13) + "시" + bbs.getBbsDate().substring(14,16) + "분" %></td>	
					</tr>
					<tr>
						<td>CONTENT</td>
						<td colspan="2" style="min-height:200px; text-align:left;"><%= bbs.getBbsContent() %></td>	
 					</tr>
					
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">LIST</a>
			<%
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
				<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">UPDATE</a>
				<a href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">DELETE</a>
			<%		
				}
			%>
		</div>
	
	</div>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>