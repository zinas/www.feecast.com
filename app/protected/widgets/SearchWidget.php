<?php

class SearchWidget extends CWidget
{
    public function init()
    {
        // this method is called by CController::beginWidget()
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/search.js", CClientScript::POS_END);

    }

    public function run()
    {
        // this method is called by CController::endWidget()
        $this->render('search-widget');
    }
}