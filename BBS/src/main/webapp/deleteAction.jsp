<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "bbs.BbsDAO" %>
<%@ page import= "bbs.Bbs" %>
<%@ page import= "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>JSP</title>
</head>
<body>
 	<%
 		PrintWriter script = response.getWriter();
 		String userID = null;
		
		if(session.getAttribute("userID") != null){			
			userID = (String) session.getAttribute("userID");
		} 
		
		if(userID == null){
			script.println("<script>");
			script.println("alert('Please log in')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		

		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
			
		}
		
		if(bbsID == 0){
			script.println("<script>");
			script.println("alert('This is an invalid post.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			script.println("<script>");
			script.println("alert('There is no authority')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}else{
				
			BbsDAO bbsDAO = new BbsDAO();
	 		int result = bbsDAO.delete(bbsID);

	 		if(result == -1){
	 			script.println("<script>");
	 			script.println("alert('Deleting failed.')");
	 			script.println("history.back()");
	 			script.println("</script>");
	 			
	 		}else{
				script.println("<script>");
	  			script.println("location.href = 'bbs.jsp'");
 	 			script.println("</script>");
	 			
	 		} 
			
		}	
	 
		 
 	 
 	%>
</body>
</html>