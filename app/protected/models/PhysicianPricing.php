<?php

/**
 * This is the model class for table "phys_pricing".
 *
 */
class PhysicianPricing extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'phys_pricing';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('physician, center, cpt, year, dateEntered', 'required'),
			array('physician, center, cpt, year', 'numerical', 'integerOnly'=>true),
			array('price', 'numerical'),
			array('dateUpdated', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, physician, center, cpt, year, price, dateEntered, dateUpdated', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'_physician' => array(self::BELONGS_TO, 'Physician', 'physician'),
			'_center' => array(self::BELONGS_TO, 'Center', 'center'),
			'_cpt' => array(self::BELONGS_TO, 'Cpt', 'cpt'),
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
	 * @return PhysicianPricing the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
