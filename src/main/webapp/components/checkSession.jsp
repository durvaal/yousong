<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	
		<meta charset="UTF-8">
		
	</head>
	<body>
	
		<%
			HttpSession httpSession = request.getSession();
	
			Integer userIdLogged = (Integer) httpSession.getAttribute("userIdLogged");
			
			if (userIdLogged == null) {
				request.setAttribute("sessionExpired", true);

				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
				
				requestDispatcher.forward(request, response);
			}
		%>
		
	</body>
</html>