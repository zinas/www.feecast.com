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

        if (Yii::app()->request->getParam('carrier')) {
            if (Yii::app()->user->isGuest || Yii::app()->user->isPracticioner) {
                Yii::app()->session['insurance-info'] = array(
                    'carrier' => Yii::app()->request->getParam('carrier'),
                    'plan' => Yii::app()->request->getParam('plan'),
                    'policy-number' => Yii::app()->request->getParam('policy-number')
                );
            } else {
                // Update Patient Info
            }
        }


        // TODO: Add location
        $centers = Center::model()
            ->with(array(
                'pricings' => array(
                    'joinType'=>'INNER JOIN',
                    'scopes' => array('cpt' => $cpt)
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
                    (pricings.pricePatient + pricings.priceIns + MAX(physicianPrices.price)) AS center_total_price_max,
                    pricings.cpt as cpt
                ',
                'order' => 'center_total_price ASC',
                'group' => 't.id'
            ));

        $summary = array(
            'min_price' => 9999999,
            'max_price' => 0,
            'average_price' => 0
        );
        $total = 0;

        foreach ($centers as $center) {
            if ($center->center_total_price<$summary['min_price'])
                $summary['min_price'] = $center->center_total_price;
            if ($center->center_total_price_max>$summary['max_price'])
                $summary['max_price'] = $center->center_total_price_max;

            $total += ($center->center_total_price+$center->center_total_price_max)/2;
        }

        $summary['average_price'] = count($centers)>0?$total / count($centers):0;


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

        $center = Center::model()->findByPk($center_id);
        $centerPricings = $center->pricings(array('condition'=>'cpt='.$cpt_id));


        foreach ($fees as $fee) {
            $result[] = array(
                'physicianId' => $fee->physician,
                'physician' => $fee->_physician,
                'price' => _::currency($fee->price+$centerPricings[0]->pricePatient+$centerPricings[0]->priceIns),
                'pPrice' => _::currency($fee->price),
                'cPrice' => _::currency($centerPricings[0]->pricePatient),
                'iPrice' => _::currency($centerPricings[0]->priceIns),
            );
        }

        $this->renderPartial('physicians', array('results'=>$result));
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