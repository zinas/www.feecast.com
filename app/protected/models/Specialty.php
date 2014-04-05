<?php

/**
 * This is the model class for table "specialty".
 *
 */
class Specialty extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'specialty';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('specName, specActor, specPlural', 'required'),
			array('category', 'numerical', 'integerOnly'=>true),
			array('specName, specActor, specPlural', 'length', 'max'=>45),
			array('specNote', 'length', 'max'=>256),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, category, specName, specActor, specPlural, specNote', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'physicians' => array(self::MANY_MANY, 'Physician', 'phys_spec(specID, phyID)'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'category' => 'Category',
			'specName' => 'Name',
			'specActor' => 'Actor',
			'specPlural' => 'Plural',
			'specNote' => 'Note',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Specialty the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
