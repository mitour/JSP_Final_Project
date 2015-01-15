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

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int check_email = 0;

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
                     * 若是，才進行下一步「驗證註冊時的 email 不可重複」。
                     */
                    if(name != null &&
                       email != null &&
                       password != null &&
                       gender != null &&
                       birthday != null &&
                       phone != null &&
                       address != null) {
                        /* 驗證註冊時的 email 不可重複：
                         * Step1. 取得資料表筆數 row_count
                         */
                        Statement count_rs = con.createStatement();
                        ResultSet foovalue = count_rs.executeQuery("SELECT COUNT(*) FROM member");
                        foovalue.next();
                        int row_count = foovalue.getInt(1);

                        /* 驗證註冊時的 email 不可重複：
                         * Step2. 根據 member_no 欄位，select 資料表中的 email 欄位，並存入 select_rs。
                         *        Using PreparedStatement()
                         */
                        String select_sql = "SELECT email FROM member WHERE member_no BETWEEN ? AND ?";
                        PreparedStatement select_prestate = con.prepareStatement(select_sql);
                        select_prestate.setInt(1, 1);
                        select_prestate.setInt(2, row_count);

                        ResultSet select_rs = select_prestate.executeQuery();   //執行查詢

                        /* 驗證註冊時的 email 不可重複：
                         * Step3. 依據查詢結果 select_rs 一筆一筆驗證 email 是否重複。
                         *        若重複，眺轉頁面至前一頁,並結束與資料庫的連線。
                         */
                        while (select_rs.next()) {
                            if (select_rs.getString("email").equals(email)) {
                                out.println("<script>");
                                out.println("alert(\"您輸入的信箱已被申請過。\");");
                                out.println("window.history.back()");
                                out.println("</script>");
                                check_email ++;
                            }
                        }
                        /*
                         * 新增會員註冊資料至資料庫：
                         * Step1. Insert 會員資料至 database。
                         *        Using PreparedStatement()
                         */
                        if (check_email == 0 ) {
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
                             * 新增會員註冊資料至資料庫：
                             * Step2. 確認 Insert 是否成功。
                             *        為求 return 值為 true or false 以方便辨認新增成功或失敗，
                             *        暫用 execute() 而非 executeUpdate()。
                             */
                            try {
                                boolean checkupdate = insert_prestate.execute();    //執行新增

                                if (!checkupdate) {
                                    out.println("<script>");
                                    out.println("console.log(\"新增資料成功。\");");
                                    out.println("alert(\"註冊成功，請至首頁登入！\");");
                                    out.println("document.location.href=\"index.jsp\";");
                                    out.println("</script>");
                                } else {
                                    out.println("<script>");
                                    out.println("console.log(\"新增資料失敗。\");");
                                    out.println("</script>");
                                }
                            } catch (SQLException sExec) {
                                out.println("<script>");
                                out.println("console.log(\"新增時SQL錯誤!" + sExec.toString() + "\");");
                                out.println(insert_prestate);
                                out.println("</script>");
                            }
                        }
                    } else {
                        out.println("<script>");
                        out.println("alert(\"各欄位不可空白。\");");
                        out.println("window.history.back()");
                        out.println("</script>");
                    }
                }
                con.close();    //關閉與資料庫之連線。
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