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
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
          <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <h2>FeeCast</h2>
                </div>
                <div class="col-md-5">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search provider by name">
                      <span class="input-group-addon">@</span>
                    </div>
                </div>
                <div class="col-md-4">
                    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
                      <ul class="nav navbar-nav navbar-right" role="navigation">
                        <li><a href="<?php echo $this->createUrl('site/help'); ?>">Help</a></li>
                        <li><a href="<?php echo $this->createUrl('site/signup'); ?>">Join</a></li>
                        <li><a href="<?php echo $this->createUrl('site/login'); ?>">Sign in</a></li>
                      </ul>
                    </nav>
                </div>
            </div>
          </div>
        </header>


        <!-- Add your site or application content here -->
        <?php echo $content; ?>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery-1.11.0.min.js"><\/script>')</script>

        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap.min.js"></script>

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