<?php
class Center extends ActiveRecord {

    public function tableName() {return 'center';}
    public function primaryKey() {return 'TIN';}
    public static function model($className=__CLASS__) {return parent::model($className);}

    public function getStubFeesList() {
        return array(
            array(
                'id' => 1,
                'facility' => 'Princeton-Plainsboro Teaching Hospital',
                'physician' => 'Gregory House, MD',
                'location' => 'Plainsboro',
                'insuredPrice' => 1000,
                'cashPrice' => 500,
                'userPrice' => 300
            ),
            array(
                'id' => 2,
                'facility' => 'Sacred Heart Hospital',
                'physician' => 'Dr. Perry Fox',
                'location' => 'New York',
                'insuredPrice' => 5000,
                'cashPrice' => 4500,
                'userPrice' => 500
            ),
            array(
                'id' => 3,
                'facility' => 'Eastman Medical Center',
                'physician' => 'Doogie Howser, MD',
                'location' => 'Los Angeles',
                'insuredPrice' => 9999,
                'cashPrice' => 999,
                'userPrice' => 99
            )
        );
    }
}
?>