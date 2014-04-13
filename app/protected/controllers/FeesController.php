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
        $term = Yii::app()->searchState->getParam('search-need');
        $location = Yii::app()->request->getParam('search-location')?Yii::app()->request->getParam('search-location'):'Chicago';
        $cpt = _::parseCpt($term);

        // TODO: Add location
        $centers = Center::model()
            ->with(array(
                'pricings' => array(
                    'joinType'=>'INNER JOIN',
                    'scopes' => array('cpt' => 23020)
                ),
                'pricings.physicianPrices' => array(
                    'joinType'=>'INNER JOIN'
                )
            ))
            ->findAll(array(
                'select' => 't.*,
                    pricings.pricePatient AS center_patient_price,
                    pricings.priceIns AS center_insurance_price,
                    MIN(physicianPrices.price) AS min_physician_price,
                    MAX(physicianPrices.price) AS max_physician_price,
                    (pricings.pricePatient + pricings.priceIns + MIN(physicianPrices.price)) AS center_total_price,
                    pricings.cpt as cpt
                ',
                'order' => 'center_total_price ASC',
                'group' => 't.id'
            ));

        $summary = Fee::model()
                ->location($location)
                ->cpt($cpt)
                ->currentUser()
                ->summary()
                ->find();

        $this->render('list', array(
            'centers' => $centers,
            'term' => $term,
            'location' => $location,
            'summary' => $summary,
            'providers' => InsuranceProvider::model()->findAll(array('order' => 'insName ASC'))
        ));
    }

    public function actionPlans() {
        $insurance = InsuranceProvider::model()->findByPk(Yii::app()->request->getParam('insurance-id'));
        $this->renderPartial('plans', array(
            'plans' => $insurance->plans
        ));
    }

    public function actionPhysicians() {
        $center_id = Yii::app()->request->getParam('center_id');
        $cpt_id = Yii::app()->request->getParam('cpt_id');

        $fees = PhysicianPricing::model()
            ->with('_physician')
            ->findAll(array(
                'condition' => 'center=:center AND cpt=:cpt',
                'params' => array(':center' => $center_id, ':cpt' => $cpt_id),
                'order' =>  'price ASC'
            ));

        $result = array();


        foreach ($fees as $fee) {
            $result[] = array(
                'feeId' => $fee->id,
                'physician' => $fee->_physician->title,
                'price' => _::currency($fee->price)
            );
        }

        $this->renderJSON($result);
    }

    public function actionTest() {
        $centers = Center::model()
            ->with(array(
                'pricings' => array(
                    'joinType'=>'INNER JOIN',
                    'scopes' => array('cpt' => 23020)
                ),
                'pricings.physicianPrices' => array(
                    'joinType'=>'INNER JOIN'
                )
            ))
            ->findAll(array(
                'select' => 't.*,
                    pricings.pricePatient AS center_patient_price,
                    pricings.priceIns AS center_insurance_price,
                    (pricings.pricePatient + pricings.priceIns) AS center_total_price,
                    MIN(physicianPrices.price) AS min_physician_price,
                    MAX(physicianPrices.price) AS max_physician_price
                ',
                'order' => 'center_total_price ASC',
                'group' => 't.id'
            ));

        foreach ($centers as $center) {
            $dump = array(
                'attributes' => $center->attributes,
                'center_patient_price' => $center->center_patient_price,
                'center_insurance_price' => $center->center_insurance_price,
                'center_total_price' => $center->center_total_price,
                'min_physician_price' => $center->min_physician_price,
                'max_physician_price' => $center->max_physician_price,
            );
            CVarDumper::dump($dump, 10, true);

            echo '<br><br>***************************************************<br><br>';
        }
    }
}