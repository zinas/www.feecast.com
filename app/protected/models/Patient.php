<?php

/**
 * This is the model class for table "patient".
 *
 */
class Patient extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'patient';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('patInsurance, patInsPlan, patZip, patGender', 'numerical', 'integerOnly'=>true),
			array('patLogin, patName, patFamName, fcbHandle', 'length', 'max'=>45),
			array('patPwd', 'length', 'max'=>40),
			array('patMidName, patPolicyNum', 'length', 'max'=>15),
			array('patEmail', 'length', 'max'=>128),
			array('patDOB, patCreateTime', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, patLogin, patPwd, patName, patFamName, patMidName, patEmail, patInsurance, patInsPlan, patZip, patPolicyNum, patGender, patDOB, patCreateTime, fcbHandle', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'appointments' => array(self::HAS_MANY, 'Appointment', 'patient'),
			'messages' => array(self::HAS_MANY, 'CenterMsg', 'patient'),
			'centerReviews' => array(self::HAS_MANY, 'CenterReview', 'user'),
			'insurance' => array(self::BELONGS_TO, 'InsuranceProvider', 'patInsurance'),
			'plan' => array(self::BELONGS_TO, 'InsurancePlan', 'patInsPlan'),
			'physicianReviews' => array(self::HAS_MANY, 'PhysicianReview', 'user'),
			'searchHistories' => array(self::HAS_MANY, 'SearchHistory', 'user'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'patLogin' => 'Login',
			'patPwd' => 'Password',
			'patName' => 'Name',
			'patFamName' => 'Family Name',
			'patMidName' => 'Middle Name',
			'patEmail' => 'Email',
			'patInsurance' => 'Insurance',
			'patInsPlan' => 'Insurance Plan',
			'patZip' => 'Zip',
			'patPolicyNum' => 'Policy Number',
			'patGender' => 'Gender',
			'patDOB' => 'DOB',
			'patCreateTime' => 'Create Time',
			'fcbHandle' => 'Fcb Handle',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Patient the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

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
