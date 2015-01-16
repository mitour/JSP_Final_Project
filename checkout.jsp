<%@ page pageEncoding = "UTF-8"%>
<%@page import = "java.sql.*" %>
<%
    request.setCharacterEncoding ("UTF-8");

    Cookie[]  cookies     = request.getCookies();
    String    rawCartList = null;
    String[]  rawCartInfo = null;
    ResultSet products    = null;
    int       countCart   = 0;

    if(session.getAttribute("user") != null) {
        Object member_no_obj = session.getAttribute("user_id");
        String member_no = String.valueOf(member_no_obj);

        out.println("<script>");
        out.println("console.log('"+member_no+"');");
        out.println("</script>");
    } else {
        out.println("<script>");
        out.println("window.alert('請先登入會員');");
        out.println("location.href='/signin.jsp'");
        out.println("</script>");
    }

    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("cart")) {
                rawCartList = c.getValue();
                rawCartInfo = c.getValue().split("_");
                countCart   = rawCartInfo.length;
            }
        }
    } else {
        out.println("<script>");
        out.println("window.alert('購物車內未找尋到符合的商品，返回商品總覽頁面');");
        out.println("location.href='/product.jsp'");
        out.println("</script>");
    }

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
                    out.println("window.alert('購物車內未找尋到符合的商品，返回商品總覽頁面');");
                    out.println("location.href='/product.jsp'");
                    out.println("</script>");
                }
            }
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
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>結帳</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"/>

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        #purchase_order th,
        #purchase_order td {
            padding: 15px 0;
            font-size: 22px;
            text-align: center;
            vertical-align: middle;
        }

        #purchase_order tr th:nth-child(1),
        #purchase_order tr td:nth-child(1) {
            width: 15%;
        }

        #purchase_order tr th:nth-child(2),
        #purchase_order tr td:nth-child(2) {
            width: 35%;
        }

        #purchase_order tr th:nth-child(3),
        #purchase_order tr td:nth-child(3) {
            width: 25%;
        }

        #purchase_order tr th:nth-child(4),
        #purchase_order tr td:nth-child(4) {
            width: 25%;
        }

        .note {
            margin: 30px 0;
        }
    </style>

</head>

