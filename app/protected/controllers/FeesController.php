<?php

class FeesController extends Controller
{
    var $layout = '//layouts/bootstrap-single-column-container';


    public function actionInsuranceInfo()
    {
        $this->render('insurance-info');
    }

    public function actionList() {
        $searchTerms = $this->__getSearchTerms();

        $fees = Center::model()->stubFeesList;
        $this->render('list', array(
            'fees' => $fees,
            'extended' => true,
            'terms' => $searchTerms
        ));
    }

    private function __getSearchTerms() {
        if (isset($_POST['search-need'])) {
            Yii::app()->session['terms'] = $_POST;
        }

        return Yii::app()->session['terms'];
    }
}