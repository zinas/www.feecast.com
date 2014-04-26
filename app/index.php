<?php
require_once(dirname(__FILE__).'/protected/config/env.php');

// change the following paths if necessary
$yii=dirname(__FILE__).'/../yii/yii.php';
$config=dirname(__FILE__).'/protected/config/main.php';

// remove the following lines when in production mode
defined('YII_DEBUG') or define('YII_DEBUG',Enviroment::yiiDebug());
// specify how many levels of call stack should be shown in each log message
defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL',Enviroment::yiiTraceLevel());

require_once($yii);
Yii::createWebApplication($config)->run();