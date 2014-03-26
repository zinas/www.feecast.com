<?php

class FeesController extends Controller
{
    var $layout = '//layouts/bootstrap-single-column-container';


    public function actionSearch()
    {
        $this->render('search');
    }

    public function actionList() {
        $fees = Fee::model()->findAll();
        $this->render('search', array('myfees' => $fees));
    }

}