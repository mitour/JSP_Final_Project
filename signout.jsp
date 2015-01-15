<%@page pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("user") != null) {
        session.removeAttribute("user");
        response.sendRedirect("index.jsp");
    } else {
        out.println("登出錯誤。");
        response.sendRedirect("index.jsp");
    }
%>