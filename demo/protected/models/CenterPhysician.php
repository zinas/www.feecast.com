<?php

/**
 * This is the model class for table "center_phys".
 *
 */
class CenterPhysician extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'center_phys';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('physician, center', 'required'),
			array('physician, center', 'numerical', 'integerOnly'=>true),
			array('rateEst', 'numerical'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, physician, center, rateEst', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'physician' => array(self::BELONGS_TO, 'Physician', 'physician'),
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
			'physician' => 'Physician',
			'center' => 'Center',
			'rateEst' => 'Rate Estimation',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CenterPhysician the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
