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

                    /*
                     * 指定連線的資料庫為 online_store
                     */
                    con.createStatement().execute("use online_store");

                    /* 驗證 email 不可重複
                     * Step1. 取得資料表筆數 row_count
                     */
                    Statement count_rs = con.createStatement();
                    ResultSet foovalue = count_rs.executeQuery("SELECT COUNT(*) FROM member");
                    foovalue.next();
                    int row_count = foovalue.getInt(1);

                    /* 驗證 email 不可重複
                     * Step2. select 資料表中 member_no 欄位，存入 rs
                     *       Using PreparedStatement()
                     */
                    String select_sql = "SELECT email FROM member WHERE member_no = ?";
                    PreparedStatement select_prestate = con.prepareStatement(select_sql);
                    select_prestate.setInt(1, row_count);

                    ResultSet rs = select_prestate.executeQuery();  //執行查詢

                    /* 驗證 email 不可重複
                     * Step3. 用 rs 一筆一筆驗證 email 是否重複。
                     *        若重複，眺轉頁面至前一頁。
                     *        若未重複，則下一步驗證使用者是否輸入每一筆資料(後端驗證)。
                     */
                    while (rs.next()) {
                        if(rs.getString("email").equals(email)) {
                            out.println("<script>");
                            out.println("alert('您輸入的信箱有人用過囉');");
                            out.println("window.history.back()");
                            out.println("</script>");
                        } else {
                            out.println("<script>");
                            out.println("console.log(\"信箱未被使用過。\");");
                            out.println("</script>");
                        }
                    }

                    /*
                     * 驗證使用者是否輸入每一筆資料(後端驗證)。
                     */

                    if(name.equals("") ||
                       email.equals("") ||
                       password.equals("") ||
                       gender.equals("") ||
                       birthday.equals("") ||
                       phone.equals("") ||
                       address.equals("")) {
                        out.println("<script>");
                        out.println("alert('各欄位不可空白。');");
                        out.println("window.history.back()");
                        out.println("</script>");
                    }

                    /*
                     * 新增會員註冊資料至資料庫。
                     * Step1. Insert 會員資料至 database。
                     *        Using PreparedStatement()
                     */
                    String insert_sql = "INSERT member(member_name, email, password, gender, birthday, phone, address) VALUES(?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement insert_prestate = con.prepareStatement(insert_sql);
                    insert_prestate.setString(1, name);
                    insert_prestate.setString(2, email);
                    insert_prestate.setString(3, password);
                    insert_prestate.setString(4, gender);
                    insert_prestate.setString(5, birthday);
                    insert_prestate.setString(6, phone);
                    insert_prestate.setString(7, address);

                    /*
                     * 新增會員註冊資料至資料庫。
                     * Step2. 確認 Insert 是否成功。
                     */
                    try {
                        boolean checkupdate = insert_prestate.execute();    //執行新增

                        if(!checkupdate) {
                            out.println("<script>");
                            out.println("console.log(\"新增資料成功。\");");
                            out.println("</script>");
                        } else {
                            out.println("<script>");
                            out.println("console.log(\"新增資料失敗。\");");
                            out.println("</script>");
                        }
                    } catch (SQLException sExec) {
                        out.println("<script>");
                        out.println("console.log(\"SQL錯誤!"+ sExec.toString()+"\");");
                        out.println(insert_prestate);
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