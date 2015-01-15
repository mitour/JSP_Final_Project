<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<html>
<head>
    <title>DB Connect</title>
</head>
<body>
<%
    request.setCharacterEncoding ("UTF-8");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        try {
            String url="jdbc:mysql://localhost?useUnicode=true&characterEncoding=UTF-8";
            Connection con=DriverManager.getConnection(url,"root","");
            if (con.isClosed()) {
                out.println("<script>");
                out.println("console.log(\"與資料庫建立連線失敗。\");");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("console.log(\"成功與資料庫建立連線。\");");
                out.println("</script>");
            }
            con.close();
        } catch (SQLException sExec) {
            out.println("<script>");
            out.println("SQL錯誤! " + sExec.toString());
            out.println("</script>");
        }
    }catch (ClassNotFoundException err) {
        out.println("<script>");
        out.println("can't found class " + err.toString());
        out.println("</script>");
    }
%>
</body>
</html>



<!--
連上DB後新增
else {
con.createStatement().execute("use online_store");
String sql = "INSERT member(member_name, email, password, gender, birthday, phone, address) " +
"VALUES ('陳曉明', '123', '456', 'male', '0912345678', '111111', '111111')";
boolean no= con.createStatement().execute(sql);
if (!no) {
out.println("<script>");
out.println("console.log('資料新增成功。');");
out.println("</script>");
} else {
out.println("<script>");
out.println("console.log('資料新增失敗。');");
out.println("</script>");
}
} -->