<?php

/**
 * This is the model class for table "center_hours".
 *
 */
class CenterHour extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'center_hours';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('center, monSt, monFin, satSt, satFin, sunSt, sunFin', 'required'),
			array('center, workdaysSame, monSt, monFin, satSt, satFin, satOpen, sunSt, sunFin, sunOpen', 'numerical', 'integerOnly'=>true),
			array('notes', 'length', 'max'=>128),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, center, workdaysSame, monSt, monFin, satSt, satFin, satOpen, sunSt, sunFin, sunOpen, notes', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'center' => array(self::BELONGS_TO, 'Center', 'center'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'center' => 'Center',
			'workdaysSame' => 'Workdays Same',
			'monSt' => 'Monday From',
			'monFin' => 'Monday To',
			'satSt' => 'Saturdat From',
			'satFin' => 'Saturday To',
			'satOpen' => 'Saturday Open',
			'sunSt' => 'Sunday From',
			'sunFin' => 'Sunday To',
			'sunOpen' => 'Sunday Open',
			'notes' => 'Notes',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CenterHour the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
