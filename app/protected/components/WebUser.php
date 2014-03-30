<?php
class WebUser extends CWebUser {
    public function getHasInsuranceInfo() {
        if (!$this->id)
            return false;
        else
            return $this->patient->hasInsuranceInfo;
    }
}
?>