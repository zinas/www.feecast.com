<?php

/**
 * This is the model class for table "fees".
 *
 */
class Fee extends CActiveRecord
{

	// Variables for placeholders of MIN() and MAX() SQL functions
	public $min_price;
	public $max_price;
	public $average_price;

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'fees';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('center_id, patient_id, physician_id, cash_price, patient_price', 'required'),
			array('center_id, patient_id, physician_id', 'numerical', 'integerOnly'=>true),
			array('cash_price, patient_price', 'numerical'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, center_id, patient_id, physician_id, cash_price, patient_price', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'physician' => array(self::BELONGS_TO, 'Physician', 'physician_id'),
			'center' => array(self::BELONGS_TO, 'Center', 'center_id'),
			'patient' => array(self::BELONGS_TO, 'Patient', 'patient_id'),
			'cpt' => array(self::BELONGS_TO, 'Cpt', 'cpt_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'center_id' => 'Center',
			'patient_id' => 'Patient',
			'physician_id' => 'Physician',
			'cash_price' => 'Cash Price',
			'patient_price' => 'Patient Price',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('center_id',$this->center_id);
		$criteria->compare('patient_id',$this->patient_id);
		$criteria->compare('physician_id',$this->physician_id);
		$criteria->compare('cash_price',$this->cash_price);
		$criteria->compare('patient_price',$this->patient_price);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Fee the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * Named scope for filtering fees only for the logged in user
	 * @return Fee
	 */
	public function currentUser() {
        $this->getDbCriteria()->mergeWith(array(
            'condition'=>'patient_id = :id',
            'params'=>array(':id'=>Yii::app()->user->id),
        ));
        return $this;
	}

	/**
	 * Named scope for grouping by center and returning min-max values
	 * @return Fee
	 */
	public function summaryByCenter() {
		$this->getDbCriteria()->mergeWith(array(
			'select' => $this->getDbCriteria()->select.', MIN(patient_price) AS min_price, MAX(patient_price) as max_price',
			'group' => 'center_id',
			'order' => 'min_price ASC'
		));

		return $this;
	}

	/**
	 * Named scope for summary
	 * @return Fee
	 */
	public function summary() {
		$this->getDbCriteria()->mergeWith(array(
			'select' => 'MIN(patient_price) AS min_price, MAX(patient_price) as max_price, AVG(patient_price) as average_price',
		));

		return $this;
	}


	/**
	 * Named scope for searching fees around a location
	 * @return Fee
	 */
	public function location($location) {
		$this->getDbCriteria()->mergeWith(array(
			'with' => 'center',
			'condition' => 'center.addrCity LIKE :location',
			'params' => array(':location' => '%'.$location.'%')
		));

		return $this;
	}

	/**
	 * Named scope for searching fees for a specific cpt
	 * @return Fee
	 */
	public function cpt($cpt) {
		$this->getDbCriteria()->mergeWith(array(
			'with' => 'cpt',
			'condition' => 'cpt.cptCode = :code',
			'params' => array(':code' => $cpt)
		));

		return $this;
	}
}
