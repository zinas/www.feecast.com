<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><?=CHtml::encode($this->pageTitle); ?></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<?=Yii::app()->request->baseUrl; ?>/css/bootstrap.css">
        <link rel="stylesheet" href="<?=Yii::app()->request->baseUrl; ?>/css/theme.css">

        <script src="js/vendor/require.js"></script>
        <script src="js/require/config.js"></script>
    </head>
    <body>
        <?=$content; ?>

        <script src="js/feecast.js"></script>
    </body>
</html>