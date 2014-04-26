<?php

/**
 * This is the model class for table "ins_plan".
 *
 */
class InsurancePlan extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'ins_plan';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('insurance', 'required'),
			array('insurance', 'numerical', 'integerOnly'=>true),
			array('planName', 'length', 'max'=>45),
			array('planDesc', 'length', 'max'=>200),
			array('planLogo', 'length', 'max'=>128),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, insurance, planName, planDesc, planLogo', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'insurance' => array(self::BELONGS_TO, 'InsProvider', 'insurance'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'insurance' => 'Insurance',
			'planName' => 'Name',
			'planDesc' => 'Description',
			'planLogo' => 'Logo',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return InsurancePlan the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
