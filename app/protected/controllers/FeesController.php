<?php

class FeesController extends Controller
{
    var $layout = '//layouts/bootstrap-single-column-container';


    public function actionInsuranceInfo()
    {
        if ($_POST) {
            $this->redirect(array('fees/list'));
        } else {
            $this->render('insurance-info');
        }
    }

    public function actionList() {
        $fees = Center::model()->stubFeesList;

        $this->render('list', array(
            'fees' => $fees,
            'term' => Yii::app()->request->getParam('search-need')
        ));
    }
}