<?php

class SearchTripleWidget extends CWidget
{
    public function init()
    {
        // this method is called by CController::beginWidget()
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/search-triple.js", CClientScript::POS_END);

    }

    public function run()
    {
        // this method is called by CController::endWidget()
        $this->render('search-triple-widget');
    }
}