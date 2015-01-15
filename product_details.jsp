<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ page import="java.util.Random" %>
<%
    request.setCharacterEncoding ("UTF-8");

    int pid = 0;
    String product_name = null;
    String image = null;
    int unit_cost = 0;
    String description = null;
    int inventory = 0;
    String select_sql = null;
    PreparedStatement select_prestate = null;
    ResultSet select_rs = null;
    Random ran = new Random();
    int random;

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
        .portfolio_img {
            position: relative;
            height: 200px;
            text-align: center;
            overflow: hidden;
        }

        .product_img {
            position: relative;
            height: 600px;
            text-align: center;
            overflow: hidden;
            border-radius: 5px;
        }

        .portfolio_img img,
        .product_img img {
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

        @media screen and (max-width: 1200px) and (min-width: 992px) {
            .product_img {
                height: 500px;
            }
            .product_img img {
                margin-top: 0;
            }
        }

        @media screen and (max-width: 992px) {
            .product_img {
                height: 400px;
            }
            .product_img img {
                margin-top: 0;
            }
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
                <h3 class="panel-title">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">首頁</a></li>
                        <li><a href="product.jsp">商品</a></li>
                        <li class="active">商品詳細</li>
                    </ol>
                </h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <%
//                        if(select_rs.next()){
//                            out.println("<script>");
//                            out.println("console.log(\"成功抓取資料。\");");
//                            out.println("</script>");
//
//                            pid = select_rs.getInt("product_no");
//                            product_name = select_rs.getString("product_name");
//                            image = select_rs.getString("image");
//                            unit_cost = select_rs.getInt("unit_cost");
//                            description = select_rs.getString("description");
//                            inventory = select_rs.getInt("inventory");
                    %>
                    <div class="col-sm-5">
                        <div class="product_img">
                            <img src="<%=image%>" alt=""/>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <h1><%=product_name%></h1>
                        <div class="product_info">
                            <p>iLorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo nventore harum ex magni, dicta impedit.</p>
                            <h3>商品規格：</h3>
                            <h3>單價：<%=unit_cost%></h3>
                            <h3>庫存量：<%=inventory%></h3>
                            <h3>購買數量：
                                <select name="quantity" id="quantity">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </h3>
                            <h3>優惠活動：</h3>
                            <h3>付款方式：</h3>
                            <h3>運送方式：</h3>
                        </div>
                        <div class="product_btn text-right">
                            <p>
                                <a class="btn btn_small" href="shopping_cart.jsp">
                                    <span class="glyphicon glyphicon-shopping-cart"></span>
                                    加入購物車
                                </a>
                                <a class="bt btn_small" href="checkout.jsp">
                                    前往結帳
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </p>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-title product_note">注意事項：</div>
                        </div>
                    </div>
                    <%--<%--%>
                        <%--}--%>
                    <%--%>--%>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<!-- Portfolio Grid Section -->--%>
<%--<section id="portfolio" class="bg-light-gray">--%>
    <%--<div class="container">--%>
        <%--<div class="row panel panel-default">--%>
            <%--<div class="panel-heading">--%>
                <%--<h3 class="panel-title">推薦商品</h3>--%>
            <%--</div>--%>
            <%--<div class="panel-body">--%>
                <%--<div class="row">--%>
                    <%--<%--%>
                        <%--while (select_rs.next()){--%>
                            <%--out.println("<script>");--%>
                            <%--out.println("console.log(\"成功抓取資料。\");");--%>
                            <%--out.println("</script>");--%>

                            <%--pid = select_rs.getInt("product_no");--%>
                            <%--product_name = select_rs.getString("product_name");--%>
                            <%--image = select_rs.getString("image");--%>
                            <%--unit_cost = select_rs.getInt("unit_cost");--%>
                            <%--description = select_rs.getString("description");--%>
                            <%--inventory = select_rs.getInt("inventory");--%>
                    <%--%>--%>
                    <%--<div class="col-md-3 col-sm-6 col-xs-10 col-sm-offset-0 col-xs-offset-1 portfolio-item">--%>
                        <%--<div class="portfolio_hover">--%>
                            <%--<div class="portfolio_img">--%>
                                <%--<a href="product_details.jsp" class="portfolio_hover_img">--%>
                                    <%--<img src="<%=image%>" alt="<%=product_name%>">--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="portfolio-caption">--%>
                                <%--<h2><%=product_name%></h2>--%>
                                <%--<p class="text-muted"><%=description%></p>--%>
                                <%--<a href="shopping_cart.jsp" class="btn btn-xl text-left">--%>
                                    <%--<span class="glyphicon glyphicon-shopping-cart"></span>--%>
                                    <%--加入購物車--%>
                                <%--</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<%--%>
                        <%--}--%>
                    <%--%>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</section>--%>

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

</body>

</html>
