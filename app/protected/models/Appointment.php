<?php

/**
 * This is the model class for table "appointment".
 *
 */
class Appointment extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'appointment';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('patient, center, dateReq', 'required'),
			array('patient, center, physician, cpt', 'numerical', 'integerOnly'=>true),
			array('estFee', 'numerical'),
			array('highLevelDesc', 'length', 'max'=>256),
			array('dateClosed', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, patient, center, physician, cpt, highLevelDesc, estFee, dateReq, dateClosed', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'patient' => array(self::BELONGS_TO, 'Patient', 'patient'),
			'center' => array(self::BELONGS_TO, 'Center', 'center'),
			'physician' => array(self::BELONGS_TO, 'Physician', 'physician'),
			'cpt' => array(self::BELONGS_TO, 'Cpt', 'cpt'),
			'scheduledAppointments' => array(self::HAS_MANY, 'ScheduledAppointment', 'app'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'patient' => 'Patient',
			'center' => 'Center',
			'physician' => 'Physician',
			'cpt' => 'Cpt',
			'highLevelDesc' => 'Description',
			'estFee' => 'Fee Estimation',
			'dateReq' => 'Date Requested',
			'dateClosed' => 'Date Closed',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Appointment the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
