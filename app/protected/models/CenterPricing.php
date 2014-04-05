<?php

/**
 * This is the model class for table "center_pricing".
 *
 */
class CenterPricing extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'center_pricing';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('center, insurance, cpt, year, dateEntered', 'required'),
			array('center, insurance, cpt', 'numerical', 'integerOnly'=>true),
			array('price', 'numerical'),
			array('year', 'length', 'max'=>4),
			array('dateUpdated', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, center, insurance, cpt, year, price, dateEntered, dateUpdated', 'safe', 'on'=>'search'),
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
			'cpt' => array(self::BELONGS_TO, 'Cpt', 'cpt'),
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
			'insurance' => 'Insurance',
			'cpt' => 'Cpt',
			'year' => 'Year',
			'price' => 'Price',
			'dateEntered' => 'Date Entered',
			'dateUpdated' => 'Date Updated',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CenterPricing the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
