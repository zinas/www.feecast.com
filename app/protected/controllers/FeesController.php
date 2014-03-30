<?php

class FeesController extends Controller
{
    var $layout = '//layouts/bootstrap-single-column-container';


    public function actionInsuranceInfo()
    {
        $this->render('insurance-info');
    }

    public function actionList() {
        $fees = Center::model()->stubFeesList;

        $this->render('list', array(
            'fees' => $fees,
            'terms' => Yii::app()->searchState->terms
        ));
    }
}