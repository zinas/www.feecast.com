<?php

/**
 * This is the model class for table "center_ins".
 *
 */
class CenterInsurance extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'center_ins';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('center, insurance', 'required'),
			array('center, insurance', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('center, insurance', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'center' => array(self::BELONGS_TO, 'Center', 'center'),
			'insurance' => array(self::BELONGS_TO, 'InsuranceProvider', 'insurance'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'center' => 'Center',
			'insurance' => 'Insurance',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CenterInsurance the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
