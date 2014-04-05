<?php

/**
 * This is the model class for table "center".
 *
 */
class Center extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'center';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('TIN, centLogin, centPwd, dateCreated, phone', 'required'),
			array('TIN, addrNum, addrZip', 'numerical', 'integerOnly'=>true),
			array('centLogin', 'length', 'max'=>45),
			array('centPwd', 'length', 'max'=>40),
			array('name', 'length', 'max'=>100),
			array('addrRoad, addrCity, addrCounty', 'length', 'max'=>128),
			array('addrState', 'length', 'max'=>2),
			array('logoLoc', 'length', 'max'=>200),
			array('phone', 'length', 'max'=>10),
			array('url, logo', 'length', 'max'=>255),
			array('desc', 'length', 'max'=>500),
			array('dateUpdated, licExpiration', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, TIN, centLogin, centPwd, name, addrNum, addrRoad, addrCity, addrCounty, addrState, addrZip, logoLoc, dateCreated, dateUpdated, phone, url, desc, licExpiration, logo', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'appointments' => array(self::HAS_MANY, 'Appointment', 'center'),
			'amenities' => array(self::HAS_MANY, 'CenterAmenity', 'center'),
			'hours' => array(self::HAS_MANY, 'CenterHour', 'center'),
			'insuranceProviders' => array(self::MANY_MANY, 'InsuranceProvider', 'center_ins(center, insurance)'),
			'messages' => array(self::HAS_MANY, 'CenterMessage', 'center'),
			'physicians' => array(self::HAS_MANY, 'CenterPhysician', 'center'),
			'pricings' => array(self::HAS_MANY, 'CenterPricing', 'center'),
			'reviews' => array(self::HAS_MANY, 'CenterReview', 'center'),
			'services' => array(self::HAS_MANY, 'CenterService', 'center'),
			'physicianPricings' => array(self::HAS_MANY, 'PhysicianPricing', 'center'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'TIN' => 'Tin',
			'centLogin' => 'Login',
			'centPwd' => 'Password',
			'name' => 'Name',
			'addrNum' => 'Address Number',
			'addrRoad' => 'Street Address',
			'addrCity' => 'City',
			'addrCounty' => 'County',
			'addrState' => 'State',
			'addrZip' => 'Zip',
			'logoLoc' => 'Logo',
			'dateCreated' => 'Date Created',
			'dateUpdated' => 'Date Updated',
			'phone' => 'Phone',
			'url' => 'Url',
			'desc' => 'Description',
			'licExpiration' => 'Lic Expiration',
			'logo' => 'Logo (obsolete)',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Center the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
