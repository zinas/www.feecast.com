<?php

class FeesController extends Controller
{
    var $layout = '//layouts/bootstrap-single-column-container';


    public function actionSearch()
    {
        $this->render('search');
    }

}