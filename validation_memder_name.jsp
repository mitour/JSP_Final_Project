<%@page pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("user") != null) {
        out.println("<li>");
        out.println("<a class=\"page-scroll\">");
        out.println("Hi," + session.getAttribute("user"));
        out.println("</a>");
        out.println("</li>");
        out.println("<li>");
        out.println("<a class=\"page-scroll\" href=\"shopping_cart.jsp\">購物車</a>");
        out.println("</li>");
    }
%>