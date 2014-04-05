<?php

/**
 * This is the model class for table "sched_app".
 *
 * The followings are the available columns in table 'sched_app':
 * @property integer $id
 * @property integer $app
 * @property string $dateSched
 * @property string $dateReq
 *
 * The followings are the available model relations:
 * @property Appointment $app0
 */
class ScheduledAppointment extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'sched_app';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('app, dateSched', 'required'),
			array('app', 'numerical', 'integerOnly'=>true),
			array('dateReq', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, app, dateSched, dateReq', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'appointment' => array(self::BELONGS_TO, 'Appointment', 'app'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'app' => 'Appointment',
			'dateSched' => 'Date Scheduled',
			'dateReq' => 'Date Requested',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ScheduledAppointment the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
