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
        if (Yii::app()->user->isGuest) {
            echo "Searching for anonymous users under development. Go back and try logging in first";
            return;
        }
        $term = Yii::app()->request->getParam('search-need');
        $location = Yii::app()->request->getParam('search-location')?Yii::app()->request->getParam('search-location'):'Chicago';
        $cpt = _::parseCpt($term);

        $fees = Fee::model()
                ->location($location)
                ->cpt($cpt)
                ->currentUser()
                ->summaryByCenter()
                ->findAll();

        $summary = Fee::model()
                ->location($location)
                ->cpt($cpt)
                ->currentUser()
                ->summary()
                ->find();

        $this->render('list', array(
            'fees' => $fees,
            'term' => $term,
            'location' => $location,
            'summary' => $summary
        ));
    }

    public function actionPhysicians() {
        $center_id = Yii::app()->request->getParam('center_id');
        $cpt_id = Yii::app()->request->getParam('cpt_id');

        $fees = Fee::model()
            ->currentUser()
            ->findAll(array(
                'condition' => 'center_id=:cid AND cpt_id=:cpt_id',
                'params' => array(':cid' => $center_id, ':cpt_id' => $cpt_id),
                'order' =>  'patient_price ASC'
            ));

        $result = array();

        foreach ($fees as $fee) {
            $result[] = array(
                'feeId' => $fee->id,
                'physician' => $fee->physician->title,
                'price' => _::currency($fee->patient_price)
            );
        }

        $this->renderJSON($result);
    }
}