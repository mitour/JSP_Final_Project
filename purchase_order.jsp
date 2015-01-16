<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ page import="java.util.Objects" %>
<%
    request.setCharacterEncoding ("UTF-8");

    Cookie[]          cookies         = request.getCookies();
    String            rawCartList     = null;
    String[]          rawCartInfo     = null;
    ResultSet         products        = null;
    String[][]        orderInfo       = null;
    String            delivery        = null;
    PreparedStatement insert_prestate = null;
    int               total           = 0;
    int               countCart       = 0;
    int               deliveryfee     = 0;

    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("cart")) {
                rawCartList = c.getValue();
                rawCartInfo = c.getValue().split("_");
                countCart   = rawCartInfo.length;
                orderInfo = new String[countCart][5];
            }
        }
        if (countCart == 0) {
            out.println("<script>");
            out.println("window.alert('購物車是空的。');");
            out.println("location.href='/product.jsp'");
            out.println("</script>");
        }
    } else {
        out.println("<script>");
        out.println("window.alert('購物車是空的。');");
        out.println("location.href='/product.jsp'");
        out.println("</script>");
    }

    if ((delivery = request.getParameter("delivery")) == null) {
        out.println("window.alert('沒有選擇寄送方式');");
    } else if (delivery.equals("711")) {
        deliveryfee = 50;
    } else if (delivery.equals("post")) {
        deliveryfee = 100;
    } else if (delivery.equals("blackcat")) {
        deliveryfee = 180;
    }

    if(session.getAttribute("user") != null) {
        Object member_no_obj = session.getAttribute("user_id");
        String member_no = String.valueOf(member_no_obj);

        out.println("<script>");
        out.println("console.log('"+member_no+"');");
        out.println("</script>");
            /*
             * 載入 JDBC 驅動程式，若找不到 .jar 檔，導入例外事件。
             */
        try {
            Class.forName("com.mysql.jdbc.Driver");

                /*
                 * 與資料庫建立連線，若 SQL 碼錯誤，導入例外事件。
                 */
            try {
                String url = "jdbc:mysql://localhost?useUnicode=true&characterEncoding=UTF-8";
                Connection con = DriverManager.getConnection(url, "root", "");
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

                    String sql = "SELECT product_no, product_name, image, unit_cost, inventory FROM product WHERE product_no = ?";
                    for (int i = 1; i < countCart; i++) {
                        sql += " OR product_no = ?";
                    }
                    PreparedStatement prestate = con.prepareStatement(sql);
                    for (int i = 0; i < countCart; i++) {
                        prestate.setString(i + 1, rawCartInfo[i]);
                    }
                    products = prestate.executeQuery();

                    if (products == null) {
                        out.println("<script>");
                        out.println("window.alert('購物車是空的。');");
                        out.println("location.href='/product.jsp'");
                        out.println("</script>");
                    }

                    int j = 0;
                    while (products.next()) {
                        String pid          = products.getString("product_no");
                        String product_name = products.getString("product_name");
                        String unit_cost    = products.getString("unit_cost");
                        String rawQuantity  = request.getParameter(pid + "_quantity");
                        int    quantity     = Integer.parseInt(rawQuantity);
                        int    temp         = 0;

                        if (rawQuantity == null) {
                            out.println("<script>");
                            out.println("alert('商品 #" + pid + " 選購數量錯誤。');");
                            out.println("location.href = 'cart.jsp';");
                            out.println("</script");
                        } else {
                            temp = Integer.parseInt(unit_cost) * Integer.parseInt(rawQuantity);
                        }
                        total += Integer.parseInt(unit_cost) * quantity;

                        orderInfo[j][0] = pid;
                        orderInfo[j][1] = product_name;
                        orderInfo[j][2] = unit_cost;
                        orderInfo[j][3] = rawQuantity;
//                        orderInfo[j][4] = Integer.toString(temp);  //小計
                        j++;
                    }
                    total += deliveryfee;

                    String insert_sql = "INSERT orders (member_no, product_no, quantity, totalprice) VALUES (?, ?, ?, ?)";
                    insert_prestate = con.prepareStatement(insert_sql);

                    String  tempProductID     = orderInfo[0][0],
                            tempUnitPrice     = orderInfo[0][2],
                            tempOrderQuantiry = orderInfo[0][3];

                    for (int i = 1; i < countCart; i++) {
                        tempProductID     += "_" + orderInfo[i][0];
                        tempUnitPrice     += "_" + orderInfo[i][2];
                        tempOrderQuantiry += "_" + orderInfo[i][3];

                    }

                    insert_prestate.setString(1, member_no);
                    insert_prestate.setString(2, tempProductID);
                    insert_prestate.setString(3, tempOrderQuantiry);
                    insert_prestate.setString(4, Integer.toString(total));

                    insert_prestate.execute();


                    /* 更新庫存量 */
                    sql = "SELECT inventory FROM product WHERE product_no = ?";

                    prestate = con.prepareStatement(sql);
                    prestate.setString(1, tempProductID);

                    ResultSet output = prestate.executeQuery();
                    output.next();
                    String originQuantity = output.getString(1);

                    for (int i = 0; i < countCart; i++) {
                        int updateQuantity;
                        updateQuantity = Integer.parseInt(originQuantity) - Integer.parseInt(orderInfo[i][3]);

                        sql = "UPDATE product SET inventory = ? WHERE product_no = ?";
                        prestate = con.prepareStatement(sql);

                        prestate.setString(1, Integer.toString(updateQuantity));
                        prestate.setString(2, orderInfo[i][0]);
                        prestate.executeUpdate();
                    }

                    if (cookies != null) {
                        for (int i = 0; i < cookies.length; i++) {
                            Cookie c = cookies[i];
                            if (c.getName().equals("cart")) {
                                c.setMaxAge(0);
                                response.addCookie(c);
                            }
                        }
                    }

                    out.println("<script>");
                    out.println("alert('訂購成功！');");
                    out.println("location.href = '/product.jsp'");
                    out.println("</script>");


                }
                con.close();    //關閉與資料庫之連線。
            } catch (SQLException sExec) {
                out.println("<script>");
                out.println("console.log(\"SQL錯誤!" + sExec.toString() + "\");");
                out.println("</script>");
            }
        } catch (ClassNotFoundException err) {
            out.println("<script>");
            out.println("console.log(\"Can't found class。" + err.toString() + "\");");
            out.println("</script>");
        }
    } else {
        out.println("<script>");
        out.println("window.alert('請先登入會員');");
        out.println("location.href='/signin.jsp'");
        out.println("</script>");
    }
%>