<body id="page-top" class="index checkout">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top product_page">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">橘。花台</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <%@ include file = "validation_memder_name.jsp"%>
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <%@ include file = "validation_member_signout.jsp"%>
                    <li>
                        <a class="page-scroll" href="index.jsp">回首頁</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <div class="header">
        <div class="container">
            <div class="panel panel-default cart">
                <div class="panel-heading">
                    <h3 class="panel-title">確認商品資訊</h3>
                </div>
                <div class="panel-body">
                    <form action="purchase_order.jsp">
                        <table id="purchase_order" class="table table-condensed">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>商品名稱</th>
                                <th>商品單價</th>
                                <th>購買數量</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                String totalprice = request.getParameter("totalprice");
                                if (countCart > 0) {
                                    while (products.next()) {
                                        String pid          = products.getString("product_no");
                                        String product_name = products.getString("product_name");
                                        String unit_cost    = products.getString("unit_cost");
                                        String rawQuantity = request.getParameter(pid + "_quantity");
                                        int quantity = Integer.parseInt(rawQuantity);
                            %>
                            <tr>
                                <td><%=pid%></td>
                                <td><%=product_name%></td>
                                <td><%=unit_cost%></td>
                                <td><%=quantity%></td>
                                <input type="hidden" name="<%=pid%>_quantity" value="<%=quantity%>">
                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td>
                                    運送方式：
                                </td>
                                    <%
                                        String delivery = request.getParameter("delivery");
                                        if (delivery.equals("711")) {
                                            out.println("<td>超商取貨 $50</td>");
                                        } else if (delivery.equals("post")) {
                                            out.println("<td>郵寄 $100</td>");
                                        } else if (delivery.equals("blackcat")) {
                                            out.println("<td>黑貓宅配 $180</td>");
                                        }
                                    %>
                                    <input type="hidden" name="delivery" value="<%=delivery%>"/>
                                <td>訂單總額(含運費)：</td>
                                <td><%=totalprice%></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        <blockquote class="note">
                            <span>注意事項：</span>
                            <p>
                                <ul>
                                    <li>
                                        請務必一一確認以上商品資訊。
                                    </li>
                                    <li>
                                        貨品出售後 3 日內可全額退貨，7 日內僅能換貨。
                                    </li>
                                    <li>
                                        但因貨品有非人為損壞、商品不全等，7 日內皆可全額退貨。
                                    </li>
                                </ul>
                            </p>
                        </blockquote>
                        <div class="product_btn text-right">
                            <input type="submit" class="btn btn_small" value="確認結帳">
                        </div>
                    </form
                </div>
            </div>
        </div>
        <%--<form action="">--%>
            <%--<div class="container">--%>
                <%--<div class="panel panel-default">--%>
                    <%--<div class="panel-heading">--%>
                        <%--<h3 class="panel-title">填寫配送資訊</h3>--%>
                    <%--</div>--%>
                    <%--<div class="panel-body">--%>
                        <%--<div class="ship_details">--%>
                            <%--<h3>付款方式：--%>
                                <%--<div id="pay" class="btn-group" data-toggle="buttons">--%>
                                    <%--<label class="btn btn_small btn_select active">--%>
                                        <%--<input type="radio" name="credit_card" id="credit_card" autocomplete="off" checked>--%>
                                        <%--信用卡--%>
                                    <%--</label>--%>
                                    <%--<label class="btn btn_small btn_select">--%>
                                        <%--<input type="radio" name="cash" id="cash" autocomplete="off">--%>
                                        <%--貨到付款--%>
                                    <%--</label>--%>
                                    <%--<label class="btn btn_small btn_select">--%>
                                        <%--<input type="radio" name="atm" id="atm" autocomplete="off">--%>
                                        <%--ATM轉帳--%>
                                    <%--</label>--%>
                                <%--</div>--%>
                            <%--</h3>--%>
                            <%--<h3>運送方式：--%>
                                <%--<div id="ship" class="btn-group" data-toggle="buttons">--%>
                                    <%--<label class="btn btn_small btn_select active">--%>
                                        <%--<input type="radio" name="home_delivery" id="home_delivery" autocomplete="off" checked>--%>
                                        <%--黑貓宅配--%>
                                    <%--</label>--%>
                                    <%--<label class="btn btn_small btn_select">--%>
                                        <%--<input type="radio" name="7-11" id="7-11" autocomplete="off">--%>
                                        <%--7-11取貨--%>
                                    <%--</label>--%>
                                    <%--<label class="btn btn_small btn_select">--%>
                                        <%--<input type="radio" name="family" id="family" autocomplete="off">--%>
                                        <%--全家取貨--%>
                                    <%--</label>--%>
                                <%--</div>--%>
                            <%--</h3>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="container">--%>
                <%--<div class="panel panel-default">--%>
                    <%--<div class="panel-heading">--%>
                        <%--<h3 class="panel-title">發票資訊</h3>--%>
                    <%--</div>--%>
                    <%--<div class="panel-body">--%>
                        <%--<div class="form-group">--%>
                            <%--<label for="recipe"></label>--%>
                            <%--<select id="recipe" name="recipe" class="form-control">--%>
                                <%--<option value="choose">請選擇</option>--%>
                                <%--<option value="donation">捐贈發票</option>--%>
                                <%--<option value="not_donation">電子發票</option>--%>
                            <%--</select>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="panel-body">--%>
                        <%--<div class="panel panel-default">--%>
                            <%--<div class="panel-heading">--%>
                                <%--<h4 class="panel-title">--%>
                                    <%--捐贈發票--%>
                                <%--</h4>--%>
                            <%--</div>--%>
                            <%--<div id="donation_field" class="donation_field panel-body" disabled>--%>
                                <%--<p>--%>
                                    <%--<input type="radio"--%>
                                           <%--id="unit"--%>
                                           <%--name="donation"--%>
                                           <%--value="unit">--%>
                                    <%--<label for="unit">捐贈單位：</label>--%>
                                    <%--<select name="unit_select" id="unit_select">--%>
                                        <%--<option selected value="dog">社團法人中華民國動物福利環保協進會</option>--%>
                                        <%--<option value="ccf">財團法人台灣兒童暨家庭扶助基金會</option>--%>
                                        <%--<option value="guidedog">社團法人台灣導盲犬協會</option>--%>
                                    <%--</select>--%>
                                <%--</p>--%>
                                <%--<p>--%>
                                    <%--<input type="radio"--%>
                                           <%--id="society"--%>
                                           <%--name="donation"--%>
                                           <%--value="society">--%>
                                    <%--<label for="society">其他社福團體愛心碼：</label>--%>
                                    <%--<input type="text"/>--%>
                                    <%--<a href="https://www.einvoice.nat.gov.tw/APMEMBERVAN/XcaOrgPreserveCodeQuery/XcaOrgPreserveCodeQuery?CSRT=4350550699150711492">--%>
                                        <%--愛心碼索引--%>
                                    <%--</a>--%>
                                <%--</p>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="panel panel-default">--%>
                            <%--<div class="panel-heading">--%>
                                <%--<h4 class="panel-title">--%>
                                    <%--電子發票--%>
                                <%--</h4>--%>
                            <%--</div>--%>
                            <%--<div id="not_donation_field" class="not_donation_field panel-body" disabled>--%>
                                <%--<span>--%>
                                    <%--依統一發票使用辦法規定：個人戶(二聯式)發票一經開立，無法任意更改或改開公司戶(三聯式)發票。--%>
                                <%--</span>--%>
                                <%--<p>--%>
                                    <%--<input type="radio"--%>
                                           <%--id="member"--%>
                                           <%--name="not_donation"--%>
                                           <%--value="unit">--%>
                                    <%--<label for="member">會員載具：</label>--%>
                                    <%--<small>讓我們自動為您兌獎，中獎後主動通知您。</small>--%>
                                    <%--<ul>--%>
                                        <%--<li>--%>
                                            <%--<div class="form-group">--%>
                                                <%--<label for="name">姓名：</label>--%>
                                                <%--<input type="text"--%>
                                                       <%--placeholder="姓名 *"--%>
                                                       <%--id="name"--%>
                                                       <%--name="name">--%>
                                            <%--</div>--%>
                                        <%--</li>--%>
                                        <%--<li>--%>
                                            <%--<div class="form-group">--%>
                                                <%--<label for="phone">手機：</label>--%>
                                                <%--<input type="tel"--%>
                                                       <%--placeholder="手機 *"--%>
                                                       <%--id="phone"--%>
                                                       <%--name="phone"--%>
                                                       <%--pattern="[09]{2}[0-9]{8}">--%>
                                            <%--</div>--%>
                                        <%--</li>--%>
                                        <%--<li>--%>
                                            <%--<div class="form-group">--%>
                                                <%--<label for="address">住址：</label>--%>
                                                <%--<input type="text"--%>
                                                       <%--placeholder="住址 *"--%>
                                                       <%--id="address"--%>
                                                       <%--name="address">--%>
                                            <%--</div>--%>
                                        <%--</li>--%>
                                    <%--</ul>--%>
                                <%--</p>--%>
                                <%--<p>--%>
                                    <%--<input type="radio"--%>
                                           <%--id="mobile"--%>
                                           <%--name="not_donation"--%>
                                           <%--value="mobile">--%>
                                    <%--<label for="mobile">共通性載具：</label>--%>
                                    <%--<small>--%>
                                        <%--您需持有手機載具，詳見財政部--%>
                                        <%--<a href="https://www.einvoice.nat.gov.tw/">--%>
                                            <%--「電子發票整合服務平台」--%>
                                        <%--</a>--%>
                                    <%--</small>--%>
                                <%--</p>--%>
                                <%--<p>--%>
                                    <%--<input type="radio"--%>
                                           <%--id="triplicate"--%>
                                           <%--name="not_donation"--%>
                                           <%--value="triplicate">--%>
                                    <%--<label for="triplicate">三聯式發票：</label>--%>
                                <%--</p>--%>
                                <%--<blockquote>--%>
                                    <%--<p>--%>
                                        <%--發票一經開立，統一編號、抬頭以及收件相關資訊無法再做更動，也無法再將二聯式發票改開三聯式發票，請務必確認資訊正確。--%>
                                    <%--</p>--%>
                                <%--</blockquote>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="product_btn text-right">--%>
                            <%--<p>--%>
                                <%--<a class="btn btn_small" href="purchase_order.jsp">--%>
                                    <%--<span class="glyphicon glyphicon-usd"></span>--%>
                                    <%--確定結帳--%>
                                <%--</a>--%>
                            <%--</p>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</form>--%>
    </div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <span class="copyright">Copyright &copy; My Website 2014</span>
                </div>
            </div>
        </div>
    </footer>



    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <!-- <script src="js/contact_me.js"></script> -->
    <script>
        $(function () { $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(); } );
    </script>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>

    <%--<script>--%>
        <%--recipe.onchange = function () {--%>
            <%--var val = this.options[this.selectedIndex].value;--%>
            <%--var donation = document.getElementById("donation_field");--%>
            <%--var recipe  = document.getElementById("not_donation_field");--%>
            <%--donation.style.display = (val === "donation") ? "block" : "none";--%>
            <%--recipe.style.display = (val === "not_donation") ? "block" : "none";--%>
            <%--donation.disabled = (val === "donation") ? false : true;--%>
            <%--recipe.disabled = (val === "not_donation") ? false : true;--%>
        <%--};--%>
    <%--</script>--%>
</body>

</html>
