<?php

class FeesListWidget extends CWidget
{
    public $fees = array();
    public $extended = true;
    public $need = null;

    public function init()
    {
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/advanced-datatable/media/js/jquery.dataTables.js", CClientScript::POS_END);
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/advanced-datatable/media/js/DT_bootstrap3.js", CClientScript::POS_END);
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/feeslist.js", CClientScript::POS_END);

    }

    public function run()
    {
        $this->render('fees-list-widget', array(
            'extended' => $this->extended,
            'fees' => $this->fees,
            'need' => $this->need
        ));
    }
}