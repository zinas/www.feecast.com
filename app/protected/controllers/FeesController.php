<?php

class FeesController extends Controller
{
    var $layout = '//layouts/bootstrap-single-column-container';


    public function actionSearch()
    {
        $this->render('search');
    }

    public function actionList() {
        $fees = Center::model()->stubFeesList;
        $this->render('list', array(
            'fees' => $fees,
            'extended' => true
        ));
    }
}