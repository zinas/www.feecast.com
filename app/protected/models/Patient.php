<?php
class Patient extends ActiveRecord {

    public function tableName() {return 'patient';}
    public function primaryKey() {return 'patID';}
    public static function model($className=__CLASS__) {return parent::model($className);}

    public function getFullname() {
        return $this->patName.' '.$this->patFamName;
    }
}
?>