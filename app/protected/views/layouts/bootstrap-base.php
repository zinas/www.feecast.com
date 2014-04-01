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
        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/font-awesome/css/font-awesome.css" />

        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/style.css">
        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/style-responsive.css">
        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/table-responsive.css">

        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/to-do.css">
        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/slider.css">


        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css">
        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl; ?>/css/typeahead.css">
        <script>var baseUrl = "<?php echo Yii::app()->request->baseUrl; ?>";</script>
    </head>
    <body class="<?php echo Yii::app()->controller->id=="site"&&Yii::app()->controller->action->id=="index"?'homepage':'' ?>">
        <!--[if lt IE 8]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <?php $this->renderPartial('//layouts/header') ?>
        <?php echo $content; ?>
        <?php $this->renderPartial('//layouts/footer') ?>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery.scrollTo.min.js"></script>
        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery.nicescroll.js"></script>
        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery.tagsinput.js"></script>

        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery-ui-1.9.2.custom.min.js"></script>


        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap.min.js"></script>
        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/typeahead.js"></script>

        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/common-scripts.js"></script>
        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap-switch.js"></script>

        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap-slider.js"></script>

        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>


        <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/form-component.js"></script>
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