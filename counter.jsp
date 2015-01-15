<%@page pageEncoding = "UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>counter</title>
</head>
<body>
    <%!
        synchronized void count() {  
            ServletContext application = getServletContext();  
            Integer counter = (Integer)application.getAttribute("counter");

            if (counter == null) {  
                counter = 1;
                application.setAttribute("counter", counter);
            } else {  
                counter += 1;
                application.setAttribute("counter", counter);
            }
        }
    %>

    <%
        request.setCharacterEncoding ("UTF-8");

        if (session.isNew()) {
            count();  
        }

        // String straccount = request.getParameter("account");

        // if (request.getCookies() == null) {
        //     //如果使用者是第一次登入，給他一個新的Cookie
        //     Cookie objCookie = new Cookie ("account", straccount);
        //     response.addCookie(objCookie);
        //     objCookie.setMaxAge(60*60*24*7);
        // }

        Integer tcounter = (Integer)application.getAttribute("counter");
    %>

    您是第<%=tcounter%>位訪客!
</body>
</html>