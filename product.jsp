<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
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

                select_sql = "SELECT * FROM product";
                select_prestate = con.prepareStatement(select_sql);

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
        #shoppingcart:hover {
            right: -10px;
        }

        #shoppingcart {
            display: none;
            position: fixed;
            top: 80%;
            right: -105px;
            background-color: #000;
            padding: 20px 20px;
            color: #fff;
            border-radius: 10px;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
        }

        #shoppingcart a:hover {
            color: #fed136;
            text-decoration: none;
        }

        #shoppingcart a {
            color: #fff;
        }

        #shoppingcart > #cartContent {
            padding-right: 10px;
        }

        .portfolio_img {
            position: relative;
            height: 300px;
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

        @media screen and (max-width: 1200px) and (min-width: 992px) {
            .portfolio_img {
                height: 240px;
            }
        }

        @media screen and (max-width: 992px) and (min-width: 768px) {
            .portfolio_img {
                height: 400px;
            }
        }

        @media screen and (max-width: 768px) and (min-width: 455px) {
            .portfolio_img {
                height: 500px;
            }
        }

        @media screen and (max-width: 455px) {
            .portfolio_img {
                height: 250px;
            }
        }
    </style>

    <script type="application/javascript">
        function setCart(pid) {
            if (getCartInfo() != null) {
                var rawCartContent = getCartInfo().split("_");
                rawCartContent.push(pid);
                var uniqueCartContent = uniqarray(rawCartContent);
                var cartContent = uniqueCartContent[0];
                for (var i = 1; i < uniqueCartContent.length; i++) {
                    cartContent += "_" + uniqueCartContent[i];
                }
                var expDays = new Date();
                expDays.setTime(expDays.getTime() + 7 * 24 * 60 * 60 * 1000);
                document.cookie = "cart = " + cartContent + "; expires = " + expDays.toGMTString();
            } else {
                var expDays = new Date();
                expDays.setTime(expDays.getTime() + 7 * 24 * 60 * 60 * 1000);
                document.cookie = "cart = " + escape(pid) + "; expires = " + expDays.toGMTString();
            }
            checkCart();
        }
        function getCartInfo() {
            var arr = document.cookie.match(new RegExp("(^| )cart=([^;]*)(;|$)"));
            if (arr != null) {
                return unescape(arr[2]);
            } else {
                return null;
            }
        }
        function eraseCookie() {
            var expDays = new Date();
            expDays.setTime(expDays.getTime() + -1 * 24 * 60 * 60 * 1000);
            document.cookie = "cart = ''; expires = " + expDays.toGMTString();
            var shoppingcart = document.getElementById("shoppingcart");
            shoppingcart.style.display = "none";
        }
        function checkCart() {
            if (getCartInfo() != null) {
                var shoppingcart = document.getElementById("shoppingcart");
                shoppingcart.style.display = "block";
                var cartContent = getCartInfo().split("_");
                var cartQuantity = cartContent.length;
                var cartTitle = document.getElementById("cartContent");
                cartTitle.innerHTML = "購物車 (" + cartQuantity + ")";
            }
        }
        function uniqarray(a) {
            var seen = {};
            var output = [];
            var len = a.length;
            var j = 0;
            for (var i = 0; i < len; i++) {
                var item = a[i];
                if (seen[item] !== 1) {
                    seen[item] = 1;
                    output[j++] = item;
                }
            }
            output.sort();
            return output;
        }
    </script>

</head>

<body id="page-top" class="index" onload="checkCart()">

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
                    <li>
                        <a class="page-scroll" href="shopping_cart.jsp">購物車</a>
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

    <div class="header row">
        <div class="col-xs-10 col-xs-offset-1">
            <div class="col-md-8">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="img-responsive" src="img/portfolio/tangerine1.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="img/portfolio/tangerine2.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="img/portfolio/tangerine3.jpg" alt="">
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>

            <div class="col-md-4">
                <h3>最新商品</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
                <h3>其他推薦商品</h3>
                <ul>
                    <li>Lorem Ipsum</li>
                    <li>Dolor Sit Amet</li>
                    <li>Consectetur</li>
                    <li>Adipiscing Elit</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <%
                    while(select_rs.next()){
                        out.println("<script>");
                        out.println("console.log(\"成功抓取資料。\");");
                        out.println("</script>");

                        pid = select_rs.getInt("product_no");
                        product_name = select_rs.getString("product_name");
                        image = select_rs.getString("image");
                        unit_cost = select_rs.getInt("unit_cost");
                        description = select_rs.getString("description");
                        inventory = select_rs.getInt("inventory");
                %>
                <div class="col-md-3 col-sm-6 col-xs-10 col-sm-offset-0 col-xs-offset-1 portfolio-item">
                    <div class="portfolio_hover">
                        <div class="portfolio_img">
                            <a href="product_details.jsp?product_no=1" class="portfolio_hover_img">
                                <img src="<%=image%>" alt="">
                            </a>
                        </div>
                        <div class="portfolio-caption">
                            <h2><%=product_name%></h2>
                            <p class="text-muted"><%=description%></p>
                            <a onclick="setCart(<%=pid%>)" class="btn btn-xl text-left">
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
    </section>

    <!-- Shopping Cart -->
    <div id="shoppingcart">
        <span id="cartContent" class="text-center title">購物車</span>
        <a target="_blank" href="shopping_cart.jsp">結帳</a>
        <a id="clearCart" href="" onclick="eraseCookie()">清空</a>
    </div>
    <!-- /.Shopping Cart -->

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
