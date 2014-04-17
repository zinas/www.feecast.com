<?php

/**
 * This is the model class for table "center".
 *
 */
class Center extends CActiveRecord
{
	/* fee related variables */
	public $center_patient_price = 0;
	public $center_insurance_price = 0;
	public $center_total_price = 0;
	public $center_total_price_max = 0;
	public $min_physician_price = 0;
	public $max_physician_price = 0;
	public $cpt = null;


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

	public function getHourSummary() {
		return 'Monday-Friday: 08.00 AM - 6.00 PM';
	}

	public function getMinTotal() {
		return $this->center_patient_price + $this->min_physician_price;
	}

	public function getMaxTotal() {
		return $this->center_patient_price + $this->max_physician_price;
	}

	public function getCover() {
		if (is_file(Yii::getPathOfAlias('webroot.images.content.center-backgrounds').DIRECTORY_SEPARATOR.$this->id.'.jpg')) {
			return Yii::app()->baseUrl.'/images/content/center-backgrounds/'.$this->id.'.jpg';
		} else {
			return self::getDefaultCover();
		}
	}

	public static function getDefaultCover() {
		return Yii::app()->baseUrl.'/images/content/center-backgrounds/0.jpg';
	}

	public function getIcon() {
		if (is_file(Yii::getPathOfAlias('webroot.images.content.center-logos').DIRECTORY_SEPARATOR.$this->id.'.png')) {
			return Yii::app()->baseUrl.'/images/content/center-logos/'.$this->id.'.png';
		} else {
			return self::getDefaultIcon();
		}
	}

	public static function getDefaultIcon() {
		return Yii::app()->baseUrl.'/images/content/center-logos/0.png';
	}

	public function getAbout() {
		return $this->name . ': '. $this->centDesc;
	}

	public function getMap() {
		//$searchTerm = str_replace(" ", "+", $this->name);
		return "https://www.google.com/maps/embed/v1/place?key=AIzaSyChG2RPGnlw3qWMfpnxvbX-HhpgOkATNew&q=".$this->name;
		//return "https://www.google.com/maps/embed/v1/place?key=AIzaSyChG2RPGnlw3qWMfpnxvbX-HhpgOkATNew&q=Space+Needle,Seattle+WA";
	}
}
