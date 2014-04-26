<?php
define('DS',DIRECTORY_SEPARATOR);
Yii::setPathOfAlias('root', dirname(__FILE__).DS.'..'.DS.'..');
return array(
    'basePath'=>dirname(__FILE__).DS.'..'.DS,
    'name'=>'FeeCast',

    // preloading 'log' component
    'preload'=>array('log'),

    // autoloading model and component classes
    'import'=>array(
        'application.models.*',
        'application.components.*',
    ),

    'modules'=>array(

    ),

    // application components
    'components'=>array(
        'less' => array(
            'class' => 'Less',
            'files' => array('theme', 'bootstrap'.DS.'bootstrap', 'feecast'),
            'createMapFiles' => true,
            'destination' => 'css',
            'source' => 'less',
        ),

        'db'=>array(
            'connectionString' => 'mysql:host=localhost;dbname=feecast',
            'emulatePrepare' => true,
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ),
    ),

    'params'=>array(
        'env' => 'dev'
    ),
);