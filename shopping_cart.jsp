<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ page import="java.util.Random" %>
<%
    request.setCharacterEncoding ("UTF-8");

    int                 pid             = 0;
    String              product_name    = null;
    String              image           = null;
    int                 unit_cost       = 0;
    int                 inventory       = 0;
    String              description     = null;
    String              select_sql      = null;
    PreparedStatement   select_prestate = null;
    ResultSet           select_rs       = null;
    Random              ran             = new Random();
    int                 random;

    Cookie[]  cookies     = request.getCookies();
    String    rawCartList = null;
    String[]  rawCartInfo = null;
    ResultSet products    = null;
    int       countCart   = 0;

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



                random = ran.nextInt(2)+1;

                select_sql = "SELECT * FROM product WHERE product_no BETWEEN ? AND ?";
                select_prestate = con.prepareStatement(select_sql);
                select_prestate.setInt(1, random);
                select_prestate.setInt(2, random+3);

                select_rs = select_prestate.executeQuery();  //執行查詢

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

    <title>橘。花台</title>

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
        #shoppinglist th,
        #shoppinglist td {
            padding: 15px 0;
            font-size: 22px;
            text-align: center;
            vertical-align: middle;
        }

        #shoppinglist tr th:nth-child(1),
        #shoppinglist tr td:nth-child(1) {
            width: 5%;
        }

        #shoppinglist tr th:nth-child(2),
        #shoppinglist tr td:nth-child(2) {
            width: 35%;
        }

        #shoppinglist tr th:nth-child(3),
        #shoppinglist tr td:nth-child(3) {
            width: 15%;
        }

        #shoppinglist tr th:nth-child(4),
        #shoppinglist tr td:nth-child(4) {
            width: 25%;
        }

        #shoppinglist tbody tr td:nth-child(4) select {
            width: 35%;
        }

        #shoppinglist tr th:nth-child(5),
        #shoppinglist tr td:nth-child(5) {
            width: 15%;
        }

        #shoppinglist tr th:nth-child(6),
        #shoppinglist tr td:nth-child(6) {
            width: 5%;
        }

        #shoppinglist tfoot tr:nth-child(1) td {
            border-top: 2px dashed #ddd;
        }

        #shoppinglist tfoot tr td:nth-child(5) input{
            border: 1px solid #ddd;
        }

        #shoppinglist tfoot tr:nth-last-child(1) td:nth-child(5) a,
        #shoppinglist tfoot tr:nth-last-child(1) td:nth-child(6) input{
            width: 100px;
        }

        input {
            border: none;
            width: 100px;
            text-align: center;
        }

        #delete_icon a{
            font-size: 200%;
            color: #337ab7;
        }

        #delete_icon a:hover,
        #delete_icon a:focus,
        #delete_icon a:active {
            color: #fed136;
            text-decoration: none;
        }

        .portfolio_img {
            position: relative;
            height: 200px;
            text-align: center;
            overflow: hidden;
        }

        .portfolio_img img {
            position: absolute;
            width: 100%;
            margin: auto;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
        }

        #portfolio .portfolio-item .portfolio-caption {
            padding: 15px;
        }

        #portfolio .portfolio-item .portfolio-caption p {
            font-size: 18px;
            height: 80px;
            overflow: hidden;
        }

        @media screen and (max-width: 768px) {
            .portfolio_img {
                height: 339px;
            }
        }
    </style>

</head>

