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

<body id="page-top" class="index order">

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
                    <h3 class="panel-title">訂單查詢</h3>
                </div>
                <div class="panel-body">
                    <div class="purchase_orders">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default purchase_order">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                             訂單#1
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <h3>商品資訊</h3>
                                        <p>
                                            <table class="table table-condensed">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>商品名稱</th>
                                                    <th>商品規格</th>
                                                    <th>購買數量</th>
                                                    <th>商品單價</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>橘子花</td>
                                                    <td>XXX</td>
                                                    <td>1</td>
                                                    <td>399</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"></td>
                                                    <td>
                                                        <h4>訂單總額：</h4>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <blockquote>
                                                <span>注意事項：</span>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                            </blockquote>
                                        </p>
                                        <h3>配送資訊</h3>
                                        <p>
                                            <h4>付款方式：</h4>
                                            <h4>運送方式：</h4>
                                            <blockquote>
                                                <span>注意事項：</span>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                            </blockquote>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default purchase_order">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            訂單#2
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <h3>商品資訊</h3>
                                        <p>
                                        <table class="table table-condensed">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>商品名稱</th>
                                                <th>商品規格</th>
                                                <th>購買數量</th>
                                                <th>商品單價</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td>
                                                    <h4>訂單總額：</h4>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <blockquote>
                                            <span>注意事項：</span>
                                            <p></p>
                                        </blockquote>
                                        </p>
                                        <h3>配送資訊</h3>
                                        <p>
                                            <h4>付款方式：</h4>
                                            <h4>運送方式：</h4>
                                            <blockquote>
                                                <span>注意事項：</span>
                                                <p></p>
                                            </blockquote>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product_btn text-right">
                        <p>
                            <a class="btn btn_small" href="product.jsp">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                返回商品頁
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
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

</body>

</html>
