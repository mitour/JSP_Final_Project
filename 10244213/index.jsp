<%@page pageEncoding="UTF-8"%>
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

</head>

<body id="page-top" class="index">
<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top">
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
                    <a class="page-scroll" href="#services">服務</a>
                </li>
                <li>
                    <a class="page-scroll" href="#portfolio">產品</a>
                </li>
                <li>
                    <a class="page-scroll" href="#team">關於我們</a>
                </li>
                <li>
                    <a class="page-scroll" href="mailto:love2082020@gmail.com">聯絡我們</a>
                </li>
                <%@include file="validation_member_signout.jsp"%>
                <li>
                    <a class="page-scroll" href="admin/member_tables.html">管理者頁面</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<!-- Header -->
<header>
    <div class="container">
        <div class="intro-text">
            <div class="intro-lead-in">Welcome To Our Studio!</div>
            <div class="intro-heading">It's Nice To Meet You</div>
            <a href="#services" class="page-scroll btn btn-xl">了解詳請</a>
        </div>
    </div>
</header>

<section id="counter">
    <div class="container">
        <div class="row">

        </div>
    </div>
</section>
<!-- Services Section -->
<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">服務</h2>
                <h3 class="section-subheading text-muted">橘。花台給你最優質的服務！</h3>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
                    </span>
                <h3 class="service-heading">線上購物</h3>
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
            </div>
            <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-truck fa-stack-1x fa-inverse"></i>
                    </span>
                <h3 class="service-heading">3天內保證出貨</h3>
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
            </div>
            <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-usd fa-stack-1x fa-inverse"></i>
                    </span>
                <h3 class="service-heading">7天內全額退費</h3>
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
            </div>
        </div>
    </div>
</section>

<!-- Portfolio Grid Section -->
<section id="portfolio" class="bg-light-gray">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">推薦商品</h2>
                <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 portfolio-item">
                <div class="portfolio_hover">
                    <a href="product_details.jsp" class="portfolio_hover_img">
                        <img src="img/portfolio/golden.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Golden</h4>
                        <p class="text-muted">Website Design</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <div class="portfolio_hover">
                    <a href="product_details.jsp" class="portfolio_hover_img">
                        <img src="img/portfolio/escape.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Golden</h4>
                        <p class="text-muted">Website Design</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <div class="portfolio_hover">
                    <a href="product_details.jsp" class="portfolio_hover_img">
                        <img src="img/portfolio/dreams.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Golden</h4>
                        <p class="text-muted">Website Design</p>
                    </div>
                </div>
            </div>
            <div class = "text-center">
                <a href="product.jsp" class="btn btn-xl">看不夠嗎？</a>
            </div>
        </div>
    </div>
</section>

<!-- Team Section -->
<section id="team" class="bg-light-gray">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">關於我們</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="team-member">
                    <img src="img/team/member.jpg" class="img-responsive img-circle" alt="">
                    <h3>張碧涵</h3>
                    <p class="text-muted">Bi-Han, Zhang</p>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="team-member">
                    <img src="img/team/member.jpg" class="img-responsive img-circle" alt="">
                    <h3>黃湘瑜</h3>
                    <p class="text-muted">Xiang-Yu, Huang</p>
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

</body>

</html>
