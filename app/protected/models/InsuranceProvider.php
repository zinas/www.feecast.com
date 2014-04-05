<?php

/**
 * This is the model class for table "ins_provider".
 *
 */
class InsuranceProvider extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'ins_provider';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('insName', 'required'),
			array('insName, insNote', 'length', 'max'=>45),
			array('insLogo', 'length', 'max'=>128),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, insName, insNote, insLogo', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'centers' => array(self::MANY_MANY, 'Center', 'center_ins(insurance, center)'),
			'centerPricings' => array(self::HAS_MANY, 'CenterPricing', 'insurance'),
			'plans' => array(self::HAS_MANY, 'InsurancePlan', 'insurance'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'insName' => 'Name',
			'insNote' => 'Note',
			'insLogo' => 'Logo',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return InsuranceProvider the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
