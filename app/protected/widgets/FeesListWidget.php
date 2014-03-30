<?php

class FeesListWidget extends CWidget
{
    public $fees = array();
    public $terms = array();

    public function init()
    {
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/advanced-datatable/media/js/jquery.dataTables.js", CClientScript::POS_END);
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/advanced-datatable/media/js/DT_bootstrap3.js", CClientScript::POS_END);
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/feeslist.js", CClientScript::POS_END);

    }

    public function run()
    {
        $this->render('fees-list-widget', array(
            'hasInsuranceInfo' => Yii::app()->user->getHasInsuranceInfo(),
            'fees' => $this->fees,
            'need' => implode('<br>', $this->terms['search-needs'])
        ));
    }
}