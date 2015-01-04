<%@page pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("user") != null) {
        out.println("<li>");
        out.println("<a class=\"page-scroll\" href=\"signout.jsp\">");
        out.println("登出會員");
        out.println("</a>");
        out.println("</li>");
    } else {
        out.println("<li>");
        out.println("<a class=\"page-scroll\" href=\"signin.jsp\">登入會員</a>");
        out.println("</li>");
        out.println("<li>");
        out.println("<a class=\"page-scroll\" href=\"signup.jsp\">註冊會員</a>");
        out.println("</li>");
    }
%>