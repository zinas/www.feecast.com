<?php
class Patient extends ActiveRecord {

    public function tableName() {return 'patient';}
    public static function model($className=__CLASS__) {return parent::model($className);}

    /**
     * [getFullname description]
     * @return [type] [description]
     */
    public function getFullname() {
        return $this->patName.' '.$this->patFamName;
    }

    /**
     * Whether the patient has submitted his insurance info
     * @return boolean
     */
    public function getHasInsuranceInfo() {
        return true;
    }
}
?>