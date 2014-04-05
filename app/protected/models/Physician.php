<?php

/**
 * This is the model class for table "physician".
 *
 */
class Physician extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'physician';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('phyLic, phyLogin, phyPwd', 'required'),
			array('phyLic', 'length', 'max'=>7),
			array('phyLogin, phyName, phyFamName', 'length', 'max'=>45),
			array('phyPwd', 'length', 'max'=>40),
			array('phyMidName', 'length', 'max'=>15),
			array('phyTitle', 'length', 'max'=>25),
			array('phyEmail', 'length', 'max'=>128),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, phyLic, phyLogin, phyPwd, phyName, phyFamName, phyMidName, phyTitle, phyEmail', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'appointments' => array(self::HAS_MANY, 'Appointment', 'physician'),
			'physPricings' => array(self::HAS_MANY, 'PhysicianPricing', 'physician'),
			'reviews' => array(self::HAS_MANY, 'PhysicianReview', 'physician'),
			'specialties' => array(self::MANY_MANY, 'Specialty', 'phys_spec(phyID, specID)'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'phyLic' => 'Lic',
			'phyLogin' => 'Login',
			'phyPwd' => 'Password',
			'phyName' => 'Name',
			'phyFamName' => 'Family Name',
			'phyMidName' => 'Middle Name',
			'phyTitle' => 'Title',
			'phyEmail' => 'Email',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Physician the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
