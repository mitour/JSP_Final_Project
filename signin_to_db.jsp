<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <%
        request.setCharacterEncoding ("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        /*
         * 載入 JDBC 驅動程式，若找不到 .jar 檔，導入例外事件。
         */
        try {
            Class.forName("com.mysql.jdbc.Driver");

            /*
             * 與資料庫建立連線，若 SQL 碼錯誤，導入例外事件。
             */
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

                    /*
                     * 指定連線的資料庫為 online_store
                     */
                    con.createStatement().execute("use online_store");

                    /*
                     * 驗證使用者是否輸入每一筆資料(後端驗證)。
                     */
                    if(email != null &&
                       password != null) {
                        /*
                         * 驗證帳號密碼是否正確：
                         */
                        String select_sql = "SELECT * FROM member WHERE email = ? AND password = ?";
                        PreparedStatement select_prestate = con.prepareStatement(select_sql);
                        select_prestate.setString(1, email);
                        select_prestate.setString(2, password);

                        ResultSet select_rs = select_prestate.executeQuery();  //執行查詢

                        if(select_rs.next()) {
                            out.println("<script>");
                            out.println("console.log(\"登入成功。\");");
                            out.println("</script>");

                            session.setAttribute("user_id",select_rs.getInt("member_no"));
                            session.setAttribute("user",select_rs.getString("member_name"));
                            response.sendRedirect("index.jsp");
                        } else {
                            out.println("<script>");
                            out.println("alert(\"信箱或密碼不符。\");");
                            out.println("window.history.back()");
                            out.println("</script>");
                        }
                    } else {
                        out.println("<script>");
                        out.println("alert(\"各欄位不可空白。\");");
                        out.println("window.history.back()");
                        out.println("</script>");
                    }

                }
                con.close();
            } catch (SQLException sExec) {
                out.println("<script>");
                out.println("console.log(\"SQL錯誤!"+ sExec.toString()+"\");");
                out.println("</script>");
            }
        }catch (ClassNotFoundException err) {
            out.println("<script>");
            out.println("console.log(\"Can't found class。"+ err.toString()+"\");");
            out.println("</script>");
        }
    %>
</body>
</html>