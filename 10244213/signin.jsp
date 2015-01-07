<%@page pageEncoding = "UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sign In</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">
    
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>   

    <link href="css/style.css" rel="stylesheet">
</head>

<body id="page-top" class="index sign_in">

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
                <a class="navbar-brand page-scroll" href="index.jsp">橘。花台</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <%@include file="validation_memder_name.jsp"%>
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <%@include file="validation_member_signout.jsp"%>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <section id="signin" class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h2 class="section-heading">登入會員</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1 text-center sign_in_row">
                    <form action="signin_to_db.jsp"
                          method="post"
                          name="sentMessage"
                          id="contactForm"
                          novalidate>
                        <div class="row">
                            <div class="form-group row">
                                <div class="col-sm-3">
                                    <label for="email">信箱</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="email"
                                           class="form-control"
                                           placeholder="信箱 *"
                                           id="email"
                                           name="email"
                                           required
                                           data-validation-required-message="請輸入您的信箱">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-3">
                                    <label for="password">密碼</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="password"
                                           class="form-control"
                                           placeholder="密碼 *"
                                           id="password"
                                           name="password"
                                           required
                                           data-validation-required-message="請設定您的密碼">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-lg-10 col-lg-offset-1 text-center row">
                                <div class="col-sm-3 col-sm-offset-3 text-center">
                                    <button type="submit" class="btn btn-xl">提交</button>
                                </div>
                                <div class="col-sm-3 col-sm-offset-2 text-center">
                                    <button type="reset" class="btn btn-xl">重設</button>
                                </div>
                            </div>
                        </div>
                    </form>
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
    <script>
        $(function () { $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(); } );
    </script>
    <%--<script src="js/contact_me.js"></script>--%>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>

</body>
</html>
