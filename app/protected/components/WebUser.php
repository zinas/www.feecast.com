<?php
class WebUser extends CWebUser {
    public function getHasInsuranceInfo() {
        if (Yii::app()->user->isGuest) {
            if (is_array(Yii::app()->session['insurance-info'])) {
                if (Yii::app()->session['insurance-info']['policy-number'])
                    return true;
                if (Yii::app()->session['insurance-info']['carrier']&&Yii::app()->session['insurance-info']['plan'])
                    return true;
            }
            return false;
        } else {
            return $this->patient->hasInsuranceInfo;
        }
    }

    public function getInsuranceProvider() {
        if (!$this->hasInsuranceInfo || !Yii::app()->session['insurance-info']['carrier'])
            return null;

        return InsuranceProvider::model()->findByPk(Yii::app()->session['insurance-info']['carrier']);
    }

    public function getInsurancePlan() {
        if (!$this->hasInsuranceInfo || !Yii::app()->session['insurance-info']['plan'])
            return null;

        return InsurancePlan::model()->findByPk(Yii::app()->session['insurance-info']['plan']);
    }
}
?>