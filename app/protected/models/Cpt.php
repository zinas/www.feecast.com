<?php

/**
 * This is the model class for table "cpt".
 *
 */
class Cpt extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'cpt';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cptCode, cptShortDesc', 'required'),
			array('cptBodyPart', 'numerical', 'integerOnly'=>true),
			array('cptCode', 'length', 'max'=>6),
			array('cptLongDesc', 'length', 'max'=>256),
			array('cptShortDesc', 'length', 'max'=>45),
			array('cptAddNotes', 'length', 'max'=>200),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, cptCode, cptLongDesc, cptShortDesc, cptAddNotes, cptBodyPart', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'appointments' => array(self::HAS_MANY, 'Appointment', 'cpt'),
			'messages' => array(self::HAS_MANY, 'CenterMsg', 'cpt'),
			'centerPricings' => array(self::HAS_MANY, 'CenterPricing', 'cpt'),
			'services' => array(self::HAS_MANY, 'CenterService', 'cpt'),
			'bodyPart' => array(self::BELONGS_TO, 'BodyPart', 'cptBodyPart'),
			'physicianPricings' => array(self::HAS_MANY, 'PhysicianPricing', 'cpt'),
			'searchHistories' => array(self::HAS_MANY, 'SearchHistory', 'cpt'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'cptCode' => 'Code',
			'cptLongDesc' => 'Description',
			'cptShortDesc' => 'Summary',
			'cptAddNotes' => 'Add Notes',
			'cptBodyPart' => 'Body Part',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Cpt the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
