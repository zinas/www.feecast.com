<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo CHtml::encode($this->pageTitle); ?></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico and apple-touch-icon(s) in the root directory -->

        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/bootstrap.css">
        <!-- <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/bootstrap-theme.css"> -->
        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css">
        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/typeahead.css">
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <header id="header-main">
            <nav class="navbar navbar-default" role="navigation">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?php echo Yii::app()->request->baseUrl; ?>">FeeCast</a>
              </div>

              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                  <li class="<?php echo $_GET['view']=='about'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'about')) ?>">About us</a></li>
                  <li class="<?php echo $_GET['view']=='contact'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'contact')) ?>">Contact</a></li>
                  <!-- <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="#">Action</a></li>
                      <li><a href="#">Another action</a></li>
                      <li><a href="#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="#">Separated link</a></li>
                      <li class="divider"></li>
                      <li><a href="#">One more separated link</a></li>
                    </ul>
                  </li> -->
                </ul>
                <div class="col-sm-3 col-md-3">
                    <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="q">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                    </form>
                </div>
                <ul class="nav navbar-nav navbar-right">
                  <li><a href="<?php echo Yii::app()->createUrl('site/signup') ?>">Sign up </a></li>
                  <li><a href="<?php echo Yii::app()->createUrl('site/login') ?>">Login</a></li>
                  <!-- <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="#">Action</a></li>
                      <li><a href="#">Another action</a></li>
                      <li><a href="#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="#">Separated link</a></li>
                    </ul>
                  </li> -->
                </ul>
              </div><!-- /.navbar-collapse -->
            </nav>
        </header>


        <!-- Add your site or application content here -->
        <?php echo $content; ?>

        <footer id="footer-main" class="container">
            <hr />
          <div class="row">
            <div class="col-lg-12">
              <div class="col-md-3">
                <ul class="list-unstyled">
                  <li>GitHub<li>
                  <li><a href="#">About us</a></li>
                  <li><a href="#">Blog</a></li>
                  <li><a href="#">Contact & support</a></li>
                  <li><a href="#">Enterprise</a></li>
                  <li><a href="#">Site status</a></li>
                </ul>
              </div>
              <div class="col-md-3">
                <ul class="list-unstyled">
                  <li>Applications<li>
                  <li><a href="#">Product for Mac</a></li>
                  <li><a href="#">Product for Windows</a></li>
                  <li><a href="#">Product for Eclipse</a></li>
                  <li><a href="#">Product mobile apps</a></li>
                </ul>
              </div>
              <div class="col-md-3">
                <ul class="list-unstyled">
                  <li>Services<li>
                  <li><a href="#">Web analytics</a></li>
                  <li><a href="#">Presentations</a></li>
                  <li><a href="#">Code snippets</a></li>
                  <li><a href="#">Job board</a></li>
                </ul>
              </div>
              <div class="col-md-3">
                <ul class="list-unstyled">
                  <li>Documentation<li>
                  <li><a href="#">Product Help</a></li>
                  <li><a href="#">Developer API</a></li>
                  <li><a href="#">Product Markdown</a></li>
                  <li><a href="#">Product Pages</a></li>
                </ul>
              </div>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-lg-12">
              <div class="col-md-8">
                <a href="#">Terms of Service</a>
                <a href="#">Privacy</a>
                <a href="#">Security</a>
              </div>
              <div class="col-md-4">
                <p class="muted pull-right">© 2013 Company Name. All rights reserved</p>
              </div>
            </div>
          </div>
        </footer>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery-1.11.0.min.js"><\/script>')</script>

        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap.min.js"></script>
        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/typeahead.js"></script>
        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X');ga('send','pageview');
        </script>
    </body>
</html>