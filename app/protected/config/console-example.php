<?php
return CMap::mergeArray(
    require(dirname(__FILE__).'/common.php'),
     array(
        'name'=>'FeeCast - Console',

        // preloading 'log' component
        'preload'=>array('log'),

        // application components
        'components'=>array(
            'log'=>array(
                'class'=>'CLogRouter',
                'routes'=>array(
                    array(
                        'class'=>'CFileLogRoute',
                        'levels'=>'error, warning',
                    ),
                ),
            ),
        ),
    )
);