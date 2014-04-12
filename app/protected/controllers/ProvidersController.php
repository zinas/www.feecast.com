<?php

class ProvidersController extends Controller
{
    var $layout = '//layouts/bootstrap-single-column-container';


    public function actionContact()
    {
        //TODO: fix queries based on params
        //
        $center = Center::model()->findByPk(1);
        $physician = Physician::model()->findByPk(1);
        $cpt = Cpt::model()->findByPk(1);

        $this->render('contact', array(
            'center' => $center,
            'physician' => $physician,
            'cpt' => $cpt,
        ));
    }

    public function actionDetails() {
        $center = Center::model()->findByPk(6);

        $this->render('details', array(
            'center' => $center
        ));
    }
}