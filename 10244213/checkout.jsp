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
                    <h3 class="panel-title">確認商品資訊</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>商品名稱</th>
                                <th>商品規格</th>
                                <th>商品單價</th>
                                <th>購買數量</th>
                                <th>小計</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>橘子花</td>
                                <td>XXX</td>
                                <td>399</td>
                                <td>1</td>
                                <td>
                                    <input type="text" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"></td>
                                <td>
                                    <h4>訂單總額：</h4>
                                </td>
                                <td>
                                    <input type="text" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <blockquote>
                        <span>注意事項：</span>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                    </blockquote>
                </div>
            </div>
        </div>
        <form action="">
            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">填寫配送資訊</h3>
                    </div>
                    <div class="panel-body">
                        <div class="ship_details">
                            <h3>付款方式：
                                <div id="pay" class="btn-group" data-toggle="buttons">
                                    <label class="btn btn_small btn_select active">
                                        <input type="radio" name="credit_card" id="credit_card" autocomplete="off" checked>
                                        信用卡
                                    </label>
                                    <label class="btn btn_small btn_select">
                                        <input type="radio" name="cash" id="cash" autocomplete="off">
                                        貨到付款
                                    </label>
                                    <label class="btn btn_small btn_select">
                                        <input type="radio" name="atm" id="atm" autocomplete="off">
                                        ATM轉帳
                                    </label>
                                </div>
                            </h3>
                            <h3>運送方式：
                                <div id="ship" class="btn-group" data-toggle="buttons">
                                    <label class="btn btn_small btn_select active">
                                        <input type="radio" name="home_delivery" id="home_delivery" autocomplete="off" checked>
                                        黑貓宅配
                                    </label>
                                    <label class="btn btn_small btn_select">
                                        <input type="radio" name="7-11" id="7-11" autocomplete="off">
                                        7-11取貨
                                    </label>
                                    <label class="btn btn_small btn_select">
                                        <input type="radio" name="family" id="family" autocomplete="off">
                                        全家取貨
                                    </label>
                                </div>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">發票資訊</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="recipe"></label>
                            <select id="recipe" name="recipe" class="form-control">
                                <option value="choose">請選擇</option>
                                <option value="donation">捐贈發票</option>
                                <option value="not_donation">電子發票</option>
                            </select>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    捐贈發票
                                </h4>
                            </div>
                            <div class="panel-body">
                                <fieldset id="donation_field" disabled>
                                    <p>
                                        <input type="radio"
                                               id="unit"
                                               name="donation"
                                               value="unit">
                                        <label for="unit">捐贈單位：</label>
                                        <select name="unit_select" id="unit_select">
                                            <option selected value="dog">社團法人中華民國動物福利環保協進會</option>
                                            <option value="ccf">財團法人台灣兒童暨家庭扶助基金會</option>
                                            <option value="guidedog">社團法人台灣導盲犬協會</option>
                                        </select>
                                    </p>
                                    <p>
                                        <input type="radio"
                                               id="society"
                                               name="donation"
                                               value="society">
                                        <label for="society">其他社福團體愛心碼：</label>
                                        <input type="text"/>
                                        <a href="https://www.einvoice.nat.gov.tw/APMEMBERVAN/XcaOrgPreserveCodeQuery/XcaOrgPreserveCodeQuery?CSRT=4350550699150711492">
                                            愛心碼索引
                                        </a>
                                    </p>
                                </fieldset>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    電子發票
                                </h4>
                            </div>
                            <div class="panel-body">
                                <fieldset id="not_donation_field" disabled>
                                    <span>
                                        依統一發票使用辦法規定：個人戶(二聯式)發票一經開立，無法任意更改或改開公司戶(三聯式)發票。
                                    </span>
                                    <p>
                                        <input type="radio"
                                               id="member"
                                               name="not_donation"
                                               value="unit">
                                        <label for="member">會員載具：</label>
                                        <small>讓我們自動為您兌獎，中獎後主動通知您。</small>
                                        <ul>
                                            <li>
                                                <div class="form-group">
                                                    <label for="name">姓名：</label>
                                                    <input type="text"
                                                           placeholder="姓名 *"
                                                           id="name"
                                                           name="name">
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <label for="phone">手機：</label>
                                                    <input type="tel"
                                                           placeholder="手機 *"
                                                           id="phone"
                                                           name="phone"
                                                           pattern="[09]{2}[0-9]{8}">
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <label for="address">住址：</label>
                                                    <input type="text"
                                                           placeholder="住址 *"
                                                           id="address"
                                                           name="address">
                                                </div>
                                            </li>
                                        </ul>
                                    </p>
                                    <p>
                                        <input type="radio"
                                               id="mobile"
                                               name="not_donation"
                                               value="mobile">
                                        <label for="mobile">共通性載具：</label>
                                        <small>
                                            您需持有手機載具，詳見財政部
                                            <a href="https://www.einvoice.nat.gov.tw/">
                                                「電子發票整合服務平台」
                                            </a>
                                        </small>
                                    </p>
                                    <p>
                                        <input type="radio"
                                               id="triplicate"
                                               name="not_donation"
                                               value="triplicate">
                                        <label for="triplicate">三聯式發票：</label>
                                    </p>
                                    <blockquote>
                                        <p>
                                            發票一經開立，統一編號、抬頭以及收件相關資訊無法再做更動，也無法再將二聯式發票改開三聯式發票，請務必確認資訊正確。
                                        </p>
                                    </blockquote>
                                </fieldset>
                            </div>
                        </div>
                        <div class="product_btn text-right">
                            <p>
                                <a class="btn btn_small" href="purchase_order.jsp">
                                    <span class="glyphicon glyphicon-usd"></span>
                                    確定結帳
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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

    <script>
        recipe.onchange = function () {
        var val = this.options[this.selectedIndex].value;
        document.getElementById("donation_field").disabled = (val === "donation") ? false : true;
        document.getElementById("not_donation_field").disabled = (val === "not_donation") ? false : true;
        };
    </script>
</body>

</html>
