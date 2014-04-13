<?php

class ProvidersController extends Controller
{
    var $layout = '//layouts/bootstrap-single-column-container';


    public function actionContact()
    {
        $center = Center::model()->findByPk(Yii::app()->request->getParam('center'));
        $cpt = Cpt::model()->findByPk(Yii::app()->request->getParam('cpt'));
        $physician = Physician::model()->findByPk(Yii::app()->request->getParam('physician'));
        $selectedPhysician = Yii::app()->request->getParam('physician')?true:false;


        if ($selectedPhysician) {
            $physicianPrice = $physician->physPricings(array('condition'=>'cpt='.$cpt->id.' AND center='.$center->id))[0]->price;
        } else {
            $physicianPrice = '';
        }

        $this->render('contact', array(
            'center' => $center,
            'physician' => $physician,
            'cpt' => $cpt,
            'centerPrice' => $center->pricings(array('condition'=>'cpt='.$cpt->id))[0]->pricePatient,
            'physicianPrice' => $physicianPrice,
            'selectedPhysician'=>$selectedPhysician
        ));
    }

    public function actionDetails() {
        $center = Center::model()->findByPk(Yii::app()->request->getParam('id'));

        $this->render('details', array(
            'center' => $center
        ));
    }
}