<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Signup to DB</title>
</head>
<body>
    <%
        request.setCharacterEncoding ("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

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

                    con.createStatement().execute("use online_store");
                    String sql = "INSERT member(member_name, email, password, gender, birthday, phone, address) VALUES(?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement prestate = con.prepareStatement(sql);
                    prestate.setString(1, name);
                    prestate.setString(2, email);
                    prestate.setString(3, password);
                    prestate.setString(4, gender);
                    prestate.setString(5, birthday);
                    prestate.setString(6, phone);
                    prestate.setString(7, address);

                    try {
                        prestate.executeUpdate();
                    } catch (SQLException sExec) {
                        out.println("<script>");
                        out.println("SQL錯誤! " + sExec.toString());
                        out.println(prestate);
                        out.println("</script>");
                    }
                }
                con.close();
            } catch (SQLException sExec) {
                out.println("<script>");
                out.println("SQL錯誤! " + sExec.toString());
                out.println("</script>");
            }
        }catch (ClassNotFoundException err) {
            out.println("<script>");
            out.println("console.log(\"Can't found class。"+ err.toString()+"\");");
            out.println("</script>");
        }





//    boolean no= con.createStatement().execute(sql);
//    if (!no) {
//        out.println("<script>");
//        out.println("console.log('資料新增成功。');");
//        out.println("</script>");
//    } else {
//        out.println("<script>");
//        out.println("console.log('資料新增失敗。');");
//        out.println("</script>");
//    }
    %>
</body>
</html>