<body id="page-top" class="index">

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
                <%@include file="validation_memder_name.jsp"%>
                <li class="hidden">
                    <a href="#page-top"></a>
                </li>
                <%@include file="validation_member_signout.jsp"%>
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">溝物清單</h3>
            </div>
            <div class="panel-body">
                <form action="checkout.jsp">
                    <table id="shoppinglist" class="table table-condensed">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>商品名稱</th>
                                <th>商品單價</th>
                                <th>購買數量</th>
                                <th>小計</th>
                                <th>刪除</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (countCart > 0) {
                                    while (products.next()) {
                                        pid          = products.getInt   ("product_no");
                                        product_name = products.getString("product_name");
                                        unit_cost    = products.getInt   ("unit_cost");
                                        inventory    = products.getInt   ("inventory");
                            %>
                            <tr>
                                <td><%=pid%></td>
                                <td><%=product_name%></td>
                                <td>
                                    <input class="price" type="number" readonly value="<%=unit_cost%>"/>
                                </td>
                                <td>
                                    <select name="<%=pid%>_quantity" id="<%=pid%>_quantity" onchange="autoCal(this)">
                                        <%
                                            if (inventory > 5) {
                                                int temp = 1;
                                                while (temp <= 5) {
                                                    out.println("<option value=\"" + temp + "\">" + temp + "</option>");
                                                    temp++;
                                                }
                                            } else {
                                                int temp = 1;
                                                while (temp <= inventory) {
                                                    out.println("<option value=\"" + temp + "\">" + temp + "</option>");
                                                    temp++;
                                                }
                                            }
                                        %>
                                    </select>
                                </td>
                                <td>
                                    <input class="price" type="number" readonly value="<%=unit_cost%>"/>
                                </td>
                                <td>
                                    <div id="delete_icon">
                                        <a class="fa fa-trash-o" type="button" value="Delete" onclick="deleteItem('<%=pid%>')"></a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }           //end while
                                } else {
                                    out.println("<script>");
                                    out.println("window.alert('購物車內未找尋到符合的商品，返回商品總覽頁面');");
                                    out.println("location.href='/product.jsp'");
                                    out.println("</script>");
                                }
                            %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <select name="delivery" id="delivery" onchange="autoCal(this)" required>
                                        <option value="null" disabled>請選擇運送方式</option>
                                        <option value="711">超商取貨 $50</option>
                                        <option value="post">郵寄 $100</option>
                                        <option value="blackcat">宅配到府 $180</option>
                                    </select>
                                </td>
                                <td>
                                    <input class="price" type="number" readonly/>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>總價：</td>
                                <td>
                                    <input class="price" type="number" readonly/>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><input name="productlist" type="text" value="<%=rawCartList%>" class="hidden"/></td>
                                <td>
                                    <a href="product.jsp" class="btn btn_small">
                                        繼續選購
                                    </a>
                                </td>
                                <td>
                                    <input type="submit" class="btn btn_small" value="前往結帳">
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Grid Section -->
<section id="portfolio" class="bg-light-gray">
    <div class="container">
        <div class="row panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">精選推薦商品</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <%
                        while(select_rs.next()){
                            out.println("<script>");
                            out.println("console.log(\"成功抓取資料。\");");
                            out.println("</script>");

                            pid = select_rs.getInt("product_no");
                            product_name = select_rs.getString("product_name");
                            image = select_rs.getString("image");
                            description = select_rs.getString("description");
                    %>
                    <div class="col-md-3 col-sm-6 col-xs-10 col-sm-offset-0 col-xs-offset-1 portfolio-item">
                        <div class="portfolio_hover">
                            <div class="portfolio_img">
                                <a href="product_details.jsp" class="portfolio_hover_img">
                                    <img src="<%=image%>" alt="">
                                </a>
                            </div>
                            <div class="portfolio-caption">
                                <h2><%=product_name%></h2>
                                <p class="text-muted"><%=description%></p>
                                <a href="shopping_cart.jsp" class="btn btn-xl text-left">
                                    <span class="glyphicon glyphicon-shopping-cart"></span>
                                    加入購物車
                                </a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</section>

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

<script type="text/javascript">
    function autoCal(obj) {
        var rows = document.getElementById('shoppinglist').getElementsByTagName("tr").length;
        var row = obj.parentNode.parentNode.rowIndex;
        var cel = obj.parentNode.cellIndex;
        var tb = document.getElementById('shoppinglist');
        console.log("total rows = " + rows);
        console.log("row = " + row);
        console.log("cell = " + cel);
        console.log(tb);
        if (obj.parentNode.parentNode.rowIndex == rows - 3) {
            if (obj.value == 711) {
                var subtotal = (tb.rows[row].cells[cel + 1].firstElementChild || tb.rows[row].cells[cel + 1].firstChild);
                subtotal.value = 50;
            } else if (obj.value == "blackcat") {
                var subtotal = (tb.rows[row].cells[cel + 1].firstElementChild || tb.rows[row].cells[cel + 1].firstChild);
                subtotal.value = 180;
            } else if (obj.value == "post") {
                var subtotal = (tb.rows[row].cells[cel + 1].firstElementChild || tb.rows[row].cells[cel + 1].firstChild);
                subtotal.value = 100;
            }
        } else {
            var unitprice = (tb.rows[row].cells[cel - 1].firstElementChild || tb.rows[row].cells[cel - 1].firstChild);
            var subtotal = (tb.rows[row].cells[cel + 1].firstElementChild || tb.rows[row].cells[cel + 1].firstChild);
            subtotal.value = obj.value * unitprice.value;
        }

        var totalprice = parseInt(0);
        for (var i = 1; i < rows - 2; i++) {
            totalprice += parseInt(tb.rows[i].cells[cel + 1].firstElementChild.value);
        }
        var totalelem = (tb.rows[rows - 2].cells[cel + 1].firstElementChild || tb.rows[row].cells[cel + 1].firstChild);
        totalelem.value = totalprice;
    }
    function getCartInfo() {
        var arr = document.cookie.match(new RegExp("(^| )cart=([^;]*)(;|$)"));
        if (arr != null) {
            return unescape(arr[2]);
        } else {
            return null;
        }
    }
    function deleteItem(index) {
        if (getCartInfo() != null) {
            var rawCartContent = getCartInfo().split("_");
            var i = rawCartContent.indexOf(index);
            console.log(i);
            if (i != -1) {
                rawCartContent.splice(i, 1);
            }
        }
        console.log(rawCartContent);
        var cartContent = rawCartContent[0];
        for (var i = 1; i < rawCartContent.length; i++) {
            cartContent += "_" + rawCartContent[i];
        }
        var expDays = new Date();
        expDays.setTime(expDays.getTime() + 7 * 24 * 60 * 60 * 1000);
        document.cookie = "cart = " + cartContent + "; expires = " + expDays.toGMTString();
        location.reload();
    }
</script>

</body>

</html>
